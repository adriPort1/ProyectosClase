-- 1, crear base de datos 
DROP DATABASE IF EXISTS procedimientos1;  
CREATE DATABASE IF NOT EXISTS procedimientos1;
USE procedimientos1;
-- 2 generar procedimiento almacenado copiado
DROP PROCEDURE IF EXISTS uno;
CREATE PROCEDURE uno()
COMMENT 'ejemplo de procedimiento almacenado'
BEGIN
/**variables**/
/**codigo**/
  DROP TABLE IF EXISTS ciudades;
  CREATE TABLE ciudades(
    id int AUTO_INCREMENT,
    nombre varchar(100),
    PRIMARY KEY (id));
END ;
-- 3 comprobar el codigo del procedimiento almacenado del servidor
SHOW CREATE PROCEDURE uno;
-- 4 ejercicio 4mostrar los procedimientos existentes en la base de datos 
SHOW PROCEDURE STATUS WHERE db="procedimientos1";
-- 5 ejecutamos el procedimiento y probar
CALL uno();
SHOW TABLES FROM procedimientos1;
DESCRIBE ciudades;
EXPLAIN ciudades;
-- 6 crear procedimiento almacenado denominadodos que me crea una tabla denominada personas y si existe la elimine y la vuelva a crear
DROP PROCEDURE IF EXISTS dos ;
CREATE PROCEDURE dos ()
BEGIN
/**variables**/
/**codigo**/
DROP TABLE IF EXISTS personas;
CREATE TABLE IF NOT EXISTS personas(
id int AUTO_INCREMENT,
nombre varchar(100),
edad int,
PRIMARY KEY(id)
);
END ;
-- 7 comprobar y llamar que se crea la taabla
CALL dos();
SELECT * FROM personas p;
-- 8 listar procedimientos almacenados existentes en la base de datos
SHOW PROCEDURE STATUS WHERE db="procedimientos1";
-- 9 crear funcion (copiar)
DROP FUNCTION IF EXISTS f1 ;
CREATE FUNCTION f1 ()
RETURNS  varchar(50) DETERMINISTIC
BEGIN
    /** variables**/
  
    /**programa**/

    /*retorna**/
RETURN CONCAT_WS(" ","hoy es ",CURDATE()," y son ",CURTIME());
 END;
-- 10 ejecutar funcion desde select
SELECT f1();
-- 11 comprobar que la funcion esta en el server
SHOW FUNCTION STATUS WHERE db="procedimientos1";
-- 12 mostrar el codigo de la funcion 
SHOW CREATE FUNCTION f1;
