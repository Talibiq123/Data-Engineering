from Extract import extract_data
from Transform import transform_data
from Load import load_data_to_sqlite

def run_etl_pipeline():
    print("🔹 Starting ETL pipeline...")

    # Step 1: Extract
    print("🔸 Extracting data from API...")
    raw_path = extract_data()

    # Step 2: Transform
    print("🔸 Transforming and cleaning data...")
    processed_path = transform_data(raw_path)

    # Step 3: Load
    print("🔸 Loading data into SQLite database...")
    load_data_to_sqlite(processed_path)

    print("✅ ETL pipeline completed successfully.")

if __name__ == "__main__":
    run_etl_pipeline()
