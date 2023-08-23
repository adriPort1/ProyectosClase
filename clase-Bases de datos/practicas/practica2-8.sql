-- ejercicio 1
DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

DROP TABLE IF EXISTS alumnos;
CREATE TABLE alumnos (
  id int UNSIGNED,
  nombre varchar(50),
  apellido1 varchar(150),
  apellido2 varchar(150),
  nota float,
  PRIMARY KEY(id)
);

-- ejercicio 2

DROP TRIGGER IF EXISTS  alumnosBI;
CREATE TRIGGER  alumnosBI
BEFORE INSERT
   ON  alumnos
   FOR EACH ROW
BEGIN
  IF(NEW.nota<0) THEN SET NEW.nota = 0 ; END IF;
  IF(NEW.nota>100) THEN SET NEW.nota = 100; END IF;


END;

INSERT INTO alumnos (id, nombre, apellido1, apellido2, nota)
  VALUES (2, 'mojame', 'garcia', 'nfsoi', -3);

SELECT * FROM alumnos a;

-- ejercicio 3
DROP TRIGGER IF EXISTS alumnosBU;
CREATE TRIGGER alumnosBU
BEFORE UPDATE
   ON  alumnos
   FOR EACH ROW
BEGIN
  IF(NEW.nota<0) THEN 
    SET NEW.nota = 0 ; 
  ELSEIF (NEW.nota>100) THEN 
    SET NEW.nota = 100; 
   ELSE 
    SET NEW.nota= ROUND(NEW.nota,1);
    END IF; 
END;

UPDATE alumnos a 
SET nota = -100
WHERE id = 2;
SELECT * FROM alumnos a;

-- ejercicio 4

DROP TRIGGER IF EXISTS alumnosBU1;
CREATE TRIGGER alumnosBU1
BEFORE UPDATE
   ON  alumnos
   FOR EACH ROW
BEGIN
IF(NEW.nota<OLD.nota) THEN 
  set NEW.nota=OLD.nota;

  END IF; 
END;

UPDATE alumnos a 
SET nota = 5
WHERE id = 2;
SELECT * FROM alumnos a;

DROP TABLE IF EXISTS notas;
CREATE TABLE notas (
  id int UNSIGNED,
  numero int,
  PRIMARY KEY(id)
);

INSERT INTO notas (id, numero)
  VALUES (0, 0),(10,0),(20,0),(30,0),(40,0),(50,0),(60,0),(70,0),(80,0),(90,0),(100,0);

-- ejercicio 6

  DROP TRIGGER IF EXISTS alumnoAI;
  CREATE TRIGGER alumnoAI
  AFTER INSERT
     ON  alumnos
     FOR EACH ROW
  BEGIN  
  UPDATE notas n 
    SET numero = n.numero + 1 
      WHERE n.id= TRUNCATE(NEW.nota, -1); 
-- se usa truncate con -1 para que convierta a 0 las unidades o deceneas, asi compara cpn la nueva nota
 END;

SELECT * FROM alumnos a;
SELECT * FROM notas n;
INSERT INTO alumnos (id, nombre, apellido1, apellido2, nota)
  VALUES (4, 'afafaf', 'bebebebe', 'cececee', 23);

-- ejercicio 7
DROP TRIGGER IF EXISTS alumnoAU;
CREATE TRIGGER alumnoAU
AFTER UPDATE
   ON  alumnos
   FOR EACH ROW
BEGIN

END;
