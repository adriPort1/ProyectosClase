-- nuevo ejer practica 7 ejer 1
DROP DATABASE IF EXISTS Ejercicio3;
CREATE DATABASE IF NOT EXISTS Ejercicio3;
USE Ejercicio3;
-- empleado tabla
CREATE TABLE empleado (
nss varchar(10),
nombre varchar(15),
apellido varchar (30),
iniciales varchar(3),
fechaNcto date,
direccion varchar(50),
sexo varchar(10),
salario float,
numeroDep int NOT NULL,
nombreDep varchar (50) NOT NULL,
PRIMARY KEY (nss)
);
-- tabla departamento
CREATE TABLE departamento(
numero int AUTO_INCREMENT,
nombre varchar(10),
numEmpleados int,
PRIMARY KEY(numero,nombre)
);
-- tabla proyecto 
CREATE TABLE proyecto (
numeropro int,
nombre varchar (10),
localizacion varchar (50),
numero int NOT NULL,
nombredep varchar(15) NOT NULL,
PRIMARY KEY (numeropro, nombre)
);
-- dependiente tabla
CREATE TABLE dependiente (
nombredep varchar(15),
nss varchar(10),
sexo varchar(2),
fechaNac date,
parentesco varchar (10),
PRIMARY KEY (nombredep, nss)
);
-- tabla supervisa
CREATE TABLE supervisa (
nss varchar(10),
supervisor varchar(15),
PRIMARY KEY (nss, supervisor),
CONSTRAINT uk3 UNIQUE KEY (nss)
);
-- tabla dirige
CREATE TABLE dirige (
nss varchar(10),
numerodep int,
nombredep varchar(10),
fechaInicio date,
PRIMARY KEY (nss, numerodep, nombredep),
CONSTRAINT UK1 UNIQUE KEY (nss),
CONSTRAINT UK2 UNIQUE KEY (numerodep, nombredep)
);
-- tabla trabaja
CREATE TABLE trabaja (
 nss varchar (10),
 numeropro int,
 horas varchar(5),
 PRIMARY KEY (nss, numeropro)
);
--  tabla localizacion departamentos 
CREATE TABLE deparlocaliza (
numerodep int,
nombredep varchar (10),
localizaciones varchar(50),
PRIMARY KEY (numerodep, nombredep)
);
-- empiezo a añadir claves ajenas
-- clave ajena departamento 
ALTER TABLE empleado
ADD CONSTRAINT fk1 FOREIGN KEY (numeroDep, nombreDep) REFERENCES departamento(numero, nombre) ON DELETE RESTRICT ON UPDATE RESTRICT;
-- clave ajena en proyecto (departamento tambien)
ALTER TABLE proyecto
ADD CONSTRAINT fk2 FOREIGN KEY (numero, nombredep) REFERENCES departamento(numero, nombre) ON DELETE RESTRICT ON UPDATE RESTRICT;
-- clave ajena en dependiente  (con empleado)
ALTER TABLE dependiente
ADD CONSTRAINT fk3 FOREIGN KEY (nss) REFERENCES empleado (nss) ON DELETE RESTRICT ON UPDATE RESTRICT;
-- clave ajena en supervisa ( empleado)
ALTER TABLE supervisa
ADD CONSTRAINT fk4 FOREIGN KEY (nss) REFERENCES empleado(nss) ON DELETE RESTRICT ON UPDATE RESTRICT, 
ADD CONSTRAINT fk42 FOREIGN KEY (supervisor) REFERENCES empleado(nss) ON DELETE RESTRICT ON UPDATE RESTRICT;
-- clave ajena en dirige (empleado y departamento)
ALTER TABLE dirige 
ADD CONSTRAINT fk5 FOREIGN KEY (nss) REFERENCES empleado(nss) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD CONSTRAINT fk52 FOREIGN KEY (numerodep, nombredep) REFERENCES departamento (numero, nombre) ON DELETE RESTRICT ON UPDATE RESTRICT;
-- clave ajena en trabaja (de empleado y proyecto)
ALTER TABLE trabaja
ADD CONSTRAINT fk6 FOREIGN KEY (nss) REFERENCES empleado (nss) ON DELETE RESTRICT ON UPDATE RESTRICT,
ADD CONSTRAINT fk62 FOREIGN KEY (numeropro) REFERENCES proyecto(numeropro) ON DELETE RESTRICT ON UPDATE RESTRICT;
-- clave ajena en departamento localizacion, (de departamento)
ALTER TABLE deparlocaliza
ADD CONSTRAINT fk7 FOREIGN KEY (numerodep, nombredep) REFERENCES departamento(numero, nombre) ON DELETE RESTRICT ON UPDATE RESTRICT;
-- añado registros para que probar
-- empiezo en departamento que no tiene ninguna foreign key porque asi puedo meterlos (no cargarte nada)
INSERT INTO departamento(nombre, numEmpleados) VALUES
   ('Ventas', 10),
   ('ofimatica', 5),
   ('repartidor', 15);
-- registros para empleado
INSERT INTO empleado (nss, nombre, apellido, iniciales, fechaNcto, direccion, sexo, salario, numeroDep, nombreDep) VALUES
   ('kfc123456', 'kevin', 'Ibarra','ki','1995-12-13','c/ la habana 1', 'hombre', 1200.50, 3, 'repartidor'),
   ('lcp789456', 'laro', 'vazquez', 'lv', '2000-01-01','c/ argentina 10','hombre', 1639.53, 2, 'ofimatica'),
   ('pch123789', 'pam', 'martinez', 'pm', '1989-05-25','c/ camilo alonso vega 40','mujer', 1400.50, 1, 'Ventas');
-- vamos a " cargarnos" una foreign key para meter datos porque todas las tablas estan todas relacionadas, ninguna libre (según el modelo de los otros, yo soy genial y tengo una libre)
-- foreign_key_check=!; este es el comando para ello
INSERT INTO proyecto (numeropro, nombre, localizacion, numero, nombredep) VALUES 
   (1, 'recorrer', 'Santander', 3, 'repartidor'),
   (2,'programar','bilbao',2,'ofimatica'),
   (3,'cartera','scranton',1,'ventas');
   -- insertar datos en dependiente
INSERT INTO dependiente (nombredep, nss, sexo, fechaNac, parentesco) VALUES
   ('pam', 'pch123789', 'm','1996-12-31', 'primo');
   -- insertar datos en supervisa
INSERT INTO supervisa (nss, supervisor) VALUES
   ('pch123789', 'lcp789456');
  -- insertar datos en dirige 
INSERT INTO dirige (nss, numerodep, nombredep, fechaInicio) VALUES
   ('lcp789456', 2, 'ofimatica', '2010-6-20');
   -- insertar datos en trabaja
INSERT INTO trabaja (nss, numeropro, horas) VALUES
   ('kfc123456', 2, '50');
   -- insertar datos en localización departamento
INSERT INTO deparlocaliza (numerodep, nombredep, localizaciones) VALUES
   (1, 'ventas', 'vitoria');