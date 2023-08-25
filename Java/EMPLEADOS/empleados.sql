SET NAMES 'utf8';

DROP DATABASE IF EXISTS empleados;

CREATE DATABASE empleados
CHARACTER SET utf8mb4
COLLATE utf8mb4_0900_ai_ci;

--
-- Set default database
--
USE empleados;

--
-- Create table `departamento`
--
CREATE TABLE departamento (
  id int UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre varchar(100) NOT NULL,
  presupuesto double UNSIGNED NOT NULL,
  gastos double UNSIGNED NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 8,
AVG_ROW_LENGTH = 2340,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

--
-- Create table `empleado`
--
CREATE TABLE empleado (
  id int UNSIGNED NOT NULL AUTO_INCREMENT,
  nif varchar(9) NOT NULL,
  nombre varchar(100) NOT NULL,
  apellido1 varchar(100) NOT NULL,
  apellido2 varchar(100) DEFAULT NULL,
  id_departamento int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 14,
AVG_ROW_LENGTH = 1260,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

--
-- Create index `nif` on table `empleado`
--
ALTER TABLE empleado
ADD UNIQUE INDEX nif (nif);

--
-- Create foreign key
--
ALTER TABLE empleado
ADD CONSTRAINT empleado_ibfk_1 FOREIGN KEY (id_departamento)
REFERENCES departamento (id);

-- 
-- Dumping data for table departamento
--
INSERT INTO departamento VALUES
(1, 'Desarrollo', 120000, 6000),
(2, 'Sistemas', 150000, 21000),
(3, 'Recursos Humanos', 280000, 25000),
(4, 'Contabilidad', 110000, 3000),
(5, 'I+D', 375000, 380000),
(6, 'Proyectos', 0, 0),
(7, 'Publicidad', 0, 1000);

-- 
-- Dumping data for table empleado
--
INSERT INTO empleado VALUES
(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1),
(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2),
(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3),
(4, '77705545E', 'Adrián', 'Suárez', NULL, 4),
(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5),
(6, '38382980M', 'María', 'Santana', 'Moreno', 1),
(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2),
(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3),
(9, '56399183D', 'Juan', 'Gómez', 'López', 2),
(10, '46384486H', 'Diego', 'Flores', 'Salas', 5),
(11, '67389283A', 'Marta', 'Herrera', 'Gil', 1),
(12, '41234836R', 'Irene', 'Salas', 'Flores', NULL),
(13, '82635162B', 'Juan Antonio', 'Sáez', 'Guerrero', NULL);