from pathlib import Path
import json
import yaml

CONFIG_DIR = Path(__file__).resolve().parent.parent / "config"


def load_formulas() -> dict:
    yaml_path = CONFIG_DIR / "formulas.yaml"
    with open(yaml_path, "r", encoding="utf-8") as file:
        return yaml.safe_load(file)


def load_settings() -> dict:
    json_path = CONFIG_DIR / "settings.json"
    with open(json_path, "r", encoding="utf-8") as file:
        return json.load(file)