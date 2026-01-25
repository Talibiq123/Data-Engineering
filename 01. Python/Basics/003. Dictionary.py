# How to make Dictionary - Method 1
dict1 = {'name': 'Alice', 1: 1, (1, 2): 3}
# print(dict1)

# How to make Dictionary - Method 1 ( Dictionary Comprehension )
dict2 = {x: x**2 for x in range(5)}
# print(dict2)

# Usinf Dict() constructor
dict3 = {"name": "Talib Saeed", "Age": 28, "Address": "Bijnor"}
# print(dict3)

# Examples:
my_dict = {
    'name': 'Talib',
    'age': 25,
    'city': 'Delhi',
    'country': 'India',
    'language': 'Python',
    'is_student': True,
    'score': 88.5,
    'hobbies': ['coding', 'reading', 'traveling'],
    'graduated': False,
    'email': 'talib@example.com'
}

# print(my_dict)


# list() Sari keys ki list lotata hain.
# print(list(my_dict))

# len() - Lenght Batata Hain
print(len(my_dict))


# print(my_dict['name'], my_dict['age'], my_dict['score'])

for key in my_dict.get(key):
    print(key)

