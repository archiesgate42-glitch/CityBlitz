from __future__ import annotations

"""
ObserverAgent (Taro-XI persona).

Industrial Hardening:
  - Exponential-backoff retries for Gemini.
  - Returns None (not 0.5) on API failure so Orchestrator can distinguish
    "neutral sentiment" from "API error".
  - friction_high_threshold validated in __init__.
  - genai.configure only when api_key present.
"""

import json
import time
from dataclasses import dataclass
from datetime import datetime, timezone
from typing import Any, Dict, List, Optional

from core.bridge import DataBridge, DataBridgeError
from core.config import get_gemini_api_key
from core.bright_data import BrightDataClient, BrightDataError


AGENT_NAME = "Observer"
_MAX_RETRIES = 3
_RETRY_BASE_DELAY = 1.0


@dataclass
class HotspotContext:
    """Lightweight view of a hotspot for sentiment probing."""

    location: str
    friction_score: float
    raw: Dict[str, Any]


class ObserverAgent:
    """
    ObserverAgent (Taro-XI):
    - Consumes Analyst output from data/inference/hotspot_analysis.json.
    - For each hotspot, calls fetch_bright_data_sentiment(location) to obtain a Vibe Score.
    - Uses Gemini to classify mock snippets as Positive / Neutral / Negative on
      safety, trash, and neighborhood pride.
    - Writes an Urban Vitality Report to data/inference/final_vibe_check.json.
    - Logs all actions using the industrial format: timestamp, agent, action, outcome.
    """

    def __init__(
        self,
        bridge: Optional[DataBridge] = None,
        *,
        model_name: str = "gemini-1.5-flash",
        friction_high_threshold: float = 0.7,
    ) -> None:
        self._bridge = bridge or DataBridge()
        self._model_name = model_name
        if not (0.0 < friction_high_threshold <= 1.0):
            raise ValueError(
                f"friction_high_threshold must be in (0.0, 1.0], got {friction_high_threshold!r}"
            )
        self._friction_high_threshold = friction_high_threshold
        self._api_key = get_gemini_api_key()
        
        try:
            self._bd_client = BrightDataClient()
        except BrightDataError:
            self._bd_client = None

        if self._api_key:
            try:
                import google.generativeai as genai
                genai.configure(api_key=self._api_key)
            except Exception as e:
                self._log_event("init", "genai_configure_failed", {"error": str(e)})
                self._api_key = None

    # ------------------------------------------------------------------
    # Logging
    # ------------------------------------------------------------------
    def _log_event(self, action: str, outcome: str, detail: Optional[Dict[str, Any]] = None) -> None:
        """
        Write a single log line for the Observer in the industrial format:
        timestamp, agent, action, outcome, detail.
        """
        record = {
            "timestamp": datetime.now(timezone.utc).isoformat(),
            "agent": AGENT_NAME,
            "action": action,
            "outcome": outcome,
        }
        if detail is not None:
            record["detail"] = detail

        log_path = self._bridge.root / "logs" / "observer_agent.log"
        log_path.parent.mkdir(parents=True, exist_ok=True)
        try:
            with log_path.open("a", encoding="utf-8") as f:
                f.write(json.dumps(record, ensure_ascii=False) + "\n")
        except OSError:
            # Logging must never crash the pipeline
            pass

    # ------------------------------------------------------------------
    # Core orchestration
    # ------------------------------------------------------------------
    def _load_hotspots(self) -> List[HotspotContext]:
        """Read hotspot_analysis.json from data/inference and normalize into HotspotContext objects."""
        try:
            raw_text = self._bridge.read_inference(AGENT_NAME, "hotspot_analysis.json")
        except DataBridgeError as e:
            self._log_event("load_hotspots", "failure", {"error": str(e)})
            raise

        try:
            data = json.loads(raw_text)
        except json.JSONDecodeError as e:
            self._log_event("load_hotspots", "failure", {"error": f"invalid JSON: {e}"})
            raise

        if isinstance(data, dict):
            hotspots = data.get("hotspots") or data.get("top_hotspots") or []
        else:
            hotspots = data

        normalized: List[HotspotContext] = []
        for h in hotspots or []:
            if not isinstance(h, dict):
                continue
            location = (
                str(h.get("zip_code"))
                or str(h.get("zipcode") or "")
                or str(h.get("district") or h.get("area") or "")
            )
            if not location:
                continue
            friction_raw = h.get("friction_score") or h.get("friction") or h.get("score")
            try:
                friction_val = float(friction_raw)
            except (TypeError, ValueError):
                friction_val = 0.0
            # Normalize if this looks like 0–100
            if friction_val > 1.0:
                friction_val = min(friction_val / 100.0, 1.0)

            normalized.append(HotspotContext(location=location, friction_score=friction_val, raw=h))

        self._log_event("load_hotspots", "success", {"count": len(normalized)})
        return normalized

    # ------------------------------------------------------------------
    # Bright Data simulation + Gemini sentiment
    # ------------------------------------------------------------------
    def _generate_mock_snippets(self, location: str, friction_score: Optional[float] = None) -> List[str]:
        """
        Generate 5–10 mock snippets about safety, trash, and neighborhood pride
        for a given location (zip/district).

        For high-friction locations, deliberately bias at least three snippets toward
        clear negative sentiment (unanswered complaints, safety fears, visible trash).
        """
        base = f"Zip/District {location}"

        high_friction = friction_score is not None and friction_score >= self._friction_high_threshold

        negative_core = [
            f"{base}: Residents complain that 311 requests stay unanswered for weeks and nothing changes.",
            f"{base}: People say they feel unsafe walking home at night due to repeated incidents.",
            f"{base}: Piles of visible trash and overflowing bins make the streets feel neglected and dirty.",
        ]

        mixed_snippets = [
            f"{base}: Some blocks feel safer after patrols, but many still avoid certain corners after dark.",
            f"{base}: Community volunteers organize cleanups, yet new litter and illegal dumping appear every week.",
            f"{base}: Social media posts show frustration about slow responses to broken streetlights and dumping.",
            f"{base}: Local news highlights both new investments and rising concerns about vandalism around transit stops.",
            f"{base}: A neighborhood festival boosts pride, but residents also demand tougher action on crime and trash.",
        ]

        if high_friction:
            snippets = negative_core + mixed_snippets
        else:
            # For lower-friction areas, still include some issues but more balanced tone.
            snippets = [
                f"{base}: Residents report feeling somewhat safer after recent patrols.",
                f"{base}: Overflowing trash cans appear occasionally, but cleanups are usually quick.",
                f"{base}: Community volunteers organize monthly cleanups, boosting neighborhood pride.",
                f"{base}: Some locals avoid a few blocks at night, though most streets feel calm.",
                f"{base}: Social media posts praise new park renovations and family-friendly events.",
                f"{base}: News mentions isolated vandalism incidents but also stronger community response.",
                f"{base}: Residents debate stricter rules around illegal dumping and better enforcement.",
                f"{base}: A neighborhood festival is highlighted as a symbol of civic pride and resilience.",
            ]

        # Clamp to 5–10
        return snippets[:8]

    def _classify_heuristic(self, text: str) -> str:
        """Rule-based fallback when no API key or offline."""
        lower = text.lower()
        neg_words = {
            "unanswered", "ignored", "unsafe", "fear", "afraid", "complain",
            "complaint", "frustration", "frustrated", "overflowing", "trash",
            "dumping", "dirty", "neglected", "rats", "crime", "incident",
            "shooting", "avoid", "vandalism",
        }
        pos_words = {
            "safer", "praise", "boosting", "festival", "pride", "renovations",
            "volunteers", "improved", "cleaner",
        }
        neg = any(w in lower for w in neg_words)
        pos = any(w in lower for w in pos_words)
        if neg and not pos:
            return "Negative"
        if pos and not neg:
            return "Positive"
        if neg and pos:
            return "Negative"
        return "Neutral"

    def _classify_with_gemini(self, text: str) -> Optional[str]:
        """
        Classify snippet as Positive/Neutral/Negative. Returns None on persistent failure.
        Exponential-backoff retry up to _MAX_RETRIES.
        """
        if not self._api_key:
            return self._classify_heuristic(text)

        import google.generativeai as genai

        prompt = (
            "You are an urban risk auditor.\n"
            "Classify the sentiment of the following text ONLY as one of: "
            "Positive, Neutral, Negative.\n"
            "Focus specifically on SAFETY, TRASH/CLEANLINESS, and NEIGHBORHOOD PRIDE.\n"
            "Be highly sensitive to signs of urban decay or citizen frustration. "
            "If a snippet shows even slight frustration, lean towards 'Negative'.\n"
            "Respond with just the single word: Positive, Neutral, or Negative.\n\n"
            f"Text: {text}"
        )

        last_exc: Optional[Exception] = None
        for attempt in range(_MAX_RETRIES):
            try:
                model = genai.GenerativeModel(self._model_name)
                response = model.generate_content(prompt)
                label = (response.text or "").strip().split()[0].capitalize()
                if label not in {"Positive", "Neutral", "Negative"}:
                    return "Neutral"
                return label
            except Exception as exc:
                last_exc = exc
                delay = _RETRY_BASE_DELAY * (2 ** attempt)
                self._log_event(
                    "classify_gemini_retry",
                    "retrying",
                    {"attempt": attempt + 1, "delay": delay, "error": str(exc)},
                )
                time.sleep(delay)

        self._log_event(
            "classify_gemini",
            "failure",
            {"error": str(last_exc), "text_preview": text[:80]},
        )
        return None


    def fetch_bright_data_sentiment(self, location: str, friction_score: Optional[float] = None) -> Optional[float]:
        """
        Fetch real sentiment via Bright Data if available, else fallback to mock.
        """
        if self._bd_client:
            try:
                # Construct query for Bright Data based on location
                query = f"Montgomery Alabama {location} public safety sentiment trash neighborhood pride"
                urls = [f"https://www.google.com/search?q={query.replace(' ', '+')}"]
                
                self._log_event("bright_data", "trigger", {"location": location, "query": query})
                snapshot_id = self._bd_client.trigger_crawl(urls)
                
                # Poll and get result (Simplified for hackathon: using 1st result)
                # In production, this would be a separate background process
                results = self._bd_client.poll_until_ready(snapshot_id, max_timeout_sec=120)
                
                if results and isinstance(results, list):
                    # Combine all text from results for Gemini classification
                    combined_text = " ".join([r.get("markdown", "") or r.get("description", "") for r in results[:3]])
                    if combined_text:
                        snippets = [combined_text]
                    else:
                        snippets = self._generate_mock_snippets(location, friction_score)
                else:
                    snippets = self._generate_mock_snippets(location, friction_score)
            except Exception as e:
                self._log_event("bright_data", "failure", {"error": str(e)})
                snippets = self._generate_mock_snippets(location, friction_score)
        else:
            snippets = self._generate_mock_snippets(location, friction_score)

        scores: List[float] = []
        label_counts: Dict[str, int] = {"Positive": 0, "Neutral": 0, "Negative": 0, "Error": 0}

        high = friction_score is not None and friction_score >= self._friction_high_threshold
        pos_w, neu_w = (0.75, 0.25) if high else (1.0, 0.5)

        for s in snippets:
            label = self._classify_with_gemini(s) if self._api_key else self._classify_heuristic(s)
            if label is None:
                label_counts["Error"] += 1
                continue
            label_counts[label] = label_counts.get(label, 0) + 1
            if label == "Positive":
                scores.append(pos_w)
            elif label == "Neutral":
                scores.append(neu_w)
            else:
                scores.append(0.0)

        if not scores:
            self._log_event(
                "fetch_bright_data_sentiment",
                "all_classifications_failed",
                {"location": location, "error_count": label_counts["Error"]},
            )
            return None

        vibe_score = float(sum(scores) / len(scores))
        self._log_event(
            "fetch_bright_data_sentiment",
            "success",
            {"location": location, "vibe_score": vibe_score, "labels": label_counts},
        )
        return vibe_score

    # ------------------------------------------------------------------
    # Public entrypoint
    # ------------------------------------------------------------------
    def run(self) -> Dict[str, Any]:
        """
        Execute the Urban Vitality scan:
        - Read hotspot_analysis.json from data/inference.
        - For each hotspot, compute Vibe Score and Priority Alpha flag.
        - Persist final_vibe_check.json back to data/inference.

        Returns a dict summarizing the report for the Orchestrator.
        """
        self._log_event("run", "started", None)

        hotspots = self._load_hotspots()
        results: List[Dict[str, Any]] = []

        for h in hotspots:
            try:
                vibe = self.fetch_bright_data_sentiment(h.location, friction_score=h.friction_score)
                if vibe is None:
                    self._log_event("process_hotspot", "skipped_no_vibe", {"location": h.location})
                    continue
                friction = h.friction_score
                priority = "Priority Alpha" if (vibe < 0.4 and friction >= self._friction_high_threshold) else "Standard"
                results.append({
                    "location": h.location,
                    "vibe_score": round(vibe, 3),
                    "friction_score": round(friction, 3),
                    "priority": priority,
                    "raw_hotspot": h.raw,
                })
            except Exception as e:
                self._log_event(
                    "process_hotspot",
                    "failure",
                    {"location": h.location, "error": str(e)},
                )

        report = {
            "timestamp": datetime.now(timezone.utc).isoformat(),
            "agent": AGENT_NAME,
            "job": "Urban Vitality Report",
            "source_file": "hotspot_analysis.json",
            "hotspots_considered": len(hotspots),
            "locations": results,
        }

        # Persist Urban Vitality Report via DataBridge
        try:
            self._bridge.write_inference(AGENT_NAME, "final_vibe_check.json", json.dumps(report, indent=2))
            self._log_event("write_report", "success", {"file": "final_vibe_check.json"})
        except DataBridgeError as e:
            self._log_event("write_report", "failure", {"error": str(e)})
            raise

        self._log_event("run", "completed", {"hotspots": len(hotspots), "locations_reported": len(results)})
        return report

