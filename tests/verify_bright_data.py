import sys
from pathlib import Path

# Ensure project root is on path
_ROOT = Path(__file__).resolve().parent.parent
if str(_ROOT) not in sys.path:
    sys.path.insert(0, str(_ROOT))

from core.bright_data import BrightDataClient, BrightDataError
from core.config import get_bright_data_api_key

def test_config():
    print("Testing config...")
    key = get_bright_data_api_key()
    if key:
        print(f"✅ API Key found (starts with {key[:4]}...)")
    else:
        print("⚠️ No API Key found in .env. Integration will use fallback.")

def test_client_init():
    print("\nTesting client initialization...")
    try:
        client = BrightDataClient(api_key="test_key")
        print("✅ Client initialized correctly with manual key.")
    except BrightDataError as e:
        print(f"❌ Client init failed: {e}")

if __name__ == "__main__":
    test_config()
    test_client_init()
    print("\nVerification complete.")
