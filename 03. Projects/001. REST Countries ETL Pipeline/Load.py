import sqlite3
import pandas as pd
import os

def load_data_to_sqlite(csv_file_path):
    # Step 1: Define database path
    db_file_path = "data/processed/countries.db"

    print("🔸 Loading data into SQLite database...")

    # Step 2: Read CSV
    df = pd.read_csv(csv_file_path)

    # Step 3: Connect to DB
    conn = sqlite3.connect(db_file_path)

    # Step 4: Load into table
    df.to_sql("countries", conn, if_exists="replace", index=False)

    print(f"✅ Data loaded into 'countries' table in {db_file_path}")

    # Optional: Show 5 sample rows
    print(df.head())

    # Step 5: Close connection
    conn.close()
