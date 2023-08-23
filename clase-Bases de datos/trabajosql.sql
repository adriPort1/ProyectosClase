-- creacion de la base dedatons y conexion con la pagina 

DROP DATABASE IF EXISTS facturas;
CREATE DATABASE IF NOT EXISTS facturas;
USE facturas;

DROP TABLE IF EXISTS grupos;
CREATE TABLE if NOT EXISTS grupos(
    id int AUTO_INCREMENT,
    nombre varchar(100) not NULL,
    iva float,
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS productos;
CREATE TABLE if NOT EXISTS productos(
    id int AUTO_INCREMENT,
    nombre varchar(100) not NULL,
    precio float,
    grupo int,
    nombreGrupo varchar(100),
    ivaGrupo float,
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS lineas;
CREATE TABLE if NOT EXISTS lineas(
    id int AUTO_INCREMENT,
    producto int NOT NULL,
    nombreProducto varchar(100),
    precio float,
    cantidad int,
    total float,
    factura int not null,
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS factura;
CREATE TABLE if NOT EXISTS factura(
    id int AUTO_INCREMENT,
    cliente varchar(100) ,
    telefono varchar(100),
    correo varchar(100),
    total float,
    iva float,
    totalIva float,
    PRIMARY KEY(id)
);

-- creacion de las claves ajenas 

ALTER TABLE productos ADD CONSTRAINT fkproductosGrupos FOREIGN KEY (grupo) REFERENCES grupos(id) on DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE lineas ADD CONSTRAINT fklineasproductos FOREIGN KEY (producto) REFERENCES productos(id)  on DELETE NO ACTION ON UPDATE NO ACTION, 
ADD CONSTRAINT fklineasfactura FOREIGN KEY (factura) REFERENCES factura(id)  on DELETE NO ACTION ON UPDATE NO ACTION;

-- procedimiento de insercion en campos derivados en tabla productos

DROP PROCEDURE IF EXISTS  actualizarproductos;
CREATE PROCEDURE  actualizarproductos()
BEGIN


  UPDATE productos p JOIN grupos g 
    ON p.grupo = g.id 
      SET p.nombreGrupo= g.nombre, p.ivaGrupo= g.iva;
  
END;

CALL actualizarproductos();

-- disparador para in sertar los productos en campos derivados

 DROP TRIGGER IF EXISTS productosivadis;
CREATE TRIGGER productosivadis
BEFORE INSERT    
   ON productos
   FOR EACH ROW
BEGIN

DECLARE nombre varchar(100);
DECLARE IVAg float;

SELECT g.nombre,g.iva INTO nombre,IVAg FROM grupos g WHERE g.id=New.grupo;

SET
    NEW.nombreGrupo = nombre,
    New.ivaGrupo = IVAg;
  
END;
 
-- funcional 
-- disparador para acutalizar los productos en campos derivados

DROP TRIGGER IF EXISTS productosBU;
CREATE TRIGGER productosBU
BEFORE UPDATE
   ON productos 
   FOR EACH ROW
BEGIN

DECLARE nombre varchar(100);
DECLARE IVAg float;

SELECT g.nombre,g.iva INTO nombre,IVAg FROM grupos g WHERE g.id=New.grupo;
 
SET
    NEW.nombreGrupo = nombre,
    NEW.ivaGrupo = IVAg;
END;

-- funcional 

-- procedimientos para insertar nuevas lineas

DROP PROCEDURE IF EXISTS lineas;
CREATE PROCEDURE lineas()
BEGIN

UPDATE lineas l
 JOIN productos p ON l.producto= p.id 
  SET l.nombreProducto= p.nombre, l.precio = p.precio,  l.total= (p.precio*l.cantidad)+p.ivaGrupo ;

END;

CALL lineas();

-- disparador para crear nuevos registros en los campos derivados de lineas 

DROP TRIGGER IF EXISTS lineasBI;
CREATE TRIGGER lineasBI
BEFORE INSERT
   ON  lineas
   FOR EACH ROW
BEGIN

DECLARE nombre varchar(100);
DECLARE precio float;
DECLARE iva float;
DECLARE cantidad float;


SELECT p.nombre, p.precio, p.ivaGrupo INTO nombre, precio, iva FROM productos p WHERE p.id= NEW.producto;

SET NEW.nombreProducto = nombre, NEW.precio=precio, NEW.total= NEW.cantidad* precio * (1+iva);
  
END;
-- funcional 

-- disparador para actualizar registros en los campos derivados de lineas

DROP TRIGGER IF EXISTS lineasBU;
CREATE TRIGGER lineasBU
BEFORE UPDATE
   ON  lineas
   FOR EACH ROW
BEGIN

DECLARE nombre varchar(100);
DECLARE precio float;
DECLARE iva float;
DECLARE cantidad float;


SELECT p.nombre, p.precio, p.ivaGrupo INTO nombre, precio, iva FROM productos p WHERE p.id= NEW.producto;

SET NEW.nombreProducto = nombre, NEW.precio=precio, NEW.total= NEW.cantidad* precio * (1+iva);

END;
-- funcional 

-- dani mamon porque no viniste el 17/07

-- actualizar un registro solo de la tabla productos

DROP PROCEDURE IF EXISTS  actualizarproducto;
CREATE PROCEDURE  actualizarproducto(IN idN int)
BEGIN
 UPDATE productos p 
  JOIN grupos g 
    ON p.grupo = g.id 
      SET p.nombreGrupo = g.nombre, 
      p.ivaGrupo = g.iva 
      WHERE p.id= idN;

END;

CALL actualizarproducto(8);

-- actualizar un registro solo de la tabla lineas 

DROP PROCEDURE IF EXISTS actualizarLinea;
CREATE PROCEDURE actualizarLinea(IN idN int)
BEGIN

UPDATE lineas l 
  JOIN productos p 
    ON l.producto = p.id 
      SET l.nombreProducto = p.nombre, 
      l.precio = p.precio, 
      l.total = p.precio* l.cantidad * (1+p.ivaGrupo)
      WHERE l.id = idN;
END;

CALL actualizarLinea(5);

-- procedimiento para calcular los campos derivados de facturas 

DROP PROCEDURE IF EXISTS insertarFactura;
CREATE PROCEDURE insertarFactura()
BEGIN

UPDATE factura f 
  JOIN (SELECT l.factura, SUM(l.total) 
    FROM lineas l 
      GROUP BY l.factura) AS c1 
        ON f.id SET f.total = c1.factura;

UPDATE factura f JOIN 
  (SELECT l.factura, SUM(l.precio* l.cantidad*p.ivaGrupo) 
    FROM productos p JOIN lineas l ON p.id = l.producto  
      GROUP BY l.factura) AS c2 ON f.id SET f.iva = c2.factura;

END;

CALL insertarFactura();