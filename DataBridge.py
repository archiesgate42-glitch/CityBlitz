import os
import pandas as pd
from typing import Literal

class DataBridge:
    """Industrial-grade gateway for BioNairi data access."""
    
    ROOT = "/home/raccoontt/rtt/factory/Hackathon-Maart-2026/CityBlitz"
    SILOS = {
        "raw": os.path.join(ROOT, "data/raw"),
        "processed": os.path.join(ROOT, "data/processed"),
        "inference": os.path.join(ROOT, "data/inference")
    }

    @classmethod
    def get_raw_path(cls, filename: str) -> str:
        path = os.path.join(cls.SILOS["raw"], filename)
        if not os.path.exists(path):
            raise FileNotFoundError(f"⚠️ Critical Error: {filename} missing in raw silo.")
        return path

    @classmethod
    def load_dataset(cls, filename: str) -> pd.DataFrame:
        """Loads data with strict read-only enforcement."""
        return pd.read_csv(cls.get_raw_path(filename), low_memory=False)

# Initialize Bridge
bridge = DataBridge()