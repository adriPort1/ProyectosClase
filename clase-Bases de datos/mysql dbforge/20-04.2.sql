-- crear database
DROP DATABASE IF EXISTS Ejercicio2;
CREATE DATABASE IF NOT EXISTS Ejercicio2;
USE Ejercicio2;
-- tabla 1
CREATE TABLE alumno(
expediente int AUTO_INCREMENT, -- autoincrement para que te vaya sumando (como un id autoincremetno)
nombre varchar(50),
apellidos varchar(100),
fechaNac date,
PRIMARY KEY (expediente)
); 
-- TABLA 2
CREATE TABLE modulo(
codigo int,
nombre varchar(50),
dniPro varchar(10) NOT NULL, -- PORQUE ES OBLIGATORIA, NOT NULL 
PRIMARY KEY (codigo)
);   
-- TABLA 3
CREATE TABLE profesor(
DNI varchar(10),
nombre varchar(50),
direccion varchar(100),
telefono varchar (15),
PRIMARY KEY (DNI)
);
-- TABLA RELACION 
CREATE TABLE cursa(
expedienteAl int,
codigoMo int,
PRIMARY KEY (expedienteAl,codigoMo)
);
-- tabla relacion 2
CREATE TABLE delegado (
expedienteDel int,
expedienteaL int,
PRIMARY KEY (expedienteDel,expedienteaL),
CONSTRAINT uk1 UNIQUE KEY (expedienteaL)
);
-- añadir claves ajenas
ALTER TABLE modulo
ADD CONSTRAINT fkpro FOREIGN KEY (dniPro) REFERENCES profesor(DNI) ON DELETE RESTRICT ON UPDATE RESTRICT;
-- CLAVE AJENA CURSA
ALTER TABLE cursa 
ADD CONSTRAINT fkcu FOREIGN KEY (expedienteAl) REFERENCES alumno(expediente) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD CONSTRAINT fkcu2 FOREIGN KEY (codigoMo) REFERENCES modulo(codigo) ON DELETE RESTRICT ON UPDATE RESTRICT;
-- CLAVE AJENA DELEGADO
ALTER TABLE delegado 
ADD CONSTRAINT fkal FOREIGN KEY (expedienteDel) REFERENCES alumno(expediente) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD CONSTRAINT fkal2 FOREIGN KEY (expedienteaL) REFERENCES alumno(expediente) ON DELETE RESTRICT ON UPDATE RESTRICT;
-- REGISTROS INVENTADOS
INSERT INTO alumno (expediente, nombre, apellidos, fechaNac) VALUES 
(1,'carol', 'peralta martinez', '1996-06-20'),
(2,'jorge','nitales','2000-1-3'),
(3,'kerry','caberga','2009-10-21');
-- REGISTROS INVENTADOS
INSERT INTO profesor (DNI, nombre, direccion, telefono) VALUES 
('72183158p', 'mar', 'c/ del monte 3', '+34 965456123'),
('85296314h','celia','c/ federico vial 8','+34 965784123'),
('98765432g','lara','c/ guerra 4', '+34 698123547');
-- REGISTROS INVENTADOS
 INSERT INTO modulo (codigo, nombre, dniPro) VALUES
 (1,'programacion','72183158p'),
 (2,'bases de datos ','85296314h'),
 (3,'lenguaje de marcas','98765432g');
-- REGISTROS INVENTADOS 
INSERT INTO cursa(expedienteAl, codigoMo) VALUES
(1,3),
(3,1),
(2,2);
-- REGISTROS INVENTADOS 
INSERT INTO delegado(expedienteDel, expedienteaL) VALUES 
(1,3),
(2,1);