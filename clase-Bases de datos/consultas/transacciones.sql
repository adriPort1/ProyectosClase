-- transacciones 
 
USE ciclistas;
-- set @dato=4
-- variables en musql solo pueden tener datos escalares, no almacenan arrays, en otros sistemas se pueden
set @dato=4;
SELECT @dato;
-- las variables no pueden almacenar un valor, no guardan mas de uno si tienen mas campos
SET @edad=(SELECT MAX(c.edad) FROM ciclista c);
SELECT @edad;
-- las variables precedidas de 2 @ o que se pueden escribir sin ella son de servidor, se llaman globales
-- si las tocas cambian las instrucciones del servidor
SET @@autocommit=0;
SELECT @@autocommit;
SELECT * FROM ciclista c;
UPDATE ciclista c SET c.edad=c.edad+1;
-- si haces commit es como guardar, si el autocommit esta a 1, lo guarda automaticamente, si lo pones a 0, necesita commit para guardar
-- rollback deshace desde el ultimo commit, obvio si es auto con 1 nunca desahra porque se deshace automaticamente
ROLLBACK;
-- eso incluye insert into y todas las tareas que se puedan hacer, seria lo suyo para no cargarte el server
-- start para empezar una accion atomica
START TRANSACTION;
-- modificar edad
UPDATE ciclista c SET c.edad = c.edad +3;
-- insertar tabla
INSERT INTO ciclista (dorsal, nombre, edad, nomequipo)
  VALUES (333, 'AMSTRONG', 80, 'BANESTO');
  -- guardar la accion 
COMMIT;
-- deshacer, para no guardar, sin commit, es uno u otro
ROLLBACK;
CREATE OR REPLACE VIEW vistaSalario AS SELECT * FROM ciclista c WHERE c.edad >30;
ALTER TABLE ciclista ADD CHECK (dorsal>3);

