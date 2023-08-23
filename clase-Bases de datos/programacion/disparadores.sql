-- disparadores
-- conjunto de instrucciones de la base de datos que se realizan automaaticanmente en una insercion actualizacion y demas (cambio)
DROP DATABASE IF EXISTS disparadores;
CREATE DATABASE disparadores;
USE disparadores;

CREATE TABLE noticias(
id int AUTO_INCREMENT,
texto varchar(100),
titulo varchar(100),
longitud int,
fecha date,
dia int,
mes varchar(20),
PRIMARY KEY(ID)
);

INSERT INTO noticias (texto, titulo,fecha) VALUES 
  ('ejemplo de noticia larga', 'larga', '2022/12/1'),
  ('ejemplo de noticia corta', 'corta', '2022/1/12');


CREATE TABLE historico(
  id int AUTO_INCREMENT,
  dia int,
  numero int DEFAULT 0,
  PRIMARY KEY (id)
);
# DISPARADOR
# CALCULA LA LONGITUD DE CARACTERES DEL
# TEXTO DE UNA NOTICIA 
# CUANDO LA INSERTO 

DROP TRIGGER IF EXISTS noticiasBI;
CREATE TRIGGER noticiasBI
BEFORE INSERT
	ON noticias 
	FOR EACH ROW
BEGIN
  SET NEW.longitud = CHAR_LENGTH(NEW.texto);
END;

# DISPARADOR
# Realizar un disparador para que cuando 
# creemos una noticia nueva nos calcule el mes 
# y el día de la fecha y los introduzca 
# en los campos mes y día

DROP TRIGGER IF EXISTS  fechaAU;
CREATE TRIGGER fechaAU
BEFORE INSERT 
	ON noticias 
	FOR EACH ROW
BEGIN
 set LC_TIME_NAMES='es_es';
  SET NEW.dia = DAY(NEW.fecha);
  SET NEW.mes=MONTH(NEW.fecha);
END;
INSERT INTO noticias (texto, titulo, fecha) VALUES 
  ('esta noticia es mas nueva', 'mas nueva', '2022/1/12');

# VOY A ACTUALIZAR UNA DE LAS NOTICIAS
UPDATE noticias n
  SET n.texto="algo diferente"
  WHERE n.id=4;

# OTRO DISPARADOR
-- para actualizar los datos del dia y mes cuandolos introduzcas, longitud del texto y coloque en el campo longitud
-- como nombre noticias BU 
DROP TRIGGER IF EXISTS  noticiaBU;
CREATE TRIGGER noticiaBU
BEFORE UPDATE
	ON  noticias
	FOR EACH ROW
BEGIN
  SET NEW.longitud = CHAR_LENGTH(NEW.texto), NEW.dia= DAY(NEW.fecha), NEW.mes=MONTH(NEW.fecha); 
END;

# VOY A ACTUALIZAR UNA DE LAS NOTICIAS
UPDATE noticias n
  SET n.texto="algo diferente"
  WHERE n.id=1;
  SELECT * FROM noticias n;

# tabla de historico

-- consulta de seleccion
SELECT n.dia, COUNT(*) AS total 
  FROM noticias n 
    GROUP BY n.dia;


-- consulta de creacion

DROP TABLE IF EXISTS historico;
CREATE TABLE historico(
  id int AUTO_INCREMENT,
  dia int,
  numero int DEFAULT 0,
  PRIMARY KEY (id)
) AS 
    SELECT 
        n.dia,
        COUNT(*) numero 
      FROM 
        noticias n
      GROUP BY n.dia;

SELECT * FROM historico h;
SELECT * FROM noticias n;

# disparador de eliminacion
# Crear un DISPARADOR que me ACTUALICE la tabla HISTORICO 
# cada vez que ELIMINO una noticia de la tabla NOTICIAS

DROP TRIGGER IF EXISTS adnoticias;
CREATE TRIGGER adnoticias
AFTER DELETE
  ON noticias
  FOR EACH ROW
BEGIN
  UPDATE historico h
    SET h.numero=h.numero-1
    WHERE h.dia=OLD.dia;
END ;

# inserto registros nuevos en noticias
INSERT INTO noticias (texto, titulo, fecha)
  VALUES ('ejemplo noticias', 'ti1', '2022/5/8'),('ejemplo noticias 1', 'ti2', '2022/8/7');
  SELECT  * FROM noticias n;
  SELECT * FROM historico h;
  DELETE FROM noticias WHERE id=1;
# disparador
# cada vez que INSERTO una noticia en la tabla NOTICIAS
# Crear un DISPARADOR que me ACTUALICE la tabla HISTORICO 

DROP TRIGGER IF EXISTS borrarAD;
  CREATE TRIGGER borrarAD
  AFTER DELETE
  	ON noticias
	FOR EACH ROW
BEGIN 
UPDATE historico h SET h.numero=h.numero-1 WHERE h.dia=OLD.dia;
END;

  SELECT 
      COUNT(*) INTO contador -- si contador=1 el dia ya esta en historico
    FROM 
      historico h 
    WHERE 
      h.dia=NEW.dia;
-- noticias ai
DROP TRIGGER IF EXISTS noticiasAI;
CREATE TRIGGER noticiasAI
AFTER INSERT
	ON  noticias
	FOR EACH ROW
BEGIN
  DECLARE dia int DEFAULT 0 ;
  DECLARE contador int DEFAULT 0;
  SET dia= NEW.dia;
  -- cuantos registros del mismo dia que la noticia de la notica introducida tengo 
  -- si el resultado es 1, ese dia esta en historico
  -- si es 0, ese dia no esta en historico
  -- opcion 1
  SELECT COUNT(*) INTO contador FROM historico h WHERE h.dia=dia;
 -- opcion 2
 -- set contador=(SELECT COUNT(*) FROM historico h WHERE h.dia=dia); 
 -- si es un, sumar 1 al campo numero con ese dia
 -- si es 0 hay que añadir el registro 
 IF (contador=1 ) THEN 
   UPDATE historico h SET h.numero=h.numero + 1 WHERE h.dia = dia; 
 ELSE
   INSERT INTO historico ( dia, numero)
  VALUES ( dia, 1);
 END IF;
   
END;
  
SELECT * FROM noticias n;
SELECT * FROM  historico h;
INSERT INTO noticias (texto, titulo, fecha)
  VALUES ('ñangrejo', 'eoeoeo', '2023/5/3');
-- quiero que si actualizo la noticia me actualice la tabla historico 
DROP TRIGGER IF EXISTS noticiasAU ;
CREATE TRIGGER noticiasAU 
AFTER UPDATE
	ON  noticias
	FOR EACH ROW
BEGIN
-- comprobar si tengo que realizar algo
 IF (NEW.dia<>OLD.dia) THEN 
     UPDATE historico h 
      SET h.numero= h.numero-1 
        WHERE h.dia= OLD.dia;
     IF ((SELECT COUNT(*) FROM historico h WHERE h.dia=NEW.dia)=1) THEN  -- esto devuelve un booleano lo que puedes hacer es dejarlo y asi sera si cumple eso entra sino no 
      UPDATE historico h 
        SET h.numero= h.numero+1 
          WHERE h.dia= NEW.dia;
     ELSE 
     INSERT INTO historico ( dia, numero)
  VALUES (NEW.dia, 1);
     END IF;
 END IF;
END;
SELECT * FROM noticias n;
SELECT * FROM  historico h;
UPDATE noticias n set n.fecha = '2023/11/12' WHERE n.id=3;

