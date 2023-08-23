-- pracitca 1 mysql 8.0
-- se tiene que hacer sin alter table 
DROP DATABASE IF EXISTS Practica1msql;
CREATE DATABASE IF NOT EXISTS Practica1msql;
USE Practica1msql; 
-- crear tabla clientes porque no tiene claves ajenos 
CREATE TABLE clientes(
cod int AUTO_INCREMENT,
nombre varchar(15),
PRIMARY KEY (cod)
);
-- fin tabla cliente

-- crear tabla coches
CREATE TABLE coches(
id int AUTO_INCREMENT,
codCliente int,
marca varchar (15),
fecha date,
precio float,
PRIMARY KEY (id),
CONSTRAINT FOREIGN KEY (codCliente) REFERENCES clientes(cod)
);
-- fin tabla coches 
-- inserto registros en las tablas para probar 
INSERT INTO clientes (nombre) VALUES 
 ('mario'),
 ('luigi');
 INSERT INTO coches (codCliente, marca, fecha, precio) VALUES
  (2, 'renault','2010-5-20', 3500.55),
  (1,'seat','2005-12-16',2935.20);