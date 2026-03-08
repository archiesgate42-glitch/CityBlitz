# 🚀 BioNairi: CityBlitz 
**Montgomery Urban Operating System (UOS)**

## 🏗️ Clean-Room Architecture
[cite_start]BioNairi hanteert een strikte **Separation of Concerns** via een Clean-Room design om data-infectie te voorkomen en auditability te garanderen.

- **data/raw**: Read-only bronbestanden van de City of Montgomery Portal en Bright Data.
- **data/processed**: Gesaneerde datasets, gevalideerd door de Janitor-agent.
- [cite_start]**data/inference**: De "Clean Room" waar AI-conclusies en de Priority Roadmap worden gegenereerd zonder de brongegevens te wijzigen.

## 🤖 Multi-Agent Hierarchy
[cite_start]Onze architectuur maakt gebruik van een gespecialiseerde cascade van agenten:
1. **Janitor Agent**: Verantwoordelijk voor data-sanitatie en integriteits-logs.
2. **Analyst Agent**: Identificeert fysieke "Red-Zones" door 311-frictie te correleren met leegstand.
3. [cite_start]**Observer Agent**: Koppelt Bright Data web-sentiment aan fysieke hotspots voor een "Vibe-Shield"[cite: 2].
4. **Impact Agent**: Projecteert de veiligheidswinst en noodhulp-besparingen via 911-data correlaties.
5. **Master Orchestrator**: Beheert de State-Pipe en genereert het finale Command Verdict.

## 🤝 Multi-Agent Consensus Logic
In contrast to traditional AI systems that rely on a single threshold, BioNairi applies a **democratic decision model**. Before any zone is promoted to **Priority Alpha**, three internal logic-paths must vote on its urgency:

- **Resident Agent**: Evaluates livability and sentiment (**urgent** when Vibe \< 0.4).
- **Municipal Agent**: Assesses pressure on city services and infrastructure (**urgent** when Friction ≥ 0.7).
- **Economy Agent**: Quantifies fiscal impact and potential savings (**urgent** when Safety ROI ≥ \$5,000).

Only when **at least 2 out of 3** paths agree is an intervention escalated to the highest level. This guarantees that every decision is grounded **socially, operationally, and economically**.

## 🧠 Unique Edge: Decision Explainability
Elke 'Priority Alpha' status wordt ondersteund door een **Explainability Engine**, die AI-beslissingen transparant maakt voor beleidsmakers door frictie-coëfficiënten en sentiment-delta's te kwantificeren.

---

## 🏆 Hackathon: Jury Criteria Mix

Ons concept is rechtstreeks ontworpen met de behoeften van Montgomery in gedachten:

### 1. Impact (Real-World Problem Solving) 🌍
**Focus: Public Safety & 311 Services.** 
CityBlitz lost het probleem van *overbelaste nood- en stadsdiensten* op door zichtbare frictie (311 klachten) te koppelen aan onzichtbare kwetsbaarheden (Vibe-drops). In plaats van reactief te handelen op 911-calls, kan de stad proactief "Broken Windows" fixen voordat ze escaleren.

### 2. Creativiteit (De "Trust-Bridge" AI) 💡
Onze **Unique Selling Point (USP)** is betrouwbaarheid. Steden kunnen geen AI gebruiken die hallucineert of liegt. Onze *Trust-Bridge* architectuur vereist een "Proof of Origin". Elke AI-beslissing in CityBlitz is cryptografisch of systemisch herleidbaar tot een exacte bron in het officiële Montgomery Open Data Portal. *Geen brondata? Geen consensus.*

### 3. Haalbaarheid (Ready for Deployment) 🚀
CityBlitz is niet zomaar een mockup. Het is ontworpen op basis van echte, schaalbare UOS (Urban Operating System) principes.
- **Clean-Room Design:** De AI leest data, maar overschrijft nooit de bronsilo's.
- **Platform Onafhankelijk:** Gebouwd met Flutter; draait native op Web (dispatch centers) en Mobile Android/iOS (veldwerkers/janitors).

### 4. Techniek ⚙️
- **Google Antigravity:** Complexe Flutter state-management en UI generatie.
- **Bright Data:** Web-sentiment scraping gecombineerd met open stadsdata via de **Crawl API v3 (direct requests)** voor maximale betrouwbaarheid en snelheid.
- **Taro-XI Engine:** Een multi-agent consensus logica (Python backend) die gevoed wordt door Riverpod streams naar een frontend dashboard.

---

## 🚀 Quick Start Deployment (Live op Render)
De lokale Multi-Agent "Lab Setup" van de **BioNairi CityBlitz**-applicatie is live gegaan op het productie-grid via Render. 

**Hoe het werkt:**
- De infrastructuur draait in een gecontaineriseerde Web Service (Python 3.11).
- Een **FastAPI/Flask Orchestration Wrapper** (`main_render.py`) ontsluit de backend via webhooks.
- De Multi-Agent zwerm voert taken asynchroon en autonoom op de achtergrond uit zodra API endpoints getriggerd worden.
- **Bright Data Integratie:** Werkt via direct-request proxying om de `bright-data-sdk` dependency te vermijden en de build-footprint op Render klein te houden.

---
*Built with ❤️ for the Montgomery Urban Open Data Hackathon 2026*