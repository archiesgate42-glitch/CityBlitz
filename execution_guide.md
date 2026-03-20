# CityBlitz Execution Guide

This guide describes how to run the CityBlitz project, including the Python backend and the Flutter mobile application.

## Prerequisites

- Python 3.12+
- Flutter SDK (latest stable)
- Google AI API Key (for Gemini functionality)


## Backend Setup (Python)

The backend consists of a Streamlit dashboard and a Flask-based data bridge.

### 1. Environment Configuration

Ensure you have a `.env` file in the root directory with the following variables:

```env
GOOGLE_API_KEY=your_google_api_key
BRIGHT_DATA_API_KEY=your_bright_data_api_key (optional)
```

### 2. Install Dependencies

It is recommended to use the provided virtual environment:

```bash
# Ensure you are in the project root
pip install -r requirements.txt
```

### 3. Run the Dashboard

Run from the project root:

```bash
.venv/bin/streamlit run main.py
```

### 4. Run the Data Bridge (API)

Run from the project root:

```bash
.venv/bin/python3 main_render.py
```

## Frontend Setup (Flutter)

The mobile application is located in the `city_blitz_app` directory.

### 1. Get Dependencies
```bash
cd city_blitz_app
flutter pub get
```

### 2. Run Code Generation (Freezed/Riverpod)
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 3. Run the App
- **Web**: `flutter run -d chrome`
- **Android/iOS**: Connect a device or emulator and run `flutter run`

## Verification

To ensure everything is working correctly, you can run the tests:

**Backend Tests:**
```bash
python3 tests/verify_bright_data.py
```

**Frontend Tests:**
```bash
cd city_blitz_app
flutter test
```
