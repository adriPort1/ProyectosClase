USE compañias;
-- practica 1 vistas y demas 
-- ejercicio 1 crear claves ajenas con el nombre colocado en el diagrama de relaciones 
-- clave ajena trabaja con compañia
ALTER TABLE trabaja 
  ADD CONSTRAINT fk_trabaka_compañia 
    FOREIGN KEY (compañia) 
      REFERENCES compañia(nombre) 
        ON DELETE NO ACTION ON UPDATE NO ACTION;
-- clave ajena trabaja persona
ALTER TABLE trabaja 
  ADD CONSTRAINT fk_trabaja_persona 
    FOREIGN KEY (persona) 
      REFERENCES persona(nombre)  
        ON DELETE NO ACTION ON UPDATE NO ACTION;
-- clave ajena compañia ciudad
ALTER TABLE compañia 
  ADD CONSTRAINT fk_compañia_ciudad 
    FOREIGN KEY (ciudad ) 
      REFERENCES ciudad (nombre) 
        ON DELETE NO ACTION ON UPDATE NO ACTION;
-- calve ajena persna ciudad
ALTER TABLE persona 
  ADD CONSTRAINT fk_persona_ciudad 
    FOREIGN KEY (ciudad) 
      REFERENCES ciudad(nombre) 
        ON DELETE NO ACTION ON UPDATE NO ACTION;
-- clave ajena tabla supervisa, persona persona
ALTER TABLE supervisa 
  ADD CONSTRAINT fk_supervisa_persona 
    FOREIGN KEY (supervisor) 
      REFERENCES persona(nombre) 
        ON DELETE NO ACTION ON UPDATE NO ACTION;
-- clave ajena supervisa persona 2
ALTER TABLE supervisa 
  ADD CONSTRAINT fk_supervisa_persona_nombre2 
    FOREIGN KEY (persona) 
      REFERENCES persona (nombre) 
        ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ejercicio 2
CREATE OR REPLACE VIEW ejercicio2 AS
SELECT COUNT(*) FROM  ciudad c;

SELECT * FROM ejercicio2;
-- ejercicio3
CREATE OR REPLACE VIEW ejercicio3 AS 
SELECT * FROM ciudad c WHERE c.población >=( SELECT AVG(c.población) FROM ciudad c);

SELECT * FROM ejercicio3 e;
-- ejercicio 4
CREATE OR REPLACE VIEW ejercicio4 AS 
SELECT * FROM ciudad c WHERE c.población <=( SELECT AVG(c.población) FROM ciudad c);

SELECT * FROM ejercicio4 e;
-- ejercicio 5 
CREATE OR REPLACE VIEW ejercicio5 AS
SELECT MAX(c.población), c.nombre FROM ciudad c;

SELECT * FROM ejercicio5 e;
-- ejercicio 6
