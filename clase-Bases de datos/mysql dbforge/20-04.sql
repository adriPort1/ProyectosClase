-- Este es el ejercicio 1 de la practica 6, con el modelo de 5 tablas
DROP DATABASE IF EXISTS Ejercicio1;
CREATE DATABASE IF NOT EXISTS Ejercicio1;
USE Ejercicio1;
-- primera tabla
CREATE TABLE Cliente(
DNI varchar(10),
Nombre varchar(50),
Apellidos varchar(100),
Fechanac date,
Telefono varchar(15),
PRIMARY KEY (DNI)
);
-- segunda tabla 
CREATE TABLE Producto(
Codigo int,
Nombre varchar(50),
Precio float,
PRIMARY KEY (Codigo) 
);
-- tercera tabla
CREATE TABLE Proveedor (
NIF varchar(20),
Nombre varchar(50),
Direccion varchar(150),
PRIMARY KEY (NIF) 
);
-- tabla primera relacion producto - proveedor
CREATE TABLE Suministra (
Codigo int,
NIF varchar(20),
PRIMARY KEY (Codigo,NIF),
CONSTRAINT uk1 UNIQUE KEY (Codigo)
);
-- segunda tabla relacion cliente - proveedor
CREATE TABLE Compra (
DNICliente varchar(10),
Codigo int,
PRIMARY KEY (DNICliente, Codigo)
);
-- añado clave ajena a tabla compra
ALTER TABLE Compra
ADD CONSTRAINT fkcom FOREIGN KEY (DNICliente) REFERENCES Cliente(DNI) ON DELETE RESTRICT ON UPDATE RESTRICT, -- poner la estructura asi, si se pone debajo se puede comer coma y que falle
ADD CONSTRAINT fkcom2 FOREIGN KEY (Codigo) REFERENCES Producto(Codigo) ON DELETE RESTRICT ON UPDATE RESTRICT; 
-- en este ejercico usamos delete restrict para que haya restriccion a la hora de maipular datos, sino usar cascade
-- añado clave ajena a tabla suministro
ALTER TABLE Suministra
ADD CONSTRAINT fksum FOREIGN KEY (Codigo) REFERENCES Producto(Codigo) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD CONSTRAINT  fksum2 FOREIGN KEY (NIF) REFERENCES Proveedor (NIF) ON DELETE RESTRICT ON UPDATE RESTRICT;
-- El restrict en update tambien es para que al meter datos tambien se haga con restriccion
-- insertar datos cliente
INSERT INTO Cliente (DNI, Nombre, Apellidos, Fechanac, Telefono) VALUES
('72185285g', 'Juan', 'Gomez Martin', '1990-01-01', '+ 34 600222555'),
('72154636j', 'Martin', 'Gilbert Cagigas', '1996-1-2', '+34 655422399'),
('50999999p','Mario','barros mencia', '1973-12-31','+34 999555666');
-- insertar datos proveedor
INSERT INTO Proveedor (NIF, Nombre, Direccion) VALUES
('555666333t','Pedro','c/ Pepito marin 13'),
('777888999y', 'Jorge', 'av/ camilo alonso 4'),
('78945612p','Paco','c/ san martin 95');
-- insertar datos producto
INSERT INTO Producto(Codigo, Nombre, Precio) VALUES
(2, 'pollo kg',13.50),
(1,'vino',21.90),
(3,'chorizo',4);
-- insertar datos Compra
INSERT INTO Compra (DNICliente, Codigo) VALUES
('72185285g',2),
('72154636j',1),
('50999999p',3),
('72185285g',1),
('72185285g',3),
('72154636j',3);
-- insertar datos Suministra
INSERT INTO Suministra (Codigo, NIF) VALUES
(2,'555666333t'),
(1,'777888999y'),
(3,'78945612p');

/*-- comprobar ejer 
USE ejercicio1;

SELECT * FROM compra c;
SELECT * FROM cliente c;
SELECT * FROM proveedor p;
SELECT * FROM producto p;
SELECT * FROM suministra s;
salen abajo las tablas con sus datos, se suele abrir en otro sql.
use + la base de datos y luego ese codigo para la tabla a sacar
*/
