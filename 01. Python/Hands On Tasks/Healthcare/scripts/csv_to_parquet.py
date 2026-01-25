import pandas as pd

# -----------------------------
# 1. Read CSV
# -----------------------------
df = pd.read_csv(
    "01. Python/Hands On Tasks/Healthcare/data/raw_data/healthcare_messy_data.csv"
)

# -----------------------------
# 2. Standardize column names
# -----------------------------
df.columns = (
    df.columns
        .str.strip()
        .str.lower()
        .str.replace(" ", "_", regex=False)
)

# -----------------------------
# 3. Text column cleanup
# -----------------------------
text_columns = [
    "patient_name",
    "gender",
    "condition",
    "medication",
    "email",
    "phone_number"
]

lowercase_columns = [
    "gender",
    "condition",
    "medication",
    "email"
]

for col in text_columns:
    # remove leading/trailing spaces
    df[col] = df[col].str.strip()

    # replace empty or whitespace-only strings with NULL
    df[col] = df[col].replace(r"^\s*$", pd.NA, regex=True)

    # handle literal "nan"
    df[col] = df[col].replace("nan", pd.NA)

for col in lowercase_columns:
    df[col] = df[col].str.lower()

# -----------------------------
# 4. Numeric & date casting
# -----------------------------
df["age"] = pd.to_numeric(df["age"], errors="coerce")
df["cholesterol"] = pd.to_numeric(df["cholesterol"], errors="coerce")

df["visit_date"] = pd.to_datetime(
    df["visit_date"],
    errors="coerce",
    infer_datetime_format=True
)

# -----------------------------
# 5. Blood pressure split
# -----------------------------
bp_split = df["blood_pressure"].str.split("/", expand=True)

df["systolic_bp"] = pd.to_numeric(bp_split[0], errors="coerce")
df["diastolic_bp"] = pd.to_numeric(bp_split[1], errors="coerce")

df.drop(columns=["blood_pressure"], inplace=True)

# -----------------------------
# 6. Final schema validation
# -----------------------------
print("Data Types:")
print(df.dtypes)
print("\nSample Cleaned Data:")
print(df.head())

# -----------------------------
# 7. Write to Parquet
# -----------------------------
df.to_parquet(
    "01. Python/Hands On Tasks/Healthcare/data/processed/healthcare_cleaned.parquet",
    index=False
)

print("\n✅ CSV successfully cleaned and written to Parquet")
