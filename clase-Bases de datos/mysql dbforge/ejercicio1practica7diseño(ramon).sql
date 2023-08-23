-- Esta es la practica de ramon, hay que modificara una tabla nueva del excel 
DROP DATABASE IF EXISTS practica7Ejercicio1Diseno;
CREATE DATABASE practica7Ejercicio1Diseno;
USE practica7Ejercicio1Diseno;

# Comienza tabla empleado 
CREATE TABLE empleado (
  nss varchar(10),
  nombre varchar(100),
  iniciales varchar(10),
  apellido varchar(100),
  sexo varchar(50),
  direccion varchar(200),
  salario float,
  fechaNacimiento date,
 PRIMARY KEY(nss)
);

# Fin tabla empleado

-- tabla pertenece
CREATE TABLE pertenece (
iddepartamento int AUTO_INCREMENT,
nssempleado varchar(10),
PRIMARY KEY (iddepartamento, nssempleado),
CONSTRAINT ukpertemp UNIQUE KEY (nssempleado)
);
-- fin tabla pertenece

# tabla supervisa
CREATE TABLE supervisa(
  supervisor varchar(10),
  supervisado varchar(10),
  PRIMARY KEY(supervisor,supervisado),
  CONSTRAINT uk1 UNIQUE KEY (supervisado)
);
# fin de la tabla supervisa

# tabla dependiente
CREATE TABLE dependiente(
nombreDependiente varchar(100),
nssEmpleado varchar(10),
sexo varchar(50),
fechaNacimiento date,
parentesco varchar(50),
PRIMARY KEY(nombreDependiente,nssEmpleado)
);
# fin de la tabla dependiente

# tabla departamento
CREATE TABLE departamento(
iddepartamento int,
nombreD varchar(100) NOT NULL,
numeroD int NOT NULL,
numeroEmpleados int,
nssEmpleadoDirector varchar(10) NOT NULL,
fechaInicioJefe date,
PRIMARY KEY(iddepartamento),
CONSTRAINT uk1 UNIQUE KEY(nssEmpleadoDirector),
CONSTRAINT iknuevadep UNIQUE KEY (nombreD, numeroD)
);

# fin de la tabla departamento

# tabla localizacionesDepartamento
CREATE TABLE localizacionesDepartamento(
    iddepartamento int,
  localizacion varchar(100),
  PRIMARY KEY(iddepartamento,localizacion)
);

# fin de la tabla localizacionesDepartamento

# tabla proyecto
CREATE TABLE proyecto(
  idproyecto int AUTO_INCREMENT,
  nombreP varchar(100) NOT NULL,
  numeroP int UNSIGNED NOT NULL,
  localizacionP varchar(100),
  iddepar int,
  PRIMARY KEY(idproyecto),
  CONSTRAINT uknomnum UNIQUE KEY(nombreP, numeroP)
);
# fin tabla proyecto

# tabla trabajaEn
CREATE TABLE trabajaEn(
  nssEmpleado varchar(10),
  nombreP varchar(100),
  numeroP int UNSIGNED,
  horas int UNSIGNED,
  PRIMARY KEY(nssEmpleado,nombreP,numeroP)
);
# fin tabla trabajaEn

/**
claves ajenas
**/
-- claves ajenas tabla peretenece
ALTER TABLE pertenece 
  ADD CONSTRAINT ukpertdepar  
    FOREIGN KEY(iddepartamento)
      REFERENCES departamento (iddepartamento)
        ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT ukpertemp 
    FOREIGN KEY (nssempleado) 
      REFERENCES empleado(nss);
-- fin claves ajenas pertenece
# claves supervisa
ALTER TABLE supervisa 
  ADD CONSTRAINT FKSupervisaEmpleadoSupervisor 
    FOREIGN KEY (supervisor)
    REFERENCES empleado(nss)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT FKSupervisaEmpleadoSupervisado
    FOREIGN KEY(supervisado)
    REFERENCES empleado(nss)
    ON DELETE RESTRICT ON UPDATE RESTRICT;

# fin claves supervisa

# claves ajenas dependiente
ALTER TABLE dependiente
  ADD CONSTRAINT FKDependienteEmpleado
    FOREIGN KEY(nssEmpleado)
    REFERENCES empleado(nss)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
# fin claves ajenas dependiente

# claves ajenas departamento
ALTER TABLE departamento 
  ADD CONSTRAINT FKDepartamentoEmpleado
    FOREIGN KEY (nssEmpleadoDirector)
    REFERENCES empleado(nss) 
    ON DELETE RESTRICT ON UPDATE RESTRICT;
# fin claves ajenas departamento

# claves ajenas localizacionesDepartamento
ALTER TABLE localizacionesDepartamento
  ADD CONSTRAINT FKLocalizacionesDepartamento
  FOREIGN KEY (iddepartamento)
  REFERENCES departamento(iddepartamento)
  ON DELETE RESTRICT ON UPDATE RESTRICT;
# fin claves ajenas localizacionesDepartamento

# claves ajenas proyecto
ALTER TABLE proyecto
  ADD CONSTRAINT FKProyectoDepartamento
    FOREIGN KEY(idproyecto)
    REFERENCES departamento(iddepartamento)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
# fin claves ajenas proyecto

# claves ajenas trabajaen
ALTER TABLE trabajaEn 
  ADD CONSTRAINT FKTrabajaEnEmpleado
    FOREIGN KEY(nssEmpleado) 
    REFERENCES empleado(nss)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT FKTrabajaEnProyecto
    FOREIGN KEY(nombreP,numeroP)
    REFERENCES proyecto(nombreP,numeroP)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
# Fin claves ajenas trabajaen

/**
fin de claves ajenas
**/

/**
datos
**/
-- deshabilito las claves ajenas
set FOREIGN_KEY_CHECKS=0;

# tabla empleados

-- meto los directores
INSERT INTO empleado 
(nss, nombre, iniciales, apellido, sexo, direccion, salario, fechaNacimiento) VALUES  
  ('1', 'ramon', 'raf', 'abramo', 'm', 'vargas', 1000, '1980/12/1'),
  ('2', 'rosa', 'rrf', 'rodriguez', 'f', 'vargas', 1000, '1990/12/1');

-- habilito las claves ajenas
set FOREIGN_KEY_CHECKS=1;


# tabla departamentos
INSERT INTO departamento 
  (iddepartamento,nombreD, numeroD, numeroEmpleados, nssEmpleadoDirector, fechaInicioJefe) VALUES 
  (1,'tecnico', 1, 20, '1', '2023/03/12'),
  (2,'visual', 1, 10, '2', '2023/04/12');

# tabla empleados
# para introducir los empleados que no son directores
# que trabajan para los departamentos creados
INSERT INTO empleado 
  (nss, nombre, iniciales, apellido, sexo, direccion, salario, fechaNacimiento) VALUES 
  ('3', 'jorge', 'jjs', 'saiz', 'm', 'luis 1', 1000, '1980/1/1'),
  ('4', 'ana', 'aan', 'noemi', 'f', 'lope 1', 1000, '1988/1/1');


# tabla supervisa

INSERT INTO supervisa 
  (supervisor, supervisado) VALUES 
  ('1', '2'),
  ('1', '3'),
  ('1', '4');

# tabla dependientes
INSERT INTO dependiente 
  (nombreDependiente, nssEmpleado, sexo, fechaNacimiento, parentesco) VALUES 
  ('laura', '1', 'f', '1999/12/7', 'hija'),
  ('luisa', '3', 'f', '2010/1/17', 'hija');

# localizaciones de los departamentos
INSERT INTO localizacionesDepartamento 
  (iddepartamento, localizacion) VALUES 
  (1, 'santander'),
  (2, 'laredo'),
  (1, 'noja'),
  (2,'santander');

# proyecto
INSERT INTO proyecto 
  (nombreP, numeroP, localizacionP, iddepar) VALUES 
  ('carreteras', 1, 'santander', 1),
  ('carreteras', 2, 'noja', 2);

# trabaja en
INSERT INTO trabajaEn 
  (nssEmpleado, nombreP, numeroP, horas) VALUES 
  ('1', 'carreteras', 1, 200),
  ('2', 'carreteras', 1, 100),
  ('3', 'carreteras', 2, 200),
  ('1', 'carreteras', 2, 200);




/**
Fin Datos
**/
