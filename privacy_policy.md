# Privacy Policy for CityBlitz

**Effective Date:** March 8, 2026

## 1. Introduction
Welcome to CityBlitz. This application functions as the frontend component for the Montgomery Urban Operating System (Taro-XI Engine). We are committed to protecting the integrity of citizen data while adhering to the Montgomery Open Data guidelines.

## 2. Data Collection and Usage
### 2.1 Read-Only Architecture
CityBlitz implements a strict "Clean-Room" architecture. The application **only reads** anonymized, aggregate inference data (e.g., Vibe Scores, Friction Metrics) from the Taro-XI Data Silos. The app itself **does not collect, store, or transmit** any personal identifiable information (PII) from your device.

### 2.2 Local Telemetry
To ensure a "Crash-Free" experience, the app monitors the heartbeat statuses of external AI agents (Janitor, Analyst, Observer). This connection is purely for operational diagnostics and is limited to reading system logs.

## 3. Location Data
CityBlitz displays heatmaps and Red-Zone locations based on public Montgomery Open Data sources (e.g., 311 service requests, dispatch telemetry). If the app requests local Location Permissions, it is solely for the purpose of orienting the map viewport relative to your position. Your location is **never stored** or sent to external servers.

## 4. Encryption & Security
All data transmitted between the Taro-XI Engine and CityBlitz is secured via industry-standard encryption protocols. In the event of an interception or connection failure, the app will instantly terminate the data link and display a critical "Encrypted Link Lost" state to protect the integrity of the data stream.

## 5. Contact
For inquiries regarding our compliance with the Montgomery Open Data Initiative or privacy concerns, please contact the CityBlitz deployment team.
