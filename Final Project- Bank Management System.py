#Final Project- Bank Management System

from os import system, name
import time

def clear():
    # for windows
    if name == 'nt':
        _ = system('cls')

data = {
    "EricAunzo76": {
        "name": "Eric Aunzo",
        "age": 47,
        "bal": 10000,
        "password": "eaunzo1020"
    },
    "Username2": {
        "name": "User Number 2",
        "age": 22,
        "bal": 20000,
        "password": "user2test"
    }
}

def deposit(username, balance):
    data[username]["bal"] += balance
    current_balance = data[username]["bal"]

    print(f"Deposited Php {float(balance)} in your account")
    print(f"Your balance is now Php {float(current_balance)}")

def withdraw(username, balance):
    data[username]["bal"] -= balance
    current_balance = data[username]["bal"]

    print(f"Withdrawn Php {float(balance)} in your account")
    print(f"Your balance is now Php {float(current_balance)}")

def transfer(username, recipient, amount):
    if amount <= data[username]["bal"]:
        data[username]["bal"] -= amount
        data[recipient]["bal"] += amount
        print(f"Transfer successful. Php {float(amount)} transferred to {recipient}.")
    else:
        print("Insufficient funds for transfer.")

def change_pin(username, new_pin):
    data[username]["password"] = new_pin
    print("PIN changed successfully.")

def check_balance(username):
    current_balance = data[username]["bal"]
    print(f"Your current balance is Php {float(current_balance)}")

def main(username):
    while True:
        print("\n****************************")
        print("*       BANK MENU           *")
        print("*  1. Withdraw              *")
        print("*  2. Deposit               *")
        print("*  3. Transfer              *")
        print("*  4. Change PIN            *")
        print("*  5. Check Balance         *")
        print("*  6. Exit                  *")
        print("****************************")

        user_choice = input("Enter your choice (1-6): ")

        if user_choice == "1":
            with_bal = float(input("How much do you want to withdraw: "))
            withdraw(username, with_bal)
        elif user_choice == "2":
            dep_bal = float(input("How much do you want to deposit: "))
            deposit(username, dep_bal)
        elif user_choice == "3":
            recipient = input("Enter the recipient's username: ")
            amount = float(input("Enter the transfer amount: "))
            transfer(username, recipient, amount)
        elif user_choice == "4":
            new_pin = input("Enter your new PIN: ")
            change_pin(username, new_pin)
        elif user_choice == "5":
            check_balance(username)
        elif user_choice == "6":
            print("Exiting. Goodbye!")
            break
        else:
            print("Invalid choice. Please enter a number from 1 to 6.")

def register():
    username = input("Enter your username: ")
    full_name = input("Enter your fullname: ")
    age = int(input("Enter your age: "))
    bal = float(input("Enter your initial balance: "))
    password = input("Enter your password: ")

    new_user = {
        username: {
            "name": full_name,
            "age": age,
            "bal": bal,
            "password": password
        }
    }

    data.update(new_user)

while True:
    print("Welcome to Bank System")
    print("1. Login")
    print("2. Register")
    print("3. Exit")
    choice = input("Enter your choice (1-3): ")

    if choice == "1":
        # Login
        username = input("Enter username: ")
        password = input("Enter password: ")

        time.sleep(2)

        if username in data:  # Check if user exists in the data
            if password == data[username]["password"]:  # If password is correct
                main(username)
            else:
                print("Wrong password! Please login again!")
                time.sleep(2)
                clear()
        else:
            print("The username is not in the database")
            time.sleep(2)
            clear()

    elif choice == "2":
        register()
        print("Registration successful!")
        time.sleep(2)
        clear()

    elif choice == "3":
        print("Exiting. Goodbye!")
        break
    else:
        print("Invalid choice. Please enter a number from 1 to 3.")




