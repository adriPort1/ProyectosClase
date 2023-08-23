-- programacion en bases de datos
-- procedimientos almacenados
-- funciones
-- disparadores
-- eventos (como despertador)
-- sintaxis procedimiento
-- procedimientos no devuelven nada, operan, se usan la clausula call y las funciones en select, having 
-- disparadores programa que se ejecuta de forma automatica enttre eventos de usuario 
-- eventos  son como la alarma, tareas programadas
DROP PROCEDURE IF EXISTS crearTablaClientes;
CREATE PROCEDURE crearTablaClientes()
  BEGIN

  END;
-- DELIMITER $$ esto indica que ahora el dolar sera el final de instruccion
-- returns solo admite escalares, no arrays
 USE ciclistas;
 DROP FUNCTION IF EXISTS funcion1;
 CREATE FUNCTION  funcion1(numero1 int, numero2 int)
 RETURNS int DETERMINISTIC 
 BEGIN
 -- declarando variables 
  DECLARE resultado int DEFAULT 0;
-- le asigno el valor
  set resultado=numero1+numero2;
  -- devuelve el resultado
  RETURN resultado;
 END;
SELECT funcion1(2,3);
-- procedimiento es para hacer operaciones
DROP PROCEDURE IF EXISTS procedimiento1;
CREATE PROCEDURE procedimiento1(numero1 int, numero2 int)
BEGIN 
  DECLARE resultado int DEFAULT 0;
  set resultado =numero1+numero2;
  SELECT resultado;
  END;
CALL procedimiento1(2,3);
