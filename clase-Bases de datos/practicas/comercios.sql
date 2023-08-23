DROP DATABASE IF EXISTS comercios;
CREATE DATABASE IF NOT EXISTS comercios
	CHARACTER SET utf8
	COLLATE utf8_spanish_ci;

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

-- 
-- Set default database
--
USE comercios;

--
-- Definition for table cliente
--
CREATE TABLE IF NOT EXISTS cliente (
  dni INT(11) NOT NULL,
  nombre VARCHAR(50) DEFAULT NULL,
  edad INT(11) DEFAULT NULL,
  PRIMARY KEY (dni)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 2730
CHARACTER SET utf8
COLLATE utf8_spanish_ci;

--
-- Definition for table comercio
--
CREATE TABLE IF NOT EXISTS comercio (
  cif INT(11) NOT NULL,
  nombre VARCHAR(50) DEFAULT NULL,
  ciudad VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (cif)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 3276
CHARACTER SET utf8
COLLATE utf8_spanish_ci;

--
-- Definition for table desarrolla
--
CREATE TABLE IF NOT EXISTS desarrolla (
  id_fab INT(11) NOT NULL DEFAULT 0,
  codigo INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (id_fab, codigo)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 819
CHARACTER SET utf8
COLLATE utf8_spanish_ci;

--
-- Definition for table distribuye
--
CREATE TABLE IF NOT EXISTS distribuye (
  cif INT(11) NOT NULL DEFAULT 0,
  codigo INT(11) NOT NULL DEFAULT 0,
  cantidad INT(11) DEFAULT NULL,
  PRIMARY KEY (cif, codigo)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 862
CHARACTER SET utf8
COLLATE utf8_spanish_ci;

--
-- Definition for table fabricante
--
CREATE TABLE IF NOT EXISTS fabricante (
  id_fab INT(11) NOT NULL,
  nombre VARCHAR(50) DEFAULT NULL,
  pais VARCHAR(30) DEFAULT NULL,
  PRIMARY KEY (id_fab)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 2730
CHARACTER SET utf8
COLLATE utf8_spanish_ci;

--
-- Definition for table programa
--
CREATE TABLE IF NOT EXISTS programa (
  codigo INT(11) NOT NULL,
  nombre VARCHAR(50) DEFAULT NULL,
  version VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (codigo)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 819
CHARACTER SET utf8
COLLATE utf8_spanish_ci;

--
-- Definition for table registra
--
CREATE TABLE IF NOT EXISTS registra (
  cif INT(11) NOT NULL DEFAULT 0,
  dni INT(11) NOT NULL DEFAULT 0,
  codigo INT(11) DEFAULT NULL,
  medio VARCHAR(20) DEFAULT NULL,
  PRIMARY KEY (cif, dni)
)
ENGINE = INNODB
AVG_ROW_LENGTH = 2730
CHARACTER SET utf8
COLLATE utf8_spanish_ci;

-- 
-- Dumping data for table cliente
--
INSERT INTO cliente VALUES
(1, 'Pepe Pérez', 45),
(2, 'Juan González', 45),
(3, 'María Gómez', 33),
(4, 'Javier Casado', 18),
(5, 'Nuria Sánchez', 29),
(6, 'Antonio Navarro', 58);

-- 
-- Dumping data for table comercio
--
INSERT INTO comercio VALUES
(1, 'El Corte Inglés', 'Sevilla'),
(2, 'El Corte Inglés', 'Madrid'),
(3, 'Jump', 'Valencia'),
(4, 'Centro Mail', 'Sevilla'),
(5, 'FNAC', 'Barcelona');

-- 
-- Dumping data for table desarrolla
--
INSERT INTO desarrolla VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(3, 17),
(3, 18),
(4, 14),
(4, 20),
(5, 15),
(5, 16),
(5, 19),
(6, 13);

-- 
-- Dumping data for table distribuye
--
INSERT INTO distribuye VALUES
(1, 1, 10),
(1, 2, 11),
(1, 6, 5),
(1, 7, 3),
(1, 10, 5),
(1, 13, 7),
(2, 1, 6),
(2, 2, 6),
(2, 6, 4),
(2, 7, 7),
(3, 10, 8),
(3, 13, 5),
(4, 14, 3),
(4, 20, 6),
(5, 8, 8),
(5, 15, 8),
(5, 16, 2),
(5, 17, 3),
(5, 19, 6);

-- 
-- Dumping data for table fabricante
--
INSERT INTO fabricante VALUES
(1, 'Oracle', 'Estados Unidos'),
(2, 'Microsoft', 'Estados Unidos'),
(3, 'IBM', 'Estados Unidos'),
(4, 'Dinamic', 'España'),
(5, 'Borland', 'Estados Unidos'),
(6, 'Symantec', 'Estados Unidos');

-- 
-- Dumping data for table programa
--
INSERT INTO programa VALUES
(1, 'Application Server', '9i'),
(2, 'Database', '8i'),
(3, 'Database', '9i'),
(4, 'Database', '10g'),
(5, 'Developer', '6i'),
(6, 'Access', '97'),
(7, 'Access', '2000'),
(8, 'Access', 'XP'),
(9, 'Windows', '98'),
(10, 'Windows', 'XP Professional'),
(11, 'Windows', 'XP Home Edition'),
(12, 'Windows', '2003 Server'),
(13, 'Norton Internet Security', '2004'),
(14, 'Freddy Hardest', NULL),
(15, 'Paradox', '2'),
(16, 'C++ Builder', '5.5'),
(17, 'DB/2', '2.0'),
(18, 'OS/2', '1.0'),
(19, 'JBuilder', 'X'),
(20, 'La prisión', '1.0');

-- 
-- Dumping data for table registra
--
INSERT INTO registra VALUES
(1, 1, 1, 'Internet'),
(1, 3, 4, 'Tarjeta postal'),
(2, 4, 15, 'Internet'),
(4, 1, 10, 'Tarjeta postal'),
(4, 2, 10, 'Teléfono'),
(5, 2, 12, 'Internet');

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;