-- consultas practica 9 
USE ciclistas;
-- 1.1 edades sin repetidos 
SELECT
 DISTINCT c.edad 
  FROM ciclista c ORDER BY c.edad ASC ;
-- 1.2 listar edades coclistas de artiach
SELECT 
  c.edad 
   FROM ciclista c 
     WHERE c.nomequipo='Artiach';
-- 1.3 edades de ciclistas de artiach p de amore vita
SELECT 
  c.edad 
    FROM ciclista c 
      WHERE c.nomequipo='Artiach' OR c.nomequipo='Amore Vita';
-- 1.4 dorsales de ciclistas edad menor de 25 o mayor 30
SELECT 
  c.dorsal 
  FROM ciclista c 
     WHERE c.edad > 25 AND c.edad < 30;
-- 1.5 dorsales ciclistas edad entre 28 y 32 y de banesto
SELECT 
  c.dorsal  
    FROM ciclista c 
      WHERE c.edad BETWEEN 28 AND 32 AND c.nomequipo='Banesto';
-- 1.6 indicar nombre ciclistas nº de caracteres > 8
SELECT 
  c.nombre 
    FROM ciclista c 
      WHERE LENGTH(c.nombre)>8;
-- 1.7 listar nombre ciclistas y dorsal en campo nuevo nombre mayusculas y mostrarlo en mayusculas 
SELECT 
  c.dorsal, UPPER(c.nombre) AS nombreMayusculas 
     FROM  ciclista c; 
-- 1.8 listar ciclistas malliot mge (amarillo) 
SELECT 
  * 
    FROM maillot m 
      WHERE m.color = 'amarillo';
-- 1.9 listar nombre puertos altura mayor a 1500
SELECT 
  p.nompuerto 
    FROM puerto p 
      WHERE p.altura > 1500;
-- 1.10 listar dorsal ciclistas ganado algun puerto cuya pendiente > 8 o altura entre 1800 y 3000
SELECT 
  p.dorsal 
    FROM puerto p 
      WHERE p.pendiente > 8 OR p.altura BETWEEN 1800 AND 3000;
-- 1.11 dorsal ciclistas ganado puerto pendiente > 8 y 1800 y 3000
SELECT 
  p.dorsal 
    FROM puerto p 
      WHERE p.pendiente > 8 AND p.altura BETWEEN 1800 AND 3000;