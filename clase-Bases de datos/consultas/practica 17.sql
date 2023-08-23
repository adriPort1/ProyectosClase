USE tienda;
-- 1 LISTA CON NOMBRE DEL PRODUCTO, PRECIO Y NOMBRE DEL FABRICANTE
SELECT f.nombre, p.nombre, p.precio 
  FROM  fabricante f 
    JOIN producto p ON f.codigo = p.codigo_fabricante;
-- 2 lista con nombre del producto, precio, y nombre fabricante de los productos de la base de datos. ordenar por fabricante alfabetico
SELECT f.nombre, p.nombre, p.precio 
  FROM producto p 
    JOIN fabricante f ON p.codigo_fabricante = f.codigo 
      ORDER BY f.nombre ASC;
-- 3 lista con identificador del producto, nombre,  identificador del fabricante y nombre del fabricante, de todos los productos de la base de datos
SELECT f.codigo, f.nombre, p.codigo_fabricante, p.nombre
   FROM producto p 
    JOIN fabricante f ON p.codigo_fabricante = f.codigo;
-- 4 nombre producto, precio y nombre fabricante prodicto mas barato
SELECT p.nombre, MIN(p.precio), f.nombre 
  FROM producto p 
    JOIN fabricante f ON p.codigo_fabricante = f.codigo;
-- opcion 2 que sale el nombre bien
SELECT p.nombre, p.precio, f.nombre 
  FROM producto p 
    JOIN fabricante f ON p.codigo_fabricante = f.codigo  
      ORDER BY p.precio ASC 
        LIMIT 1;
-- opcion 3, mas optima
-- c1
SELECT MIN(p.precio) 
  FROM producto p;
-- c2
SELECT * 
  FROM producto p 
    WHERE p.precio =(SELECT MIN(p.precio) FROM producto p);
-- final
SELECT c2.nombre, c2.precio, f.nombre 
  FROM fabricante f 
    JOIN (SELECT * FROM producto p WHERE p.precio =(SELECT MIN(p.precio) FROM producto p)) c2 ON c2.codigo_fabricante=f.codigo;
-- 5 nombre del producto, precio, nombre fabricante, mas caro
SELECT p.nombre, MAX(p.precio), f.nombre 
  FROM producto p 
    JOIN fabricante f ON p.codigo_fabricante = f.codigo; 
-- opcion 2 que sale el nombre bien
SELECT p.nombre, p.precio, f.nombre 
  FROM producto p 
    JOIN fabricante f ON p.codigo_fabricante = f.codigo 
      ORDER BY p.precio DESC LIMIT 1;
-- opcion 2, mas optima
-- c1 
SELECT MAX(p.precio) 
  FROM producto p;
-- c2 
SELECT * 
  FROM producto p 
    WHERE p.precio =(SELECT MAX(p.precio) 
      FROM producto p);
-- final
SELECT c2.nombre, c2.precio, f.nombre 
  FROM fabricante f 
    JOIN (SELECT * 
  FROM producto p 
    WHERE p.precio =(SELECT MAX(p.precio) 
      FROM producto p)) c2 ON c2.codigo_fabricante= f.codigo;
-- 6 lista productos fabricante lenovo
SELECT * 
  FROM fabricante f 
    JOIN producto p ON f.codigo = p.codigo_fabricante 
      WHERE f.nombre ='lenovo';
-- 7 lista productos fabricante crucial precio mayor 200
SELECT p1.nombre 
  FROM producto p1
    JOIN fabricante f ON p1.codigo_fabricante = f.codigo 
      WHERE f.nombre ='crucial' AND p1.precio >200;
-- 8 listado  productos fabricantes asus, hewlett - seagate sin in
SELECT * 
  FROM producto p 
    JOIN fabricante f ON p.codigo_fabricante = f.codigo 
      WHERE f.nombre ='asus' OR f.nombre ='hewlett-packard';
-- 9 listado con productos fabricantes asus, hewlett-packardy seagate con in
SELECT * 
  FROM producto p 
    JOIN fabricante f ON p.codigo_fabricante = f.codigo 
      WHERE f.nombre IN('asus', 'hewlett-packard');
-- 10 nombre y precio productos fabricantes que empiecen por e
SELECT * 
  FROM producto p 
    JOIN fabricante f ON p.codigo_fabricante = f.codigo 
      WHERE f.nombre LIKE '%e';
-- 11 nombre y precio productos cuyo nombre contenga caracter w en su nombre
SELECT p.nombre, p.precio 
  FROM producto p 
    WHERE p.nombre LIKE'%e%';
-- 12 listado nombre producto, precio y nombre fabricante productos que tengan precio mayor o = 180, precio descendiente y nombre ascendente
SELECT p.nombre, p.precio, f.nombre 
  FROM producto p 
    JOIN fabricante f ON p.codigo_fabricante = f.codigo 
      WHERE p.precio >=180 
        ORDER BY p.precio DESC, f.nombre ASC;
-- 13 listado identificador y nombre fabricante solamente de aquellos fabricantes que ponen productos asociados base de datos 
SELECT f.codigo, f.nombre 
  FROM fabricante f 
    LEFT JOIN producto p ON f.codigo = p.codigo_fabricante 
      WHERE p.codigo IS NOT NULL;
-- 14 listado fabricantes existen base de datos, junto con productoos que tiene cada uno de ellos. mostrara fabricantes que no tienen productos asociados
SELECT * 
  FROM fabricante f 
    LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;
-- 15 listado solo aparezcan fabricantes que no tienen producto asociado
SELECT * 
  FROM  fabricante f 
    LEFT JOIN producto p ON f.codigo = p.codigo_fabricante 
      WHERE p.codigo IS NULL;