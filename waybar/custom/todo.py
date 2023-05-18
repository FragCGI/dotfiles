#!/env/python


user_input='random'

# Item list storage
data=list()

def showMenu():
    print("Menu:")
    print("1. Add an item:")
    print("2. Remove an item:")
    print("3. Show to do list:")
    print("4. Quit")

while user_input != '4':
    showMenu()
    user_input = input("Enter Your Choice: ")

    if user_input == '1':
        item = input("What do you want to add? ")
        data.append(item)
        print("Added ",item)
    elif user_input == '2':
        item = input("What did you complete? ")
        if item in data:
            data.remove(item)
            print(item," completed")
        else:
            print("Item does not exist in the to-do list. ")
    elif user_input == '3':
        print("Current to-do list:")
        for items in data:
            print(item)
    elif user_input == '4':
        print("Quitting...")
