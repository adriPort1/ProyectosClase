CREATE DATABASE IF NOT EXISTS ejemplosProgramacion;
USE ejemplosProgramacion;
DROP FUNCTION IF EXISTS funcion1;
CREATE FUNCTION funcion1 (numero1 int, numero2 int, numero3 int)
RETURNS int DETERMINISTIC
BEGIN
  -- declarar variables
  DECLARE resultado int DEFAULT 0;
  -- procesamiento
  SET resultado = LEAST(numero1, numero2, numero3); -- min seria para registros, para esto no vale 
  -- devolver resultado

  RETURN resultado;
END;

SELECT
  funcion1(3, 4, 5);
-- el case tiene una sintaxis alternativa, porque puedes poner when 
DROP FUNCTION IF EXISTS funcion2;
CREATE FUNCTION funcion2 (numero1 int, numero2 int, numero3 int)
RETURNS int DETERMINISTIC
BEGIN
  -- declarar variables
  DECLARE resultado int DEFAULT 0;
  -- procesamiento
  IF (numero1 < numero2
    AND numero1 < numero3) THEN
    SET resultado = numero1;
  END IF;
  IF ( numero2 < numero3) THEN
    SET resultado = numero2;
  ELSE SET resultado = numero3;
  END IF;
  -- devolver resultado
  RETURN resultado;
END;
SELECT funcion2(7, 8, 8);



  DROP FUNCTION IF EXISTS funcion3;
CREATE FUNCTION funcion3 (numero1 int, numero2 int, numero3 int)
RETURNS int DETERMINISTIC
BEGIN
  -- declarar variables
  DECLARE resultado int DEFAULT 0;
  -- procesamiento
  IF (numero1 < numero2
    AND numero1 < numero3) THEN
    SET resultado = numero1;
  ELSEIF (numero2<numero3) THEN
    set resultado= numero2;
  ELSE
    set resultado=numero3;
  END IF; 
  -- devolver resultado
  RETURN resultado;
END;

-- funcion 4 
DROP FUNCTION IF EXISTS funcion4;
CREATE FUNCTION funcion4 (numero1 int, numero2 int, numero3 int)
RETURNS int DETERMINISTIC
BEGIN
  -- declarar variables
  DECLARE resultado int DEFAULT 0;
  -- procesamiento
  DROP TEMPORARY TABLE IF EXISTS numeros;
  CREATE TEMPORARY TABLE numeros(
    id int AUTO_INCREMENT,
    numero int,
    PRIMARY KEY (id)  
    );
    INSERT INTO numeros (numero)
  VALUES (numero1),(numero2), (numero3);
   -- set resultado =( SELECT MIN(numero) FROM numeros);
   SELECT MIN(n.numero) INTO resultado from numeros n;
  -- devolver resultado
  RETURN resultado;
END;
-- funcion 5
-- procedimiento que devuelva mayor de 3 num (la gracia esta que con procedimiento no se podria porque no devuelve valores)

DROP PROCEDURE IF EXISTS procedimiento1  ;
CREATE PROCEDURE procedimiento1 (numero1 int, numero2 int, numero3 int, INOUT resultado int)
BEGIN
/**variables**/
SET resultado = GREATEST(numero1,numero2, numero3);
/**codigo**/

END ;

CALL procedimiento1(1,5,6,@mayor);
SELECT @mayor;
-- las funciones para esto, el procedimiento seria mas para meter una tabla y meter el numero mas grande de los 3, las funciones para sacar el numero mas grande 
