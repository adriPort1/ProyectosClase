-- practica 6 procedimientos 
DROP DATABASE IF EXISTS practicaProcedimiento6;
CREATE DATABASE IF NOT EXISTS practicaProcedimiento6;
USE practicaProcedimiento6;

-- ejercicio 1 
DROP PROCEDURE IF EXISTS ejercicio1;
CREATE PROCEDURE ejercicio1 ()
COMMENT 'procedimiento que saca mensaje por pantalla'
BEGIN

-- declarar variables

-- procesamiento 
SELECT 'Este es un ejemplo de procedimiento' AS mesaje;
END;
CALL ejercicio1();

-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

-- ejercicio 2 

DROP PROCEDURE IF EXISTS ejercicio2;
CREATE PROCEDURE ejercicio2 ()
COMMENT 'Procedimiento con variables'
BEGIN
-- declarar variables
DECLARE numero int DEFAULT 1;
DECLARE texto varchar(10) DEFAULT NULL;
DECLARE numDecimal float DEFAULT 10.48;
-- procesamiento 
SET numero = 10;
SET texto = 'prueba de procedimientos';
END;

