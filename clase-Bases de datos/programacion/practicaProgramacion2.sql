-- practica programacion 2
-- creamos la base de datos
DROP DATABASE IF EXISTS practica2;
CREATE DATABASE IF NOT EXISTS practica2;

-- ejercicio 1
DROP PROCEDURE IF EXISTS ejercicio1;

CREATE PROCEDURE ejercicio1 (IN lado float)
BEGIN
  /**variables**/
  DECLARE area float;
  DECLARE superficie float;
  /**codigo**/
  SET area = POW(lado, 2);
  SET superficie = lado * 4;
  -- crear tabla
  CREATE TABLE IF NOT EXISTS ejercicio1 (
    numero int AUTO_INCREMENT,
    lado float,
    area float,
    superficie float,
    PRIMARY KEY (numero)
  -- almacenar resultado
  );
  INSERT INTO ejercicio1
    VALUES (DEFAULT, lado, area, superficie);
END;
CALL ejercicio1(1.2);
SELECT
  *
FROM ejercicio1 e;
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

-- ejercicio 2
DROP PROCEDURE IF EXISTS ejercicio2;
CREATE PROCEDURE ejercicio2 (IN lado float)
BEGIN
  -- declarar variables
  DECLARE volumen float;
  -- procesamiento 
  SET volumen = POW(lado, 3);
  -- tabla
  CREATE TABLE IF NOT EXISTS ejercicio2 (
    id int AUTO_INCREMENT,
    ladoCampo float,
    volumenCampo float,
    PRIMARY KEY (id)
  );
  INSERT INTO ejercicio2
    VALUES (DEFAULT, lado, volumen);
END;
CALL ejercicio2(7.0);
SELECT
  *
FROM ejercicio2 e;
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

-- ejercicio 3 
DROP PROCEDURE IF EXISTS ejercicio3;

CREATE PROCEDURE ejercicio3 (IN lado float)
BEGIN
-- declarar variables
DECLARE volumen float;
DECLARE areaTotal float;
-- procesamiento 
SET volumen = lado*lado*lado;
SET areaTotal = 6*lado*lado;

-- creamos la tabla
CREATE TABLE IF NOT EXISTS ejercicio3(
id int AUTO_INCREMENT,
ladoCampo float,
volumenCampo float,
areaTotalCampo float,
PRIMARY KEY(id)
);

-- almacenar resultados 
INSERT INTO ejercicio3 VALUES(DEFAULT, lado, volumen, areaTotal);
END;
CALL ejercicio3(16);
SELECT * FROM ejercicio3 e;
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- ejercicio 4
DROP FUNCTION IF EXISTS funcionejer1;
CREATE FUNCTION funcionejer1 (lado int)
RETURNS float  DETERMINISTIC
BEGIN
-- declarar variables
DECLARE volumen float;
-- procesamiento
 SET volumen = POW(lado,3);
-- devolver resultado

RETURN volumen;
END;
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- ejercicio 5
DROP FUNCTION IF EXISTS funcionarea;
CREATE FUNCTION funcionarea (lado float)
RETURNS float  DETERMINISTIC
BEGIN
-- declarar variables
DECLARE volumen float;
-- procesamiento
 SET volumen= POW(lado,3);
-- devolver resultado

RETURN volumen;
END;
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- ejercicio6 
DROP PROCEDURE IF EXISTS practica1Ejer6;
CREATE PROCEDURE practica1Ejer6 (IN lado float)
BEGIN
-- declarar variables
DECLARE volumen float;
DECLARE areaTotal float;
-- procesamiento 
 SET volumen= funcionejer1(lado);

-- creamos tabla si no existe con los resultados
CREATE TABLE IF NOT EXISTS ejercicio6(
id int AUTO_INCREMENT,
ladoCampo float,
volumenCampo float,
PRIMARY KEY (id)
);
INSERT INTO ejercicio6 (ladoCampo, volumenCampo)
  VALUES (lado, volumen);

END;

CALL practica1Ejer6(2);
SELECT * FROM ejercicio6 e;

-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- ejercicio 7

DROP FUNCTION IF EXISTS ejercicio7;
CREATE FUNCTION ejercicio7 (radio float, altura float)
RETURNS float  DETERMINISTIC
BEGIN
-- declarar variables
DECLARE volumen float;
-- procesamiento
SET volumen = PI()*POW(radio, 2)*altura;
-- devolver resultado
RETURN volumen;
END;
SELECT ejercicio7(1.2,4);

-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- ejercicio 8

DROP FUNCTION IF EXISTS ejercicio8;
CREATE FUNCTION ejercicio8 (radio float, altura float)
RETURNS float  DETERMINISTIC
BEGIN
-- declarar variables
DECLARE areaLateral float;
-- procesamiento
SET areaLateral= 2*PI()*radio*altura;
-- devolver resultado

RETURN areaLateral;
END;
SELECT ejercicio8(4,9);
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- ejercicio 9

DROP FUNCTION IF EXISTS ejercicio9;
CREATE FUNCTION ejercicio9 (radio float, altura float)
RETURNS float  DETERMINISTIC
BEGIN
-- declarar variables
DECLARE areaTotal float;
-- procesamiento
set areaTotal = (ejercicio8(radio, altura))+(ejercicio7(radio, altura));
-- devolver resultado

RETURN areaTotal;
END;
SELECT ejercicio9(3,3);

-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

-- ejercicio 10 
DROP PROCEDURE IF EXISTS ejercicio10;
CREATE PROCEDURE ejercicio10 (IN radio float, IN altura float)
BEGIN
-- declarar variables
DECLARE volumen float;
DECLARE areaTotal float;
DECLARE areaLateral float;

-- procesamiento 
SET volumen= ejercicio7(radio, altura);
SET areaLateral = ejercicio8(radio, altura);
set areaTotal = ejercicio9(radio, altura);

-- creamos tabla por si no existe para lols resultados
CREATE TABLE IF NOT EXISTS ejercicio10 (
id int AUTO_INCREMENT,
volumen float,
areaLateral float,
areaTotal float,
PRIMARY KEY (id)
);

INSERT INTO ejercicio10 ( volumen, areaLateral, areaTotal)
  VALUES (volumen, areaLateral, areaTotal);

END;

CALL ejercicio10(3,3);
SELECT * FROM ejercicio10 e;