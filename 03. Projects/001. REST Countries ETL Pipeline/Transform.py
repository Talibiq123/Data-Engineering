import json
import os
import pandas as pd

def transform_data(raw_path="data/raw/countries_raw.json"):
    # Step 1: Load raw data
    with open(raw_path, "r", encoding="utf-8") as f:
        raw_data = json.load(f)

    processed_data = []

    # Step 2: Flatten each country record
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

            currencies = country.get("currencies", {})
            if currencies:
                first_currency = list(currencies.values())[0]
                currency_name = first_currency.get("name", "")
                currency_symbol = first_currency.get("symbol", "")
            else:
                currency_name = ""
                currency_symbol = ""

            processed_data.append({
                "name_common": name_common,
                "name_official": name_official,
                "capital": capital,
                "region": region,
                "subregion": subregion,
                "population": population,
                "area": area,
                "languages": languages,
                "currency_name": currency_name,
                "currency_symbol": currency_symbol
            })

        except Exception as e:
            print(f"⚠️ Skipped a country due to error: {e}")

    # Step 3: Save to processed folder
    os.makedirs("data/processed", exist_ok=True)
    processed_path = "data/processed/countries_processed.csv"
    df = pd.DataFrame(processed_data)
    df.to_csv(processed_path, index=False, encoding="utf-8")

    print(f"✅ Flattened data saved to {processed_path}")
    return processed_path
