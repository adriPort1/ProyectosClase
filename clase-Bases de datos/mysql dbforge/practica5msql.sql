-- practica 5 mysql
-- elimino si existe, creo si no existe y la uso
DROP DATABASE IF EXISTS practica5msql;
CREATE DATABASE IF NOT EXISTS practica5msql;
USE practica5msql;
-- creo tabla alumno
CREATE TABLE alumno (
expediente int,
nombre varchar(15),
apellidos varchar (25),
fecha_nac date,
PRIMARY KEY (expediente)
);
-- crear tabla profesor 
CREATE TABLE profesor (
dni varchar(9),
nombre varchar(15),
direccion varchar(40),
telefono int,
PRIMARY KEY (dni)
);
-- crear tabla modulo
CREATE TABLE modulo(
codigo int,
nombre varchar(15),
PRIMARY KEY(codigo)
);
-- crear tabla delegado
CREATE TABLE delegado (
expedienteDel int,
expedienteAl int,
PRIMARY KEY(expedienteDel, expedienteAl)
);
-- crear tabla cursa
CREATE TABLE cursa(
expedienteAl int,
expedienteMod int,
PRIMARY KEY(expedienteAl, expedienteMod)
);
-- crear tabla imparte
CREATE TABLE imparte (
dniProfe varchar (9),
codigoMod int,
PRIMARY KEY (dniProfe, codigoMod)
);
-- empezamos a colocar claves ajenas y unicas
-- claves ajenas y unicas en delegado
ALTER TABLE delegado 
ADD CONSTRAINT fkAl1 FOREIGN KEY (expedienteDel) REFERENCES alumno(expediente),
ADD CONSTRAINT fkAl2 FOREIGN KEY (expedienteAl) REFERENCES alumno(expediente),
ADD CONSTRAINT ukAlD UNIQUE KEY (expedienteAl); 
-- claves ajenas cursa
ALTER TABLE cursa
ADD CONSTRAINT fkAlC1 FOREIGN KEY (expedienteAl) REFERENCES alumno(expediente),
ADD CONSTRAINT fkAlC2 FOREIGN KEY (expedienteMod) REFERENCES modulo(codigo);
-- claves ajenas y unicas en tabla imparte
ALTER TABLE imparte
ADD CONSTRAINT fkProfe FOREIGN KEY (dniProfe) REFERENCES profesor (dni),
ADD CONSTRAINT fkMod FOREIGN KEY (codigoMod) REFERENCES modulo(codigo),
ADD CONSTRAINT ukImp UNIQUE KEY (codigoMod);
-- introducir registros 
INSERT INTO alumno (expediente, nombre, apellidos, fecha_nac) VALUES
 (212, 'Ricardo', 'Montoya', '2002-6-6');
 -- registros en profesor
 INSERT INTO profesor (dni, nombre, direccion, telefono) VALUES
 ('72258621P', 'Jorge','C/ Antonio Mendoza', 0);
  -- registros modulo
  INSERT INTO modulo (codigo, nombre) VALUES
 (3, 'informatica');
  -- registros en delegado 
  INSERT INTO delegado (expedienteDel, expedienteAl) VALUES
 (212, 212);
 -- registro en cursa
 INSERT INTO cursa (expedienteAl, expedienteMod) VALUES
 (212, 3);
 -- registro imparte
 INSERT INTO imparte (dniProfe, codigoMod) VALUES
 ('72258621P', 3);