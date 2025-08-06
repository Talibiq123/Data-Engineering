import pandas as pd

df = pd.DataFrame({
    "name": ["Braund, Mr. Owen Harris",
             "Allen, Mr. William Henry",
             "Bonell, Miss. Elizabeth"],
    "age": [22, 35, 58],
    "sex": ["male", "male", "female"]
})

print(df)
