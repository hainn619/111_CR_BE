
--- create user table ---
CREATE TABLE user(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    hobbies TEXT,
    active BOOLEAN NOT NULL DEFAULT 1
)
--- insert data ---
insert into user (first_name, last_name, hobbies) values ("hai","nguyen","playing soccer");
insert into user (first_name, last_name, hobbies) values ("Ramos","Sergio","playing soccer");
insert into user (first_name, last_name, hobbies) values ("Lucas","Modric","playing soccer");


Create table vehicle_type(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    descript VARCHAR(64)
);
insert into vehicle_type (descript) values ("motorcycle");
insert into vehicle_type (descript) values ("car");
insert into vehicle_type (descript) values ("truck");
insert into vehicle_type (descript) values ("suv");



Create table vehicle( 
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    v_type INTEGER not NULL,
    license_plate VARCHAR(45) not NULL,
    color VARCHAR(45),
    brand VARCHAR(45),
    model VARCHAR(45),
    active BOOLEAN DEFAULT 1,
    user_id INTEGER NOT NULL,
    Foreign KEY (user_id) REFerences user(id),
    Foreign KEY (v_type) REFerences vehicle_type(id)

);
insert into vehicle (color, license_plate, v_type, user_id, brand, model) values ("red","HLL01", 1, 1, "bmw", "430i");
insert into vehicle (color, license_plate, v_type, user_id, brand, model) values ("white","SLK02", 2, 2, "honda", "accord");
insert into vehicle (color, license_plate, v_type, user_id, brand, model) values ("silver","BK1132", 3, 2, "Mazda", "Cx5");


select user.last_name, user.first_name,user.hobbies, user.active,
vehicle.license_plate,vehicle.color,vehicle_type.descript,vehicle.brand,vehicle.model from user inner join vehicle on user.id=vehicle.user_id
inner join vehicle_type on vehicle.v_type= vehicle_type.id where user.id=1;