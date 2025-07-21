import json
import csv
import os

# Step 1: Load the raw JSON data
with open("data/raw/countries_raw.json", "r", encoding="utf-8") as f:
    raw_data = json.load(f)

# Step 2: Flatten and extract required fields
flattened_data = []

for country in raw_data:
    try:
        name_common = country.get("name", {}).get("common", "")
        name_official = country.get("name", {}).get("official", "")
        capital = ", ".join(country.get("capital", []))
        region = country.get("region", "")
        subregion = country.get("subregion", "")
        area = country.get("area", 0.0)
        population = country.get("population", 0)
        languages = ", ".join(country.get("languages", {}).values())

        # Handle currencies
        currencies = country.get("currencies", {})
        if currencies:
            first_currency = list(currencies.values())[0]
            currency_name = first_currency.get("name", "")
            currency_symbol = first_currency.get("symbol", "")
        else:
            currency_name = ""
            currency_symbol = ""

        flattened_data.append({
            "name_common": name_common,
            "name_official": name_official,
            "capital": capital,
            "region": region,
            "subregion": subregion,
            "area": area,
            "population": population,
            "languages": languages,
            "currency_name": currency_name,
            "currency_symbol": currency_symbol
        })
    except Exception as e:
        print(f"⚠️ Error processing country: {e}")

# Step 3: Write to CSV
os.makedirs("data/processed", exist_ok=True)
csv_file_path = "data/processed/countries_processed.csv"

with open(csv_file_path, "w", encoding="utf-8", newline="") as f:
    writer = csv.DictWriter(f, fieldnames=flattened_data[0].keys())
    writer.writeheader()
    writer.writerows(flattened_data)

print("✅ CSV file created at:", csv_file_path)
