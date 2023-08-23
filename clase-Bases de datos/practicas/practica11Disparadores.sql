USE practicaDisparadores;


-- ejercicio 1 
DROP TRIGGER IF EXISTS ventasBI;
CREATE TRIGGER ventasBI
BEFORE INSERT 
   ON ventas 
   FOR EACH ROW
   BEGIN    
    SET NEW.total=NEW.precio*NEW.unidades ;
END;
-- pruebas
SELECT v.producto,v.id, v.total FROM ventas v ;
SELECT * FROM productos p;
-- insercion para pruebas
INSERT INTO ventas ( producto, precio, unidades)
  VALUES ( 'p5', 50, 5);

-- ejercicio 2 usando lo de arriba para probar

DROP TRIGGER IF EXISTS ventasBI2 ;
CREATE TRIGGER ventasBI2 
BEFORE iNSERT
   ON  ventas 
   FOR EACH ROW
BEGIN
UPDATE productos p 
SET p.cantidad = p.cantidad+ NEW.precio*NEW.unidades
WHERE p.producto = NEW.producto;

END;

-- ejercicio 3 

DROP TRIGGER IF EXISTS ventasBU;
CREATE TRIGGER ventasBU
BEFORE UPDATE
   ON  ventas
   FOR EACH ROW
BEGIN

SET NEW.total= NEW.precio*NEW.unidades;

END;
-- select para ver y update para probar 
SELECT * FROM ventas v JOIN productos p;
UPDATE ventas v 
set 
    producto = 'p5',
    precio = 0,
    unidades = 0
WHERE v.id = 14;

-- ejercicio 4 

DROP TRIGGER IF EXISTS ventasAU;
CREATE TRIGGER ventasAU
AFTER UPDATE
   ON ventas  
   FOR EACH ROW
BEGIN

UPDATE productos p 
SET p.cantidad = (SELECT SUM(v.total) FROM ventas v WHERE NEW.producto= v.producto)
WHERE p.producto = NEW.producto;

END;

-- comprobacion 

SELECT * FROM ventas v JOIN productos p ON v.producto = p.producto WHERE p.producto= v.producto;
SELECT * FROM productos p;
UPDATE ventas v 
set 
    producto = 'p4',
    precio = 10,
    unidades = 10

WHERE v.id = 17;

-- ejercicio 5 

DROP TRIGGER IF EXISTS  productosBU;
CREATE TRIGGER  productosBU
BEFORE UPDATE
   ON  productos
   FOR EACH ROW
BEGIN

SET NEW.cantidad= (SELECT SUM(v.total) FROM ventas v WHERE v.producto= NEW.producto);

END;

INSERT INTO ventas (producto, precio, unidades, total)
  VALUES ('p20', 5, 5, 25);

UPDATE productos p  SET p.producto = 'p20' WHERE p.producto= 'p1';

SELECT * FROM productos p;
SELECT * FROM ventas v;

-- ejercicio 6

DROP TRIGGER IF EXISTS  productosAD;
CREATE TRIGGER  productosAD
AFTER DELETE
   ON  productos
   FOR EACH ROW
BEGIN

  DELETE FROM ventas
    WHERE producto = OLD.producto;
END;
DELETE FROM productos WHERE producto = 'P20';

SELECT * FROM productos p;
SELECT * FROM ventas v;

-- ejercicio 7

DROP TRIGGER IF EXISTS ventasAD;
CREATE TRIGGER ventasAD
AFTER DELETE
   ON ventas
   FOR EACH ROW
BEGIN
  UPDATE  productos p
    SET p.cantidad = cantidad - OLD.total WHERE p.producto = OLD.producto;
END;

DELETE FROM ventas WHERE id= 13;
