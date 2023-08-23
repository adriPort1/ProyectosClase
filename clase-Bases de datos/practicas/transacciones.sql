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

-- las vistas
-- forma de poder guardar consultas seleccion en el servidor
-- de lospocos objetos que admiten create
-- no se actualizan, asi que si se crea un campo nuevo y no lo mostrará
-- nombre y edad de cilcistas que han ganado + de 1 etapa
SELECT e.dorsal, COUNT(*) numero FROM etapa e GROUP BY e.dorsal HAVING numero>1;
SELECT c.nombre, c.edad FROM  ciclista c WHERE c.dorsal IN(SELECT e.dorsal FROM etapa e GROUP BY e.dorsal HAVING COUNT(*)>1);
-- crear vista con el dorsal y las etapas y el numero de etapas que ha ganado
CREATE OR REPLACE VIEW ganadores AS SELECT e.dorsal, COUNT(*) numero FROM etapa e GROUP BY e.dorsal HAVING numero>1;
SELECT * FROM ganadores g;
 -- crear otra vista para listar el nombre y edad
 CREATE OR REPLACE VIEW consulta1 AS SELECT c.nombre, c.edad FROM  ciclista c JOIN ganadores g USING (dorsal);
 SELECT * FROM consulta1 c;

CREATE OR REPLACE VIEW consulta1A AS SELECT c.dorsal FROM ciclista c WHERE c.dorsal IN (SELECT g.dorsal FROM ganadores g);
SELECT * FROM consulta1A a;

-- indicar ciclistas que hayan ganado mas de 1 etapa y mas de un puerto
SELECT e.dorsal FROM etapa e WHERE e.numetapa HAVING COUNT(*)>1;

CREATE OR REPLACE VIEW ganadorEtapa AS SELECT e.dorsal FROM etapa e WHERE e.dorsal HAVING COUNT(*)>1;

SELECT p.dorsal FROM puerto p WHERE p.dorsal HAVING COUNT(*)>1; 

CREATE OR REPLACE VIEW ganadorPuerto AS SELECT p.dorsal FROM puerto p WHERE p.dorsal HAVING COUNT(*)>1;

SELECT * FROM ciclista c WHERE c.dorsal IN ( SELECT p.dorsal FROM ganadorEtapa e JOIN ganadorPuerto p USING(dorsal)); 
-- crear regla validacion o check
-- edad ciclista mayor que 18
ALTER TABLE ciclista ADD CHECK (edad>=18);
INSERT INTO ciclista (dorsal, nombre, edad, nomequipo)
  VALUES (1003, 'juan', 16, 'BANESTO'),
  (1002,'roberto',14,'vaaa');
  COMMIT;
-- aqui no salio como debia porque estoy en la 5.7 porque lo pedia el ejer, en la 8 no funcionaria (que es lo que deberia pasar)
-- si creo una lista y le añado with local check options, le obligo a que pase el check y casca, que es lo que tendria que pasar
-- esto es para las versiones anteriores a la 8.0
-- probar creando vista que permita restringir los datos a introducir en la tabla
CREATE OR REPLACE VIEW ciclistasJovenes AS SELECT * FROM ciclista c WHERE c.edad>=18 WITH LOCAL CHECK OPTION;
SELECT * FROM ciclistasJovenes j;
INSERT INTO ciclistasJovenes (dorsal, nombre, edad, nomequipo)
  VALUES (1005, 'joven', 15, 'banesto');
  -- aserciones