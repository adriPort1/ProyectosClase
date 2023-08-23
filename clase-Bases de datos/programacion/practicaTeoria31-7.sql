DROP DATABASE IF EXISTS numeros;
CREATE DATABASE IF NOT EXISTS numeros;
USE numeros;

DROP TABLE IF EXISTS numero;
CREATE TABLE IF NOT EXISTS numero(
id int AUTO_INCREMENT,
valor int,
PRIMARY KEY (id)
);


INSERT INTO numero (valor)
  VALUES (2),(4),(7),(20),(13);
-- procedimiento para mostrar los resultados por separado de contar los registros y mostrarlos


DROP PROCEDURE IF EXISTS p1 ;
CREATE PROCEDURE p1  ()
BEGIN
-- crear variables
DECLARE registros int DEFAULT 0;
DECLARE contador int DEFAULT 0;
-- procesamiento 

SELECT COUNT(n.valor) INTO registros FROM numero n;

WHILE (contador<registros) DO 
  SELECT * FROM numero n LIMIT contador,1;
  set contador = contador+1;
END WHILE;

END;

CALL p1();

-- ahora vamos a probar con cursores, probando algun ejercicio 

DROP PROCEDURE IF EXISTS cursor1;
CREATE PROCEDURE cursor1 ()
BEGIN

-- declarar variables
DECLARE valor int DEFAULT 0;
DECLARE id int DEFAULT 0;
-- declarar cursores
DECLARE cursorPrimero CURSOR FOR 
  SELECT 
    n.id, n.valor 
  FROM numero n;
-- procesamiento 

-- abrimos cursor
OPEN cursorPrimero;
-- utilizamos cursor
FETCH cursorPrimero INTO id, valor; -- leo el primer registro y guardo en las variables los campos 
-- cerramos cursor 
CLOSE cursorPrimero;
-- mostramos valor de variables 
SELECT id, valor;

END;


CALL cursor1();

DROP PROCEDURE IF EXISTS cursor2;
CREATE PROCEDURE cursor2 ()
BEGIN
-- declarar variables
DECLARE contador int DEFAULT 0;
DECLARE id int DEFAULT 0;
DECLARE valor int DEFAULT 0;
DECLARE registros int DEFAULT 0;
-- declarar cursores
DECLARE cursorPrimero CURSOR FOR 
  SELECT n.id, n.valor FROM numero n;

-- procesamiento 

-- abrir cursor
OPEN cursorPrimero;

SELECT COUNT(n.id) INTO registros FROM numero n;

  WHILE (contador<registros) DO

    FETCH cursorPrimero INTO id, valor;
    SELECT id, valor;
    SET contador= contador +1;
  END WHILE;
-- cerrar cursor
  CLOSE cursorPrimero;
END;

CALL cursor2();


-- CURSOR 3 PERO CON LAS EXCEPCIONES, ASI NO USAR CONTADOR 

DROP PROCEDURE IF EXISTS CURSOR3;
CREATE PROCEDURE CURSOR3 ()
BEGIN

DECLARE id int DEFAULT 0;
DECLARE valor int DEFAULT 0;
DECLARE ultimo boolean DEFAULT FALSE;
-- declarar cursores
DECLARE cursorPrimero CURSOR FOR 
  SELECT n.id, n.valor FROM numero n;
 
-- manipulador de excepciones 
DECLARE CONTINUE HANDLER FOR NOT FOUND set ultimo=1; -- begin y end para mas de una, set para 1;
-- puedes poder lo de arriba o:
-- DECLARE CONTINUE HANDLER FOR '02000' set ultimo=1; 
-- DECLARE CONTINUE HANDLER FOR 1329 set ultimo=1;
 
-- abrir cursor

OPEN cursorPrimero;

  FETCH cursorPrimero INTO id, valor;
  WHILE (ultimo=0) DO 
    SELECT id, valor;
    FETCH cursorPrimero INTO id, valor;  
  END WHILE;
-- cerrar cursor
  CLOSE cursorPrimero;
  -- este es el error que buscamos con el handler de arriba, para controlarlo 
  -- Error number: 1329; Symbol: ER_SP_FETCH_NO_DATA; SQLSTATE: 02000
END;

CALL CURSOR3();

-- procedimiento que busca los numeros pares de la tabla y los muesttra con caoncatenados con un guion 
-- si llamo a pares que me devuelva los numeros pares concatenados con un guion 
-- call pares(): ==> 2-4-20;
-- utilizando cursores y excepciones

DROP PROCEDURE IF EXISTS pares;
CREATE PROCEDURE pares ()
BEGIN
-- declarar variables
DECLARE numerosP varchar(100) DEFAULT NULL;
DECLARE ultimo boolean DEFAULT 0;
DECLARE valor int DEFAULT 0;

-- procesamiento 

DECLARE cursorPrimero CURSOR FOR SELECT n.valor FROM numero n;

DECLARE CONTINUE HANDLER FOR NOT FOUND set ultimo=1;

OPEN cursorPrimero;
  FETCH cursorPrimero INTO valor;
  WHILE (ultimo=0) DO 
    IF ((valor MOD 2)= 0) THEN 
      set numerosP = CONCAT_WS("-", valor, numerosP);
    END IF;
    FETCH cursorPrimero INTO valor; 
  END WHILE;
  
SELECT numerosP;
END;

CALL pares();