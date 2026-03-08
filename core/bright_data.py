import os
import time
import requests
from typing import List, Dict, Any, Optional, Union
from core.config import get_bright_data_api_key, get_bright_data_dataset_id

class BrightDataError(Exception):
    """Base exception for Bright Data API errors."""
    pass

class BrightDataClient:
    """
    Typed wrapper for Bright Data's Crawl API v3.
    Industrial Hardening:
    - Centralized error normalization.
    - Polling with exponential backoff.
    - Typed request/response interfaces.
    """

    BASE_URL = "https://api.brightdata.com/datasets/v3"

    def __init__(self, api_key: Optional[str] = None, dataset_id: Optional[str] = None):
        self._api_key = api_key or get_bright_data_api_key()
        self._dataset_id = dataset_id or get_bright_data_dataset_id()
        if not self._api_key:
            raise BrightDataError("Bright Data API Key is missing.")

    @property
    def _headers(self) -> Dict[str, str]:
        return {
            "Authorization": f"Bearer {self._api_key}",
            "Content-Type": "application/json"
        }

    def trigger_crawl(self, urls: List[str], include_errors: bool = True, custom_output_fields: Optional[str] = "markdown|ld_json|html") -> str:
        """
        Trigger a crawl for a list of URLs. Returns snapshot_id.
        """
        if not self._dataset_id:
            raise BrightDataError("Bright Data Dataset ID is missing.")

        endpoint = f"{self.BASE_URL}/trigger"
        params = {
            "dataset_id": self._dataset_id,
            "include_errors": str(include_errors).lower()
        }
        if custom_output_fields:
            params["custom_output_fields"] = custom_output_fields

        payload = [{"url": url} for url in urls]

        try:
            resp = requests.post(endpoint, params=params, json=payload, headers=self._headers, timeout=30)
            resp.raise_for_status()
            data = resp.json()
            snapshot_id = data.get("snapshot_id")
            if not snapshot_id:
                raise BrightDataError(f"API response missing snapshot_id: {data}")
            return snapshot_id
        except requests.RequestException as e:
            raise BrightDataError(f"Failed to trigger crawl: {e}")

    def get_progress(self, snapshot_id: str) -> Dict[str, Any]:
        """
        Monitor progress of a snapshot.
        Returns: {'status': 'starting'|'running'|'ready'|'failed', ...}
        """
        endpoint = f"{self.BASE_URL}/progress/{snapshot_id}"
        try:
            resp = requests.get(endpoint, headers=self._headers, timeout=20)
            resp.raise_for_status()
            return resp.json()
        except requests.RequestException as e:
            raise BrightDataError(f"Failed to fetch progress for {snapshot_id}: {e}")

    def download_snapshot(self, snapshot_id: str, format: str = "json", compress: bool = False) -> Union[List[Dict[str, Any]], str]:
        """
        Download the finished snapshot.
        """
        endpoint = f"{self.BASE_URL}/snapshot/{snapshot_id}"
        params = {
            "format": format,
            "compress": str(compress).lower()
        }
        try:
            resp = requests.get(endpoint, params=params, headers=self._headers, timeout=60)
            resp.raise_for_status()
            if format == "json":
                return resp.json()
            return resp.text
        except requests.RequestException as e:
            raise BrightDataError(f"Failed to download snapshot {snapshot_id}: {e}")

    def poll_until_ready(self, snapshot_id: str, max_timeout_sec: int = 600, initial_delay: int = 5) -> Union[List[Dict[str, Any]], str]:
        """
        Poll progress and download result when ready with exponential backoff.
        """
        start_time = time.time()
        delay = initial_delay
        
        while (time.time() - start_time) < max_timeout_sec:
            progress = self.get_progress(snapshot_id)
            status = progress.get("status")
            
            if status == "ready":
                return self.download_snapshot(snapshot_id)
            elif status == "failed":
                raise BrightDataError(f"Snapshot {snapshot_id} failed on Bright Data side.")
            
            # Exponential backoff capped at 30s
            time.sleep(delay)
            delay = min(delay * 2, 30)
            
        raise TimeoutError(f"Polling for snapshot {snapshot_id} timed out after {max_timeout_sec}s")
