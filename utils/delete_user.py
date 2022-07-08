import requests

URL = "http://127.0.0.1:5000/users"


def deactive(id):
    user_data = {
        "active": 2
    }
    reponse = requests.put(f"{URL}/{id}")
    if reponse.status_code == 204:
        print("User successfully Updated")
    else:
        print("Error: user was not created")


# if the script is directly executed from the terminal
if __name__ == "__main__":
    print("CREATE USER")
    print("-" * 20)
    id = input("ID: ")
    deactive(id)
