from __future__ import annotations

"""
AnalystAgent: Hotspot Detection for CityBlitz Phase 1: BROKEN

Minimal implementation for orchestrated test runs:
- Reads cleaned data from data/processed via DataBridge (if available).
- Derives a very simple hotspot list (one synthetic hotspot per available file).
- Writes hotspot_analysis.json into data/inference for ObserverAgent.
"""

import json
from dataclasses import dataclass
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Dict, List, Optional

from core.bridge import DataBridge, DataBridgeError


ANALYST_AGENT_NAME = "Analyst"


@dataclass
class SimpleHotspot:
    location: str
    friction_score: float
    meta: Dict[str, Any]


class AnalystAgent:
    """
    Minimal AnalystAgent for Phase 1 test runs.

    NOTE: This is intentionally lightweight; it treats each processed file as
    a potential hotspot and assigns a synthetic friction score based on filename.
    """

    def __init__(self, bridge: Optional[DataBridge] = None) -> None:
        self._bridge = bridge or DataBridge()

    def _discover_processed_files(self) -> List[Path]:
        root = self._bridge.root
        processed_dir = root / "data" / "processed"
        if not processed_dir.exists():
            return []
        return [p for p in processed_dir.rglob("*.csv")] + [p for p in processed_dir.rglob("*.json")]

    def _make_hotspot_from_path(self, path: Path) -> SimpleHotspot:
        # Derive a pseudo-zip/district from the filename (sans extension)
        stem = path.stem
        location = stem
        # Simple pseudo friction: longer names and deeper paths map to higher friction
        depth_factor = len(path.relative_to(self._bridge.root).parts)
        name_factor = min(len(stem) / 10.0, 1.0)
        friction = min(0.4 + 0.1 * depth_factor + 0.3 * name_factor, 1.0)
        return SimpleHotspot(
            location=location,
            friction_score=friction,
            meta={
                "source_file": str(path.relative_to(self._bridge.root / "data" / "processed")),
            },
        )

    def run(self) -> Dict[str, Any]:
        """
        Produce a basic hotspot_analysis.json artifact for downstream agents.

        Returns a summary dict with hotspot count for the Orchestrator.
        """
        files = self._discover_processed_files()
        hotspots: List[Dict[str, Any]] = []

        for f in files:
            hs = self._make_hotspot_from_path(f)
            hotspots.append(
                {
                    "zip_code": hs.location,
                    "friction_score": round(hs.friction_score, 3),
                    "meta": hs.meta,
                }
            )

        payload = {
            "timestamp": datetime.now(timezone.utc).isoformat(),
            "agent": ANALYST_AGENT_NAME,
            "hotspots": hotspots,
        }

        try:
            self._bridge.write_inference(ANALYST_AGENT_NAME, "hotspot_analysis.json", json.dumps(payload, indent=2))
        except DataBridgeError:
            # Surface this by simply re-raising to Orchestrator
            raise

        return {
            "agent": ANALYST_AGENT_NAME,
            "hotspots_detected": len(hotspots),
        }

