# Print Welcome Message - This is single line comment in python.
print("Hello, World!!!")

# Variable: A variable in python is a name that store a value in memory. It acts like a label or container that holds data such as numbers, text amd more complex objects - so you can use and manipulate it later in your program.
message = "Hello, World!!!"
x = 10
print(message)
print(x)

# How Variables Work Internally
# When you assign a value like x = 10,
# Python:
# Creates an object in memory that holds the value 10
# Creates a reference named x pointing to that object
# So x doesn’t contain the value directly — it points to the value stored somewhere in memory.


# Rules for Naming Variables
# Variable names can contain letters (A–Z, a–z), digits (0–9), and underscores (_)
# Variable names must not start with a number
# Variable names are case-sensitive
# age, Age, and AGE are three different variables
# You can’t use Python keywords as variable names (like if, while, class, for, etc.)
# ✅ Valid examples:

user_name = "John"
age2 = 25
_total = 100


# ❌ Invalid examples:

# 2name = "Ali"    # starts with a number
# user-name = "Ali" # contains a hyphen
# class = 10        # 'class' is a reserved keyword


# You can also assign multiple variables at once:
a, b, c = 1, 2, 3

# Or assign one value to multiple variables:
x = y = z = 10

# Changing Values (Reassignment)
# Variables can change value during program execution:
x = 10
x = 20   # now x holds 20


# Variable Types
# Python variables are dynamically typed — you don’t need to declare a type explicitly.
# Example:
a = 10        # int
a = "Python"  # now it's a str
# Python automatically understands the data type of a variable based on the value assigned.

# Checking Type
# You can check the type of a variable using:
type(a)
# Example:
x = 10
print(type(x))  # <class 'int'>


# Deleting Variables
# To remove a variable, use the del statement:
x = 10
del x
# Now x no longer exists.


# Global and Local Variables
# Variables can exist in different scopes:
# Local Variable — created inside a function; accessible only there.
# Global Variable — created outside any function; accessible throughout the program.
# Example:
x = "global"

def my_func():
    y = "local"
    print(y)  # local variable
    print(x)  # global variable

my_func()


# To modify a global variable inside a function, use the global keyword:
x = 5

def update():
    global x
    x = 10

update()
print(x)  # 10


# Constants in Python
# Python doesn’t have true constants, but by convention, we write them in UPPERCASE to show they shouldn’t be changed:
PI = 3.14159
MAX_USERS = 100

