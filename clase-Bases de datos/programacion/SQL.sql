USE ciclistas;
/** funcion 1
crear una uncion que recibe un texto e indica el numero de caracteres del texto
**/
DROP FUNCTION IF EXISTS funcion1;
CREATE FUNCTION funcion1 (texto varchar(100))
RETURNS int DETERMINISTIC
BEGIN
-- craer variables
DECLARE resultado int DEFAULT 0;
-- procesamiento
set resultado = CHAR_LENGTH(texto);
-- SELECT CHAR_LENGTH(texto) INTO resultado; // esto es hacer lo mismo que lo de arriba, pero para ver 
-- salida
RETURN resultado;
END;

SELECT funcion1("hola clase");
SELECT funcion1(c.nombre) FROM ciclista c;
-- las funcion para que te devuelvan datos, los procedimientos para crar tablas y deams
-- crear un procediminto que genere dos tablas, cliente y categorias 
DROP PROCEDURE IF EXISTS crearCliente;
CREATE PROCEDURE crearCliente ()
BEGIN
-- declarar variables

-- procesamiento 
DROP  TABLE IF EXISTS cliente;
CREATE TABLE IF NOT EXISTS cliente(
id int,
nombre varchar(100),
PRIMARY KEY(id)
);
DROP TABLE IF EXISTS categorias;
CREATE TABLE IF NOT EXISTS categorias(
id int,
nombre varchar(100),
PRIMARY KEY (id)
);
END;

-- ejecutar procedimiento
CALL crearCliente();
SELECT * FROM cliente c;
SELECT * FROM categorias c;
-- otro procedimiento que una las tablas (con una tabla intermedia llamada tiene) cardinalidad n n 
DROP PROCEDURE IF EXISTS crearrelacion;
CREATE PROCEDURE crearrelacion()
BEGIN
-- declarar variables

-- procesamiento
DROP TABLE IF EXISTS tiene; 
CREATE TABLE IF NOT EXISTS tiene(
idCliente int,
idCategorias int,
PRIMARY KEY(idCliente, idCategorias),
CONSTRAINT a2 FOREIGN KEY (idCliente) REFERENCES cliente(id),
CONSTRAINT a1 FOREIGN KEY (idCategorias) REFERENCES categorias(id)
);

END;
CALL crearrelacion();
SELECT * FROM tiene; 

-- procedimiento que elimine claves ajenas (de esa tabla)
DROP PROCEDURE IF EXISTS borrarAjeno;
CREATE PROCEDURE borrarAjeno ()
BEGIN
-- declarar variables

-- procesamiento 
ALTER TABLE tiene DROP FOREIGN KEY a1;
ALTER TABLE tiene  DROP FOREIGN KEY a2;
END;
-- llamamos al procedimiento 
CALL borrarAjeno();
-- comprobado con el database explorer
-- crear procedimietno para restaurar la bbdd enetera utilizando los procedimietnos creados
DROP PROCEDURE IF EXISTS restaurar;
CREATE PROCEDURE restaurar ()
BEGIN
-- declarar variables

-- procesamiento 
CALL borrarAjeno();
CALL crearCliente();
CALL crearrelacion();
END;
-- llamamos al procedimietno 
CALL restaurar();
-- procedimietnos que reciba 3 argumentos y los una por ,
DROP PROCEDURE IF EXISTS procedimiento1;
CREATE PROCEDURE procedimiento1 (dato1 varchar(100),dato2 varchar(100),dato3 varchar(100))
BEGIN
-- declarar variables
DECLARE resultado varchar (300);
-- procesamiento 
set resultado=CONCAT_WS(",",dato1,dato2,dato3);
SELECT resultado;
END;
CALL procedimiento1("nombre","apellido1","apellido2");