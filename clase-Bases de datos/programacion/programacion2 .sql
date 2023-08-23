USE ciclistas;
-- funcion para sumar dos cantidades
SELECT funcion1(1,2);
UPDATE ciclista c SET c.edad=funcion1(edad,2);
SELECT c.edad FROM ciclista c;
-- snipped, vamos a crear uno 
DROP FUNCTION IF EXISTS procedimiento1;
CREATE FUNCTION procedimiento1 ()
RETURNS
BEGIN

RETURN 
END;
-- snippet para crear uncion 
DROP PROCEDURE IF EXISTS procedimiento1 ;
CREATE PROCEDURE procedimiento1  ()
BEGIN
END;
-- formas de programar
-- con un @ no teneis que declarar la variable pero se usan mal para subrutinas o para procedimientos (no vamos a usar ese metodo)

