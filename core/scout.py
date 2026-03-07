from __future__ import annotations

"""
Scout utilities for Global Sweep (autonomous dataset discovery).

Phase: IMPROVE / Global Sweep
-----------------------------
- Fetch DCAT feed from Montgomery Open Data Portal.
- Parse dataset metadata and locate CSV/GeoJSON download URLs.
- Prioritize Business, Construction, Demolitions, and Public Safety datasets.
- Use DataBridge.fetch_external_data to ingest raw files into data/raw/external.
"""

from dataclasses import dataclass
from typing import Any, Dict, List, Optional

import requests

from core.bridge import DataBridge, DataBridgeError


DCAT_FEED_URL = "https://opendata.montgomeryal.gov/api/feed/dcat-us/1.1.json"

# Keywords to prioritize for Global Sweep
PRIORITY_KEYWORDS = (
    "business",
    "license",
    "construction",
    "demolition",
    "demolitions",
    "permit",
    "code enforcement",
    "public safety",
    "police",
    "fire",
    "crime",
)


@dataclass
class DatasetResource:
    title: str
    description: str
    download_url: str
    media_type: str
    score: int


def _fetch_dcat_feed() -> Dict[str, Any]:
    resp = requests.get(DCAT_FEED_URL, timeout=60)
    resp.raise_for_status()
    return resp.json()


def _score_dataset(title: str, description: str) -> int:
    text = f"{title} {description}".lower()
    return sum(1 for kw in PRIORITY_KEYWORDS if kw in text)


def discover_priority_resources(max_items: int = 10) -> List[DatasetResource]:
    """
    Fetch DCAT feed and return prioritized CSV/GeoJSON download URLs.
    """
    catalog = _fetch_dcat_feed()
    datasets = catalog.get("dataset") or []

    resources: List[DatasetResource] = []
    for ds in datasets:
        if not isinstance(ds, dict):
            continue
        title = str(ds.get("title") or "")
        desc = str(ds.get("description") or "")
        score = _score_dataset(title, desc)

        for dist in ds.get("distribution") or []:
            if not isinstance(dist, dict):
                continue
            url = dist.get("downloadURL") or dist.get("accessURL")
            if not url:
                continue
            media = (dist.get("mediaType") or "").lower()
            url_l = str(url).lower()

            is_csv = "csv" in media or url_l.endswith(".csv")
            is_geo = "geo+json" in media or url_l.endswith(".geojson") or url_l.endswith(".json")

            if not (is_csv or is_geo):
                continue

            # Only keep datasets that have at least minimal relevance.
            if score <= 0:
                continue

            resources.append(
                DatasetResource(
                    title=title,
                    description=desc,
                    download_url=str(url),
                    media_type=media or ("text/csv" if is_csv else "application/geo+json"),
                    score=score,
                )
            )

    # Sort by score (desc) then title
    resources.sort(key=lambda r: (-r.score, r.title))
    return resources[:max_items]


def run_global_scout(bridge: DataBridge, max_items: int = 10) -> Dict[str, Any]:
    """
    Execute Global Sweep discovery and ingest prioritized datasets into data/raw.

    Returns a small summary dict for UI display.
    """
    discovered = discover_priority_resources(max_items=max_items)
    downloaded: List[str] = []
    errors: List[Dict[str, str]] = []

    for res in discovered:
        try:
            # Use Orchestrator identity for auditing; this is a system-level ingest.
            path = bridge.fetch_external_data("Orchestrator", res.download_url)
            downloaded.append(str(path.relative_to(bridge.root)))
        except DataBridgeError as e:
            errors.append({"url": res.download_url, "error": str(e)})

    return {
        "discovered_count": len(discovered),
        "downloaded_count": len(downloaded),
        "downloaded_paths": downloaded,
        "errors": errors,
    }

