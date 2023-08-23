USE compranp;
SELECT * FROM productos p;
SELECT * FROM  compran c;
-- crear tabla para introducir los productos vendidos
CREATE TABLE ProductosVendidos (
id int AUTO_INCREMENT,
nombre varchar(50),
PRIMARY KEY (id)
);
-- consulta
-- introducir en la tabla los productos vendidos
-- tenemos que utilizar los productos y compran 
SELECT p.codPro, p.nombre 
  FROM  productos p 
    JOIN compran c ON p.codPro = c.codPro;
-- esta de arriba seria la peor solucion (es la que idee yo jajajaj) (AUNQUE LE AÑADI EL WHERE QUE ESTABA MAL)
SELECT p.codPro, p.nombre 
  FROM productos p 
    WHERE p.codPro 
      IN (SELECT DISTINCT c.codPro FROM compran c);
-- esta es mejor, con in
-- ahora con consultas correlacionadas con exist
SELECT p.codPro, p.nombre
  FROM productos p 
    WHERE 
      EXISTS (SELECT 1 FROM compran c WHERE c.codPro = p.codPro);
-- join con subconsultas
SELECT c1.codPro, p.nombre
  FROM  productos p 
    JOIN (SELECT DISTINCT c.codPro FROM compran c) c1 USING (codPro);
-- consultas de datos anexados
INSERT INTO ProductosVendidos (id, nombre)
  SELECT p.codPro, p.nombre 
  FROM productos p 
    WHERE 
      EXISTS (SELECT 1 FROM compran c WHERE c.codPro = p.codPro);

SELECT * FROM  ProductosVendidos pv;
-- PARA HACER ESTO TIENE QUE COINCIDIR EL TIPO DE DATO, OSEA SI ES INT CON INT, VARCHAR CON VARCHAR

CREATE TABLE productosNoVendidos(
id int AUTO_INCREMENT, 
nombre varchar(50),
PRIMARY KEY (id)
);
INSERT INTO productos (codPro, nombre, precio, numeroClientes)
  VALUES (100, 'raro', 10, 0);
-- crear subconsulta
SELECT p.codPro, p.nombre 
  FROM  productos p 
    LEFT JOIN compran c ON p.codPro = c.codPro WHERE c.codPro IS NULL;
-- esta de arriba seria la peor solucion (es la que idee yo jajajaj) (AUNQUE LE AÑADI EL WHERE QUE ESTABA MAL)
SELECT p.codPro, p.nombre 
  FROM productos p 
    WHERE p.codPro 
     NOT IN (SELECT DISTINCT c.codPro FROM compran c);
-- esta es mejor, con in
-- ahora con consultas correlacionadas con exist
SELECT p.codPro, p.nombre
  FROM productos p 
    WHERE 
      NOT EXISTS (SELECT 1 FROM compran c WHERE c.codPro = p.codPro);
-- join con subconsultas
SELECT p.codPro, p.nombre
  FROM  productos p 
    LEFT JOIN (SELECT DISTINCT c.codPro FROM compran c ) c1 USING (codPro) WHERE c1.codPro IS NULL;
-- para meter datos de dos tablas 
INSERT INTO 
  productosNoVendidos (id, nombre)
  SELECT p.codPro, p.nombre
    FROM productos p 
      WHERE 
        NOT EXISTS (SELECT 1 FROM compran c WHERE c.codPro = p.codPro) ;
SELECT * 
  FROM  productosNoVendidos nv;
-- ahora hemos hecho lo mismo para productos no vendidos

--  consultas de datos anexados es lo que hemos hecho con el insert into
-- crear una tabla con el nombre y el id y codigo de productos vendidos
-- restauramos la base de datos compranp para limpiar si no habia registros

-- crear tabla productos vendidos con codigo y nombre de los productos vendidos
-- esta es la opcion 1 pero peligrosa porque puedes crear infinitas y mas cosas
CREATE TABLE productosVendidos AS SELECT p.codPro, p.nombre 
  FROM productos p 
    WHERE p.codPro 
      IN (SELECT DISTINCT c.codPro FROM compran c);

SELECT * FROM  productosVendidos v;
-- ejemplos para poner parametros al create table
-- la elimino para que no me de error al crear otra, sin ejecutar el compranp 
DROP TABLE productosVendidos;
-- tabla mejor porque no puedes duplicar datos ni nada 
CREATE TABLE productosVendidos (
codPro int AUTO_INCREMENT,
nombre varchar(50),
PRIMARY KEY (codPro)
) AS  SELECT p.codPro, p.nombre 
  FROM productos p 
    WHERE p.codPro 
      IN (SELECT DISTINCT c.codPro FROM compran c);
-- comprobar que esta bien
SELECT * FROM productosVendidos v;

-- consulta datos anexados
-- introducir productos vendidos en tabla productos 
-- vendidos pero si algun producto vendido a cambiado de nombre
-- se actualizara en la tabla productos vendidos
-- tambien se pueden hace para meterlo a mano pero siempre con clave principal
INSERT INTO productosVendidos 
  SELECT p.codPro, p.nombre 
  FROM productos p 
    JOIN (SELECT c.codPro FROM  compran c)c1 USING (codPro) ON DUPLICATE KEY UPDATE nombre=VALUES(nombre);
SELECT * FROM productos p;
-- 
-- hacer lo mismo pero con los no vendidos
-- 
DROP TABLE  IF EXISTS productosNoVendidos;
-- consulta creacion de tabla
CREATE TABLE productosNoVendidos(
codPro int AUTO_INCREMENT,
nombre varchar(50),
PRIMARY KEY (codPro)
)SELECT p.codPro, p.nombre 
  FROM productos p 
    WHERE p.codPro 
     NOT IN (SELECT DISTINCT c.codPro FROM compran c); 

SELECT * FROM productosNoVendidos nv ;
-- consulta insert datos anexados que me permita actualizar
-- insert + update
INSERT INTO 
  productosNoVendidos 
    SELECT p.codPro, p.nombre 
      FROM productos p 
        LEFT JOIN 
          (SELECT DISTINCT c.codPro FROM compran c) c1 
            USING (codPro) 
              WHERE c1.codPro IS NULL ON DUPLICATE KEY UPDATE nombre=VALUES(nombre);

 INSERT INTO productos (codPro, nombre, precio, numeroClientes)
  VALUES (150, 'rarote', 50, 0);
-- son consultas para actualizar, si no existe en la tabla primaria, no hace falta el duplicate

-- hacer consulta
-- crear tabla llamada clientes1 campo nombre (de nombre y apellido clientes)
DROP TABLE IF EXISTS cliente1;
CREATE TABLE cliente1(
codCli int,
nombre varchar(50),
PRIMARY KEY (codCli)
) SELECT c.codCli, CONCAT_WS(" ",c.nombre," ", c.apellidos) AS nombre FROM clientes c;

SELECT * FROM cliente1 c;
