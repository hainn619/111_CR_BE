from sqlite3 import Cursor
from unittest import result
from app.database import get_db


def output_formatter(results):
    out = []
    for result in results:
        user = {}
        user["id"] = result[0]
        user["first_name"] = result[1]
        user["last_name"] = result[2]
        user["hobbies"] = result[3]
        user["active"] = result[4]
        out.append(user)
    return out


def scan():
    cursor = get_db().execute("select * from user where active=1", ())
    results = cursor.fetchall()
    cursor.close()
    return output_formatter(results)


def select_by_id(id):
    cursor = get_db().execute(
        "select * from user where id=? and active=", (id, ))
    result = cursor.fetchall()
    cursor.close()  # close database connection
    return output_formatter(result)


def deactivate(id):
    cursor = get_db().execute(
        "update user set active=0 where id=?", (id, ))
    result = cursor.fetchall()
    cursor.close()  # close database connection
    return output_formatter(result)


def insert(data):
    #  first_name= data.get("first_name")
    query = """Insert into user (first_name, last_name, hobbies) values (?,?,?)"""
    values = (
        data.get("first_name"),
        data.get("last_name"),
        data.get("hobbies")
    )
    cursor = get_db()
    cursor.execute(query, values)
    cursor.commit()
    cursor.close()
    # return output_formatter(result)
