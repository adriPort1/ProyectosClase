-- practica 15
USE ciclistas;
-- consulta 1 nombre y edad de ciclistas que hayan ganado etapas y puertos
-- modelo de comparacion, respuesta 
-- c1 ciclistas ganados etapas
SELECT 
  DISTINCT e.dorsal 
    FROM etapa e;
-- c2 ciclistas puertos
SELECT 
  DISTINCT p.dorsal 
    FROM  puerto p;
-- c3, que hayan ganado uno y otra
SELECT 
  * 
    FROM (SELECT DISTINCT e.dorsal FROM etapa e) c1 
      NATURAL JOIN (SELECT DISTINCT p.dorsal FROM  puerto p)c2; -- este es con natural join
SELECT 
  DISTINCT e.dorsal 
    FROM etapa e 
      WHERE e.dorsal 
        IN (SELECT 
           DISTINCT p.dorsal 
              FROM  puerto p); -- con in
-- consulta final 
SELECT c.nombre, c.edad FROM (SELECT * FROM (SELECT 
  DISTINCT e.dorsal 
    FROM etapa e) c1 NATURAL JOIN(SELECT 
  DISTINCT p.dorsal 
    FROM  puerto p) c2) c3 JOIN ciclista c USING (dorsal);
-- consulta 2 nombre y edad de los ciclistas que no hayan ganado etapas, usar resta, left join y not in
SELECT 
  DISTINCT e.dorsal 
    FROM  etapa e;
SELECT 
  DISTINCT c.nombre, c.edad 
    FROM ciclista c 
      LEFT JOIN (SELECT DISTINCT e.dorsal FROM  etapa e) AS c1 
        USING (dorsal) 
          WHERE c1.dorsal IS NULL; -- con el left join
SELECT 
  DISTINCT c.nombre, c.edad 
    FROM ciclista c 
      WHERE c.dorsal 
        NOT IN(SELECT DISTINCT e.dorsal FROM  etapa e); -- con el not in
-- consulta 3 listar director equipos que tengan ciclistas que hayan ganado alguna etapa,
-- (1) sacar ciclistas que han ganado etapas,
-- (2) combinar resultado con tabla ciclistas y sacar equipos que tengan ciclistas que han ganado etapas
-- (3) combinar resultado con tabla que sea necesaria para sacar directores que tengan ciclistas que han ganado etapas (con join y con in)
-- c1
SELECT 
  * 
    FROM etapa e;
-- c2
SELECT 
  DISTINCT c.nomequipo 
    FROM  ciclista c 
      JOIN etapa e ON c.dorsal = e.dorsal;
-- final con join
SELECT 
  DISTINCT e.director 
    FROM equipo e 
      JOIN (SELECT DISTINCT c.nomequipo FROM  ciclista c JOIN etapa e ON c.dorsal = e.dorsal) c3 
        USING (nomequipo);
-- con in 
SELECT 
  DISTINCT e.director 
    FROM equipo e 
      WHERE e.nomequipo 
        IN (SELECT DISTINCT c.nomequipo FROM  ciclista c JOIN etapa e ON c.dorsal = e.dorsal);
-- 4 dorsal y nombre ciclistas con algun maillot
-- (1) primero ciclistas con algun maillot
-- (2) combinar con tabla ciclistas
SELECT 
  DISTINCT l.dorsal 
    FROM lleva l;
SELECT 
  DISTINCT c.dorsal, c.nombre 
    FROM ciclista c 
      JOIN lleva l ON c.dorsal = l.dorsal; -- con join 
SELECT 
  DISTINCT c.nombre, c.edad 
    FROM ciclista c 
      WHERE c.dorsal 
        IN (SELECT l.dorsal FROM lleva l); -- con in
-- 5 nombre y edad ciclistas  que NO han ganado puertos
-- (1) utilizando resta conjuntos con left join
-- (2) utilizando resta conjuntos not in 
SELECT 
  p.dorsal 
    FROM puerto p;
SELECT 
  c.nombre, c.edad 
    FROM ciclista c 
      LEFT JOIN ( SELECT * FROM puerto p ) c1 
        USING (dorsal) 
          WHERE c1.dorsal IS NULL;
SELECT 
  c.nombre, c.edad 
    FROM ciclista c 
      WHERE c.dorsal 
        NOT IN(SELECT p.dorsal FROM puerto p);
-- 6 listar director de equipos que  no hayan ganado etapas
-- (1) dorsal ciclistas que han ganado etapas
-- (2) equipos que tienen ciclistas que han ganado etapas
-- (3) restar  equipos menos etapas
SELECT 
  DISTINCT c.dorsal, c.nomequipo 
    FROM ciclista c 
      JOIN etapa e ON c.dorsal = e.dorsal;
SELECT 
  DISTINCT e.director 
    FROM equipo e 
      LEFT JOIN(SELECT DISTINCT c.dorsal, c.nomequipo FROM ciclista c JOIN etapa e ON c.dorsal = e.dorsal) c1 
        USING (nomequipo);
-- 7 dorsal y nombre de los de ciclistas no hayan llevado ningun maillot utilizsar resta
SELECT 
  DISTINCT l.dorsal 
    FROM ciclista c 
      JOIN lleva l ON c.dorsal = l.dorsal;
SELECT 
  DISTINCT c.dorsal, c.nombre
    FROM ciclista c 
      LEFT JOIN (SELECT DISTINCT l.dorsal FROM ciclista c JOIN lleva l ON c.dorsal = l.dorsal) c1 
        USING (dorsal);
SELECT 
  DISTINCT c.dorsal, c.nombre 
    FROM ciclista c 
      WHERE c.dorsal 
        NOT IN(SELECT 
          DISTINCT l.dorsal 
            FROM ciclista c 
              JOIN lleva l ON c.dorsal = l.dorsal);
-- 8 dorsal y nombre de ciclistas no hayan llevado maillot amarillo nunca, utilizar resta 
SELECT 
  DISTINCT l.dorsal 
    FROM lleva l 
      JOIN maillot m ON l.código = m.código 
        WHERE m.color='amarillo';
SELECT 
  DISTINCT c.nombre, c.dorsal 
    FROM ciclista c 
      LEFT JOIN(SELECT 
        DISTINCT l.dorsal 
          FROM lleva l 
            JOIN maillot m ON l.código = m.código 
              WHERE m.color='amarillo') c1 USING(dorsal) WHERE c1.dorsal IS NULL;
SELECT 
  DISTINCT c.dorsal, c.nombre 
    FROM ciclista c 
      WHERE c.dorsal NOT IN(SELECT 
        DISTINCT l.dorsal 
          FROM lleva l 
            JOIN maillot m ON l.código = m.código 
              WHERE m.color='amarillo');
-- 9 listar dorsal y nombre ciclistas que hayan ganado alguna etapa que no tenga  puerto
SELECT 
  DISTINCT p.numetapa 
    FROM puerto p;
-- con el left join
SELECT 
  DISTINCT e.dorsal, c.nombre 
    FROM (ciclista c JOIN etapa e ON c.dorsal = e.dorsal) 
      LEFT JOIN(SELECT DISTINCT p.numetapa FROM puerto p) c1 
        USING (numetapa) WHERE c1.numetapa IS NULL;
-- con el not in 
SELECT 
  DISTINCT e.dorsal, c.nombre 
    FROM ciclista c 
      JOIN etapa e ON c.dorsal = e.dorsal 
        WHERE e.numetapa NOT IN( SELECT 
          DISTINCT p.numetapa 
            FROM puerto p);
-- 10 listar dorsal ciclistas ganado unicamente etapas que no tengan puertos
-- 1 listar etapas con puertos
-- 2 listar dorsales de ciclistas ganado etapas con pouertos
-- 3 dorsales de ciclistas que han ganado etapas sin puertos
-- 4 restar consultas 3-2
-- 1
SELECT 
  DISTINCT p.numetapa 
    FROM puerto p;
-- 2
SELECT 
  DISTINCT e.dorsal 
    FROM etapa e 
      JOIN(SELECT 
       DISTINCT p.numetapa 
        FROM puerto p) c1 USING (numetapa);
-- 3 
SELECT 
  DISTINCT e.dorsal 
    FROM etapa e 
      LEFT JOIN(SELECT 
        DISTINCT p.numetapa 
          FROM puerto p) D1 
            USING (numetapa) 
              WHERE D1.numetapa 
                IS NULL;
-- 4 
SELECT 
  * 
    FROM 
(SELECT 
  DISTINCT e.dorsal 
    FROM etapa e 
      LEFT JOIN(SELECT 
        DISTINCT p.numetapa 
          FROM puerto p) D1 
            USING (numetapa) 
              WHERE D1.numetapa 
                IS NULL) c2 
LEFT JOIN 
(SELECT 
  DISTINCT e.dorsal 
   FROM etapa e 
    JOIN(SELECT 
     DISTINCT p.numetapa 
      FROM puerto p) c1 USING (numetapa)) d3 USING(dorsal) WHERE d3.dorsal IS NULL;