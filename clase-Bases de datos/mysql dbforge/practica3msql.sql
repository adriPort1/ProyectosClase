-- practica myql3
DROP DATABASE IF EXISTS practica3msql;
CREATE DATABASE IF NOT EXISTS practica3msql;
USE practica3msql;
-- tabla poblacion
CREATE TABLE poblacion(
codpob int,
nombre  varchar(15),
PRIMARY KEY (codpob)
);
-- fin tabla
-- tabla clientes
CREATE TABLE clientes (
codigo int AUTO_INCREMENT,
nombre varchar(15),
PRIMARY KEY (codigo)
);
-- fin tabla clientes
-- tabla coches
CREATE TABLE coches(
matricula int,
PRIMARY KEY (matricula)
);
-- fin tabla coches
-- creacion tabla relacion
CREATE TABLE relacion(
codcliente int,
codpob int,
matricula int,
PRIMARY KEY (codcliente, codpob, matricula)
);
-- fin tabla relacion 
-- crear claves ajenas 
ALTER TABLE relacion 
 ADD CONSTRAINT fkcliente FOREIGN KEY (codcliente) REFERENCES clientes(codigo),
 ADD CONSTRAINT fkpob FOREIGN KEY (codpob) REFERENCES poblacion(codpob),
 ADD CONSTRAINT fkcoches FOREIGN KEY (matricula) REFERENCES coches(matricula);
-- fin claves ajenas 
-- insrto registros para probar si está bien puesto   
-- registro nombre
INSERT INTO clientes (nombre) VALUES
 ('Javi'),
 ('jose'),
 ('juan');
-- registro coche
INSERT INTO coches (matricula) VALUES
 (1234),
 (5697),
 (9874);
 -- registro poblacion
 INSERT INTO poblacion (codpob, nombre) VALUES
  (21, 'tarragona'),
  (98,'asturias'),
  (74, 'valencia');
-- registro relacion
INSERT INTO relacion (codcliente, codpob, matricula) VALUES
 (2, 21, 1234),
 (1,98,9874),
 (3,74,5697);