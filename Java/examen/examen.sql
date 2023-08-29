DROP DATABASE IF EXISTS examen;
CREATE DATABASE IF NOT EXISTS examen;
USE examen;

CREATE TABLE vocales(
id int AUTO_INCREMENT,
texto varchar(10),
PRIMARY KEY (id)
);

CREATE TABLE consonante(
id int AUTO_INCREMENT,
texto varchar(10),
PRIMARY KEY (id)
);
SELECT * FROM consonante c;
SELECT * FROM vocales v;

