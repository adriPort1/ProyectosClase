USE practica9programacion;

-- ejercicio 1 practica 10

DROP PROCEDURE IF EXISTS ejercicio1P9;
CREATE PROCEDURE ejercicio1P9(IN char1 varchar(1), IN texto varchar(100))
BEGIN

SELECT POSITION(char1 IN texto);

END;

CALL ejercicio1P9('e','decrepito');
-- ejercicio 2 practica 10

DROP PROCEDURE IF EXISTS ejercicio2;
CREATE PROCEDURE ejercicio2(IN texto varchar(100), IN caracter varchar(1))
BEGIN

SELECT SUBSTRING_INDEX(texto,caracter,1);


END;

CALL ejercicio2('chupinazo','a');


-- ejercicio 4 practica 4



DROP PROCEDURE IF EXISTS ejercicio4;
CREATE PROCEDURE ejercicio4()
BEGIN

SELECT d.numero1, d.numero2 FROM datos d WHERE d.numero1>50 AND d.numero2>50;
END;

CALL ejercicio4();


-- ejercicio 5 



DROP PROCEDURE IF EXISTS ejercicio5;
CREATE PROCEDURE ejercicio5()
BEGIN

UPDATE datos d 
SET d.suma = d.numero1+d.numero2,
    resta = d.numero1-d.numero2;
 SELECT d.suma, d.resta FROM datos d;
END;
 
CALL ejercicio5();



-- ejercicio 6

DROP PROCEDURE IF EXISTS ejercicio6 ;
CREATE PROCEDURE ejercicio6 ()
BEGIN
UPDATE datos d 
SET 
    suma = NULL ,
    resta = NULL;


UPDATE datos d 
SET 
    suma = d.numero1+d.numero2,
    resta = d.numero1-d.numero2
    WHERE d.numero1>d.numero2;
    
UPDATE datos d 
SET 
    resta = d.numero2-d.numero1
    WHERE d.numero1<d.numero2;

SELECT d.numero1,d.numero2,d.suma,d.resta FROM datos d;
END;

CALL ejercicio6();

-- ejercicio 7

DROP PROCEDURE IF EXISTS  ejercicio7;
CREATE PROCEDURE  ejercicio7()
BEGIN

UPDATE datos d 
SET 
    
    junto = CONCAT(d.texto1,' ', d.texto2);
   
 
SELECT d.junto,d.texto1,d.texto2 FROM datos d;
END;

CALL ejercicio7();

-- ejercicio 8

DROP PROCEDURE IF EXISTS  ejercicio8;
CREATE PROCEDURE  ejercicio8()
BEGIN

UPDATE datos d 
SET 
    junto = NULL;

UPDATE datos d 
SET 
    junto = CONCAT(d.texto1,' - ' ,d.texto2)
    WHERE d.rango = 'A';
UPDATE datos d 
SET 
    junto = CONCAT(d.texto1,' + ' ,d.texto2)
    WHERE d.rango = 'B';

UPDATE datos d 
SET 
    junto = d.texto1
    WHERE d.rango<>'A' AND d.rango<>'b';


SELECT d.texto1,d.texto2,d.junto,d.rango FROM datos d;
END;

CALL ejercicio8();
