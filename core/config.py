# Configuration and environment settings.

import os
from pathlib import Path

from dotenv import load_dotenv

# Load .env from project root (parent of core/)
_ROOT = Path(__file__).resolve().parent.parent
load_dotenv(_ROOT / ".env")

def get_gemini_api_key() -> str | None:
    """Return Gemini/Google AI API key from env (GOOGLE_API_KEY or GEMINI_API_KEY)."""
    return os.environ.get("GOOGLE_API_KEY") or os.environ.get("GEMINI_API_KEY")

def get_project_root() -> Path:
    """Return project root directory."""
    return _ROOT
