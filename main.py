from core.bridge import DataBridge
from agents.janitor import JanitorAgent
import os

def start_lab():
    print("🚀 BioNairi Lab: Starting CityBlitz Foundation...")
    bridge = DataBridge()
    
    # 1. Start de Janitor
    print("🧹 Phase 1: Cleaning Raw Data...")
    janitor = JanitorAgent(bridge, move_after_process=True)
    report = janitor.run()
    
    if report['files_processed'] > 0:
        print(f"✅ Janitor finished. Processed {report['files_processed']} files.")
        print(f"Logs can be found in logs/janitor_quality.log")
    else:
        print("⚠️ No new files found in data/raw. Check your folder!")

if __name__ == "__main__":
    start_lab()