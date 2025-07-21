import requests
import json
import os

def extract_data():
    # Step 1: API endpoint
    fields = "name,capital,region,subregion,area,population,languages,currencies"
    url = f"https://restcountries.com/v3.1/all?fields={fields}"

    print("🔸 Extracting data from API...")
    response = requests.get(url)
    data = response.json()

    # Step 2: Ensure directory exists
    os.makedirs("data/raw", exist_ok=True)
    raw_path = "data/raw/countries_raw.json"

    # Step 3: Save file
    with open(raw_path, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=2)

    print(f"✅ Data extracted and saved to {raw_path}")
    return raw_path  # ← THIS IS IMPORTANT
