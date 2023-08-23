-- programacion 3 
-- while normal, repeat es un do while 
DROP DATABASE IF EXISTS ejemplosProgramacion;
CREATE DATABASE IF NOT EXISTS ejemplosProgramacion;
USE ejemplosProgramacion;
-- funcion f1
-- recibe un numerp
-- devuelve suma de todos los numeros desde el 1 hasta el que se le ha pasado
-- numero pasa siempre mayor que uno 
DROP FUNCTION IF EXISTS f1;
CREATE FUNCTION f1 (num int)
RETURNS int  DETERMINISTIC
BEGIN
-- declarar variables
DECLARE contador int;
DECLARE suma int;
-- procesamiento
set contador =1;
set suma=0;
WHILE (contador<=num) DO 
SET suma=suma+contador;
SET contador = contador +1;
END WHILE;
-- devolver resultado
RETURN suma;
END;

SELECT f1 (100);
-- funcion f1
-- recibe un numerp
-- devuelve suma de todos los numeros desde el 1 hasta el que se le ha pasado
-- numero pasa siempre mayor que uno 
-- numero*(numero+1)/2
DROP FUNCTION IF EXISTS f1;
CREATE FUNCTION f1 (num int)
RETURNS int DETERMINISTIC
BEGIN
-- declarar variables
DECLARE suma int DEFAULT 0;
-- procesamiento
SET suma = num*(num+1)/2;
-- devolver resultado
RETURN suma;
END;

-- funcion f2
-- realizar una funcion que me devuelva la suma de los 
-- numeros pares entre 1 y el numero que hacemos como argumento 
-- el numero pasado siempre sera mayor que 1
-- f2(9) = 2+4+6+8;
DROP FUNCTION IF EXISTS f2;
CREATE FUNCTION f2 (num int)
RETURNS int  DETERMINISTIC
BEGIN
-- declarar variables
DECLARE suma int DEFAULT 0;
DECLARE contador int DEFAULT 2;
-- procesamiento
WHILE (contador<=num) DO
 set suma = suma + contador;
  SET contador = contador+2;
END WHILE;
-- devolver resultado
RETURN suma;
END;
SELECT f2(66);

-- procedimientos p1
-- recibe un num
-- crea tabla numeros (si existe cargarsela) con num desde 1 hasta argumento
-- numero pasado siempre mayor que 1.  (solo id y primary key)
-- call p1(5)
-- 1
-- 2
-- 3
-- 4
-- 5
DROP PROCEDURE IF EXISTS p1;
CREATE PROCEDURE p1 (IN num int)
BEGIN
-- declarar variables
DECLARE contador int DEFAULT 1;
-- procesamiento 
DROP TABLE IF EXISTS numeros;
CREATE TABLE IF NOT EXISTS numeros(
  id int,
  PRIMARY KEY(id)
  );  
 WHILE (contador<=num) DO
  INSERT INTO numeros (id)
    VALUES (contador); 
   SET contador=contador+1; 
 END WHILE;
END;
CALL p1(10);
SELECT * FROM numeros n;
-- procedimientos 2 
-- prcedimiento que recibe num, crea tabla num dedse 1 hasta argumento y al lado 
-- la suma de los dos numeros hasta ese numero pasado siempre mayor que 1 
-- call pd(5)
-- id suma
-- 1 1 
-- 2 3
-- 3 6
-- 4 10 
-- 5 15
DROP PROCEDURE IF EXISTS p2;
CREATE PROCEDURE p2 (IN num int)
BEGIN
-- declarar variables
DECLARE contador int DEFAULT 1;
DECLARE suma int DEFAULT 1;
-- procesamiento 
DROP TABLE IF EXISTS numeros;
CREATE TABLE IF NOT EXISTS numeros(
  id int,
  suma int,
  PRIMARY KEY(id)
  );  
 WHILE (contador<=num) DO
  INSERT INTO numeros (id,suma)
    VALUES (contador,suma); 
   SET contador=contador+1;
   set suma=suma+contador; 
 END WHILE;
END;
CALL p2(10);
SELECT * FROM numeros n;
-- funcion letras
-- le pasamos a la funcion un texto
-- y nos tiene que mostrarel numero de vocales que contiene 
-- solo tendremos vocales sin tilde 
-- y siempre habra algo en la frase
-- letrass(hola)--> 2
-- if
DROP FUNCTION IF EXISTS funcionLetras;
CREATE FUNCTION funcionLetras (frase varchar(1000))
RETURNS int DETERMINISTIC
BEGIN
-- declarar variables
DECLARE vocal int DEFAULT 0;
DECLARE contador int DEFAULT 1;
-- procesamiento
WHILE (contador<=CHAR_LENGTH(frase)) DO 
IF (SUBSTRING(frase,contador,1)='a') THEN 
set vocal = vocal +1;
END IF;
IF (SUBSTRING(frase,contador,1)='e') THEN
set vocal = vocal +1;
END IF;
IF (SUBSTRING(frase,contador,1)='i') THEN
set vocal = vocal +1;
END IF;
IF (SUBSTRING(frase,contador,1)='o') THEN
set vocal = vocal +1;
END IF;
 IF (SUBSTRING(frase,contador,1)='u') THEN
set vocal = vocal +1;
END IF;
 set contador=contador+1;
END WHILE;
-- devolver resultado
RETURN vocal;
END;
SELECT funcionLetras('pachuru'); -- el lo de las vocales lo hizo en funcion

DROP FUNCTION IF EXISTS esVocal;
CREATE FUNCTION esVocal (entrada char(1))
RETURNS boolean  DETERMINISTIC
BEGIN
-- declarar variables
DECLARE salida boolean DEFAULT FALSE;
-- procesamiento
CASE (LOWER(entrada))
  WHEN 'a' THEN set salida = TRUE ;
  WHEN 'e' THEN set salida = TRUE ;
  WHEN 'i' THEN set salida = TRUE ;
  WHEN 'o' THEN set salida = TRUE ;
  WHEN 'u' THEN set salida = TRUE ;
  ELSE SET salida =FALSE;
  END CASE;
-- devolver resultado
RETURN salida;
END;
-- habria que meter el es vocal en funcion letras para usar 