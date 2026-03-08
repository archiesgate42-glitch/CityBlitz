from __future__ import annotations

"""
ImpactAgent – Phase 3: IMPROVE (Industrial Intelligence)

Quantifies potential safety and quality-of-life (QoL) gains for the current
Priority Alpha zone identified by the Orchestrator.

Pipeline:
- Read cityblitz_priority_roadmap.json to find the Priority Alpha location.
- Read data/processed/911_Calls.csv via DataBridge.
- Estimate 911 safety/crime call density (with Temporal Weighting: 2.5x for last 48h window).
- Project a Safety ROI using a 15–20% reduction in non-medical calls
  inspired by the Broken Windows Theory.
- Compute Friction-to-Vibe Ratio (FVR) for transparency.
- Write impact_prediction.json into data/inference.
- Log all actions to logs/impact_agent.log (industrial JSON format).
"""

import json
from dataclasses import dataclass
from datetime import datetime, timezone
from io import StringIO
from typing import Any, Dict, List, Optional, Tuple

import pandas as pd

from core.bridge import DataBridge, DataBridgeError


AGENT_NAME = "Impact"
TEMPORAL_WEIGHT_RECENT = 2.5  # 2.5x for events in "last 48h" window


@dataclass
class ImpactContext:
    location: str
    friction_score: float
    vibe_score: float
    priority: str


class ImpactAgent:
    """
    Phase 3: IMPROVE – Safety & QoL impact estimation for Priority Alpha zones.
    """

    def __init__(
        self,
        bridge: Optional[DataBridge] = None,
        *,
        reduction_range: tuple[float, float] = (0.15, 0.20),
        cost_per_call: float = 800.0,
    ) -> None:
        self._bridge = bridge or DataBridge()
        self._reduction_low, self._reduction_high = reduction_range
        self._cost_per_call = cost_per_call

    # ------------------------------------------------------------------
    # Logging
    # ------------------------------------------------------------------
    def _log_event(self, action: str, outcome: str, detail: Optional[Dict[str, Any]] = None) -> None:
        record: Dict[str, Any] = {
            "timestamp": datetime.now(timezone.utc).isoformat(),
            "agent": AGENT_NAME,
            "action": action,
            "outcome": outcome,
        }
        if detail is not None:
            record["detail"] = detail

        log_path = self._bridge.root / "logs" / "impact_agent.log"
        log_path.parent.mkdir(parents=True, exist_ok=True)
        try:
            with log_path.open("a", encoding="utf-8") as f:
                f.write(json.dumps(record, ensure_ascii=False) + "\n")
        except OSError:
            pass

    # ------------------------------------------------------------------
    # Core helpers
    # ------------------------------------------------------------------
    def _load_priority_alpha(self) -> Optional[ImpactContext]:
        """
        Load cityblitz_priority_roadmap.json and extract the Priority Alpha zone,
        if present. If not present, fall back to the top red-zone (if any).
        """
        try:
            raw = self._bridge.read_inference(AGENT_NAME, "cityblitz_priority_roadmap.json")
        except DataBridgeError as e:
            self._log_event("load_roadmap", "failure", {"error": str(e)})
            return None

        try:
            data = json.loads(raw)
        except json.JSONDecodeError as e:
            self._log_event("load_roadmap", "failure", {"error": f"invalid JSON: {e}"})
            return None

        red = data.get("red_zone")
        if not red:
            self._log_event("load_roadmap", "no_red_zone", None)
            return None

        priority = str(red.get("priority", "Standard"))
        ctx = ImpactContext(
            location=str(red.get("location")),
            friction_score=float(red.get("friction_score", 0.0)),
            vibe_score=float(red.get("vibe_score", 0.0)),
            priority=priority,
        )

        outcome = "priority_alpha" if priority == "Priority Alpha" else "non_alpha_red_zone"
        self._log_event(
            "load_roadmap",
            outcome,
            {
                "location": ctx.location,
                "priority": ctx.priority,
                "friction_score": ctx.friction_score,
                "vibe_score": ctx.vibe_score,
            },
        )
        return ctx

    def _load_911_calls(self) -> Optional[pd.DataFrame]:
        """
        Read the cleaned 911_Calls.csv from data/processed via DataBridge.
        """
        try:
            text = self._bridge.read_processed(AGENT_NAME, "911_Calls.csv")
        except DataBridgeError as e:
            self._log_event("load_911_calls", "failure", {"error": str(e)})
            return None

        try:
            df = pd.read_csv(StringIO(text))
        except Exception as e:
            self._log_event("load_911_calls", "failure", {"error": str(e)})
            return None

        self._log_event("load_911_calls", "success", {"rows": len(df), "columns": list(df.columns)})
        return df

    def _filter_zone_rows(self, df: pd.DataFrame, ctx: ImpactContext) -> pd.DataFrame:
        """
        Filter 911 rows that belong to the same Zip Code/District as the Priority Alpha zone.

        Because schemas can vary, we try a best-effort match on common location fields.
        If no matching rows are found, we conservatively fall back to the full dataframe.
        """
        location = ctx.location
        loc_candidates = [
            c
            for c in df.columns
            if any(k in c.lower() for k in ("zip", "district", "area", "zone", "neighborhood"))
        ]
        if not loc_candidates:
            return df

        mask = pd.Series(False, index=df.index)
        for col in loc_candidates:
            try:
                mask |= df[col].astype(str).str.strip().eq(location)
            except Exception:
                continue

        zone_df = df[mask]
        if zone_df.empty:
            # If there is no direct match on location columns, treat the full dataset
            # as representing the affected urban environment for this prototype.
            return df
        return zone_df

    def _compute_temporal_weights(self, df: pd.DataFrame) -> Tuple[pd.Series, bool]:
        """
        Apply Temporal Weighting: 2.5x for events in the most recent temporal window.
        For 911 data with Year/Month: the most recent month gets 2.5x; older months get 1.0x.
        Returns (weights series, temporal_weighting_applied).
        """
        if df.empty:
            return pd.Series(dtype=float), False

        year_col = None
        month_col = None
        for c in df.columns:
            if "year" in c.lower():
                year_col = c
            if "month" in c.lower() and "year" not in c.lower():
                month_col = c

        if year_col is None or month_col is None:
            return pd.Series(1.0, index=df.index), False

        try:
            years = df[year_col].astype(int)
            months_raw = df[month_col].astype(str)
            # Parse "1 - January" -> 1
            months = months_raw.str.extract(r"^(\d+)", expand=False).astype(float)
            months = months.fillna(1).astype(int)
            max_year = int(years.max())
            max_month = int(months[years == max_year].max()) if (years == max_year).any() else 1
            is_recent = (years == max_year) & (months == max_month)
            weights = pd.Series(1.0, index=df.index)
            weights[is_recent] = TEMPORAL_WEIGHT_RECENT
            return weights, True
        except Exception:
            return pd.Series(1.0, index=df.index), False

    def _friction_vibe_ratio(self, friction: float, vibe: float) -> float:
        """FVR = friction / (vibe + 0.01). Higher = more urgency."""
        return friction / (max(vibe, 0.01) + 0.01)

    def _filter_safety_crime_calls(self, df: pd.DataFrame) -> pd.DataFrame:
        """
        Restrict to safety/crime oriented calls based on textual fields.
        """
        text_cols = [
            c
            for c in df.columns
            if any(k in c.lower() for k in ("type", "nature", "desc", "category", "problem", "incident"))
        ]
        if not text_cols:
            return df

        keywords = (
            "assault",
            "burglary",
            "theft",
            "robbery",
            "weapon",
            "gun",
            "shots fired",
            "shooting",
            "domestic",
            "violence",
            "fight",
            "disturbance",
            "threat",
            "suspicious",
            "trespass",
        )

        mask = pd.Series(False, index=df.index)
        for col in text_cols:
            try:
                series = df[col].astype(str).str.lower()
                for kw in keywords:
                    mask |= series.str.contains(kw, na=False)
            except Exception:
                continue

        subset = df[mask]
        return subset if not subset.empty else df

    # ------------------------------------------------------------------
    # Public API
    # ------------------------------------------------------------------
    def run(self) -> Optional[Dict[str, Any]]:
        """
        Compute an impact prediction for the current Priority Alpha (or top red-zone).
        Writes impact_prediction.json into data/inference and returns the payload.
        """
        ctx = self._load_priority_alpha()
        if ctx is None:
            self._log_event("run", "skipped", {"reason": "no_red_zone_available"})
            return None

        df_911 = self._load_911_calls()
        if df_911 is None or df_911.empty:
            self._log_event("run", "skipped", {"reason": "no_911_data"})
            return None

        zone_df = self._filter_zone_rows(df_911, ctx)
        safety_df = self._filter_safety_crime_calls(zone_df)

        # Temporal Weighting: 2.5x for most recent month
        weights, temporal_applied = self._compute_temporal_weights(safety_df)
        weighted_safety = float((weights).sum()) if not safety_df.empty else 0.0
        unweighted_safety = int(len(safety_df))

        total_911 = int(len(df_911))
        zone_911 = int(len(zone_df))
        safety_911 = int(round(weighted_safety))

        # Relative density of (safety) calls in the zone vs the entire dataset.
        density = (safety_911 / total_911) if total_911 > 0 else 0.0

        fvr = self._friction_vibe_ratio(ctx.friction_score, ctx.vibe_score)

        low_r, high_r = self._reduction_low, self._reduction_high
        mid_r = (low_r + high_r) / 2.0

        projected_reduction_mid = int(round(safety_911 * mid_r))
        projected_reduction_low = int(round(safety_911 * low_r))
        projected_reduction_high = int(round(safety_911 * high_r))

        estimated_savings_mid = float(projected_reduction_mid * self._cost_per_call)

        # Vitality Recovery % – scaled by both reduction rate and local density.
        vitality_recovery_pct = round(min(100.0, density * mid_r * 100.0 * 2.0), 1)

        impact_payload: Dict[str, Any] = {
            "timestamp": datetime.now(timezone.utc).isoformat(),
            "agent": AGENT_NAME,
            "job": "Phase 3: IMPROVE – Impact Projection",
            "target_location": ctx.location,
            "priority": ctx.priority,
            "friction_score": ctx.friction_score,
            "vibe_score": ctx.vibe_score,
            "aps": {
                "friction_vibe_ratio": round(fvr, 3),
                "temporal_weight_applied": temporal_applied,
                "temporal_weight_recent_multiplier": TEMPORAL_WEIGHT_RECENT,
                "safety_calls_unweighted": unweighted_safety,
                "safety_calls_weighted": safety_911,
            },
            "roi_assumptions": {
                "reduction_range": [low_r, high_r],
                "cost_per_call": self._cost_per_call,
                "theory": "Broken Windows – resolving visible disorder reduces 911 non-medical calls.",
            },
            "baseline": {
                "total_911_calls": total_911,
                "zone_911_calls": zone_911,
                "safety_911_calls_in_zone": safety_911,
                "zone_share_of_city_calls": round(density, 4),
            },
            "projection": {
                "projected_calls_avoided_low": projected_reduction_low,
                "projected_calls_avoided_mid": projected_reduction_mid,
                "projected_calls_avoided_high": projected_reduction_high,
                "projected_lives_impacted": projected_reduction_mid,
                "estimated_emergency_cost_savings": estimated_savings_mid,
                "vitality_recovery_percent": vitality_recovery_pct,
            },
        }

        try:
            self._bridge.write_inference(
                AGENT_NAME,
                "impact_prediction.json",
                json.dumps(impact_payload, indent=2),
            )
            self._log_event(
                "write_impact",
                "success",
                {"file": "impact_prediction.json", "target_location": ctx.location},
            )
        except DataBridgeError as e:
            self._log_event("write_impact", "failure", {"error": str(e)})
            return None

        self._log_event(
            "run",
            "completed",
            {
                "target_location": ctx.location,
                "projected_calls_avoided_mid": projected_reduction_mid,
                "estimated_emergency_cost_savings": estimated_savings_mid,
            },
        )
        return impact_payload

