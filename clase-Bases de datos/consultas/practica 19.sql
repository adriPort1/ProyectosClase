USE rubros;

-- 1  insertar campo desc rubro y mostrar tipo rubro depeendiendo de la tabla rubros

SELECT * FROM rubros r;
UPDATE productos p JOIN rubros r USING (`COD-RUBRO`) SET p.`DESC-RUBRO`=r.`DESC-RUBRO`;
SELECT * FROM productos p;

-- 2 tabla precios, se detallan articulos que se venden 
-- a) se debera mostrar para cada columna de codigo descripcion correspondiente
-- ejemplo, cod prod con desc producto, se localiza en hojas respectivas

SELECT * FROM productos p;
UPDATE precios p JOIN productos p1 USING(`COD-PRODUCTO`) SET p.`DESC-PRODUCTO`=p1.`DESC-PRODUCTO`;
SELECT * FROM precios p;

-- b) campo llamado como cod-articulo, debera generar un codigo que identifique un producto por su marca
-- se formará de unic cod prod mas una "p" de producto mas el cod marca, mas una m, dicho codigo se usara mas adelante

SELECT * FROM precios p;
SELECT p.`COD-PRODUCTO`, p.`COD-MARCA` FROM precios p;
ALTER TABLE precios MODIFY COLUMN `COD-ARTICULO` varchar(10);
UPDATE precios p SET p.`COD-ARTICULO` = CONCAT(p.`COD-PRODUCTO` ,' p ',p.`COD-MARCA`,' m');

-- c) en la columna iva incl se debera calcular el precio del articulo con su iva incluido.
-- tener en cuenta que cada rubro al cual pertenecen los articulos posee un va especifico que esta en la hoja rubros

SELECT * FROM rubros r1;
SELECT * FROM precios p;
UPDATE precios p JOIN rubros r USING (`COD-RUBRO`) SET p.`IVA_Incl.`= p.IMPORTE*r.IVA;

-- esto no lo piden pero esque la jodí al poner los cod rubro, porque force la union cunado no hacia falta

UPDATE precios p1 JOIN rubros r USING (`COD-RUBRO`) SET p1.`DESC-RUBRO`=r.`DESC-RUBRO`;

-- 3 tabla gestion, en la columna cod_articulo, generar mismo codigo hoja precios.
-- servira para precio unit (dettallado en hoja precios)

SELECT  * FROM gestion ;
SELECT * FROM precios p;
ALTER TABLE gestion MODIFY `COD-ARTICULO` varchar(10);
UPDATE gestion g JOIN precios p USING (`COD-MARCA`, `COD-PRODUCTO`) SET g.`COD-ARTICULO`= p.`COD-ARTICULO`;

-- b) calcular columna importe que viene de precio unit y cantidad

SELECT g.`PRECIO_UNIT.`, g.CANTIDAD, g.IMPORTE FROM gestion g;
UPDATE gestion g JOIN precios p  USING(`COD-ARTICULO`)SET g.`PRECIO_UNIT.`= p.`IMPORTE`;
UPDATE gestion g JOIN precios p USING (`COD-MARCA`) SET g.IMPORTE = g.`PRECIO_UNIT.`* g.CANTIDAD;

-- c) mostrar importe correspondiente al calculo de la columna descuento, teniendo en cuenta que se realizara un descuento
-- en la venta de articulos, dependiendo del rubro y del dia de la semana que se realice la misma
-- los dias lunes poseen descuento los fiambres, los dias miercoles los lacteos y los dias viernes los productos de panaderia
-- el porcentaje se localiza enn la hoja rubros

SELECT * FROM gestion g;
SELECT * FROM productos p;
SELECT * FROM rubros r;

--  esta consulta es para actualizar cod rubro para no usar productos

UPDATE precios p JOIN productos p1 USING (`COD-PRODUCTO`) SET p.`COD-RUBRO`= p1.`COD-RUBRO`;
-- esto no se puede con campos que puedan ser nulos, cambiar por dos join para que no de problemas
-- esta consulta es para actualizar el desc rubro, asi usar solo rubros y gestion

UPDATE gestion g JOIN productos p USING(`COD-PRODUCTO`) SET g.`DESC-RUBRO`= p.`DESC-RUBRO`, g.`DESC-PRODUCTO`= p.`DESC-PRODUCTO`;

-- actualizar descuento ahora

UPDATE gestion g JOIN precios p USING(`COD-PRODUCTO`) JOIN rubros r USING (`COD-RUBRO`)SET  g.IVA= r.IVA, g.DESCUENTO= r.DESCUENTO ;-- este es el e), que me flipé y lo hice con otro

 UPDATE gestion g 
  JOIN  precios p USING (`COD-ARTICULO`) 
  JOIN rubros r USING(`COD-RUBRO`) SET g.DESCUENTO=IF
  ((DAYOFWEEK(g.FECHA)=2 AND r.`DESC-RUBRO`='fiambres') OR 
  (DAYOFWEEK(g.FECHA)=4 AND r.`DESC-RUBRO`='lacteos') OR
  (DAYOFWEEK(g.FECHA)=6 AND r.`DESC-RUBRO`='panaderia'), r.DESCUENTO, 0);
  SELECT * FROM gestion g; 

-- dependencia funcional, se deben a fallos de normalizacion, cuando actualizas campos en tablas que no existen para poder relacionar sin funcion de otras tablas 
-- d, subtotal, importe - descuento 
UPDATE gestion g SET g.SUBTOTAL= g.IMPORTE*(1-g.DESCUENTO);
SELECT * FROM gestion g;

-- e, iva, calculo del iva porcentaje correspondiente en rubros (hecho arriba con descuento )
-- f)total, que es subtotal + iva
UPDATE gestion g SET g.TOTAL = g.SUBTOTAL*(1+g.IVA);
SELECT * FROM gestion g;
-- g) descripciones prod, rubro, marca
SELECT * FROM gestion g;
SELECT * FROM marcas m1;                   
UPDATE gestion g JOIN marcas m USING(`COD-MARCA`) SET g.`DESC-MARCA`= m.`DESC-MARCA`;        