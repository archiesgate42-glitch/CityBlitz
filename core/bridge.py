# Bridge: data-access layer for raw, processed, and inference data.
"""
DataBridge: the ONLY gateway for agents to access data.
Enforces read-only from data/raw, write-only to data/inference, with full audit logging.
"""

from pathlib import Path
import json
from datetime import datetime, timezone
from typing import Union

import requests

# Allowed agent names for audit clarity
ALLOWED_AGENTS = frozenset({"Janitor", "Analyst", "Observer", "Orchestrator", "Impact"})


class DataBridgeError(Exception):
    """Raised when a data access rule is violated or path is invalid."""


class DataBridge:
    """
    Single gateway for all agent data access.
    - read_only: read from data/raw only.
    - read_inference: read from data/inference only.
    - write_processed: write to data/processed only (e.g. Janitor cleaned output).
    - write_inference: write to data/inference only.
    All access is logged for auditability (Industrial Grade).
    """

    def __init__(self, base_path: Union[str, Path, None] = None):
        """
        Args:
            base_path: Project root. Defaults to parent of core/ (this file's grandparent).
        """
        if base_path is None:
            base_path = Path(__file__).resolve().parent.parent
        self._root = Path(base_path).resolve()
        self._raw_dir = self._root / "data" / "raw"
        self._processed_dir = self._root / "data" / "processed"
        self._inference_dir = self._root / "data" / "inference"
        self._logs_dir = self._root / "logs"
        self._audit_log = self._logs_dir / "data_access_audit.log"
        self._raw_dir.mkdir(parents=True, exist_ok=True)
        self._processed_dir.mkdir(parents=True, exist_ok=True)
        self._inference_dir.mkdir(parents=True, exist_ok=True)
        self._logs_dir.mkdir(parents=True, exist_ok=True)

    @property
    def root(self) -> Path:
        """Project root directory (read-only)."""
        return self._root

    def _resolve_under(self, segment: str, base: Path) -> Path:
        """Resolve a relative path under base; forbid escaping with '..'."""
        if not segment or segment.strip() != segment:
            raise DataBridgeError("Path segment must be non-empty and not start/end with whitespace")
        # Normalize and remove leading slashes
        segment = segment.lstrip("/").replace("\\", "/")
        if ".." in segment or segment.startswith("/"):
            raise DataBridgeError("Path must not contain '..' or be absolute")
        resolved = (base / segment).resolve()
        try:
            resolved.relative_to(base)
        except ValueError:
            raise DataBridgeError(f"Path escapes allowed directory: {segment!r}")
        return resolved

    def _log_access(self, agent: str, action: str, path: str, success: bool, detail: str = "") -> None:
        """Append one audit record to the log file."""
        record = {
            "timestamp": datetime.now(timezone.utc).isoformat(),
            "agent": agent,
            "action": action,
            "path": path,
            "success": success,
            "detail": detail,
        }
        line = json.dumps(record, ensure_ascii=False) + "\n"
        try:
            with open(self._audit_log, "a", encoding="utf-8") as f:
                f.write(line)
        except OSError:
            pass  # Do not break the main operation if logging fails

    def read_only(self, agent: str, path: str, encoding: str = "utf-8") -> str:
        """
        Fetch data from data/raw only. This is the only way agents may read raw data.

        Args:
            agent: One of Janitor, Analyst, Observer, Orchestrator (for audit).
            path: Relative path under data/raw (e.g. "montgomery/2024.csv").
            encoding: Text encoding for the file.

        Returns:
            File contents as string.

        Raises:
            DataBridgeError: If path is invalid or outside data/raw.
        """
        if agent not in ALLOWED_AGENTS:
            self._log_access(agent, "read_only", path, False, "agent not in allowed list")
            raise DataBridgeError(f"Unknown agent: {agent!r}. Allowed: {sorted(ALLOWED_AGENTS)}")

        try:
            full_path = self._resolve_under(path, self._raw_dir)
        except DataBridgeError as e:
            self._log_access(agent, "read_only", path, False, str(e))
            raise

        if not full_path.exists():
            self._log_access(agent, "read_only", path, False, "file not found")
            raise DataBridgeError(f"Raw file not found: {path!r}")

        try:
            content = full_path.read_text(encoding=encoding)
            self._log_access(agent, "read_only", path, True)
            return content
        except OSError as e:
            self._log_access(agent, "read_only", path, False, str(e))
            raise DataBridgeError(f"Cannot read raw file {path!r}: {e}") from e

    def read_inference(self, agent: str, path: str, encoding: str = "utf-8") -> str:
        """
        Fetch data from data/inference only. This is the only way agents may read
        model conclusions and downstream analytics.

        Args:
            agent: One of Janitor, Analyst, Observer, Orchestrator (for audit).
            path: Relative path under data/inference (e.g. "hotspot_analysis.json").
            encoding: Text encoding for the file.

        Returns:
            File contents as string.

        Raises:
            DataBridgeError: If path is invalid or outside data/inference.
        """
        if agent not in ALLOWED_AGENTS:
            self._log_access(agent, "read_inference", path, False, "agent not in allowed list")
            raise DataBridgeError(f"Unknown agent: {agent!r}. Allowed: {sorted(ALLOWED_AGENTS)}")

        try:
            full_path = self._resolve_under(path, self._inference_dir)
        except DataBridgeError as e:
            self._log_access(agent, "read_inference", path, False, str(e))
            raise

        if not full_path.exists():
            self._log_access(agent, "read_inference", path, False, "file not found")
            raise DataBridgeError(f"Inference file not found: {path!r}")

        try:
            content = full_path.read_text(encoding=encoding)
            self._log_access(agent, "read_inference", path, True)
            return content
        except OSError as e:
            self._log_access(agent, "read_inference", path, False, str(e))
            raise DataBridgeError(f"Cannot read inference file {path!r}: {e}") from e

    def read_processed(self, agent: str, path: str, encoding: str = "utf-8") -> str:
        """
        Fetch data from data/processed only. This is the only way agents may read
        cleaned/sanitized datasets.

        Args:
            agent: One of Janitor, Analyst, Observer, Orchestrator (for audit).
            path: Relative path under data/processed (e.g. "911_Calls.csv").
            encoding: Text encoding for the file.

        Returns:
            File contents as string.

        Raises:
            DataBridgeError: If path is invalid or outside data/processed.
        """
        if agent not in ALLOWED_AGENTS:
            self._log_access(agent, "read_processed", path, False, "agent not in allowed list")
            raise DataBridgeError(f"Unknown agent: {agent!r}. Allowed: {sorted(ALLOWED_AGENTS)}")

        try:
            full_path = self._resolve_under(path, self._processed_dir)
        except DataBridgeError as e:
            self._log_access(agent, "read_processed", path, False, str(e))
            raise

        if not full_path.exists():
            self._log_access(agent, "read_processed", path, False, "file not found")
            raise DataBridgeError(f"Processed file not found: {path!r}")

        try:
            content = full_path.read_text(encoding=encoding)
            self._log_access(agent, "read_processed", path, True)
            return content
        except OSError as e:
            self._log_access(agent, "read_processed", path, False, str(e))
            raise DataBridgeError(f"Cannot read processed file {path!r}: {e}") from e

    def read_log(self, agent: str, path: str, encoding: str = "utf-8") -> str:
        """
        Fetch a log file from logs/ (e.g. data_access_audit.log, orchestrator_agent.log).

        This is primarily intended for dashboards and audits; it is read-only.

        Args:
            agent: One of Janitor, Analyst, Observer, Orchestrator (for audit).
            path: Relative path under logs/ (e.g. "data_access_audit.log").
            encoding: Text encoding for the file.

        Returns:
            File contents as string.

        Raises:
            DataBridgeError: If path is invalid or file is missing.
        """
        if agent not in ALLOWED_AGENTS:
            self._log_access(agent, "read_log", path, False, "agent not in allowed list")
            raise DataBridgeError(f"Unknown agent: {agent!r}. Allowed: {sorted(ALLOWED_AGENTS)}")

        try:
            full_path = self._resolve_under(path, self._logs_dir)
        except DataBridgeError as e:
            self._log_access(agent, "read_log", path, False, str(e))
            raise

        if not full_path.exists():
            self._log_access(agent, "read_log", path, False, "file not found")
            raise DataBridgeError(f"Log file not found: {path!r}")

        try:
            content = full_path.read_text(encoding=encoding)
            self._log_access(agent, "read_log", path, True)
            return content
        except OSError as e:
            self._log_access(agent, "read_log", path, False, str(e))
            raise DataBridgeError(f"Cannot read log file {path!r}: {e}") from e

    def fetch_external_data(self, agent: str, url: str, target_name: str | None = None) -> Path:
        """
        Download an external dataset into data/raw using industrial logging.

        Args:
            agent: One of the allowed agents (typically Orchestrator/Impact/Analyst).
            url: HTTP(S) URL to fetch.
            target_name: Optional file name under data/raw/external/. If omitted,
                it is derived from the URL path.

        Returns:
            The resolved Path to the downloaded file inside data/raw.
        """
        if agent not in ALLOWED_AGENTS:
            self._log_access(agent, "fetch_external_data", url, False, "agent not in allowed list")
            raise DataBridgeError(f"Unknown agent: {agent!r}. Allowed: {sorted(ALLOWED_AGENTS)}")

        try:
            parsed_name = Path(url.split("?", 1)[0]).name or "dataset"
        except Exception:
            parsed_name = "dataset"
        filename = target_name or parsed_name
        # Store under data/raw/external/
        segment = str(Path("external") / filename)

        try:
            full_path = self._resolve_under(segment, self._raw_dir)
        except DataBridgeError as e:
            self._log_access(agent, "fetch_external_data", url, False, str(e))
            raise

        full_path.parent.mkdir(parents=True, exist_ok=True)

        try:
            resp = requests.get(url, timeout=60)
            resp.raise_for_status()
            data = resp.content
        except Exception as e:
            self._log_access(agent, "fetch_external_data", url, False, f"request_failed: {e}")
            raise DataBridgeError(f"Failed to fetch external data from {url!r}: {e}") from e

        try:
            full_path.write_bytes(data)
            self._log_access(agent, "fetch_external_data", str(full_path.relative_to(self._raw_dir)), True, url)
            return full_path
        except OSError as e:
            self._log_access(agent, "fetch_external_data", str(full_path), False, f"write_failed: {e}")
            raise DataBridgeError(f"Failed to write external data to {full_path!r}: {e}") from e

    def read_only_bytes(self, agent: str, path: str) -> bytes:
        """
        Fetch data from data/raw as bytes (e.g. for binary files).

        Args:
            agent: One of Janitor, Analyst, Observer, Orchestrator.
            path: Relative path under data/raw.

        Returns:
            File contents as bytes.
        """
        if agent not in ALLOWED_AGENTS:
            self._log_access(agent, "read_only_bytes", path, False, "agent not in allowed list")
            raise DataBridgeError(f"Unknown agent: {agent!r}. Allowed: {sorted(ALLOWED_AGENTS)}")

        try:
            full_path = self._resolve_under(path, self._raw_dir)
        except DataBridgeError as e:
            self._log_access(agent, "read_only_bytes", path, False, str(e))
            raise

        if not full_path.exists():
            self._log_access(agent, "read_only_bytes", path, False, "file not found")
            raise DataBridgeError(f"Raw file not found: {path!r}")

        try:
            content = full_path.read_bytes()
            self._log_access(agent, "read_only_bytes", path, True)
            return content
        except OSError as e:
            self._log_access(agent, "read_only_bytes", path, False, str(e))
            raise DataBridgeError(f"Cannot read raw file {path!r}: {e}") from e

    def list_raw(self, agent: str, extensions: tuple = (".csv", ".json")) -> list[str]:
        """
        List relative paths of files under data/raw with the given extensions.
        Used e.g. by Janitor to discover new CSV/JSON files.

        Args:
            agent: For audit log.
            extensions: File suffixes to include (default .csv, .json).

        Returns:
            Sorted list of relative path strings.
        """
        if agent not in ALLOWED_AGENTS:
            self._log_access(agent, "list_raw", "", False, "agent not in allowed list")
            raise DataBridgeError(f"Unknown agent: {agent!r}. Allowed: {sorted(ALLOWED_AGENTS)}")
        out: list[str] = []
        try:
            for p in sorted(self._raw_dir.rglob("*")):
                if p.is_file() and p.suffix.lower() in extensions:
                    out.append(str(p.relative_to(self._raw_dir)))
            self._log_access(agent, "list_raw", f"count={len(out)}", True)
            return out
        except OSError as e:
            self._log_access(agent, "list_raw", "", False, str(e))
            raise DataBridgeError(f"Cannot list raw dir: {e}") from e

    def write_processed(self, agent: str, path: str, data: Union[str, bytes]) -> Path:
        """
        Save data to data/processed only (e.g. cleaned output from Janitor).

        Args:
            agent: For audit log.
            path: Relative path under data/processed.
            data: String (UTF-8) or bytes.

        Returns:
            Resolved path of the written file.
        """
        if agent not in ALLOWED_AGENTS:
            self._log_access(agent, "write_processed", path, False, "agent not in allowed list")
            raise DataBridgeError(f"Unknown agent: {agent!r}. Allowed: {sorted(ALLOWED_AGENTS)}")
        try:
            full_path = self._resolve_under(path, self._processed_dir)
        except DataBridgeError as e:
            self._log_access(agent, "write_processed", path, False, str(e))
            raise
        full_path.parent.mkdir(parents=True, exist_ok=True)
        try:
            if isinstance(data, str):
                full_path.write_text(data, encoding="utf-8")
            else:
                full_path.write_bytes(data)
            self._log_access(agent, "write_processed", path, True)
            return full_path
        except OSError as e:
            self._log_access(agent, "write_processed", path, False, str(e))
            raise DataBridgeError(f"Cannot write processed file {path!r}: {e}") from e

    def remove_raw(self, agent: str, path: str) -> None:
        """
        Remove a file from data/raw (e.g. after successful move to processed).

        Args:
            agent: For audit log.
            path: Relative path under data/raw.
        """
        if agent not in ALLOWED_AGENTS:
            self._log_access(agent, "remove_raw", path, False, "agent not in allowed list")
            raise DataBridgeError(f"Unknown agent: {agent!r}. Allowed: {sorted(ALLOWED_AGENTS)}")
        try:
            full_path = self._resolve_under(path, self._raw_dir)
        except DataBridgeError as e:
            self._log_access(agent, "remove_raw", path, False, str(e))
            raise
        if not full_path.exists() or not full_path.is_file():
            self._log_access(agent, "remove_raw", path, False, "not a file or missing")
            raise DataBridgeError(f"Raw file not found or not a file: {path!r}")
        try:
            full_path.unlink()
            self._log_access(agent, "remove_raw", path, True)
        except OSError as e:
            self._log_access(agent, "remove_raw", path, False, str(e))
            raise DataBridgeError(f"Cannot remove raw file {path!r}: {e}") from e

    def write_inference(self, agent: str, path: str, data: Union[str, bytes]) -> Path:
        """
        Save data to data/inference only. This is the only way agents may write conclusions.

        Args:
            agent: One of Janitor, Analyst, Observer, Orchestrator (for audit).
            path: Relative path under data/inference (e.g. "orcha/conclusions.json").
            data: String (written as UTF-8) or bytes.

        Returns:
            Resolved path of the written file.

        Raises:
            DataBridgeError: If path is invalid or outside data/inference.
        """
        if agent not in ALLOWED_AGENTS:
            self._log_access(agent, "write_inference", path, False, "agent not in allowed list")
            raise DataBridgeError(f"Unknown agent: {agent!r}. Allowed: {sorted(ALLOWED_AGENTS)}")

        try:
            full_path = self._resolve_under(path, self._inference_dir)
        except DataBridgeError as e:
            self._log_access(agent, "write_inference", path, False, str(e))
            raise

        full_path.parent.mkdir(parents=True, exist_ok=True)

        try:
            if isinstance(data, str):
                full_path.write_text(data, encoding="utf-8")
            else:
                full_path.write_bytes(data)
            self._log_access(agent, "write_inference", path, True)
            return full_path
        except OSError as e:
            self._log_access(agent, "write_inference", path, False, str(e))
            raise DataBridgeError(f"Cannot write inference file {path!r}: {e}") from e
