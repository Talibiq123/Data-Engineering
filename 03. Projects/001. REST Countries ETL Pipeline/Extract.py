import requests
import json
import os

# Select only needed fields (max 10)
fields = "name,capital,region,subregion,area,population,languages,currencies"
url = f"https://restcountries.com/v3.1/all?fields={fields}"

response = requests.get(url)

# Ensure the folder exists
os.makedirs("data/raw", exist_ok=True)

# Save the fetched data
with open("data/raw/countries_raw.json", "w", encoding='utf-8') as f:
    json.dump(response.json(), f, indent=2)
