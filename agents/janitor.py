# Janitor agent: data cleaning pipeline.

"""
JanitorAgent: Data Sanitation.
Monitors data/raw for CSV/JSON, checks missing values and types (Montgomery dataset),
cleans and moves to data/processed, logs quality via Gemini, and reports to Orchestrator.
"""

from __future__ import annotations

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

# Optional Montgomery dataset expected dtypes (override per run if needed)
MONTGOMERY_EXPECTED_DTYPES: dict[str, str] = {
    "numeric": "number",
    "date": "datetime",
    "id": "string",
}


def _describe_quality_with_gemini(quality_report: dict[str, Any], api_key: str | None) -> str:
    """Use Gemini to produce a short data-quality log entry. Falls back to plain summary if no key."""
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

    try:
        import google.generativeai as genai

        genai.configure(api_key=api_key)
        model = genai.GenerativeModel("gemini-1.5-flash")
        prompt = (
            "In one short sentence (max 15 words), describe the data quality for an audit log. "
            "Be neutral and factual. Only output that sentence, no quotes or prefix.\n\n"
            f"Report: {json.dumps(quality_report, default=str)}"
        )
        response = model.generate_content(prompt)
        if response and response.text:
            return response.text.strip() or summary
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
        """Check for missing values and dtypes, clean, return (cleaned_df, quality_report)."""
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

        # Missing: fill numeric with median, rest with mode; drop rows that are still all-Na
        before = len(df)
        for col in df.columns:
            if df[col].isna().any():
                n = df[col].isna().sum()
                if pd.api.types.is_numeric_dtype(df[col]):
                    df[col] = df[col].fillna(df[col].median())
                else:
                    mode = df[col].mode()
                    df[col] = df[col].fillna(mode.iloc[0] if len(mode) else "")
                report["missing_filled"] += int(n)
        df = df.dropna(how="all")
        report["rows_dropped"] = before - len(df)
        report["rows"] = len(df)

        # Coerce types where possible (Montgomery-style: numeric, date, string)
        for col in df.columns:
            try:
                if pd.api.types.is_numeric_dtype(df[col]):
                    continue
                # Try numeric
                pd.to_numeric(df[col], errors="raise")
                df[col] = pd.to_numeric(df[col], errors="coerce")
                report["type_corrections"] += 1
            except (TypeError, ValueError):
                pass
            try:
                pd.to_datetime(df[col], errors="raise")
                df[col] = pd.to_datetime(df[col], errors="coerce")
                report["type_corrections"] += 1
            except (TypeError, ValueError):
                pass

        return df, report

    def _process_csv(self, rel_path: str) -> dict[str, Any]:
        """Read CSV from raw, clean, write to processed, optionally remove from raw. Return status report."""
        content = self._bridge.read_only(self.AGENT_NAME, rel_path)
        df = pd.read_csv(StringIO(content))
        df, quality_report = self._quality_check_and_clean_df(df, rel_path)

        # Write to processed (same relative path under processed)
        out_path = rel_path
        self._bridge.write_processed(self.AGENT_NAME, out_path, df.to_csv(index=False))

        if self._move_after_process:
            self._bridge.remove_raw(self.AGENT_NAME, rel_path)

        self._processed_paths.add(rel_path)

        # Gemini quality description and log
        api_key = get_gemini_api_key()
        quality_sentence = _describe_quality_with_gemini(quality_report, api_key)
        self._write_quality_log(rel_path, quality_sentence, quality_report)

        return {
            "status": "success",
            "file": rel_path,
            "output_path": out_path,
            "quality_report": quality_report,
            "quality_summary": quality_sentence,
        }

    def _process_json(self, rel_path: str) -> dict[str, Any]:
        """Read JSON from raw, clean (list of objs: fill missing, normalize types), write to processed."""
        content = self._bridge.read_only(self.AGENT_NAME, rel_path)
        data = json.loads(content)

        if isinstance(data, list):
            df = pd.DataFrame(data)
        elif isinstance(data, dict):
            if "data" in data:
                df = pd.DataFrame(data["data"])
            else:
                df = pd.DataFrame([data])
        else:
            df = pd.DataFrame()

        df, quality_report = self._quality_check_and_clean_df(df, rel_path)
        out_data = df.to_dict(orient="records")
        out_path = rel_path
        self._bridge.write_processed(self.AGENT_NAME, out_path, json.dumps(out_data, indent=2))

        if self._move_after_process:
            self._bridge.remove_raw(self.AGENT_NAME, rel_path)

        self._processed_paths.add(rel_path)

        api_key = get_gemini_api_key()
        quality_sentence = _describe_quality_with_gemini(quality_report, api_key)
        self._write_quality_log(rel_path, quality_sentence, quality_report)

        return {
            "status": "success",
            "file": rel_path,
            "output_path": out_path,
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
