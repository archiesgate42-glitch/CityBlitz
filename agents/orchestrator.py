from __future__ import annotations

"""
OrchestratorAgent (Taro-XI, System Architect) – Industrial Intelligence

Industrial Hardening:
  - Process-level threading lock prevents concurrent cascade runs.
  - Roadmap stub written even when a phase fails (for auditability).
"""

import json
import threading
from dataclasses import dataclass
from datetime import datetime, timezone
from typing import Any, Dict, List, Optional, Tuple

from core.bridge import DataBridge, DataBridgeError
from agents.janitor import JanitorAgent
from agents.observer import ObserverAgent
from agents.analyst import AnalystAgent  # type: ignore[import]
from agents.impact import ImpactAgent  # Phase 3: IMPROVE


ORCHESTRATOR_AGENT_NAME = "Orchestrator"
_CASCADE_LOCK = threading.Lock()


@dataclass
class CascadeResult:
    """Structured view of the cascade outcome for downstream consumption and logging."""

    janitor_report: Dict[str, Any]
    analyst_report: Optional[Dict[str, Any]]
    observer_report: Optional[Dict[str, Any]]
    stopped_phase: Optional[str]


class OrchestratorAgent:
    """
    Coordinates the Janitor -> Analyst -> Observer cascade.

    All terminal artifacts (e.g. cityblitz_priority_roadmap.json) are written via DataBridge
    into data/inference. Logging follows the industrial JSON format: timestamp, agent,
    action, outcome, with optional detail.
    """

    def __init__(self, bridge: Optional[DataBridge] = None) -> None:
        self._bridge = bridge or DataBridge()
        self._janitor = JanitorAgent(self._bridge)
        self._analyst = AnalystAgent(self._bridge)  # type: ignore[call-arg]
        self._observer = ObserverAgent(self._bridge)
        self._impact = ImpactAgent(self._bridge)

    # ------------------------------------------------------------------
    # Logging
    # ------------------------------------------------------------------
    def _log_event(self, action: str, outcome: str, detail: Optional[Dict[str, Any]] = None) -> None:
        """
        Write a single log line for the Orchestrator in the industrial format:
        timestamp, agent, action, outcome, [detail].
        """
        record: Dict[str, Any] = {
            "timestamp": datetime.now(timezone.utc).isoformat(),
            "agent": ORCHESTRATOR_AGENT_NAME,
            "action": action,
            "outcome": outcome,
        }
        if detail is not None:
            record["detail"] = detail

        log_path = self._bridge.root / "logs" / "orchestrator_agent.log"
        log_path.parent.mkdir(parents=True, exist_ok=True)
        try:
            with log_path.open("a", encoding="utf-8") as f:
                f.write(json.dumps(record, ensure_ascii=False) + "\n")
        except OSError:
            # Never allow logging failures to crash orchestration
            pass

    # ------------------------------------------------------------------
    # Helpers
    # ------------------------------------------------------------------
    def _janitor_phase(self) -> Dict[str, Any]:
        """Run JanitorAgent and enforce Critical Data Integrity Failure rules."""
        self._log_event("janitor_phase", "started", None)
        report = self._janitor.run()

        files_processed = int(report.get("files_processed", 0))
        files_failed = int(report.get("files_failed", 0))

        if files_failed > 0:
            # Hard failure: Janitor attempted to clean data but encountered errors.
            message = "Critical Data Integrity Failure: Janitor encountered errors while cleaning data."
            self._log_event(
                "janitor_phase",
                "critical_failure",
                {
                    "files_processed": files_processed,
                    "files_failed": files_failed,
                    "message": message,
                },
            )
            raise RuntimeError(message)

        if files_processed <= 0 and files_failed == 0:
            # Soft condition: no new raw files to process. Allow the cascade to continue,
            # but surface this explicitly to the operator.
            self._log_event(
                "janitor_phase",
                "no_new_raw_data",
                {
                    "files_processed": files_processed,
                    "files_failed": files_failed,
                    "message": "No new raw files in data/raw (all data already processed or folder empty).",
                },
            )
            return report

        self._log_event(
            "janitor_phase",
            "success",
            {"files_processed": files_processed, "files_failed": files_failed},
        )
        return report

    def _analyst_phase(self) -> Dict[str, Any]:
        """
        Run AnalystAgent. The concrete implementation of AnalystAgent is expected
        to write hotspot_analysis.json into data/inference and/or return a structure
        describing hotspots.
        """
        self._log_event("analyst_phase", "started", None)
        report = self._analyst.run()  # type: ignore[assignment]

        # Derive hotspot count by inspecting the on-disk hotspot_analysis.json,
        # keeping the contract close to ObserverAgent's interpretation.
        hotspot_count = self._count_hotspots_from_inference()
        report.setdefault("hotspots_detected", hotspot_count)

        if hotspot_count <= 0:
            self._log_event(
                "analyst_phase",
                "no_hotspots",
                {"message": "Analyst produced no actionable hotspots; Observer will not be triggered."},
            )
        else:
            self._log_event(
                "analyst_phase",
                "success",
                {"hotspots_detected": hotspot_count},
            )

        return report

    def _count_hotspots_from_inference(self) -> int:
        """
        Inspect data/inference/hotspot_analysis.json and return hotspot count.
        Mirrors the flexible schema expectations used by ObserverAgent.
        """
        try:
            raw_text = self._bridge.read_inference(ORCHESTRATOR_AGENT_NAME, "hotspot_analysis.json")
        except DataBridgeError:
            return 0

        try:
            data = json.loads(raw_text)
        except json.JSONDecodeError:
            return 0

        if isinstance(data, dict):
            hotspots = data.get("hotspots") or data.get("top_hotspots") or []
        else:
            hotspots = data

        return len(hotspots or [])

    def _observer_phase(self, hotspots_detected: int) -> Optional[Dict[str, Any]]:
        """
        Run ObserverAgent only if hotspots were detected by the Analyst.
        """
        if hotspots_detected <= 0:
            self._log_event(
                "observer_phase",
                "skipped",
                {"reason": "no_hotspots_from_analyst"},
            )
            return None

        self._log_event("observer_phase", "started", {"hotspots_detected": hotspots_detected})
        report = self._observer.run()
        self._log_event("observer_phase", "success", {"locations": len(report.get("locations", []))})
        return report

    def _friction_vibe_ratio(self, friction: float, vibe: float) -> float:
        """APS: FVR = friction / (vibe + 0.01). Higher = more urgency."""
        return friction / (max(vibe, 0.01) + 0.01)

    def _select_top_red_zone(self, observer_report: Dict[str, Any]) -> Optional[Dict[str, Any]]:
        """
        Choose the #1 Red-Zone using Adaptive Priority System (FVR).
        Replaces static thresholds: higher Friction-to-Vibe Ratio = higher urgency.
        """
        locations = observer_report.get("locations") or []
        if not locations:
            return None

        def fvr_key(loc: Dict[str, Any]) -> float:
            friction = float(loc.get("friction_score", 0.0))
            vibe = float(loc.get("vibe_score", 1.0))
            return -self._friction_vibe_ratio(friction, vibe)  # higher FVR first

        return max(locations, key=fvr_key)

    def _agent_consensus(
        self,
        red_zone: Dict[str, Any],
        impact_report: Optional[Dict[str, Any]],
    ) -> Tuple[bool, Dict[str, Any]]:
        """
        Simulate weighted vote: Resident, Municipal, Economy.
        Priority Alpha only if at least 2 of 3 paths agree on urgency.
        """
        friction = float(red_zone.get("friction_score", 0.0))
        vibe = float(red_zone.get("vibe_score", 0.5))
        resident_urgent = vibe < 0.4
        municipal_urgent = friction >= 0.7
        roi = 0.0
        if impact_report and "projection" in impact_report:
            roi = float(impact_report["projection"].get("estimated_emergency_cost_savings", 0))
        economy_urgent = roi >= 5000.0

        votes = {
            "resident": resident_urgent,
            "municipal": municipal_urgent,
            "economy": economy_urgent,
        }
        urgent_count = sum(votes.values())
        promoted = urgent_count >= 2

        return promoted, {
            "votes": votes,
            "resident_urgent": resident_urgent,
            "municipal_urgent": municipal_urgent,
            "economy_urgent": economy_urgent,
            "urgent_count": urgent_count,
            "promoted_to_priority_alpha": promoted,
        }

    def generate_decision_markdown(
        self,
        roadmap: Dict[str, Any],
        impact: Optional[Dict[str, Any]],
    ) -> str:
        """
        Explainability Engine: human-readable justification for Priority Alpha.
        Format: "Why this zone? 1) Friction X (Top Y%), 2) Sentiment Delta Z%, 3) Safety ROI $N."
        """
        red = roadmap.get("red_zone")
        if not red:
            return "No Red-Zone identified; no decision to explain."

        friction = float(red.get("friction_score", 0.0))
        vibe = float(red.get("vibe_score", 0.5))
        location = red.get("location", "Unknown")

        # Friction percentile: assume 1.0 = top tier (Top 5%), scale down
        friction_pct = "Top 5%" if friction >= 0.95 else f"Top {int(10 + (1 - friction) * 40)}%"
        # Sentiment Delta: vibe 0.5 = neutral; negative delta = worse
        sentiment_delta_pct = int((vibe - 0.5) * 100)
        roi_str = "$0"
        if impact and "projection" in impact:
            roi = int(impact["projection"].get("estimated_emergency_cost_savings", 0))
            roi_str = f"${roi:,}"

        return (
            f"**Why this zone ({location})?**\n"
            f"1) Friction {friction:.1f} ({friction_pct}), "
            f"2) Sentiment Delta {sentiment_delta_pct:+d}%, "
            f"3) Safety ROI {roi_str}."
        )

    def _write_priority_roadmap(
        self,
        cascade: CascadeResult,
        observer_report: Optional[Dict[str, Any]],
    ) -> Dict[str, Any]:
        """
        Construct and persist cityblitz_priority_roadmap.json to data/inference.
        """
        if observer_report is None:
            # No observer output; still write a roadmap stub.
            roadmap: Dict[str, Any] = {
                "timestamp": datetime.now(timezone.utc).isoformat(),
                "agent": ORCHESTRATOR_AGENT_NAME,
                "phase": "Phase 1: BROKEN",
                "status": "Observer not executed (no hotspots from Analyst).",
                "red_zone": None,
                "command_verdict": "Await improved data and analytical signal before intervention.",
            }
        else:
            top = self._select_top_red_zone(observer_report)
            if top is None:
                roadmap = {
                    "timestamp": datetime.now(timezone.utc).isoformat(),
                    "agent": ORCHESTRATOR_AGENT_NAME,
                    "phase": "Phase 1: BROKEN",
                    "status": "Observer executed but returned no locations.",
                    "red_zone": None,
                    "command_verdict": "No clear red‑zone identified; monitor trends.",
                }
            else:
                priority = top.get("priority", "Standard")
                if priority == "Priority Alpha":
                    verdict = "Immediate Infrastructure Intervention Required"
                else:
                    verdict = "Targeted Improvements Recommended (Monitor and phase interventions)."

                fvr = self._friction_vibe_ratio(
                    float(top.get("friction_score", 0)),
                    float(top.get("vibe_score", 0.5)),
                )

                roadmap = {
                    "timestamp": datetime.now(timezone.utc).isoformat(),
                    "agent": ORCHESTRATOR_AGENT_NAME,
                    "phase": "Phase 1: BROKEN",
                    "status": "Cascade completed.",
                    "red_zone": {
                        "location": top.get("location"),
                        "vibe_score": top.get("vibe_score"),
                        "friction_score": top.get("friction_score"),
                        "priority": priority,
                    },
                    "command_verdict": verdict,
                    "aps": {
                        "friction_vibe_ratio": round(fvr, 3),
                    },
                    "consensus": None,
                    "explainability": None,
                    "source_reports": {
                        "hotspots_file": "hotspot_analysis.json",
                        "vitality_file": "final_vibe_check.json",
                    },
                }

        try:
            self._bridge.write_inference(
                ORCHESTRATOR_AGENT_NAME,
                "cityblitz_priority_roadmap.json",
                json.dumps(roadmap, indent=2),
            )
            self._log_event("write_priority_roadmap", "success", {"file": "cityblitz_priority_roadmap.json"})
        except DataBridgeError as e:
            self._log_event("write_priority_roadmap", "failure", {"error": str(e)})
            raise

        return roadmap

    def _impact_phase(self) -> Optional[Dict[str, Any]]:
        """
        Run ImpactAgent as Phase 3: IMPROVE to quantify potential safety & QoL gains.
        """
        self._log_event("impact_phase", "started", None)
        try:
            report = self._impact.run()
        except Exception as e:
            self._log_event("impact_phase", "failure", {"error": str(e)})
            return None

        if report is None:
            self._log_event("impact_phase", "skipped_or_no_output", None)
            return None

        self._log_event(
            "impact_phase",
            "success",
            {
                "target_location": report.get("target_location"),
                "projected_calls_avoided_mid": report.get("projection", {}).get("projected_calls_avoided_mid"),
                "estimated_emergency_cost_savings": report.get("projection", {}).get(
                    "estimated_emergency_cost_savings"
                ),
            },
        )
        return report

    def _write_failure_stub(self, stopped_phase: str, error: str) -> None:
        """Write roadmap stub on cascade failure so operators always have something to inspect."""
        stub = {
            "timestamp": datetime.now(timezone.utc).isoformat(),
            "agent": ORCHESTRATOR_AGENT_NAME,
            "phase": "Phase 1: BROKEN",
            "status": f"Cascade stopped at {stopped_phase}.",
            "red_zone": None,
            "command_verdict": "Cascade failed – check logs for details.",
            "cascade_failure": {"stopped_phase": stopped_phase, "error": error},
        }
        try:
            self._bridge.write_inference(
                ORCHESTRATOR_AGENT_NAME,
                "cityblitz_priority_roadmap.json",
                json.dumps(stub, indent=2),
            )
            self._log_event("write_failure_stub", "success", {"stopped_phase": stopped_phase})
        except DataBridgeError as e:
            self._log_event("write_failure_stub", "failure", {"error": str(e)})

    def _load_priority_roadmap(self) -> Dict[str, Any]:
        """Load cityblitz_priority_roadmap.json from disk."""
        try:
            raw = self._bridge.read_inference(ORCHESTRATOR_AGENT_NAME, "cityblitz_priority_roadmap.json")
            return json.loads(raw)
        except (DataBridgeError, json.JSONDecodeError):
            return {}

    def _enrich_roadmap_with_transparency(
        self,
        roadmap: Dict[str, Any],
        impact_report: Optional[Dict[str, Any]],
    ) -> None:
        """
        After Impact runs: apply Agent Consensus, generate Explainability markdown,
        and persist the enriched roadmap to disk.
        """
        red = roadmap.get("red_zone")
        if not red:
            return

        promoted, consensus = self._agent_consensus(red, impact_report)

        if not consensus["promoted_to_priority_alpha"]:
            roadmap["red_zone"]["priority"] = "Standard"
            roadmap["command_verdict"] = "Targeted Improvements Recommended (Monitor and phase interventions)."
        else:
            roadmap["red_zone"]["priority"] = "Priority Alpha"
            roadmap["command_verdict"] = "Immediate Infrastructure Intervention Required"

        roadmap["consensus"] = consensus
        roadmap["explainability"] = {
            "decision_markdown": self.generate_decision_markdown(roadmap, impact_report),
        }
        if "aps" not in roadmap:
            roadmap["aps"] = {}
        if impact_report and "aps" in impact_report:
            roadmap["aps"].update(impact_report["aps"])

        try:
            self._bridge.write_inference(
                ORCHESTRATOR_AGENT_NAME,
                "cityblitz_priority_roadmap.json",
                json.dumps(roadmap, indent=2),
            )
            self._log_event("enrich_roadmap", "success", {"consensus": consensus})
        except DataBridgeError as e:
            self._log_event("enrich_roadmap", "failure", {"error": str(e)})

    # ------------------------------------------------------------------
    # Public API
    # ------------------------------------------------------------------
    def run_cascade(self) -> Dict[str, Any]:
        """
        Execute the full cascade. Process-level lock prevents concurrent runs.
        Always writes a roadmap (success or failure stub) for auditability.
        """
        if not _CASCADE_LOCK.acquire(blocking=False):
            raise RuntimeError(
                "A cascade is already running. Wait for it to complete before triggering another."
            )

        self._log_event("run_cascade", "started", None)
        stopped_phase: Optional[str] = None

        try:
            try:
                janitor_report = self._janitor_phase()
            except Exception as e:
                stopped_phase = "Janitor"
                self._log_event("run_cascade", "stopped", {"phase": stopped_phase, "error": str(e)})
                self._write_failure_stub(stopped_phase, str(e))
                raise

            try:
                analyst_report = self._analyst_phase()
            except Exception as e:
                stopped_phase = "Analyst"
                self._log_event("run_cascade", "stopped", {"phase": stopped_phase, "error": str(e)})
                self._write_failure_stub(stopped_phase, str(e))
                raise

            hotspots_detected = int(analyst_report.get("hotspots_detected", 0))
            observer_report = self._observer_phase(hotspots_detected)

            cascade = CascadeResult(
                janitor_report=janitor_report,
                analyst_report=analyst_report,
                observer_report=observer_report,
                stopped_phase=None,
            )

            try:
                roadmap = self._write_priority_roadmap(cascade, observer_report)
            except Exception as e:
                stopped_phase = "WriteRoadmap"
                self._log_event("run_cascade", "stopped", {"phase": stopped_phase, "error": str(e)})
                self._write_failure_stub(stopped_phase, str(e))
                raise

            impact_report = self._impact_phase()
            if roadmap.get("red_zone"):
                self._enrich_roadmap_with_transparency(roadmap, impact_report)
                roadmap = self._load_priority_roadmap()

            self._log_event(
                "run_cascade",
                "completed",
                {
                    "red_zone": roadmap.get("red_zone"),
                    "impact": {
                        "target_location": (impact_report or {}).get("target_location") if impact_report else None,
                    },
                },
            )
            return roadmap

        finally:
            _CASCADE_LOCK.release()


def _pretty_print_summary(summary: Dict[str, Any]) -> None:
    """Lightweight CLI summary for `python agents/orchestrator.py`."""
    red_zone = summary.get("red_zone")
    verdict = summary.get("command_verdict")
    phase = summary.get("phase")

    print(f"[Orchestrator] Phase: {phase}")
    if red_zone is None:
        print("[Orchestrator] No Red-Zone identified.")
    else:
        loc = red_zone.get("location")
        vibe = red_zone.get("vibe_score")
        friction = red_zone.get("friction_score")
        priority = red_zone.get("priority")
        print(f"[Orchestrator] #1 Red-Zone: {loc} (Priority: {priority})")
        print(f"[Orchestrator] Vibe Score: {vibe}, Friction Score: {friction}")
    print(f"[Orchestrator] Command Verdict: {verdict}")


if __name__ == "__main__":
    bridge = DataBridge()
    orchestrator = OrchestratorAgent(bridge)
    try:
        result = orchestrator.run_cascade()
        _pretty_print_summary(result)
    except Exception as exc:
        print(f"[Orchestrator] Cascade failed: {exc}")

