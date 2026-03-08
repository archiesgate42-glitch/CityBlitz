import os
import threading
from flask import Flask, jsonify, request
from core.bridge import DataBridge
from agents.janitor import JanitorAgent
from core.bright_data import BrightDataClient, BrightDataError

app = Flask(__name__)

def run_agents():
    print("🚀 BioNairi Lab: Starting CityBlitz Foundation...")
    try:
        bridge = DataBridge()
        print("🧹 Phase 1: Cleaning Raw Data...")
        janitor = JanitorAgent(bridge, move_after_process=True)
        report = janitor.run()
        print(f"✅ Janitor finished. Processed {report.get('files_processed', 0)} files.")
    except Exception as e:
        print(f"❌ Error in Agent execution: {str(e)}")

# Bright Data API Proxy Routes for local dashboard compatibility
@app.route('/api/brightdata/trigger', methods=['POST'])
def bd_trigger():
    try:
        data = request.json
        urls = data.get("urls", [])
        client = BrightDataClient()
        snapshot_id = client.trigger_crawl(urls)
        return jsonify({"snapshot_id": snapshot_id}), 200
    except BrightDataError as e:
        return jsonify({"error": str(e)}), 500

@app.route('/api/brightdata/progress/<snapshot_id>')
def bd_progress(snapshot_id):
    try:
        client = BrightDataClient()
        progress = client.get_progress(snapshot_id)
        return jsonify(progress), 200
    except BrightDataError as e:
        return jsonify({"error": str(e)}), 500

@app.route('/api/brightdata/snapshot/<snapshot_id>')
def bd_snapshot(snapshot_id):
    try:
        client = BrightDataClient()
        data = client.download_snapshot(snapshot_id)
        return jsonify(data), 200
    except BrightDataError as e:
        return jsonify({"error": str(e)}), 500

@app.route('/health')
def health_check():
    """Endpoint for Render uptime health-checks"""
    return jsonify({
        "status": "healthy",
        "service": "BioNairi CityBlitz Multi-Agent Engine"
    }), 200

@app.route('/start', methods=['POST'])
def start_processing():
    """Trigger the multi-agent system asynchronously"""
    thread = threading.Thread(target=run_agents)
    thread.daemon = True
    thread.start()
    return jsonify({"status": "processing_started", "message": "Agents are running in the background"}), 202

if __name__ == "__main__":
    # Dynamic port binding loopback 0.0.0.0
    port = int(os.environ.get("PORT", 8080))
    app.run(host="0.0.0.0", port=port)
