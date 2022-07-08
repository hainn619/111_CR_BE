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
        user["license_plate"] = result[5]
        user["color"] = result[6]
        user["vehicle_type"] = result[7]
        user["brand"] = result[8]
        user["model"] = result[9]
        out.append(user)
    return out


def scan():
    cursor = get_db().execute("select user.last_name, user.first_name,user.hobbies,user.active, vehicle.license_plate,vehicle.color,vehicle_type.descript,vehicle.brand,vehicle.model from user inner join vehicle on user.id=vehicle.user_id inner join vehicle_type on vehicle.v_type= vehicle_type.id", ())
    results = cursor.fetchall()
    cursor.close()
    return output_formatter(results)
