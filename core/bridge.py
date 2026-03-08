# Bridge: data-access layer for raw, processed, and inference data.
"""
DataBridge: the ONLY gateway for agents to access data.
Enforces read-only from data/raw, write-only to data/inference, with full audit logging.

Industrial Hardening:
  - MAX_READ_SIZE_BYTES (256MB) and MAX_WRITE_SIZE_BYTES (512MB) guards.
  - ALLOWED_WRITE_EXTENSIONS whitelist prevents binary injection.
  - Thread-safe audit logging via Lock.
"""

from pathlib import Path
import json
import threading
from datetime import datetime, timezone
from typing import Union

import requests

# Allowed agent names for audit clarity
ALLOWED_AGENTS = frozenset({"Janitor", "Analyst", "Observer", "Orchestrator", "Impact"})

# Whitelisted extensions for processed / inference writes (prevents binary injection)
ALLOWED_WRITE_EXTENSIONS = frozenset({
    ".csv", ".json", ".txt", ".log", ".parquet", ".geojson",
})

MAX_READ_SIZE_BYTES = 256 * 1024 * 1024   # 256 MB
MAX_WRITE_SIZE_BYTES = 512 * 1024 * 1024  # 512 MB

_EXTERNAL_FETCH_TIMEOUT = (10, 120)  # (connect, read) seconds


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
        self._log_lock = threading.Lock()
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
        if not segment or not segment.strip():
            raise DataBridgeError("Path segment must be non-empty.")
        segment = segment.strip().lstrip("/").replace("\\", "/")
        if ".." in segment.split("/") or segment.startswith("/"):
            raise DataBridgeError(f"Path traversal or absolute path not allowed: {segment!r}")
        resolved = (base / segment).resolve()
        try:
            resolved.relative_to(base.resolve())
        except ValueError:
            raise DataBridgeError(f"Path escapes allowed directory: {segment!r}")
        return resolved

    def _validate_write_extension(self, path: str) -> None:
        """Reject writes with disallowed extensions to prevent binary injection."""
        suffix = Path(path).suffix.lower()
        if suffix and suffix not in ALLOWED_WRITE_EXTENSIONS:
            raise DataBridgeError(
                f"Write rejected: extension {suffix!r} not in allowed set "
                f"{sorted(ALLOWED_WRITE_EXTENSIONS)}."
            )

    def _validate_write_size(self, data: Union[str, bytes]) -> None:
        """Reject writes exceeding MAX_WRITE_SIZE_BYTES."""
        size = len(data.encode("utf-8") if isinstance(data, str) else data)
        if size > MAX_WRITE_SIZE_BYTES:
            raise DataBridgeError(
                f"Write rejected: payload size {size:,} bytes exceeds limit "
                f"{MAX_WRITE_SIZE_BYTES:,} bytes."
            )

    def _validate_agent(self, agent: str, action: str, path: str) -> None:
        """Centralised agent validation."""
        if agent not in ALLOWED_AGENTS:
            self._log_access(agent, action, path, False, "agent not in allowed list")
            raise DataBridgeError(f"Unknown agent: {agent!r}. Allowed: {sorted(ALLOWED_AGENTS)}")

    def _log_access(self, agent: str, action: str, path: str, success: bool, detail: str = "") -> None:
        """Thread-safe append to audit log."""
        record = {
            "timestamp": datetime.now(timezone.utc).isoformat(),
            "agent": agent,
            "action": action,
            "path": path,
            "success": success,
            "detail": detail,
        }
        line = json.dumps(record, ensure_ascii=False) + "\n"
        with self._log_lock:
            try:
                with open(self._audit_log, "a", encoding="utf-8") as f:
                    f.write(line)
            except OSError:
                pass

    def read_only(self, agent: str, path: str, encoding: str = "utf-8") -> str:
        """Fetch data from data/raw only (text)."""
        self._validate_agent(agent, "read_only", path)
        try:
            full_path = self._resolve_under(path, self._raw_dir)
        except DataBridgeError as e:
            self._log_access(agent, "read_only", path, False, str(e))
            raise

        if not full_path.exists():
            self._log_access(agent, "read_only", path, False, "file not found")
            raise DataBridgeError(f"Raw file not found: {path!r}")

        size = full_path.stat().st_size
        if size > MAX_READ_SIZE_BYTES:
            self._log_access(agent, "read_only", path, False, f"file too large: {size} bytes")
            raise DataBridgeError(
                f"Raw file {path!r} is {size:,} bytes, exceeding read limit {MAX_READ_SIZE_BYTES:,}."
            )

        try:
            content = full_path.read_text(encoding=encoding)
            self._log_access(agent, "read_only", path, True)
            return content
        except OSError as e:
            self._log_access(agent, "read_only", path, False, str(e))
            raise DataBridgeError(f"Cannot read raw file {path!r}: {e}") from e

    def read_inference(self, agent: str, path: str, encoding: str = "utf-8") -> str:
        """Fetch data from data/inference only."""
        self._validate_agent(agent, "read_inference", path)
        try:
            full_path = self._resolve_under(path, self._inference_dir)
        except DataBridgeError as e:
            self._log_access(agent, "read_inference", path, False, str(e))
            raise

        if not full_path.exists():
            self._log_access(agent, "read_inference", path, False, "file not found")
            raise DataBridgeError(f"Inference file not found: {path!r}")

        size = full_path.stat().st_size
        if size > MAX_READ_SIZE_BYTES:
            self._log_access(agent, "read_inference", path, False, f"file too large: {size} bytes")
            raise DataBridgeError(
                f"Inference file {path!r} is {size:,} bytes, exceeding read limit {MAX_READ_SIZE_BYTES:,}."
            )

        try:
            content = full_path.read_text(encoding=encoding)
            self._log_access(agent, "read_inference", path, True)
            return content
        except OSError as e:
            self._log_access(agent, "read_inference", path, False, str(e))
            raise DataBridgeError(f"Cannot read inference file {path!r}: {e}") from e

    def read_processed(self, agent: str, path: str, encoding: str = "utf-8") -> str:
        """Fetch data from data/processed only."""
        self._validate_agent(agent, "read_processed", path)
        try:
            full_path = self._resolve_under(path, self._processed_dir)
        except DataBridgeError as e:
            self._log_access(agent, "read_processed", path, False, str(e))
            raise

        if not full_path.exists():
            self._log_access(agent, "read_processed", path, False, "file not found")
            raise DataBridgeError(f"Processed file not found: {path!r}")

        size = full_path.stat().st_size
        if size > MAX_READ_SIZE_BYTES:
            self._log_access(agent, "read_processed", path, False, f"file too large: {size} bytes")
            raise DataBridgeError(
                f"Processed file {path!r} is {size:,} bytes, exceeding read limit {MAX_READ_SIZE_BYTES:,}."
            )

        try:
            content = full_path.read_text(encoding=encoding)
            self._log_access(agent, "read_processed", path, True)
            return content
        except OSError as e:
            self._log_access(agent, "read_processed", path, False, str(e))
            raise DataBridgeError(f"Cannot read processed file {path!r}: {e}") from e

    def read_log(self, agent: str, path: str, encoding: str = "utf-8") -> str:
        """Fetch a log file from logs/ (read-only, for dashboards / audits)."""
        self._validate_agent(agent, "read_log", path)
        try:
            full_path = self._resolve_under(path, self._logs_dir)
        except DataBridgeError as e:
            self._log_access(agent, "read_log", path, False, str(e))
            raise

        if not full_path.exists():
            self._log_access(agent, "read_log", path, False, "file not found")
            raise DataBridgeError(f"Log file not found: {path!r}")

        size = full_path.stat().st_size
        if size > MAX_READ_SIZE_BYTES:
            self._log_access(agent, "read_log", path, False, f"file too large: {size} bytes")
            raise DataBridgeError(
                f"Log file {path!r} is {size:,} bytes, exceeding read limit {MAX_READ_SIZE_BYTES:,}."
            )

        try:
            content = full_path.read_text(encoding=encoding)
            self._log_access(agent, "read_log", path, True)
            return content
        except OSError as e:
            self._log_access(agent, "read_log", path, False, str(e))
            raise DataBridgeError(f"Cannot read log file {path!r}: {e}") from e

    def fetch_external_data(
        self,
        agent: str,
        url: str,
        target_name: str | None = None,
        *,
        chunk_size: int = 8192,
    ) -> Path:
        """
        Download an external dataset into data/raw using chunked streaming.
        Validates URL scheme; honours MAX_WRITE_SIZE_BYTES during download.
        """
        self._validate_agent(agent, "fetch_external_data", url)
        if not url.lower().startswith(("http://", "https://")):
            self._log_access(agent, "fetch_external_data", url, False, "invalid scheme")
            raise DataBridgeError(f"Only http/https URLs are allowed. Got: {url!r}")

        try:
            parsed_name = Path(url.split("?", 1)[0]).name or "dataset"
        except Exception:
            parsed_name = "dataset"
        filename = target_name or parsed_name
        segment = str(Path("external") / filename)

        try:
            full_path = self._resolve_under(segment, self._raw_dir)
        except DataBridgeError as e:
            self._log_access(agent, "fetch_external_data", url, False, str(e))
            raise

        full_path.parent.mkdir(parents=True, exist_ok=True)

        try:
            with requests.get(url, timeout=_EXTERNAL_FETCH_TIMEOUT, stream=True) as resp:
                resp.raise_for_status()
                total = 0
                with open(full_path, "wb") as fh:
                    for chunk in resp.iter_content(chunk_size=chunk_size):
                        if chunk:
                            total += len(chunk)
                            if total > MAX_WRITE_SIZE_BYTES:
                                fh.close()
                                full_path.unlink(missing_ok=True)
                                raise DataBridgeError(
                                    f"External file exceeds size limit {MAX_WRITE_SIZE_BYTES:,} bytes."
                                )
                            fh.write(chunk)
        except requests.RequestException as e:
            self._log_access(agent, "fetch_external_data", url, False, f"request_failed: {e}")
            full_path.unlink(missing_ok=True)
            raise DataBridgeError(f"Failed to fetch external data from {url!r}: {e}") from e
        except DataBridgeError:
            self._log_access(agent, "fetch_external_data", url, False, "size_limit_exceeded")
            raise
        except OSError as e:
            self._log_access(agent, "fetch_external_data", url, False, f"write_failed: {e}")
            raise DataBridgeError(f"Failed to write external data to {full_path!r}: {e}") from e

        self._log_access(
            agent, "fetch_external_data",
            str(full_path.relative_to(self._raw_dir)), True, url,
        )
        return full_path

    def read_only_bytes(self, agent: str, path: str) -> bytes:
        """Fetch data from data/raw as bytes."""
        self._validate_agent(agent, "read_only_bytes", path)
        try:
            full_path = self._resolve_under(path, self._raw_dir)
        except DataBridgeError as e:
            self._log_access(agent, "read_only_bytes", path, False, str(e))
            raise

        if not full_path.exists():
            self._log_access(agent, "read_only_bytes", path, False, "file not found")
            raise DataBridgeError(f"Raw file not found: {path!r}")

        size = full_path.stat().st_size
        if size > MAX_READ_SIZE_BYTES:
            self._log_access(agent, "read_only_bytes", path, False, f"file too large: {size} bytes")
            raise DataBridgeError(
                f"Raw file {path!r} is {size:,} bytes, exceeding read limit {MAX_READ_SIZE_BYTES:,}."
            )

        try:
            content = full_path.read_bytes()
            self._log_access(agent, "read_only_bytes", path, True)
            return content
        except OSError as e:
            self._log_access(agent, "read_only_bytes", path, False, str(e))
            raise DataBridgeError(f"Cannot read raw file {path!r}: {e}") from e

    def list_raw(self, agent: str, extensions: tuple = (".csv", ".json")) -> list[str]:
        """List relative paths of files under data/raw with given extensions."""
        self._validate_agent(agent, "list_raw", "")
        out: list[str] = []
        try:
            for p in sorted(self._raw_dir.rglob("*")):
                if p.is_file() and p.suffix.lower() in extensions:
                    out.append(str(p.relative_to(self._raw_dir)))
            detail = f"count={len(out)}"
            if not out:
                detail += " (empty)"
            self._log_access(agent, "list_raw", detail, True)
            return out
        except OSError as e:
            self._log_access(agent, "list_raw", "", False, str(e))
            raise DataBridgeError(f"Cannot list raw dir: {e}") from e

    def write_processed(self, agent: str, path: str, data: Union[str, bytes]) -> Path:
        """Save data to data/processed only (e.g. cleaned output from Janitor)."""
        self._validate_agent(agent, "write_processed", path)
        self._validate_write_extension(path)
        self._validate_write_size(data)
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
        Idempotent: already-deleted files are logged and ignored.
        """
        self._validate_agent(agent, "remove_raw", path)
        try:
            full_path = self._resolve_under(path, self._raw_dir)
        except DataBridgeError as e:
            self._log_access(agent, "remove_raw", path, False, str(e))
            raise

        if not full_path.exists():
            self._log_access(agent, "remove_raw", path, True, "already absent")
            return

        if not full_path.is_file():
            self._log_access(agent, "remove_raw", path, False, "not a regular file")
            raise DataBridgeError(f"Not a regular file: {path!r}")

        try:
            full_path.unlink()
            self._log_access(agent, "remove_raw", path, True)
        except OSError as e:
            self._log_access(agent, "remove_raw", path, False, str(e))
            raise DataBridgeError(f"Cannot remove raw file {path!r}: {e}") from e

    def write_inference(self, agent: str, path: str, data: Union[str, bytes]) -> Path:
        """Save data to data/inference only. The ONLY way agents may write conclusions."""
        self._validate_agent(agent, "write_inference", path)
        self._validate_write_extension(path)
        self._validate_write_size(data)
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
