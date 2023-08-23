-- practica 16 consultas
USE comercios;
-- consulta 1 dni clientes
SELECT 
  c.dni 
    FROM  cliente c ;
-- consulta 2 datos de todos los prgramas
SELECT 
  * 
    FROM  programa p;
-- consulta 3 obten listado de nombres de todos los programas
SELECT 
  p.nombre 
    FROM programa p;
-- consulta 4 lista de ciudades con establecimientos donde se vendan programas, son que aparezcan valores duplicados
SELECT 
  DISTINCT c.ciudad 
    FROM comercio c 
      JOIN distribuye d 
        USING (cif);
-- consulta 5 lista con nombres programas, si duplicados
SELECT  
  DISTINCT p.nombre 
    FROM programa p;
-- consulta 6 fabricantes de eeuu
SELECT f.nombre 
  FROM fabricante f 
    WHERE f.pais='estados unidos';
-- consulta 7 fabricantes no españoles con IN
SELECT f.nombre 
  FROM fabricante f 
    WHERE f.pais 
      NOT IN('españa');
-- consulta 8 comercios que no sean el corte ingles con in 
SELECT c.nombre 
  FROM comercio c 
    WHERE c.nombre 
      NOT IN ('el corte ingles');
-- consulta 9 genera una lista de los codigos distintas versiones de windows y acces, utilizar in 
SELECT 
  DISTINCT p.version, p.codigo 
    FROM  programa p 
      WHERE p.nombre 
        IN ('access','windows');
-- consulta 10 listado  nombvres clientes entre 10 y 25 años,  y de mas de 50, con between y sin between
SELECT 
  c.nombre 
    FROM cliente c
      WHERE c.edad 
        BETWEEN 10 AND 25;
SELECT 
  c.nombre 
    FROM  cliente c 
      WHERE c.edad >50;
-- consulta 11 nombre clientes que terminan en o con y sin like
SELECT c.nombre 
  FROM cliente c 
    WHERE c.nombre LIKE '%o';
SELECT c.nombre 
  FROM  cliente c 
    WHERE c.nombre REGEXP 'o$';
-- 12 clientes terminan su nombre en o y mayores de 30
SELECT c.nombre 
  FROM cliente c 
    WHERE c.nombre 
      LIKE '%o' AND c.edad >30;
-- 13 listado aparezcan prigramas cuya version finalice letra i o nombre comience por una a o por una w
SELECT p.nombre
  FROM programa p 
    WHERE p.nombre 
      REGEXP'i$' 
        OR(p.nombre REGEXP '^a'OR p.nombre REGEXP '^w') ; -- usar el caracter ^ para el principio de una cadena ( de momento probado con regexp) 
SELECT p.nombre 
  FROM programa p 
    WHERE p.nombre
      LIKE '%i' 
        OR (p.nombre LIKE 'a%' OR p.nombre LIKE 'w%');
-- 14 listado de empresas por orden alfabetico descendente
SELECT f.nombre 
  FROM fabricante f 
    ORDER BY f.nombre DESC;
-- 15 comercios que distribuyen windows
SELECT d.cif, p.nombre 
  FROM distribuye d 
    JOIN programa p 
      WHERE p.nombre = 'windows';
-- 16 genera listado de programas y cantidades que han distribuido a el corte ingles madrid
SELECT c.nombre, c.ciudad, d.cantidad, p.nombre 
  FROM comercio c 
    JOIN distribuye d USING (cif) 
      JOIN programa p USING (codigo)  
        WHERE c.ciudad='madrid' AND c.nombre='el corte ingles';
-- 17 que usuarios han optado por internet como medio de registro
SELECT c.nombre, r.medio FROM registra r JOIN cliente c USING(dni) WHERE r.medio ='internet';