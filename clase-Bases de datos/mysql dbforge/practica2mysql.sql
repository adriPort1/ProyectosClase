-- practica 2 mysql
-- tambien hay que evitar el alter table 
DROP DATABASE IF EXISTS Practica2msql;
CREATE DATABASE IF NOT EXISTS Practica2msql;
USE Practica2msql;

-- crear tablas, empezamos con coches
CREATE TABLE coches (
id int AUTO_INCREMENT,
marca varchar(15),
fecha date,
precio float,
PRIMARY KEY (id)
);
-- terminar tabla coches

-- crear tabla clientes 
CREATE TABLE clientes(
cod int AUTO_INCREMENT,
nombre varchar(15),
PRIMARY KEY (cod)
);
-- terminar tabla cliente

-- crear tabla comprados
CREATE TABLE comprados (
idcoches int,
codclientes int,
PRIMARY KEY (idcoches, codclientes),
CONSTRAINT FOREIGN KEY(idcoches) REFERENCES coches(id),
CONSTRAINT FOREIGN KEY (codclientes) REFERENCES clientes(cod)
);
-- tabla comprados acabada 

INSERT INTO clientes (nombre) VALUES 
('marc'),
('sofia');

INSERT INTO coches (marca, fecha, precio) VALUES 
('renault', '2010-2-5', 2550.60),
('audi','2020-10-2',8000.95);

INSERT INTO comprados (idcoches, codclientes) VALUES
 (1, 2),
 (2, 1);