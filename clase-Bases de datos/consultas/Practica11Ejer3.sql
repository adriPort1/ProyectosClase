-- practica 11 ejer 3
USE ciclistas;
-- 1.1 edades banesto
SELECT c.edad FROM ciclista c WHERE c.nomequipo='Banesto';
-- 1.2 edades ciclistas banesto o navigare
SELECT c.edad FROM ciclista c WHERE c.nomequipo='Banesto' OR c.nomequipo='Navigare';
-- 1.3 dorsal ciclistas banesto y edad entre 25 y 32
SELECT c.dorsal FROM ciclista c WHERE c.nomequipo='Banesto' AND  c.edad BETWEEN 25 AND 32;
-- 1.4 dorsal banesto o 25 - 32
SELECT c.dorsal FROM  ciclista c WHERE c.nomequipo='Banesto' OR c.edad BETWEEN 25 AND 32;
-- 1.5 inicial equipo ciclistas empiecen por R
SELECT LEFT(c.nomequipo,1) FROM ciclista c WHERE c.nombre LIKE 'r%';
-- 1.6
-- piezas colores que 1 pieza supere  + 10kg (otro sql, tienen que salir 2)
