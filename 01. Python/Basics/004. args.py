def addition(*args):
    total = 0
    for num in args:
        total += num
    return total


print(addition(1, 2, 3))
print(addition(1, 2, 3, 4, 5))


def printInfo(**kwargs):
    print(type(kwargs))
    for key, value in kwargs.items():
        print(f"{key} = {value}")


printInfo(name="Talib", age=27)


