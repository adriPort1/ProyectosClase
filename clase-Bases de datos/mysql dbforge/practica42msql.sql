-- creo tabla practica 4 msql
DROP DATABASE IF EXISTS practica42msql;
CREATE DATABASE IF NOT EXISTS practica42msql;
USE practica42msql;

-- tabla empleado
CREATE TABLE empleado (
nss int,
nombre varchar (10),
apellido varchar (15),
iniciales varchar (3),
sexo varchar (2),
direccion varchar (20),
salario float,
fechanacimiento date,
nombred varchar(10),
numerod int,
PRIMARY KEY (nss)
);
-- tabla departamento
CREATE TABLE departamento (
nombred varchar(10),
nssd int,
sexo varchar(2),
numeroempleados int,
nssempleado int NOT NULL,
fechainicio date,
PRIMARY KEY (nombred, nssd),
CONSTRAINT ukdep UNIQUE KEY (nssempleado)
);
-- tabla supervisa
CREATE TABLE supervisa (
supervisor int,
supervisado int,
PRIMARY KEY (supervisor, supervisado),
CONSTRAINT ukemp2 UNIQUE KEY (supervisado)
);
-- tabla dependiente
CREATE TABLE dependiente (
nombredependiente varchar(10),
nssempleado int,
sexo varchar(2),
fechanac date,
parentesco varchar(20),
PRIMARY KEY (nombredependiente, nssempleado)
);
-- tabla localizacionesdepartamento 
CREATE TABLE localizaciondep (
nombred varchar(10),
numerod int,
localizacion varchar (30),
PRIMARY KEY (nombred, numerod)
);
-- crear tabla proyecto 
CREATE TABLE proyecto(
nombrep varchar(10),
numerop int,
localizacion varchar (30),
nombrecontrola varchar(10) NOT NULL,
nsscontrola int,
PRIMARY KEY (nombrep, numerop)
);
-- crear tabla trabajaen
CREATE TABLE trabajaen(
nssempleado int,
nombrep varchar (10),
numerop int,
horas int,
PRIMARY KEY (nssempleado, nombrep, numerop)
);
-- alteracion tabla para las claves ajenas 
ALTER TABLE empleado 
ADD CONSTRAINT fkdepemp FOREIGN KEY (nombred, numerod) REFERENCES departamento(nombred, nssd);
-- tabla supervisa claves ajenas 
ALTER TABLE supervisa 
ADD CONSTRAINT fksuper FOREIGN KEY (supervisor) REFERENCES empleado(nss),
ADD CONSTRAINT fksuper2 FOREIGN KEY (supervisado) REFERENCES empleado(nss);
-- tabla dependiente 
ALTER TABLE dependiente
ADD CONSTRAINT fkdep FOREIGN KEY (nssempleado) REFERENCES empleado(nss);
-- claves departamento ajenas
ALTER TABLE departamento 
ADD CONSTRAINT fkempd FOREIGN KEY (nssempleado) REFERENCES empleado(nss) ;
-- claves ajneas localizacion
ALTER TABLE localizaciondep 
ADD CONSTRAINT fklocal FOREIGN KEY (nombred, numerod) REFERENCES departamento(nombred, nssd);
-- claves ajenas proyecto 
ALTER TABLE proyecto 
ADD CONSTRAINT fkpro FOREIGN KEY (nombrecontrola, nsscontrola) REFERENCES departamento(nombred, nssd);
-- claves ajenas trabajaen 
ALTER TABLE trabajaen  
ADD CONSTRAINT fktraem FOREIGN KEY (nssempleado) REFERENCES empleado(nss),
ADD CONSTRAINT fktrap FOREIGN KEY (nombrep, numerop) REFERENCES proyecto(nombrep, numerop);
-- insertar registros para comprobar la tabla 

set FOREIGN_KEY_CHECKS=0;
  INSERT INTO empleado 
   (nss, nombre, apellido, iniciales, sexo, direccion, salario, fechanacimiento, nombred, numerod) VALUES 
   (3, 'jose', 'castillo', 'jct', 'H', 'avda camilo alonso', 1000,'1996-2-2' ,'ventas', 1),
   (7, 'juan', 'ortega', 'jod','NB', 'c/ alta',2000,'1999-1-30','reparto', 2);
 set FOREIGN_KEY_CHECKS=1;
   -- tabla supervisa registros
  INSERT INTO supervisa (supervisor, supervisado) VALUES
 (7, 3);
  -- tabla dependiente
  INSERT INTO dependiente (nombredependiente, nssempleado, sexo, fechanac, parentesco) VALUES
  ('jose', 3, 'H', '1996-2-21', 'hermano');
  -- tabla departamento registro
  INSERT INTO departamento (nombred, nssd, sexo, numeroempleados, nssempleado, fechainicio) VALUES
  ('ventas', 1, 'H', 10, 3, '2010-5-5'),
  ('reparto', 2, 'H', 20, 7, '2015-4-10');
  -- tabla localizacióndepartamento 
  INSERT INTO localizaciondep (nombred, numerod, localizacion) VALUES
  ('ventas', 1, 'malaga'),
  ('reparto',2,'santander');
  -- tabla proyecto 
 INSERT INTO proyecto (nombrep, numerop, localizacion, nombrecontrola, nsscontrola) VALUES 
 ('peña', 1, 'valladolid', 'ventas', 1),
 ('algo',2,'santander','reparto',2);
 -- tabla trabajaen
 INSERT INTO trabajaen (nssempleado, nombrep, numerop, horas) VALUES 
  (3, 'peña', 1, 20);
