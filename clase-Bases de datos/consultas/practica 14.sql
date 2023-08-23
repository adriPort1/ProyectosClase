-- practica 14
USE ciclistas;
-- ejer 1 nombre y edad ciclistas no ganado etaps
SELECT 
  DISTINCT c.nombre, c.edad 
    FROM ciclista c 
      LEFT JOIN etapa e ON c.dorsal = e.dorsal 
        WHERE e.dorsal IS NULL; -- esta es la forma directa
-- metodo optimo
-- subconsulta c1
-- ciclistas que han ganado etapas
SELECT 
  DISTINCT e.dorsal 
    FROM etapa e;
    -- esta es la de sustraer, la que va a restar
SELECT c.nombre, c.edad 
  FROM ciclista c 
    LEFT JOIN (SELECT DISTINCT e.dorsal FROM etapa e) c1 
      USING (dorsal) WHERE c1.dorsal IS NULL;-- ahora acabar la consulta con un not in
-- si las subconsultas estan en el from, llevan nombre, si es en el wher no hace falta
SELECT c.nombre, c.edad FROM ciclista c WHERE dorsal NOT IN(SELECT 
  DISTINCT e.dorsal 
    FROM etapa e);
-- usar alias obligatorio ty escribir los parentesis en vacio primero
-- si hubiera resta seria select * from ciclista c except select distinct e.dorsal from etapa e;

-- ejer 2 nombre y edad  ciclistas no ganado puertos
SELECT 
  c.nombre, c.edad 
  FROM ciclista c 
    LEFT JOIN puerto p ON c.dorsal = p.dorsal 
      WHERE p.dorsal IS NULL;
 -- resta left join
SELECT c1.nombre, c1.edad 
  FROM ciclista c1 
    LEFT JOIN (SELECT DISTINCT * FROM puerto p)c1 
      USING (dorsal) 
        WHERE c1.dorsal IS NULL; -- esto es restando
-- not in
SELECT c1.nombre, c1.edad  
  FROM ciclista c1 
    WHERE dorsal 
      NOT IN (SELECT DISTINCT p.dorsal FROM puerto p); -- esta con not in  

-- ejercicio 3 directores que tengan ciclistas no hayan ganado ninguna et apa
SELECT DISTINCT e1.director 
  FROM equipo e1 
    JOIN ciclista c ON e1.nomequipo = c.nomequipo 
      LEFT JOIN etapa e ON c.dorsal = e.dorsal 
        WHERE e.dorsal IS NULL; -- la dejo porque estaba parecida a como la hice
-- subconsulta: ciclistas que han ganado etapas
SELECT e.dorsal FROM etapa e;
SELECT DISTINCT c.nomequipo 
  FROM ciclista c 
    LEFT JOIN (SELECT e.dorsal FROM etapa e)c1 USING (dorsal) WHERE c1.dorsal IS NULL;
SELECT 
  e.director
   FROM equipo e  JOIN(SELECT DISTINCT c.nomequipo 
  FROM ciclista c 
    LEFT JOIN (SELECT e.dorsal FROM etapa e)c1 USING (dorsal) WHERE c1.dorsal IS NULL) c2;

-- ejecririo 4 dorsal y nombre ciclistas no hayan llevado algun maillot
SELECT 
  c.dorsal, c.nombre 
    FROM ciclista c 
      LEFT JOIN lleva l ON c.dorsal = l.dorsal 
        WHERE l.dorsal IS NULL;
-- c1
SELECT DISTINCT l.dorsal FROM lleva l;
-- tabla a proyectar el c1
SELECT c.nombre, c.dorsal 
  FROM ciclista c 
    LEFT JOIN(SELECT DISTINCT l.dorsal FROM lleva l) AS l1 
      USING (dorsal) 
        WHERE l1.dorsal IS NULL; 
-- fin de la resta
-- ejercicio 4 con el not in
SELECT c.nombre, c.dorsal 
  FROM  ciclista c 
    WHERE c.dorsal 
      NOT IN (SELECT DISTINCT l.dorsal FROM lleva l);
-- ejercicio 5 dorsal y nombre ciclistas noo hayan llevado maillot amarillo
SELECT 
  c.dorsal, c.nombre 
    FROM  ciclista c 
      LEFT JOIN (SELECT DISTINCT l.dorsal FROM maillot m JOIN lleva l ON m.código = l.código WHERE m.color='amarillo') AS c1 
        ON c.dorsal= c1.dorsal WHERE c1.dorsal IS NULL;
-- sacar el codigo para simplificar
-- c1
SELECT 
  * 
    FROM maillot m 
      WHERE m.color='amarillo';
-- ciclistas que han llevado el maillot amarillo

SELECT 
  DISTINCT l.dorsal 
    FROM lleva l 
      WHERE l.código 
        IN (SELECT m.color FROM maillot m WHERE m.color='amarillo');
-- para terminar, restar los ciclistas menos los que han llevado el maillot amarillo
-- implementamos la resta con un left join 
SELECT 
  DISTINCT l.dorsal 
    FROM lleva l 
      JOIN (SELECT * FROM maillot m WHERE m.color='amarillo')c1 
        USING (código);
-- resultado consulta final
SELECT 
  c.dorsal, c.nombre 
    FROM ciclista c 
      LEFT JOIN(SELECT DISTINCT l.dorsal 
        FROM lleva l 
          JOIN (SELECT * FROM maillot m WHERE m.color='amarillo')c1 
             USING (código))c2 USING (dorsal) WHERE c2.dorsal IS NULL;
-- lo mismo pero con not in
SELECT c.dorsal, c.nombre FROM ciclista c WHERE c.dorsal NOT IN(SELECT 
  DISTINCT l.dorsal 
    FROM lleva l 
      JOIN (SELECT * FROM maillot m WHERE m.color='amarillo')c1 
        USING (código)); 
-- ejercicio 6 indicar el numetapa de las etapas que no tengan puertos
SELECT  
  DISTINCT e.numetapa 
    FROM  etapa e 
      LEFT JOIN puerto p ON e.numetapa = p.numetapa 
        WHERE p.numetapa IS NULL 
          ORDER BY e.numetapa ASC;
-- c1
-- etapas que tienen puerto
SELECT DISTINCT p.numetapa FROM puerto p; 
-- con la resta left join
SELECT 
  DISTINCT e.numetapa 
    FROM  etapa e 
      LEFT JOIN (SELECT DISTINCT p.numetapa FROM puerto p) AS c1 
        USING (numetapa) WHERE c1.numetapa IS NULL;
-- con el not in 
SELECT 
  DISTINCT e.numetapa 
    FROM etapa e 
      WHERE e.numetapa 
        NOT IN (SELECT DISTINCT p.numetapa FROM puerto p);
-- ejercicio 7 indicar distancia media de las etapas no tengan puertos
SELECT 
  AVG(e.kms) AS promedioEtapas
    FROM  etapa e 
      LEFT JOIN puerto p ON e.numetapa = p.numetapa 
        WHERE p.numetapa IS NULL;
-- c1
-- sacar las etapas con puerto 
SELECT 
  DISTINCT  p.numetapa 
    FROM puerto p;
-- restar con el left join 
SELECT AVG(e1.kms) FROM etapa e1 
  LEFT JOIN (SELECT 
      DISTINCT  p.numetapa 
        FROM puerto p) AS c1 
         USING (numetapa) 
          WHERE c1.numetapa IS NULL;
-- con el not in 
SELECT AVG(e1.kms) 
  FROM etapa e1 
    WHERE e1.numetapa 
      NOT IN(SELECT 
        DISTINCT  p.numetapa 
          FROM puerto p);
-- ejercicio 8 listar el numero de ciclistas que no hayan ganado alguna etapa
SELECT 
  COUNT(c.dorsal) 
    FROM  ciclista c 
      LEFT JOIN etapa e ON c.dorsal = e.dorsal 
        WHERE e.numetapa IS NULL;
-- optimizar, c1
SELECT 
  COUNT(DISTINCT e1.dorsal) 
    FROM etapa e1;
-- c2 contar ciclistas
SELECT 
  COUNT(DISTINCT c.dorsal) 
    FROM ciclista c;
-- c2 - c1, resta escalar, porque son numeros
SELECT 
  (SELECT 
    COUNT(DISTINCT c.dorsal) 
      FROM ciclista c)-(SELECT 
        COUNT(DISTINCT e1.dorsal) 
          FROM etapa e1);
-- ejercicio 9 listar dorsal de ciclistas que hayan ganado alguna etapa que no tenga puerto
SELECT 
  DISTINCT c.dorsal 
    FROM (ciclista c JOIN  etapa e ON c.dorsal = e.dorsal)
      LEFT JOIN puerto p ON e.numetapa = p.numetapa 
        WHERE p.numetapa IS NULL;
-- c1
SELECT 
  DISTINCT p.numetapa 
    FROM puerto p;
-- resta quitando etapas que tienen puerto con el not in
SELECT 
  DISTINCT e.dorsal 
    FROM etapa e 
      WHERE e.numetapa 
        NOT IN (SELECT DISTINCT p.numetapa FROM puerto p)
 -- consulta con la resta left join
SELECT 
  DISTINCT e.dorsal 
    FROM etapa e 
      LEFT JOIN (SELECT DISTINCT p.numetapa FROM puerto p) c1 
        USING (numetapa) 
          WHERE c1.numetapa IS NULL;
-- 10 listar dorsal de los ciclistas que hayan ganado unicamente etapas que no tengan puertos
-- c1
SELECT 
  DISTINCT e.dorsal 
    FROM etapa e 
      JOIN puerto p ON e.numetapa = p.numetapa 
        WHERE p.nompuerto IS NOT NULL; 
-- con el left join
SELECT 
  DISTINCT e.dorsal 
    FROM etapa e
      LEFT JOIN (SELECT DISTINCT e.dorsal FROM etapa e JOIN puerto p ON e.numetapa = p.numetapa WHERE p.nompuerto IS NOT NULL)c1 
        USING (dorsal) 
          WHERE c1.dorsal IS NULL;
-- con el not null
SELECT 
  DISTINCT e.dorsal 
    FROM  etapa e
      WHERE e.dorsal NOT IN(SELECT DISTINCT e.dorsal FROM etapa e JOIN puerto p ON e.numetapa = p.numetapa WHERE p.nompuerto IS NOT NULL);