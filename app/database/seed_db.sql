
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