DROP DATABASE IF EXISTS practica8Disparadores;

CREATE DATABASE IF NOT EXISTS practica8Disparadores;

USE practica8Disparadores;

-- ejercicio 1 con if

DROP PROCEDURE IF EXISTS ejercicio1IF;
CREATE PROCEDURE ejercicio1IF(IN num1 int, IN num2 int)
BEGIN
IF (num1>num2) THEN
  SELECT num1;  
ELSE
  SELECT num2;
END IF;
END;

CALL ejercicio1D(15,25);

-- ejercicio1 cpn consulta de totales

DROP PROCEDURE IF EXISTS ejercicio1Consulta;
CREATE PROCEDURE ejercicio1Consulta(IN num1 int, IN num2 int)
BEGIN

DROP TEMPORARY TABLE IF EXISTS mayor;
CREATE TEMPORARY TABLE mayor(
numeros int
);

INSERT INTO mayor (numeros)
  VALUES (num1),(num2);

SELECT MAX(m.numeros) FROM mayor m;
END;

CALL ejercicio1Consulta(10,20);

-- ejercicio 1 con funcion de mysql

DROP PROCEDURE IF EXISTS ejercicio1Funcion;
CREATE PROCEDURE ejercicio1Funcion(IN num1 int, IN num2 int)
BEGIN

SELECT GREATEST(num1, num2);
END;

CALL ejercicio1Funcion(20,10);

-- ejercicio2 con if

DROP PROCEDURE IF EXISTS ejercicio2IF;
CREATE PROCEDURE ejercicio2IF(IN num1 int, IN num2 int, IN num3 int)
BEGIN
IF (num1>=num2 AND num1>=num3) THEN
  SELECT num1;  
ELSE IF(num3>= num2 AND num1<= num3) THEN
   SELECT num3;
ELSE IF ( num1<=num2 AND num2>= num3) THEN
    SELECT num2;
END IF;
END IF;
END IF;
END;

CALL ejercicio2IF(250,50,50);

-- ejercicio 2 con tabla temporal

DROP PROCEDURE IF EXISTS ejercicio2Consulta;
CREATE PROCEDURE ejercicio2Consulta(IN num1 int, IN num2 int, IN num3 int)
BEGIN

DROP TEMPORARY TABLE IF EXISTS mayor;
CREATE TEMPORARY TABLE mayor(
numeros int
);

INSERT INTO mayor (numeros)
  VALUES (num1),(num2),(num3);

SELECT MAX(m.numeros) FROM mayor m;
END;

CALL ejercicio2Consulta(1000000,2000,896);

-- ejercicio 2 con funcion de mysql

DROP PROCEDURE IF EXISTS ejercicio2Funcion;
CREATE PROCEDURE ejercicio2Funcion(IN num1 int, IN num2 int, IN num3 int)
BEGIN

SELECT GREATEST(num1, num2, num3) AS mayor;
END;

CALL ejercicio2Funcion(20,10,60);

-- ejercicio 3 

DROP PROCEDURE IF EXISTS ejercicio3IO;
CREATE PROCEDURE ejercicio3IO(IN num1 int, IN num2 int, IN num3 int, OUT mayor int, OUT menor int)
BEGIN
 
 SELECT GREATEST(num1, num2, num3) INTO mayor ;

 SELECT LEAST(num1, num2, num3) INTO menor;

END;

CALL ejercicio3IO(23,44,777, @mayor, @menor);

SELECT @mayor, @menor;

-- ejercicio 4 

DROP PROCEDURE IF EXISTS  ejercicio4;
CREATE PROCEDURE  ejercicio4(IN fecha1 date, IN fecha2 date )
BEGIN

SELECT DATEDIFF(fecha1, fecha2);

END;

CALL ejercicio4('2010/1/1', '2009/1/10');

-- ejercicio 5 

DROP PROCEDURE IF EXISTS  ejercicio5;
CREATE PROCEDURE  ejercicio5(IN fecha1 date, IN fecha2 date )
BEGIN

SELECT 
  PERIOD_DIFF (DATE_FORMAT(fecha1,'%Y%m'), 
    DATE_FORMAT(fecha2,'%Y%m'));

END;

CALL ejercicio5('2010/10/1', '2010/01/1');

-- EJERCICIO 6
DROP PROCEDURE IF EXISTS ejercicio6;
CREATE PROCEDURE ejercicio6(IN fecha1 date, IN fecha2 date, OUT restaDias int, OUT restaMeses int, OUT restaAnos int)
BEGIN

SET restaDias = DATEDIFF(fecha1, fecha2);
SET restaMeses = PERIOD_DIFF (DATE_FORMAT(fecha1,'%Y%m'), 
    DATE_FORMAT(fecha2,'%Y%m'));
set restaAnos = year(fecha1)- year(fecha2);
 
SELECT restaDias AS RestaEnDias, restaMeses AS RestaEnMeses, restaAnos AS RestaEnAnos;

END;

CALL ejercicio6 ('2023/07/20', '2009/11/30',@restaDias, @restaMeses, @restaAnos);

-- ejercicio 7 

DROP PROCEDURE IF EXISTS ejercicio7;
CREATE PROCEDURE ejercicio7(IN texto varchar(100))
BEGIN

SELECT CHAR_LENGTH(texto);

END;

CALL ejercicio7('esternocleidomastoideo');
