# python datatypes

# Integer
age = 25
print("Age", age, type(age))

# Float
salary = 4500.75
print("Salary", salary, type(salary))

# Complex Number
z = 2 + 3j
print("Complex number", z, type(z)) 

# range
x = range(5)
print("Range ", x, type(x))

# String
name = "Talib"
print("Name", name, type(name))

# Boolean
is_engineer = True
print("Is Engineer", is_engineer, type(is_engineer))

# tuple
fruits = ("apple", "banana", "mango")
print("Fruits", fruits, type(fruits))

# List
skills = ["python", "sql"]
print("Skills", skills, type(skills))

# dictionary
employee = {
    "name": "Talib",
    "age": 28,
    "skills": ["python", "sql"]
}

print("Employee Details", employee, type(employee))

# set
nums = {1, 2, 2, 3, 3, 3, 4}
print("Set numbers are", nums, type(nums))

# frozenset
fs = frozenset([1, 2, 2, 3, 3, 3])
print("Frozen set", fs, type(fs))

# Binary Type
b = b"Hello"
print("Byte type", b, type(b))

# Byte array
ba = bytearray(b"hello")
print("Byte Array", ba, type(ba))

# Memory View
data = bytearray(b"hello world")
mv = memoryview(data)
print("Memory View", mv, type(mv))
part = mv[0:5]   # view, NOT copy

# None type
val = None
print("None Type", val, type(val))
