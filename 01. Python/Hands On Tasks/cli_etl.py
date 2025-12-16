# Implement a small CLI ETL: read CSV → cleanse → write Parquet.
import pandas as pd

df = pd.read_csv('01. Python/Hands on Tasks/cars.csv')
# print(df.head())

df.columns = (
    df.columns
        .str.strip()
        .str.lower()
        .str.replace(" ", "_", regex = False)
        .str.replace("([a-z])([A-Z])", r"\1_\2", regex = True)
)

print(df.columns)
