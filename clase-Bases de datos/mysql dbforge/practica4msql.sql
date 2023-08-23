-- creo tabla practica 4 msql
DROP DATABASE IF EXISTS practica4msql;
CREATE DATABASE IF NOT EXISTS practica4msql;
USE practica4msql;

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
CONSTRAINT ukdep UNIQUE KEY (nssempleado),
CONSTRAINT fkempleado FOREIGN KEY (nssempleado) REFERENCES empleado(nss)
);
-- tabla supervisa
CREATE TABLE supervisa (
supervisor int,
supervisado int,
PRIMARY KEY (supervisor, supervisado),
CONSTRAINT ukemp2 UNIQUE KEY (supervisado),
CONSTRAINT fkemps FOREIGN KEY (supervisor) REFERENCES empleado(nss),
CONSTRAINT fkemps2 FOREIGN KEY (supervisado) REFERENCES empleado(nss)
);
-- tabla dependiente
CREATE TABLE dependiente (
nombredependiente varchar(10),
nssempleado int,
sexo varchar(2),
fechanac date,
parentesco varchar(20),
PRIMARY KEY (nombredependiente, nssempleado),
CONSTRAINT fkdepen FOREIGN KEY (nssempleado) REFERENCES empleado(nss)
);
-- tabla localizacionesdepartamento 
CREATE TABLE localizaciondep (
nombred varchar(10),
numerod int,
localizacion varchar (30),
PRIMARY KEY (nombred, numerod),
CONSTRAINT fklocal FOREIGN KEY(nombred, numerod) REFERENCES  departamento(nombred,nssd)
);
-- crear tabla proyecto 
CREATE TABLE proyecto(
nombrep varchar(10),
numerop int,
localizacion varchar (30),
nombrecontrola varchar(10) NOT NULL,
nsscontrola int,
PRIMARY KEY (nombrep, numerop),
CONSTRAINT fkp FOREIGN KEY (nombrecontrola, nsscontrola) REFERENCES departamento(nombred, nssd)
);
-- crear tabla trabajaen
CREATE TABLE trabajaen(
nssempleado int,
nombrep varchar (10),
numerop int,
horas int,
PRIMARY KEY (nssempleado, nombrep, numerop),
CONSTRAINT fktra FOREIGN KEY (nssempleado) REFERENCES empleado(nss),
CONSTRAINT fktra2 FOREIGN KEY (nombrep, numerop) REFERENCES proyecto(nombrep, numerop)
);
-- procedo a usar alter table para agregar las claves ajenas a empleado, ya que no deja meterlas si no es modificandolo
ALTER TABLE empleado 
ADD CONSTRAINT fkdepemp FOREIGN KEY (nombred, numerod) REFERENCES departamento(nombred, nssd);
