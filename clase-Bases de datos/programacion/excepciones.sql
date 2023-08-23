DROP DATABASE IF EXISTS excepciones;
CREATE DATABASE excepciones;
USE excepciones;

CREATE TABLE errores(
  id int AUTO_INCREMENT,
  nombre varchar(100),
  fecha datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(id)
);

DROP PROCEDURE IF EXISTS errores1;
CREATE PROCEDURE errores1()
BEGIN
-- declarar variables
-- declarar condiciones
-- declarar manipuladores
DECLARE EXIT HANDLER FOR SQLEXCEPTION 
BEGIN
  INSERT INTO errores (nombre)
  VALUES ('error 1'); 
END;
-- procesamiento
SELECT * FROM tonteria;
END;
-- si pones continue, seguira y te insertara la tabla con el error(por la orden que le hemmos dado)
-- si pones exit, nunca llegará a ejecutarla porque el manipulador se sale, rompe el programa

CALL errores1();
SELECT * FROM errores e;

DROP PROCEDURE IF EXISTS errores2;
CREATE PROCEDURE errores2 ()
BEGIN
-- declarar variables
-- declarar condiciones
-- declarar manipuladores
DECLARE CONTINUE HANDLER FOR 1051
BEGIN 
INSERT INTO errores (nombre)
  VALUES ('error en el procedimiento errores 2');
END;
-- al intentar selecionarla, da el error normal, si es para borrarla, lanza la excepcion
-- porque el manipulador es de tipo continue
DROP TABLE tonteria;
SELECT * FROM errores e;
END;

CALL errores2();
-- si usas show error con algo que te de error, te dice el numero
-- select * from tonterias;
-- show errors;
-- pasara por pantalla el  error 

DROP PROCEDURE IF EXISTS errores3;
CREATE PROCEDURE errores3 ()
BEGIN
-- declarar variables
-- declarar condiciones 
DECLARE tablaNoExiste CONDITION FOR 1051;
-- declarar manipulador
DECLARE CONTINUE HANDLER FOR tablaNoExiste
BEGIN
INSERT INTO errores (nombre)
  VALUES ('error en el procedimiento 3'); 
END;
-- procesamiento 
DROP TABLE tonterias;
SELECT * FROM errores e;
END;
CALL errores3();

DROP TABLE IF EXISTS numeros;
CREATE TABLE IF NOT EXISTS numeros(
id int,
valor int NOT NULL,
PRIMARY KEY (id),
UNIQUE KEY (valor)
);


INSERT INTO numeros (valor)
  VALUES (1);
  SHOW ERRORS;
  SELECT * FROM numeros n;



DROP PROCEDURE IF EXISTS errores4;
CREATE PROCEDURE errores4 ()
BEGIN
-- declarar variables
DECLARE registroNoValido  CONDITION FOR 1364; -- 1364 para la excepcion dejar u n campo sin rellenar obligatorio
DECLARE noValidoVacio CONDITION FOR 1048;
DECLARE CONTINUE HANDLER FOR registroNoValido, noValidoVacio 
BEGIN 
INSERT INTO errores (nombre)
  VALUES ('error procedimiento 4, registro no valido');
END;
-- procesamiento 

INSERT INTO numeros (id, valor) VALUES (2, NULL);
END;

 CALL errores4();
 SELECT * FROM numeros n;
 SELECT * FROM errores e;

DROP PROCEDURE IF EXISTS errores5;
CREATE PROCEDURE errores5 ()
BEGIN
-- declarar variables
DECLARE CONTINUE HANDLER FOR 1062 
BEGIN 
INSERT INTO errores ( nombre)
  VALUES ('error procedimiento 5, valores duplicados');
END;
-- procesamiento 
INSERT INTO numeros (id, valor)
  VALUES (1, 1);

END;

CALL errores5();
SELECT * FROM   errores e;
SELECT * FROM numeros n;


DROP PROCEDURE IF EXISTS errores6;
CREATE PROCEDURE errores6 ()
BEGIN
-- declarar variables
DECLARE registroNoValido  CONDITION FOR 1364; -- no dejar vacio campo obligatorios
DECLARE noValidoVacio CONDITION FOR 1048;-- no dejar a null campo obligatorio
DECLARE CONTINUE HANDLER FOR registroNoValido, noValidoVacio 
BEGIN 
INSERT INTO errores (nombre)
  VALUES ('error procedimiento 6, registro no valido');
END;
DECLARE CONTINUE HANDLER FOR 1062 -- no duplicar
BEGIN 
INSERT INTO errores ( nombre)
  VALUES ('error procedimiento 6, valores duplicados');
END;
-- procesamiento
INSERT INTO numeros (id, valor)
  VALUES (1, 1);

INSERT INTO numeros(id) VALUES (1);
END;

CALL errores6();
SELECT * FROM errores e;

DROP PROCEDURE IF EXISTS errores7;
CREATE PROCEDURE errores7 ()
BEGIN
-- declarar variables
DECLARE requerido CONDITION FOR 1364 ;
DECLARE noVacio CONDITION FOR 1048;
DECLARE duplicado CONDITION FOR 1062;
DECLARE CONTINUE HANDLER FOR requerido, noVacio
BEGIN

INSERT INTO errores ( nombre)
  VALUES ('no puedo introducir registros en la tabla numeros din los campos requeridos');
END;
DECLARE CONTINUE HANDLER FOR duplicado
BEGIN
INSERT INTO errores(nombre) 
  VALUES('no puedo meter el campo porque esta duplicado');
END;

-- procesamiento 
INSERT INTO numeros (id, valor)
  VALUES (2, 1);
INSERT INTO numeros (valor) VALUES (1);
END;

CALL errores7();
SELECT * FROM errores e;

DROP FUNCTION IF EXISTS errores1;
CREATE FUNCTION errores1 ( numero int)
RETURNS varchar(20)  DETERMINISTIC
BEGIN
-- declarar variables
DECLARE texto varchar(20) DEFAULT 'Es impar';
-- procesamiento
  IF (MOD(numero,2)=0) THEN
    SET texto= 'Es par';
  END IF;
-- devolver resultado
RETURN texto; 
END;

SELECT errores1(4);

DROP FUNCTION IF EXISTS errores1;
CREATE FUNCTION errores1 (numero int)
RETURNS varchar(20)  DETERMINISTIC
BEGIN
-- declarar variables
DECLARE texto varchar(20) DEFAULT NULL;
-- procesamiento
DECLARE par CONDITION FOR SQLSTATE '45000';
DECLARE impar CONDITION FOR SQLSTATE '45001';

DECLARE CONTINUE HANDLER FOR par 
BEGIN
SET texto= 'par';
END;

DECLARE CONTINUE HANDLER FOR impar
BEGIN
 set texto='impar';
END;

IF (MOD(numero,2)=0 ) THEN 
  SIGNAL par;
ELSE
  SIGNAL impar;
END IF;
 
-- devolver resultado

RETURN texto;
END;

SELECT errores1(5);


DROP FUNCTION IF EXISTS errores2;
CREATE FUNCTION errores2 (fecha date)
RETURNS varchar(20)  DETERMINISTIC
BEGIN
-- declarar variables
DECLARE texto varchar(20);
DECLARE laboral CONDITION FOR SQLSTATE '45003';
DECLARE festivo CONDITION FOR SQLSTATE '45004';

DECLARE CONTINUE HANDLER FOR laboral
BEGIN 
SET texto = 'Es dia laboral';
END;

DECLARE CONTINUE HANDLER FOR festivo
BEGIN 
SET texto = 'Es dia festivo'; 
END;
-- procesamiento
IF (DAYOFWEEK(fecha)>1 AND DAYOFWEEK(fecha)<7) THEN 
  SIGNAL laboral;
ELSE
  SIGNAL festivo;
END IF;
 
-- devolver resultado
RETURN texto;
END;

SELECT errores2('2023-08-05');