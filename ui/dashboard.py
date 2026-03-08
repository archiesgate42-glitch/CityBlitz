from __future__ import annotations

"""
BioNairi | CityBlitz Command Center

High-end Streamlit dashboard for Phase 1: BROKEN
------------------------------------------------
- Reads the cityblitz_priority_roadmap.json and logs via DataBridge.
- Shows Status Command Center for Janitor, Analyst, and Observer.
- Highlights the #1 Red-Zone with Vibe vs. Friction.
- Streams the last lines of the industrial data_access_audit.log.
- Provides a Run Cascade button to trigger OrchestratorAgent.run_cascade().
"""

import sys
from pathlib import Path

# Ensure project root is on path when running as streamlit run ui/dashboard.py
_ROOT = Path(__file__).resolve().parent.parent
if str(_ROOT) not in sys.path:
    sys.path.insert(0, str(_ROOT))

import json
from typing import Any, Dict, List, Optional

import altair as alt
import pandas as pd
import streamlit as st

from core.bridge import DataBridge, DataBridgeError
from core.scout import run_global_scout
from core.bright_data import BrightDataClient, BrightDataError
from agents.orchestrator import OrchestratorAgent


DASHBOARD_AGENT_NAME = "Orchestrator"  # Reuse orchestrator identity for bridge auditing


def _load_priority_roadmap(bridge: DataBridge) -> Optional[Dict[str, Any]]:
    """Load the latest cityblitz_priority_roadmap.json via DataBridge."""
    try:
        raw = bridge.read_inference(DASHBOARD_AGENT_NAME, "cityblitz_priority_roadmap.json")
    except DataBridgeError:
        return None
    try:
        return json.loads(raw)
    except json.JSONDecodeError:
        return None


def _load_impact_prediction(bridge: DataBridge) -> Optional[Dict[str, Any]]:
    """Load impact_prediction.json (Phase 3: IMPROVE) via DataBridge."""
    try:
        raw = bridge.read_inference(DASHBOARD_AGENT_NAME, "impact_prediction.json")
    except DataBridgeError:
        return None
    try:
        return json.loads(raw)
    except json.JSONDecodeError:
        return None


def _load_orchestrator_log(bridge: DataBridge) -> List[Dict[str, Any]]:
    """Load orchestrator_agent.log as a list of JSON records (oldest→newest)."""
    try:
        text = bridge.read_log(DASHBOARD_AGENT_NAME, "orchestrator_agent.log")
    except DataBridgeError:
        return []
    records: List[Dict[str, Any]] = []
    for line in text.splitlines():
        line = line.strip()
        if not line:
            continue
        try:
            records.append(json.loads(line))
        except json.JSONDecodeError:
            continue
    return records


def _load_janitor_status(bridge: DataBridge) -> Optional[Dict[str, Any]]:
    """Load the last Janitor status snapshot if present."""
    try:
        text = bridge.read_log(DASHBOARD_AGENT_NAME, "janitor_status.json")
    except DataBridgeError:
        return None
    try:
        return json.loads(text)
    except json.JSONDecodeError:
        return None


def _extract_phase_status(orchestrator_events: List[Dict[str, Any]], phase_action: str) -> Optional[Dict[str, Any]]:
    """Return the latest event for a given phase action (e.g. 'janitor_phase')."""
    for record in reversed(orchestrator_events):
        if record.get("action") == phase_action:
            return record
    return None


def _tail_data_access_audit(bridge: DataBridge, lines: int = 10) -> List[str]:
    """Return the last N lines from logs/data_access_audit.log via DataBridge."""
    try:
        text = bridge.read_log(DASHBOARD_AGENT_NAME, "data_access_audit.log")
    except DataBridgeError:
        return []
    raw_lines = text.splitlines()
    return raw_lines[-lines:] if raw_lines else []


def _has_completed_cascade(bridge: DataBridge) -> bool:
    """Return True if run_cascade has ever completed successfully."""
    events = _load_orchestrator_log(bridge)
    return any(
        e.get("action") == "run_cascade" and e.get("outcome") == "completed"
        for e in events
    )


def _status_label(outcome: Optional[str]) -> str:
    if not outcome:
        return "Unknown"
    if outcome in {"success", "completed"}:
        return "Healthy"
    if "failure" in outcome or "critical" in outcome:
        return "Critical"
    if outcome in {"no_hotspots", "skipped", "stopped"}:
        return "Attention"
    return outcome.capitalize()


def _render_status_center(
    bridge: DataBridge,
    roadmap: Optional[Dict[str, Any]],
) -> None:
    st.subheader("Status Command Center")

    orchestrator_events = _load_orchestrator_log(bridge)
    janitor_status = _load_janitor_status(bridge)

    janitor_event = _extract_phase_status(orchestrator_events, "janitor_phase")
    analyst_event = _extract_phase_status(orchestrator_events, "analyst_phase")
    observer_event = _extract_phase_status(orchestrator_events, "observer_phase")

    col1, col2, col3 = st.columns(3)

    with col1:
        st.markdown("#### Janitor – Data Sanitation")
        outcome = janitor_event.get("outcome") if janitor_event else None
        label = _status_label(outcome)
        st.metric("Status", label)
        if janitor_status:
            st.caption(
                f"Files processed: {janitor_status.get('files_processed', '?')} · "
                f"Failed: {janitor_status.get('files_failed', '?')}"
            )

    with col2:
        st.markdown("#### Analyst – Hotspot Detection")
        outcome = analyst_event.get("outcome") if analyst_event else None
        label = _status_label(outcome)
        st.metric("Status", label)
        if analyst_event and analyst_event.get("detail"):
            detail = analyst_event["detail"]
            hotspots = detail.get("hotspots_detected") or detail.get("count") or "?"
            st.caption(f"Hotspots detected: {hotspots}")

    with col3:
        st.markdown("#### Observer – Urban Vitality")
        outcome = observer_event.get("outcome") if observer_event else None
        label = _status_label(outcome)
        st.metric("Status", label)
        if roadmap and roadmap.get("red_zone"):
            rz = roadmap["red_zone"]
            st.caption(f"Current Red‑Zone: {rz.get('location', 'N/A')} ({rz.get('priority', 'N/A')})")


def _render_red_zone_card(roadmap: Optional[Dict[str, Any]]) -> None:
    st.subheader("Red‑Zone Alert")

    if not roadmap or not roadmap.get("red_zone"):
        st.info("No Red‑Zone has been identified yet. Run the cascade to generate a roadmap.")
        return

    red = roadmap["red_zone"]
    verdict = roadmap.get("command_verdict", "No verdict available.")

    col1, col2 = st.columns([2, 1])
    with col1:
        st.markdown(
            f"""
            <div style="
                padding: 1.5rem;
                border-radius: 0.75rem;
                background: linear-gradient(120deg, #2b2b2b, #550000);
                color: #f5f5f5;
                border: 1px solid #ff4b4b;
            ">
                <h3 style="margin-top: 0; margin-bottom: 0.25rem;">#1 Red‑Zone: {red.get('location')}</h3>
                <p style="margin: 0.25rem 0; font-size: 0.9rem; opacity: 0.85;">
                    Priority Tier: <strong>{red.get('priority')}</strong><br/>
                    Vibe Score: <strong>{red.get('vibe_score')}</strong> ·
                    Friction Score: <strong>{red.get('friction_score')}</strong>
                </p>
                <p style="margin-top: 0.75rem; font-size: 0.9rem;">
                    Command Verdict:<br/>
                    <strong>{verdict}</strong>
                </p>
            </div>
            """,
            unsafe_allow_html=True,
        )
    with col2:
        st.markdown("##### Phase Context")
        st.write(roadmap.get("phase", "Phase 1: BROKEN"))
        st.caption(roadmap.get("status", "Cascade status not available."))


def _render_vibe_vs_friction_chart(roadmap: Optional[Dict[str, Any]]) -> None:
    st.subheader("Vibe vs. Friction")

    if not roadmap or not roadmap.get("red_zone") and not roadmap.get("locations"):
        st.info("No vitality data available yet. Run the cascade to generate hotspot vitality metrics.")
        return

    locations = roadmap.get("locations") or []
    # If roadmap is minimal (only top red-zone), locations may be missing
    if not locations and roadmap.get("red_zone"):
        rz = roadmap["red_zone"]
        locations = [dict(location=rz.get("location"), vibe_score=rz.get("vibe_score"), friction_score=rz.get("friction_score"))]

    chart_data = pd.DataFrame(
        [
            {
                "Location": loc.get("location"),
                "Vibe Score": float(loc.get("vibe_score", 0.0)),
                "Friction Score": float(loc.get("friction_score", 0.0)),
            }
            for loc in locations
            if loc.get("location") is not None
        ]
    )

    if chart_data.empty:
        st.info("No locations available for charting.")
        return

    st.bar_chart(
        chart_data.set_index("Location")[["Vibe Score", "Friction Score"]],
        use_container_width=True,
    )


def _render_audit_log_tail(bridge: DataBridge) -> None:
    st.subheader("Industrial Audit Log – Data Access (Last 10 Lines)")
    lines = _tail_data_access_audit(bridge, lines=10)
    if not lines:
        st.caption("Audit log is empty or not yet created.")
        return
    st.code("\n".join(lines), language="json")


# ---------------------------------------------------------------------------
# High-Impact Visual (War Room – first 5 seconds)
# ---------------------------------------------------------------------------
def _render_pulse_gauge(roadmap: Optional[Dict[str, Any]]) -> None:
    """Centralized Vibe vs. Friction gauge (Altair)."""
    if not roadmap or not roadmap.get("red_zone"):
        st.caption("No red zone data. Run cascade to see Pulse.")
        return

    rz = roadmap["red_zone"]
    vibe = float(rz.get("vibe_score", 0.5))
    friction = float(rz.get("friction_score", 0.0))

    df = pd.DataFrame([
        {"metric": "Vibe", "value": vibe},
        {"metric": "Friction", "value": friction},
    ])

    chart = (
        alt.Chart(df)
        .mark_bar(size=48)
        .encode(
            x=alt.X("value:Q", scale=alt.Scale(domain=[0, 1]), title=""),
            y=alt.Y("metric:N", title="", sort=["Friction", "Vibe"]),
            color=alt.Color(
                "metric:N",
                scale=alt.Scale(domain=["Vibe", "Friction"], range=["#38bdf8", "#ef4444"]),
                legend=None,
            ),
        )
        .properties(height=140, title=alt.TitleParams(text="Vitality Radar (Vibe vs. Friction)", fontSize=18))
    )
    # Reference rule at 0.4 (Priority Alpha threshold)
    rule = (
        alt.Chart(pd.DataFrame({"x": [0.4]}))
        .mark_rule(strokeDash=[4, 2], stroke="#94a3b8", strokeWidth=2)
        .encode(x="x:Q")
    )
    layered = alt.layer(chart, rule).configure_axis(labelFontSize=14, titleFontSize=12)
    st.altair_chart(layered, use_container_width=True)


def _render_critical_delta(impact: Optional[Dict[str, Any]]) -> None:
    """Single large metric: Potential Safety ROI."""
    if not impact or "projection" not in impact:
        savings = 0
    else:
        savings = int(impact.get("projection", {}).get("estimated_emergency_cost_savings", 0))

    st.markdown(
        f'<p style="font-size: 2.2rem; font-weight: 700; color: #ef4444; margin: 0;">'
        f'Potential Safety ROI: ${savings:,}</p>',
        unsafe_allow_html=True,
    )
    st.caption("Estimated emergency cost savings (Phase 3: IMPROVE)")


def _render_priority_alpha_map_or_card(
    roadmap: Optional[Dict[str, Any]],
    impact: Optional[Dict[str, Any]],
) -> None:
    """Priority Alpha: st.map with red dot if coords exist, else large Target card."""
    red = (roadmap or {}).get("red_zone") if roadmap else None
    location_name = (red or {}).get("location") or (impact or {}).get("target_location") or "—"
    priority = (red or {}).get("priority") or (impact or {}).get("priority") or ""

    # If we had lat/lon we would use: st.map(pd.DataFrame({"lat": [lat], "lon": [lon]}))
    # Our inference payload has no coordinates, so we use a Target card.
    st.markdown(
        f"""
        <div style="
            padding: 1.25rem 1.5rem;
            border-radius: 0.5rem;
            background: linear-gradient(135deg, #1e1e1e 0%, #2d1515 100%);
            border: 2px solid #ef4444;
            text-align: center;
        ">
            <p style="margin: 0; font-size: 0.85rem; color: #94a3b8; letter-spacing: 0.1em;">PRIORITY ALPHA TARGET</p>
            <p style="margin: 0.35rem 0 0; font-size: 1.4rem; font-weight: 700; color: #fef2f2;">{location_name}</p>
            <p style="margin: 0.2rem 0 0; font-size: 0.9rem; color: #fca5a5;">{priority}</p>
        </div>
        """,
        unsafe_allow_html=True,
    )

def _render_bright_data_controls(bridge: DataBridge) -> None:
    """Render Bright Data Settings and Crawl Runner in the sidebar or a tab."""
    st.sidebar.markdown("---")
    st.sidebar.subheader("Bright Data Integration")
    
    with st.sidebar.expander("Settings", expanded=False):
        api_key = st.text_input("API Key", type="password", value=os.environ.get("BRIGHT_DATA_API_KEY", ""))
        dataset_id = st.text_input("Dataset ID", value=os.environ.get("BRIGHT_DATA_DATASET_ID", ""))
        if st.button("Save Settings"):
            # In a real app, we'd persist this properly. For hackathon, we show feedback.
            st.success("Settings applied to session.")
            os.environ["BRIGHT_DATA_API_KEY"] = api_key
            os.environ["BRIGHT_DATA_DATASET_ID"] = dataset_id

    st.sidebar.markdown("#### Crawl Runner")
    target_urls = st.sidebar.text_area("URLs (one per line)", placeholder="https://example.com")
    
    if st.sidebar.button("Run Web Intelligence Crawl"):
        urls = [u.strip() for u in target_urls.split("\n") if u.strip()]
        if not urls:
            st.sidebar.error("Enter at least one URL.")
        else:
            try:
                client = BrightDataClient()
                st.sidebar.info("Triggering crawl...")
                snapshot_id = client.trigger_crawl(urls)
                st.sidebar.success(f"Snapshot triggered: {snapshot_id}")
                
                progress_bar = st.sidebar.progress(0)
                status_text = st.sidebar.empty()
                
                # Polling loop
                for i in range(20): # Max 20 attempts in UI for responsiveness
                    time.sleep(5)
                    progress = client.get_progress(snapshot_id)
                    status = progress.get("status", "unknown")
                    status_text.text(f"Status: {status}")
                    progress_bar.progress((i + 1) * 5)
                    
                    if status == "ready":
                        data = client.download_snapshot(snapshot_id)
                        st.sidebar.success("Crawl complete!")
                        with st.expander("View Intelligence Data", expanded=True):
                            st.json(data)
                        break
                    elif status == "failed":
                        st.sidebar.error("Crawl failed.")
                        break
                else:
                    st.sidebar.warning("Crawl taking longer than usual. Check Bright Data console.")
            except Exception as e:
                st.sidebar.error(f"Error: {e}")

def main() -> None:
    st.set_page_config(
        page_title="BioNairi | CityBlitz Command Center",
        layout="wide",
        initial_sidebar_state="collapsed",
    )

    bridge = DataBridge()
    import os
    import time

    # Render Bright Data controls
    _render_bright_data_controls(bridge)

    # Global dark / MI6-style theme + stage box borders
    st.markdown(
        """
        <style>
        .stApp { background-color: #020617; color: #e5e7eb; }
        div[data-testid="stVerticalBlock"] > div { border-radius: 0.5rem; }
        /* Workspace borders for stage columns */
        div[data-testid="column"] {
            border: 1px solid #334155;
            border-radius: 0.5rem;
            padding: 0.75rem;
            background: rgba(15, 23, 42, 0.4);
        }
        </style>
        """,
        unsafe_allow_html=True,
    )

    # Branding / header
    st.markdown(
        """
        <div style="
            padding: 1rem 1.5rem;
            border-radius: 0.75rem;
            background: linear-gradient(120deg, #020617, #0f172a);
            color: #e5e7eb;
            border: 1px solid #38bdf8;
            margin-bottom: 1rem;
        ">
            <h1 style="margin: 0; font-size: 1.8rem;">BioNairi | CityBlitz – Tactical MI6 Deck</h1>
            <p style="margin: 0.25rem 0 0; font-size: 0.9rem; opacity: 0.8;">
                City of Montgomery · Janitor → Analyst → Observer → Impact
            </p>
        </div>
        """,
        unsafe_allow_html=True,
    )

    # Load data
    roadmap = _load_priority_roadmap(bridge)
    impact = _load_impact_prediction(bridge)

    # Run Cascade & Global Sweep (prominent at top)
    impact_available = impact is not None
    if "global_sweep_unlocked" not in st.session_state:
        st.session_state["global_sweep_unlocked"] = impact_available
    elif impact_available:
        st.session_state["global_sweep_unlocked"] = True

    ctrl_col, _ = st.columns([2, 1])
    with ctrl_col:
        if st.button("Run Cascade", type="primary", use_container_width=True):
            with st.spinner("Executing Janitor → Analyst → Observer → Impact cascade..."):
                orchestrator = OrchestratorAgent(bridge)
                try:
                    orchestrator.run_cascade()
                    st.success("Cascade completed. All stages updated.")
                    roadmap = _load_priority_roadmap(bridge)
                    impact = _load_impact_prediction(bridge)
                except Exception as exc:
                    st.error(f"Cascade failed: {exc}")

    sweep_col1, sweep_col2 = st.columns(2)
    with sweep_col1:
        sweep_disabled = not st.session_state.get("global_sweep_unlocked", False)
        if st.button("INITIATE FULL CITY SCAN", disabled=sweep_disabled, use_container_width=True):
            if not sweep_disabled:
                with st.spinner("Initiating full city scan across Montgomery datasets..."):
                    try:
                        summary = run_global_scout(bridge, max_items=10)
                        st.success(f"Discovered {summary['discovered_count']} datasets, downloaded {summary['downloaded_count']}.")
                    except Exception as exc:
                        st.error(f"Full city scan failed: {exc}")
    with sweep_col2:
        if sweep_disabled:
            st.caption("Locked until impact_prediction.json exists.")

    st.markdown("---")

    # ---- 3-column modular grid ----
    col1, col2, col3 = st.columns(3)
    orchestrator_events = _load_orchestrator_log(bridge)
    janitor_status = _load_janitor_status(bridge)
    janitor_ev = _extract_phase_status(orchestrator_events, "janitor_phase")
    analyst_ev = _extract_phase_status(orchestrator_events, "analyst_phase")
    observer_ev = _extract_phase_status(orchestrator_events, "observer_phase")
    hotspot_count = 0
    if analyst_ev and analyst_ev.get("detail"):
        hotspot_count = analyst_ev["detail"].get("hotspots_detected") or analyst_ev["detail"].get("count") or 0
    processed = janitor_status.get("files_processed", 0) if janitor_status else 0

    # COLUMN 1: STAGE 1 – THE AUDIT (BROKEN)
    with col1:
        with st.container():
            st.markdown(
                '<div style="border: 1px solid #ef4444; border-radius: 0.5rem; padding: 0.75rem 1rem; margin-bottom: 0.75rem; background: rgba(30,0,0,0.3);">'
                '<p style="margin:0; font-size:0.95rem; font-weight:700; color:#fca5a5;">STAGE 1: THE AUDIT (BROKEN)</p>'
                '</div>',
                unsafe_allow_html=True,
            )
            st.markdown("**Janitor – Data Sanitation**")
            st.metric("Status", _status_label(janitor_ev.get("outcome") if janitor_ev else None))
            if janitor_status:
                st.caption(f"Files processed: {janitor_status.get('files_processed', '?')} · Failed: {janitor_status.get('files_failed', '?')}")
            st.markdown("**Analyst – Friction Detection**")
            st.metric("Status", _status_label(analyst_ev.get("outcome") if analyst_ev else None))
            st.caption(f"Hotspots detected: {hotspot_count}")
            st.markdown(
                f'<div style="border: 1px solid #38bdf8; border-radius: 0.5rem; padding: 0.75rem; margin-top: 0.5rem; background: rgba(0,30,60,0.2);">'
                f'<p style="margin:0; font-size:0.8rem; color:#94a3b8;">Metric Card</p>'
                f'<p style="margin:0.25rem 0 0; font-size:1.2rem; font-weight:700; color:#bfdbfe;">{processed} files · {hotspot_count} hotspots</p>'
                f'</div>',
                unsafe_allow_html=True,
            )

    # COLUMN 2: STAGE 2 – THE STRATEGY (MOVES)
    with col2:
        with st.container():
            st.markdown(
                '<div style="border: 1px solid #38bdf8; border-radius: 0.5rem; padding: 0.75rem 1rem; margin-bottom: 0.75rem; background: rgba(0,30,60,0.3);">'
                '<p style="margin:0; font-size:0.95rem; font-weight:700; color:#93c5fd;">STAGE 2: THE STRATEGY (MOVES)</p>'
                '</div>',
                unsafe_allow_html=True,
            )
            st.markdown("**Observer – Vibe Scan (Bright Data)**")
            st.metric("Status", _status_label(observer_ev.get("outcome") if observer_ev else None))
            _render_pulse_gauge(roadmap)
            verdict = (roadmap or {}).get("command_verdict", "No verdict yet.")
            st.markdown(
                f'<div style="border: 2px solid #38bdf8; border-radius: 0.5rem; padding: 1rem; margin-top: 0.5rem; background: linear-gradient(135deg,#0f172a,#1e293b);">'
                f'<p style="margin:0; font-size:0.75rem; color:#64748b; letter-spacing:0.05em;">COMMAND VERDICT</p>'
                f'<p style="margin:0.35rem 0 0; font-size:1rem; font-weight:700; color:#e2e8f0;">{verdict}</p>'
                f'</div>',
                unsafe_allow_html=True,
            )

    # COLUMN 3: STAGE 3 – THE PROJECTION (IMPROVE)
    with col3:
        with st.container():
            st.markdown(
                '<div style="border: 1px solid #22c55e; border-radius: 0.5rem; padding: 0.75rem 1rem; margin-bottom: 0.75rem; background: rgba(0,40,20,0.3);">'
                '<p style="margin:0; font-size:0.95rem; font-weight:700; color:#86efac;">STAGE 3: THE PROJECTION (IMPROVE)</p>'
                '</div>',
                unsafe_allow_html=True,
            )
            st.markdown("**Impact Agent**")
            if impact and "projection" in impact:
                proj = impact["projection"]
                savings = int(proj.get("estimated_emergency_cost_savings", 0))
                calls_avoided = int(proj.get("projected_calls_avoided_mid", 0))
                vitality_pct = float(proj.get("vitality_recovery_percent", 0))
                st.markdown(
                    f'<p style="font-size:1.6rem; font-weight:700; color:#ef4444; margin:0;">Safety ROI: ${savings:,}</p>',
                    unsafe_allow_html=True,
                )
                st.caption("Estimated emergency cost savings")
                st.markdown(
                    f'<p style="font-size:1.2rem; font-weight:700; color:#38bdf8; margin:0.5rem 0 0;">Projected Calls Avoided: {calls_avoided}</p>',
                    unsafe_allow_html=True,
                )
                st.progress(min(vitality_pct / 100.0, 1.0))
                st.caption(f"Vitality Recovery: {vitality_pct}%")
            else:
                st.info("Run cascade to see Impact projections.")

    # ---- Industrial Audit (technical details behind expander) ----
    with st.expander("Industrial Audit", expanded=False):
        _render_status_center(bridge, roadmap)
        _render_red_zone_card(roadmap)
        _render_vibe_vs_friction_chart(roadmap)
        _render_audit_log_tail(bridge)


if __name__ == "__main__":
    main()

