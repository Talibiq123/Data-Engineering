# Write scripts to parse CSVs and transform columns.
import pandas as pd

df = pd.read_csv('01. Python/Hands On Tasks/cars.csv')
# print(df.head(10))
# print(df.columns)

df.rename(columns={'MSRP': 'Price' ,'MPG_City': 'City_MPG', 'MPG_Highway': 'Highway_MPG'}, inplace=True)
print(df.columns)
# print(df.head())
