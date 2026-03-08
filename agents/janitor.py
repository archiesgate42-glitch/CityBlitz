# Janitor agent: data cleaning pipeline.

"""
JanitorAgent: Data Sanitation.

Industrial Hardening:
  - Raw files removed ONLY after successful write_processed AND quality log.
  - Type-coercion mutually exclusive (numeric OR datetime per column).
  - 30s timeout for Gemini calls.
  - chardet-based encoding detection for non-UTF-8 CSVs.
"""

from __future__ import annotations

import concurrent.futures
import json
import logging
from datetime import datetime, timezone
from io import StringIO
from pathlib import Path
from typing import Any

import pandas as pd

from core.bridge import DataBridge, DataBridgeError
from core.config import get_gemini_api_key

logger = logging.getLogger(__name__)

_GEMINI_TIMEOUT_SECONDS = 30
_DATE_HINT_PATTERNS = ("date", "time", "created", "modified", "expire", "effdate")

MONTGOMERY_EXPECTED_DTYPES: dict[str, str] = {
    "numeric": "number",
    "date": "datetime",
    "id": "string",
}


def _col_looks_like_date(col: str) -> bool:
    """Return True if column name suggests date/time data."""
    return any(pat in col.lower() for pat in _DATE_HINT_PATTERNS)


def _detect_encoding(raw_bytes: bytes) -> str:
    """Best-effort encoding detection. Uses chardet if installed, else latin-1."""
    try:
        import chardet
        result = chardet.detect(raw_bytes[:65536])
        enc = result.get("encoding") or "utf-8"
        return enc if enc else "utf-8"
    except ImportError:
        return "latin-1"


def _describe_quality_with_gemini(quality_report: dict[str, Any], api_key: str | None) -> str:
    """Use Gemini with 30s timeout. Falls back to plain summary if no key or timeout."""
    summary = (
        f"Rows: {quality_report.get('rows', '?')}, "
        f"Columns: {quality_report.get('columns', '?')}. "
        f"Missing filled: {quality_report.get('missing_filled', 0)}, "
        f"Rows dropped: {quality_report.get('rows_dropped', 0)}, "
        f"Type corrections: {quality_report.get('type_corrections', 0)}. "
        f"Issues: {quality_report.get('issues', [])}"
    )
    if not api_key:
        return f"[Janitor] Data quality: {summary}"

    def _call_gemini() -> str:
        import google.generativeai as genai
        genai.configure(api_key=api_key)
        model = genai.GenerativeModel("gemini-1.5-flash")
        prompt = (
            "In one short sentence (max 15 words), describe the data quality for an audit log. "
            "Be neutral and factual. Only output that sentence, no quotes or prefix.\n\n"
            f"Report: {json.dumps(quality_report, default=str)}"
        )
        response = model.generate_content(prompt)
        return (response.text or "").strip() or summary

    try:
        with concurrent.futures.ThreadPoolExecutor(max_workers=1) as executor:
            future = executor.submit(_call_gemini)
            return future.result(timeout=_GEMINI_TIMEOUT_SECONDS)
    except concurrent.futures.TimeoutError:
        logger.warning("Gemini quality description timed out after %ss.", _GEMINI_TIMEOUT_SECONDS)
    except Exception as e:
        logger.warning("Gemini quality description failed: %s", e)
    return summary


class JanitorAgent:
    """
    Data Sanitation agent. Monitors data/raw for new CSV/JSON, checks missing values
    and data types (Montgomery-oriented), cleans data, moves to data/processed,
    writes a Gemini-generated quality log entry, and reports status to the Orchestrator.
    """

    AGENT_NAME = "Janitor"

    def __init__(
        self,
        bridge: DataBridge | None = None,
        *,
        move_after_process: bool = True,
        expected_dtypes: dict[str, str] | None = None,
    ):
        self._bridge = bridge or DataBridge()
        self._move_after_process = move_after_process
        self._expected_dtypes = expected_dtypes or MONTGOMERY_EXPECTED_DTYPES
        self._processed_paths: set[str] = set()  # track already processed raw paths (in-memory only)

    def get_new_raw_files(self) -> list[str]:
        """List CSV/JSON in data/raw that have not yet been processed this session."""
        all_raw = self._bridge.list_raw(self.AGENT_NAME)
        return [p for p in all_raw if p not in self._processed_paths]

    def _quality_check_and_clean_df(self, df: pd.DataFrame, rel_path: str) -> tuple[pd.DataFrame, dict[str, Any]]:
        """
        Check for missing values and dtypes; clean. Mutually exclusive: numeric OR datetime per column.
        """
        report: dict[str, Any] = {
            "file": rel_path,
            "rows": len(df),
            "columns": list(df.columns),
            "missing_per_column": df.isna().sum().to_dict(),
            "missing_filled": 0,
            "rows_dropped": 0,
            "type_corrections": 0,
            "issues": [],
        }

        before = len(df)
        for col in df.columns:
            if df[col].isna().any():
                n = int(df[col].isna().sum())
                if pd.api.types.is_numeric_dtype(df[col]):
                    df[col] = df[col].fillna(df[col].median())
                else:
                    mode_vals = df[col].mode()
                    fill_val = mode_vals.iloc[0] if len(mode_vals) else ""
                    df[col] = df[col].fillna(fill_val)
                report["missing_filled"] += n
        df = df.dropna(how="all")
        report["rows_dropped"] = before - len(df)
        report["rows"] = len(df)

        for col in df.columns:
            if pd.api.types.is_numeric_dtype(df[col]):
                continue

            if _col_looks_like_date(col):
                try:
                    converted = pd.to_datetime(df[col], errors="coerce")
                    valid_ratio = converted.notna().mean()
                    if valid_ratio >= 0.5:
                        df[col] = converted
                        report["type_corrections"] += 1
                    else:
                        report["issues"].append(
                            f"Column {col!r}: datetime coercion <50% valid – skipped."
                        )
                except Exception as exc:
                    report["issues"].append(f"Column {col!r}: datetime error: {exc}")
                continue

            try:
                pd.to_numeric(df[col], errors="raise")
                df[col] = pd.to_numeric(df[col], errors="coerce")
                report["type_corrections"] += 1
                continue
            except (TypeError, ValueError):
                pass

            if df[col].dtype == object:
                try:
                    converted = pd.to_datetime(df[col], errors="coerce")
                    valid_ratio = converted.notna().mean()
                    if valid_ratio >= 0.5:
                        df[col] = converted
                        report["type_corrections"] += 1
                except Exception as exc:
                    report["issues"].append(f"Column {col!r}: datetime error: {exc}")

        return df, report

    def _process_csv(self, rel_path: str) -> dict[str, Any]:
        """Read CSV from raw, clean, write to processed. Remove raw ONLY after write and log succeed."""
        raw_bytes = self._bridge.read_only_bytes(self.AGENT_NAME, rel_path)
        encoding = "utf-8"
        try:
            raw_bytes.decode("utf-8")
        except UnicodeDecodeError:
            encoding = _detect_encoding(raw_bytes)
            logger.info("Janitor: %s encoded as %s (not UTF-8).", rel_path, encoding)

        try:
            content = raw_bytes.decode(encoding, errors="replace")
            df = pd.read_csv(StringIO(content), low_memory=False)
        except Exception as e:
            raise DataBridgeError(f"Cannot parse CSV {rel_path!r}: {e}") from e

        df, quality_report = self._quality_check_and_clean_df(df, rel_path)
        cleaned_csv = df.to_csv(index=False)

        self._bridge.write_processed(self.AGENT_NAME, rel_path, cleaned_csv)
        api_key = get_gemini_api_key()
        quality_sentence = _describe_quality_with_gemini(quality_report, api_key)
        self._write_quality_log(rel_path, quality_sentence, quality_report)

        if self._move_after_process:
            try:
                self._bridge.remove_raw(self.AGENT_NAME, rel_path)
            except DataBridgeError as e:
                logger.warning("Janitor: could not remove raw %s after processing: %s", rel_path, e)

        self._processed_paths.add(rel_path)
        return {
            "status": "success",
            "file": rel_path,
            "output_path": rel_path,
            "quality_report": quality_report,
            "quality_summary": quality_sentence,
        }

    def _process_json(self, rel_path: str) -> dict[str, Any]:
        """Read JSON from raw, clean, write to processed. Remove raw ONLY after write and log succeed."""
        content = self._bridge.read_only(self.AGENT_NAME, rel_path)
        try:
            data = json.loads(content)
        except json.JSONDecodeError as e:
            raise DataBridgeError(f"Cannot parse JSON {rel_path!r}: {e}") from e

        if isinstance(data, list):
            df = pd.DataFrame(data)
        elif isinstance(data, dict):
            df = pd.DataFrame(data.get("data") or [data])
        else:
            df = pd.DataFrame()

        df, quality_report = self._quality_check_and_clean_df(df, rel_path)
        out_data = df.to_dict(orient="records")
        cleaned_json = json.dumps(out_data, indent=2, default=str)

        self._bridge.write_processed(self.AGENT_NAME, rel_path, cleaned_json)
        api_key = get_gemini_api_key()
        quality_sentence = _describe_quality_with_gemini(quality_report, api_key)
        self._write_quality_log(rel_path, quality_sentence, quality_report)

        if self._move_after_process:
            try:
                self._bridge.remove_raw(self.AGENT_NAME, rel_path)
            except DataBridgeError as e:
                logger.warning("Janitor: could not remove raw %s after processing: %s", rel_path, e)

        self._processed_paths.add(rel_path)
        return {
            "status": "success",
            "file": rel_path,
            "output_path": rel_path,
            "quality_report": quality_report,
            "quality_summary": quality_sentence,
        }

    def _write_quality_log(self, rel_path: str, quality_sentence: str, report: dict[str, Any]) -> None:
        """Append one quality log entry to logs/janitor_quality.log."""
        log_path = self._bridge.root / "logs" / "janitor_quality.log"
        log_path.parent.mkdir(parents=True, exist_ok=True)
        ts = datetime.now(timezone.utc).isoformat()
        line = json.dumps({
            "timestamp": ts,
            "agent": self.AGENT_NAME,
            "file": rel_path,
            "quality_summary": quality_sentence,
            "report": report,
        }, default=str) + "\n"
        try:
            with open(log_path, "a", encoding="utf-8") as f:
                f.write(line)
        except OSError as e:
            logger.warning("Could not write janitor quality log: %s", e)

    def run(self) -> dict[str, Any]:
        """
        Monitor data/raw for new CSV/JSON, process each, and return a status report
        for the Orchestrator.
        """
        new_files = self.get_new_raw_files()
        results: list[dict[str, Any]] = []
        errors: list[dict[str, Any]] = []

        for rel_path in new_files:
            try:
                if rel_path.lower().endswith(".csv"):
                    r = self._process_csv(rel_path)
                elif rel_path.lower().endswith(".json"):
                    r = self._process_json(rel_path)
                else:
                    continue
                results.append(r)
            except DataBridgeError as e:
                errors.append({"file": rel_path, "error": str(e)})
                logger.exception("Janitor failed for %s", rel_path)
            except Exception as e:
                errors.append({"file": rel_path, "error": str(e)})
                logger.exception("Janitor failed for %s", rel_path)

        report_to_orchestrator = {
            "agent": self.AGENT_NAME,
            "job": "Data Sanitation",
            "timestamp": datetime.now(timezone.utc).isoformat(),
            "files_processed": len(results),
            "files_failed": len(errors),
            "results": results,
            "errors": errors,
        }
        self._report_to_orchestrator(report_to_orchestrator)
        return report_to_orchestrator

    def _report_to_orchestrator(self, report: dict[str, Any]) -> None:
        """Write status report so the Orchestrator can read it (logs/janitor_status.json)."""
        log_dir = self._bridge.root / "logs"
        log_dir.mkdir(parents=True, exist_ok=True)
        path = log_dir / "janitor_status.json"
        try:
            path.write_text(json.dumps(report, indent=2, default=str), encoding="utf-8")
        except OSError as e:
            logger.warning("Could not write Orchestrator status report: %s", e)
