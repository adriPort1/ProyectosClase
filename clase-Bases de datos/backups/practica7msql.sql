-- database practica 7 DROP DATABASE IF EXISTS practica7msql;
DROP DATABASE IF EXISTS practica7msql;
CREATE DATABASE IF NOT EXISTS practica7msql;
USE practica7msql;
-- crear base de datos 
-- tabla alumno
CREATE TABLE alumno (
matricula int,
nombre varchar(10),
grupo varchar(1),
PRIMARY KEY (matricula)
) COMMENT "Probando";
-- tabla practica 
CREATE TABLE practica (
tipoPractica varchar(10),
titulo varchar(20),
dificultad varchar(20),
PRIMARY KEY (tipoPractica)
);
-- tabla realiza 
CREATE TABLE realiza (
matriculaAl int,
tipPractica varchar(10),
PRIMARY KEY (matriculaAl, tipPractica)
);
-- tabla fecha de la practica
CREATE TABLE fechaP(
matriculAl int,
tipoPractica varchar(10),
nota float,
fechaP date,
PRIMARY KEY (matriculAl, tipoPractica)
);
-- añadir clñaves ajenas y unicas 
-- añadir claves ajenas de arealiza
ALTER TABLE realiza
ADD CONSTRAINT fkAl FOREIGN KEY (matriculaAl) REFERENCES alumno(matricula),
ADD CONSTRAINT fkPractica FOREIGN KEY (tipPractica) REFERENCES practica(tipoPractica);
-- añadir claves ajenas de fecha 
ALTER TABLE fechaP
ADD CONSTRAINT fkRealiza FOREIGN KEY (matriculAl, tipoPractica) REFERENCES realiza(matriculaAl, tipPractica);

SELECT * FROM alumno a;