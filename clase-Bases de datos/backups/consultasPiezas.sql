  -- teoria de manipulacion
USE piezas;
  -- renombrar tablas sin tocar registros
RENAME TABLE j TO proyectos;
RENAME TABLE s TO proveedores;
RENAME TABLE p TO piezas;
  -- instruccion select (empezar con campos from tabla)
SELECT 
  p.noms,p.ciudad -- campos (con * los saca todos)
    FROM proveedores AS p;-- tablas con nombre de la consulta 'p'
  -- ciudad de los proveedores
 SELECT 
   DISTINCT c.ciudad -- con distinct haces que no haya repetidos
    FROM proveedores AS c; -- el AS es opcional 
  -- color y peso de las piezas
SELECT 
  co.color, co.peso 
    FROM piezas AS co;
 -- para ordenar resultados con order by + campo y escoger ascendente (asc) o descendente (desc) con la coma puedes poner varios 
 -- select campo1, campo2 .... from tabla order by campo ASC|DESC
SELECT 
  *  
    FROM proyectos AS total 
      ORDER BY piezasTotales ASC; -- si no pones nada es orden ascendente 
-- ordenadas por nombre
SELECT 
  * 
    FROM piezas AS totnom 
      ORDER BY nomp ASC;
  -- vamos a realizar una serie de filtrado
  -- where
  -- where pregunta
  -- nombres de proveedores que viven en londres 
 SELECT -- a esto en matematicas en proyeccion
  pc.noms  
    FROM proveedores pc 
      WHERE -- y esto es seleccion
        pc.ciudad='Londres'; 
  -- para varias consultas and, or o  not, aunque hay muchos mas
  -- not (es monarieo, necesita solo un campo, complementar, este lo pones delante de lo que hayas puesto hace lo contrario)
  -- and (binario, solo devuelve verdadero si todas las condiciones se cumplen) se le llama producto
  -- or (binario también, devuelve cuando se cumple una de las condiciones, o cuando todas son falsas) se le llama suma
  -- where pregunta1 y/o pregunta2...
  -- son operadores con registro (van registro a registro, para hacerlo en mas cosas se usaran los operadores de conjuntos)
  
  -- listas los proveedores de londres y paris
  SELECT 
    cu.noms 
      FROM proveedores cu 
        WHERE 
          cu.ciudad ='Londres' OR cu.ciudad='Paris';
-- todas las piezas gris y rojo
SELECT 
  col.nomp, col.color 
    FROM piezas AS  col 
      WHERE 
        col.color='gris' OR col.color='rojo';
-- gris o rojas y londres
SELECT 
cipi.nomp, cipi.color, cipi.ciudad
FROM piezas AS  cipi
 WHERE 
 (cipi.color='gris' OR cipi.color='rojo') AND cipi.ciudad='Londres'; -- con estos 
 -- operadores logicos avanzados in y betwen
 -- where campo in (valor1,valor2,valor3,...) suele valer solo para el igual, suele usarse con o (que sea igual a esto o lo otro)
 -- where campor betwen(valormin and valormax)

-- WHERE cipi.color='gris' OR cipi.color='rojo'
-- where cipi.color in('rojo','gris')
-- where edad >18 and edad <30
-- where edad betwen18 and 30 (es cerrado en ambos lados, osea los incluye)

-- realizamos la consulta anterior con in
SELECT 
cipi2.nomp, cipi2.color, cipi2.ciudad
FROM piezas AS  cipi2
 WHERE 
 cipi2.color IN('rojo','gris') AND cipi2.ciudad='Londres';
 -- proveedores entre 20 y 50
 SELECT 
   * 
    FROM proveedores AS esta
      WHERE
        esta.estado >= 20 AND esta.estado<=50;
 SELECT 
  * 
   FROM  proveedores AS  esta2
      WHERE 
        esta2.estado BETWEEN 20 AND 50;
-- comodines 
-- sustituir en una comparacion 0 o n caracteres 
-- para comprarar
-- operadores basicos: =, <, >, <=, >=, <>
-- hay uno de comparacion avanzado (LIKE) compara a través de un patrón, no puedes mezclar nada con este operador, solo después
-- where campo LIKE 'expresión con comodines'
-- comodines: _ (sustituye un caractere), % (sustituye 0 o n caracteres)

-- piezas que empiecen por a
SELECT 
  * 
    FROM piezas po 
      WHERE po.nomp LIKE 'a%';
SELECT 
  * 
    FROM  piezas po2 
      WHERE po2.nomp LIKE 'A%' OR po2.nomp LIKE'M%';
-- de las piezas, entre a y m
SELECT 
  * 
    FROM  piezas po3 
      WHERE po3.nomp >= 'a' AND po3.nomp <= 'm' OR po3.nomp LIKE 'm%' ORDER BY po3.nomp ASC;

-- funciones son herramientas para realizar calculos en las expresiones
-- select camp, expresion from tabla where expresiones order by campo (ejemplo, puedes crear campos nuevos)
-- en la expresiones puedo realizar calculos con operadores y funciones 

-- consulta de campo calculado
-- select expresion from tabla
-- listar el primer caracter de los nombres de las piezas y el nombre 
 SELECT 
  LEFT(np.nomp,1) np, nomp -- saca el caracter desde la izquierda que le pidas
    FROM  piezas np;
-- utilizar expresion en el where
-- listar piezas con nombre empiece por a sin like
SELECT 
  * 
    FROM piezas ip 
      WHERE 
        LEFT(nomp,1)='a';
-- listar piezas cuyp nombre comience por a o por m
SELECT 
  * 
    FROM piezas ip2 
      WHERE LEFT(ip2.nomp,1) IN ('a','m');
-- subconsultas o consultas anidadas es lo que daremos otro dia (hoy es 11/05/2023)
-- puedes cambiar el nombre de un campo para consultarlo en la nueva tabla 