-- practica 10 ejercicio 2 de consultas
USE ciclistas;
-- 1.1 ciclistas que hay 
SELECT 
  COUNT(c.nombre) 
    FROM ciclista c;
-- 1.2 n1 ciclistas equipo banesto
SELECT 
  COUNT(c.nombre) 
    FROM ciclista c 
      WHERE c.nomequipo ='Banesto';
-- 1.3 edad media ciclistas 
SELECT 
  AVG(c.edad) 
    FROM ciclista c; 
-- 1.4 edad media banesto 
SELECT 
  AVG(c.edad) 
    FROM ciclista c 
      WHERE c.nomequipo ='Banesto';
-- 1.5 edad medias por equipo 
SELECT 
  c.nomequipo, AVG(c.edad) 
    FROM ciclista c 
      GROUP BY c.nomequipo;
-- 1.6 nº ciclistas por equipo 
SELECT 
 COUNT(c.nombre), c.nomequipo 
  FROM ciclista c 
    GROUP BY c.nomequipo;
-- 1.7 nº puertos
SELECT 
  COUNT(p.nompuerto) 
    FROM puerto p;
-- 1.8 nº puertos mayores de 1500 
SELECT 
  COUNT(p.nompuerto) 
    FROM puerto p 
      WHERE p.altura > 1500;
-- 1.9 lista equipos tengan + 4 ciclistas
SELECT 
  COUNT(c.nombre) AS Listaequipo, c.nomequipo 
    FROM ciclista c  
      GROUP BY c.nomequipo 
        HAVING Listaequipo > 4;
-- 1.10 listar nombres equipos con + 4 ciclistas y edad entre 28 y 32
SELECT 
  COUNT(c.nomequipo) AS Listaequipo2, c.nomequipo, c.edad 
    FROM ciclista c 
      GROUP BY c.nomequipo 
        HAVING Listaequipo2 > 4 AND c.edad BETWEEN 28 AND 32;
-- 1.11 indicar nº etapas ganada cada uno de los ciclistas 
SELECT 
 e.dorsal,COUNT(*)
    FROM etapa e 
      GROUP BY e.dorsal;
-- 1.12 indicar dorsal ganado + de una etapa
SELECT 
  e.dorsal 
    FROM etapa e 
      GROUP BY e.dorsal 
        HAVING COUNT(e.dorsal)> 1;