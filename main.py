from core.bridge import DataBridge
from agents.janitor import JanitorAgent
import os
import streamlit as st
import streamlit.components.v1 as components

def inject_tutorial():
    tutorial_html = """
    <style>
        :root {
            --tutorial-primary: #00ffa3; /* BioNairi Green */
            --tutorial-surface: #1a1a1a;
            --tutorial-font-family: 'Inter', sans-serif;
        }

        .tutorial-modal {
            position: fixed; top: 0; left: 0; width: 100%; height: 100%;
            z-index: 9999; display: none; align-items: center; justify-content: center;
            background: rgba(0,0,0,0.85); backdrop-filter: blur(8px);
        }

        .tutorial-content {
            background: var(--tutorial-surface); color: white;
            padding: 2rem; border-radius: 15px; border: 1px solid var(--tutorial-primary);
            max-width: 500px; font-family: var(--tutorial-font-family);
        }

        .feature-card {
            background: #252525; padding: 1rem; margin: 1rem 0;
            border-radius: 8px; cursor: pointer; transition: 0.3s;
        }

        .feature-card:hover { border-left: 4px solid var(--tutorial-primary); }
        
        .tutorial-btn {
            background: var(--tutorial-primary); color: black;
            border: none; padding: 0.8rem 1.5rem; border-radius: 5px;
            font-weight: bold; cursor: pointer; width: 100%;
        }
    </style>

    <div class="tutorial-modal" id="tutorialModal">
        <div class="tutorial-content">
            <h2>Welcome to BioNairi CityBlitz ⚡</h2>
            <p>Industrial-grade verification for Montgomery County Data.</p>
            
            <div class="feature-card">
                <h4>🛡️ Multi-Agent Trust Layer</h4>
                <p>Verify data authenticity with autonomous agent consensus.</p>
            </div>

            <div class="feature-card">
                <h4>🌐 Bright Data Integration</h4>
                <p>Live Web Unlocking for real-time scraping of county records.</p>
            </div>

            <div class="feature-card">
                <h4>💰 $12,000 Monthly ROI</h4>
                <p>Automating 15 hours of legal/admin work per week.</p>
            </div>

            <button class="tutorial-btn" onclick="closeModal()">Start Inspecting</button>
        </div>
    </div>

    <script>
        window.onload = function() {
            if(!localStorage.getItem('tutorialShown')) {
                document.getElementById('tutorialModal').style.display = 'flex';
            }
        }
        function closeModal() {
            document.getElementById('tutorialModal').style.display = 'none';
            localStorage.setItem('tutorialShown', 'true');
        }
    </script>
    """
    components.html(tutorial_html, height=0) # Height 0 want het is een overlay

# Roep de functie aan
inject_tutorial()

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