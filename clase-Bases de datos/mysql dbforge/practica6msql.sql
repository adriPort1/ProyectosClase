-- practica 6 msql
-- eliminar, crear y usar tabla
DROP DATABASE IF EXISTS practica6msql;
CREATE DATABASE IF NOT EXISTS practica6msql;
USE practica6msql;
-- creacion de tablas
-- crear tabla cliente
CREATE TABLE cliente (
nif varchar(10),
nombre varchar(10),
direccion varchar(30),
ciudad varchar(15),
telefono int,
PRIMARY KEY (nif)
);
-- crear tabla coche
CREATE TABLE coche(
matricula varchar(10),
marca varchar(15),
modelo varchar(10),
color varchar(10),
precio float,
PRIMARY KEY (matricula)
);
-- creara tabla compra 
CREATE TABLE compra(
nifCliente varchar(10),
matriculaCoche varchar(10),
PRIMARY KEY (nifCliente, matriculaCoche)
);
-- crear tabla revision
CREATE TABLE revision (
codigo int,
filtro varchar(20),
aceite varchar(20),
frenos varchar(20),
matriculaCoche varchar(10) NOT NULL,
PRIMARY KEY (codigo)
);
-- creacion de claves ajenas y unicas en tablas 
-- creacion claves ajenas y propias 
ALTER TABLE compra 
ADD CONSTRAINT fkCliente FOREIGN KEY (nifCliente) REFERENCES cliente(nif),
ADD CONSTRAINT fkCoche FOREIGN KEY (matriculaCoche) REFERENCES coche(matricula),
ADD CONSTRAINT ukCoche UNIQUE KEY (matriculaCoche);
-- creacion claves ajenas revision 
ALTER TABLE revision 
ADD CONSTRAINT fkMatC FOREIGN KEY (matriculaCoche) REFERENCES coche(matricula);
-- insertar registros en la tabla 
INSERT INTO cliente (nif, nombre, direccion, ciudad, telefono)  VALUES
 ('12345678P', 'jose', 'c/ Alfonso', 'malaga', 942030506);
-- insertar en coche 
INSERT INTO coche (matricula, marca, modelo, color, precio) VALUES
 ('c256ag', 'audi', 'a4', 'negro', 2500.30);
-- registros en tabla compra 
INSERT INTO compra (nifCliente, matriculaCoche) VALUES
 ('12345678P', 'c256ag');
 -- registros revision 
 INSERT INTO revision (codigo, filtro, aceite, frenos, matriculaCoche) VALUES
 (35, 'aire', 'semisintetico', 'disco', 'c256ag');