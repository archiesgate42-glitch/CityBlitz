## CityBlitz – How to Run the System

This guide explains how to run the **BioNairi / CityBlitz Phase 1: BROKEN** pipeline for the City of Montgomery, and how to launch the industrial-grade dashboard.

---

### 1. Prerequisites

- **Python**: 3.10+ (project tested with Python 3.14 in a virtual environment).
- **OS**: Linux/macOS/WSL recommended.
- **Network access**: Required if you want to call the Gemini API (for Janitor + Observer).

Clone or place the `CityBlitz` repository on your machine, then open a terminal in the project root:

```bash
cd /path/to/CityBlitz
```

---

### 2. Create a Virtual Environment & Install Dependencies

It is strongly recommended to use a virtual environment:

```bash
python3 -m venv .venv
source .venv/bin/activate        # Windows: .venv\\Scripts\\activate
pip install -r requirements.txt
```

This installs:

- `streamlit` – dashboard
- `pandas` – data cleaning & analysis
- `google-generativeai` – Gemini API client (Janitor + Observer)
- `python-dotenv` – `.env` loading
- `requests` – HTTP utilities

---

### 3. Configure Environment Variables (Gemini API)

Create a `.env` file in the project root:

```bash
cp .env.example .env    # if present, otherwise create manually
```

Add your Gemini API key:

```env
GOOGLE_API_KEY=YOUR_API_KEY_HERE
# or
GEMINI_API_KEY=YOUR_API_KEY_HERE
```

`core/config.py` will automatically load this key for the Janitor and Observer agents.

> The system still runs without a key, but will fall back to simpler, non‑LLM summaries.

---

### 4. Prepare Input Data

CityBlitz expects **raw Montgomery data** to be placed under:

- `data/raw/` – untouched Montgomery & Bright Data (CSV/JSON).

For a realistic run:

1. Drop one or more **CSV/JSON** files into `data/raw/`  
   (e.g. `data/raw/Received_311_Service_Request.csv`).
2. Make sure they contain reasonable tabular data; Janitor will attempt to:
   - Fill missing values,
   - Normalize basic data types,
   - Drop fully empty rows.

You do **not** need to touch `data/processed` or `data/inference`; those are populated by the agents.

---

### 5. Run a Full Cascade (CLI)

Activate your virtualenv if not already active:

```bash
source .venv/bin/activate
cd /path/to/CityBlitz
```

Then run the orchestrator:

```bash
python -m agents.orchestrator
```

This triggers the **3‑agent cascade**:

1. **JanitorAgent** – cleans `data/raw` → writes cleaned files to `data/processed` and logs quality.
2. **AnalystAgent** – scans `data/processed` → writes `data/inference/hotspot_analysis.json`.
3. **ObserverAgent** – reads hotspot analysis → computes Vibe Scores & priorities → writes:
   - `data/inference/final_vibe_check.json`
   - `data/inference/cityblitz_priority_roadmap.json`

On success, the CLI prints a short summary, for example:

```text
[Orchestrator] Phase: Phase 1: BROKEN
[Orchestrator] #1 Red-Zone: Received_311_Service_Request (Priority: Standard)
[Orchestrator] Vibe Score: 0.5, Friction Score: 1.0
[Orchestrator] Command Verdict: Targeted Improvements Recommended (Monitor and phase interventions).
```

If the Janitor cannot produce a clean dataset (no usable raw files, or failures), the Orchestrator will halt with a **Critical Data Integrity Failure** and will not proceed to Analyst/Observer.

---

### 6. Run the Industrial Command Center (Streamlit Dashboard)

Streamlit is installed **inside the project virtualenv**. Use one of these:

**If the virtualenv is already active** (you see `(.venv)` in your prompt):

```bash
streamlit run ui/dashboard.py
```

**If you haven't activated the venv**, run Streamlit via the venv’s executable:

```bash
.venv/bin/streamlit run ui/dashboard.py
```

Or activate first, then run:

```bash
source .venv/bin/activate   # Linux/macOS
streamlit run ui/dashboard.py
```

The dashboard includes:

- **BioNairi | CityBlitz branding** and Phase 1: BROKEN banner.
- **Run Cascade** button – triggers `OrchestratorAgent.run_cascade()` directly from the UI.
- **Status Command Center** – shows the latest status of:
  - Janitor (Data Sanitation),
  - Analyst (Hotspot Detection),
  - Observer (Urban Vitality).
- **Red‑Zone Alert** card – highlights the current #1 Red‑Zone with Vibe vs. Friction and Command Verdict.
- **Vibe vs. Friction chart** – bar chart comparing scores across locations.
- **Industrial Audit Log tail** – shows the last 10 lines of `logs/data_access_audit.log` in a code block.

The dashboard reads **only** from:

- `data/inference/cityblitz_priority_roadmap.json`, and
- the `logs/` directory via `core/bridge.DataBridge`.

---

### 7. Logs & Auditability

CityBlitz is designed for **Industrial Grade** traceability:

- `logs/data_access_audit.log` – every DataBridge access (who read/wrote what, and when).
- `logs/janitor_quality.log` – Janitor data quality summaries (including Gemini‑generated sentences).
- `logs/janitor_status.json` – last Janitor run status (for the dashboard).
- `logs/observer_agent.log` – ObserverAgent actions and vibe scoring details.
- `logs/orchestrator_agent.log` – Orchestrator cascade events and state‑pipe decisions.

All logs are line‑oriented JSON, suitable for downstream SIEM or log analysis tools.

---

### 8. Typical Operator Workflow

1. **Ingest** new Montgomery/Bright data into `data/raw/`.
2. **Run cascade**:
   - Either from CLI (`python -m agents.orchestrator`), or
   - From the Streamlit dashboard via **Run Cascade**.
3. **Review output**:
   - `data/inference/cityblitz_priority_roadmap.json` for the Command Verdict and top Red‑Zone.
   - `ui/dashboard.py` Streamlit view for visual status and metrics.
4. **Drill into logs** in `logs/` for full auditability and debugging.

This completes the Phase 1: BROKEN loop for the City of Montgomery under the BioNairi / CityBlitz framework.

