USE COMPRANP;
SELECT * FROM productos p;
-- inicializar el numeroClientes de todos los productos a 0
UPDATE productos p 
  SET p.numeroClientes=0;
-- inicializar el numClientes a 1 de todos los prodcutos que esten en la tabla compranP
-- metodo 1
SELECT * 
  FROM productos p 
    JOIN compran c ON p.codPro = c.codPro;
UPDATE productos p 
  JOIN compran c ON p.codPro = c.codPro 
    SET p.numeroClientes=0;
-- esto es lo mismo pero mas eficiente ya que hay que evitar unir tablas en estas ordenes
-- se puede hacer, pero es mas rapida la segunda
-- el metodo 2 es para ver donde se iguala
UPDATE productos p 
  SET p.numeroClientes =2 
    WHERE p.codPro 
      IN (SELECT c.codPro FROM compran c);
-- metodo 3
UPDATE  productos p 
  SET p.numeroClientes=4 
    WHERE EXISTS (SELECT 1 FROM compran c WHERE p.codPro = c.codPro);
-- estas son las tablas a manipular, dejar a la vista asi par apoder comprarar
SELECT * 
  FROM  productos p;
SELECT * 
  FROM  compran c;
-- usar alter table (de definicion) para añadir campo 
ALTER TABLE productos 
  ADD COLUMN numeroUnidades 
    int DEFAULT 0;
-- actualizar el campo solicitado
-- utilizando el campo cantidad 
-- este es el malo
SELECT c.codPro, SUM(c1.cantidad) suma 
  FROM  productos p 
    JOIN compran c ON p.codPro = c.codPro 
      JOIN compranp c1 ON c.idCompran = c1.idCompran 
        GROUP BY c.codPro;
-- metodo bueno
UPDATE productos p 
  JOIN 
    (SELECT c.codPro, SUM(c1.cantidad) suma 
      FROM compran c 
        JOIN compranp c1 ON c.idCompran = c1.idCompran 
          GROUP BY c.codPro) c1 
            USING (codPro) SET p.numeroUnidades=c1.suma;
-- c1
SELECT c.codPro, SUM( c2.cantidad) suma 
  FROM compran c 
    JOIN compranp c2 ON c.idCompran = c2.idCompran 
      GROUP BY c.codPro;
-- esto nose muy bien porque lo he puesto 
SELECT SUM(c.cantidad) 
  FROM compranp c 
    JOIN compran c1 ON c.idCompran = c1.idCompran 
      WHERE c1.codPro =1;
-- actualizar numproductos tabla compran utilizando cantidad de productos
-- calculando es obtener el numero de unidades vendidas al mismo cliente de ese producto 
SELECT c.idCompran ,SUM(c.cantidad) suma
  FROM compranp c GROUP BY c.idCompran;
-- que registros quuiero actualizar
-- actualizacion
UPDATE compran c JOIN (SELECT c.idCompran ,SUM(c.cantidad) suma
  FROM compranp c GROUP BY c.idCompran) c1 USING (idCompran) SET c.numeroProductos=c1.suma;

-- calcular precio total productos compranp
-- el total es num unidades por cantidad
SELECT SUM(c.cantidad) FROM  compranp c GROUP BY c.idCompran;
SELECT p.precio FROM productos p;
-- calcular valor 
SELECT p.precio*c1.cantidad AS multiplicacion, c1.idCompran FROM productos p JOIN compran c ON p.codPro = c.codPro JOIN compranp c1 ON c.idCompran = c1.idCompran;
-- actualizar tabla compranp y todos los registros
UPDATE productos p1 JOIN compran c ON p1.codPro = c.codPro JOIN compranp c1 ON c.idCompran = c1.idCompran SET c1.total=p1.precio*c1.cantidad;

-- calcular precio de productos en la tabla compranp teniendo en cuenta:
-- si el numero de unidades pedido es menor a 10 no hay descuento
-- si el numero unidades entre 10, 30, descuento del 10%
-- mayor de 30, descuento 20
-- para calcular el precio del producto multiplicar precio por unidad
SELECT c1.cantidad, p.precio FROM productos p JOIN compran c ON p.codPro = c.codPro JOIN compranp c1 ON c.idCompran = c1.idCompran;
SELECT 
  IF((c1.cantidad* p.precio)<10, c1.cantidad* p.precio, IF((c1.cantidad* p.precio)<30, (c1.cantidad* p.precio)*0.90, (c1.cantidad* p.precio)*0.70)) AS posible  
    FROM productos p 
      JOIN compran c ON p.codPro = c.codPro 
        JOIN compranp c1 ON c.idCompran = c1.idCompran;
-- solucion ramon
-- falta solucion
-- copiar luego, o pillar del git
-- ESTO EH PARA BORRAR REGIHTROH
-- ---------------------------------------------------- 
-- borrar registros de precios mayores a 20 €
-- seleccion, asi puedo ver lo que borro
SELECT * FROM productos p WHERE p.precio>=20;
-- consulta de eliminacion
DELETE FROM productos p WHERE p.precio>=20;

-- eliminar las compras de productos que el precio esa mayor o igual 
SELECT * FROM compran c JOIN productos p ON c.codPro = p.codPro WHERE p.precio>=20;
-- sintaxis directa con mas tablas 
DELETE c FROM ( compran c JOIN productos p ON c.codPro = p.codPro ) WHERE p.precio>=20;
-- sintaxis 2;
DELETE c.* FROM ( compran c JOIN productos p ON c.codPro = p.codPro ) WHERE p.precio>=20;
-- si no hay alias, hay que poner el nombre de la tabla 
-- utilizando where + in
DELETE FROM compran WHERE codPro IN (SELECT * FROM productos p WHERE p.precio >=20);
-- where antes de join 
DELETE c FROM compran c JOIN (SELECT * FROM productos p WHERE p.precio>=20) c1 USING (codPro);
-- where y exists
DELETE c FROM compran c WHERE EXISTS (SELECT 1 FROM productos p WHERE p.precio>=20 AND p.codPro=c.codPro);
-- borrar compras de clientes de santander
SELECT  c.nombre, c1.idCompran, p.nombre
  FROM clientes c JOIN poblacion p ON c.poblacion = p.idPob JOIN compran c1 ON c.codCli = c1.codCli;
SELECT * FROM compran c;

DELETE c 
  FROM clientes c 
    JOIN poblacion p1 ON c.poblacion = p1.idPob 
      JOIN compran c1 ON c.codCli = c1.codCli 
       WHERE p1.nombre = 'SANTANDER';
-- c1
SELECT * FROM poblacion p WHERE p.nombre ='santander';
-- c2
SELECT * 
  FROM  clientes c 
    WHERE c.poblacion 
      =(SELECT p.idPob 
        FROM poblacion p 
          WHERE p.nombre ='santander');
DELETE c 
  FROM compran c 
    WHERE codCli IN 
      (SELECT clientes c 
        WHERE c.poblacion 
          =(SELECT p.idPob 
            FROM poblacion p 
              WHERE p.nombre ='santander'));
-- falta de copiar

