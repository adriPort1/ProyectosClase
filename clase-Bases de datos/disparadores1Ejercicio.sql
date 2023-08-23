USE disparadores1;
-- disparador
-- crear disparador que calcule cuando se meta una empresa
-- diasemana
-- mes
-- mesnumero
-- anno
-- de la fecha de entrada
-- empresas Before insert

DROP TRIGGER IF EXISTS empresasBI ;
CREATE TRIGGER empresasBI 
BEFORE INSERT
	ON empresas
	FOR EACH ROW
BEGIN
  set LC_TIME_NAMES='es_es';

  SET NEW.diaSemana =DAYNAME(NEW.fechaentrada),
   NEW.diaMes = DAYOFMONTH(NEW.fechaEntrada),
   NEW.mes = MONTHNAME(NEW.fechaEntrada),
   NEW.mesNumero= MONTH(NEW.fechaEntrada),
   NEW.anno = YEAR(NEW.fechaEntrada);
END;

INSERT INTO empresas (empresa, fechaEntrada)
  VALUES ('prueba2', '2021-12-4');


SELECT * FROM empresas e;

-- Crear un disparador para que cuando ACTUALIZAR una empresa me coloque correctamente
-- diasemana
-- mes
-- mesNumero
-- anno
-- de la fecha de entrada

DROP TRIGGER IF EXISTS empresaBU;
CREATE TRIGGER empresaBU
BEFORE UPDATE
	ON  empresas
	FOR EACH ROW
BEGIN
  set LC_TIME_NAMES='es_es';
  SET 
   NEW.diaSemana =DAYNAME(NEW.fechaentrada), 
   NEW.diaMes = DAYOFMONTH(NEW.fechaEntrada),
   NEW.mes = MONTHNAME(NEW.fechaEntrada),
   NEW.mesNumero= MONTH(NEW.fechaEntrada),
   NEW.anno = YEAR(NEW.fechaEntrada);
END;

-- actualizar empresa ejemplo
UPDATE empresas e
  SET e.fechaEntrada='2021/8/14'
  WHERE e.empresa='alpe';
SELECT * FROM empresas e;

-- Modificar el disparador anterior para que en caso de que 
-- al actualizar la empresa no se modidique la fecha de entrada
-- no realice ningun calculo

DROP TRIGGER IF EXISTS empresasbu2;
CREATE TRIGGER empresasbu2
BEFORE UPDATE
	ON  empresas
	FOR EACH ROW
BEGIN
  set LC_TIME_NAMES='es_es';
IF (NEW.fechaEntrada<>OLD.fechaEntrada ) THEN 
   SET 
   NEW.diaSemana =DAYNAME(NEW.fechaentrada), 
   NEW.diaMes = DAYOFMONTH(NEW.fechaEntrada),
   NEW.mes = MONTHNAME(NEW.fechaEntrada),
   NEW.mesNumero= MONTH(NEW.fechaEntrada),
   NEW.anno = YEAR(NEW.fechaEntrada);
END IF;
 
END;

UPDATE empresas e
  SET e.fechaEntrada='2021/11/2'
  WHERE e.empresa='seur';

SELECT * FROM empresas e;

-- CREAR UN DISPARADOR PARA CLIENTES QUE CUANDO INSERTO UNO NUEVO
-- ME CALCULE LA REFERENCIA COMO NOMBRE DEL CLIENTE JUNTO CON EL CODIGO
-- NOMBRE=ANA Y CODIGO=2 ==> REFERENCIA=ANA2
-- ES NECESARIO PASAR EL CODIGO EN EL INSERT

SELECT * FROM clientes c;
DROP TRIGGER IF EXISTS clientesBI;
CREATE TRIGGER clientesBI
BEFORE INSERT
	ON clientes 
	FOR EACH ROW
BEGIN
SET NEW.referencia= CONCAT(NEW.nombre, NEW.codigo);
END;

INSERT INTO clientes (codigo,nombre, empresa,fechaNacimiento)
  VALUES (100,'silvia', 'alpe', '2000-1-2');
  
-- MODIFICAR EL DISPARADOR PARA CLIENTES QUE CUANDO INSERTO UNO NUEVO
-- ME CALCULE LA REFERENCIA COMO NOMBRE DEL CLIENTE JUNTO CON EL CODIGO
-- NOMBRE=ANA Y CODIGO=2 ==> REFERENCIA=ANA2
-- NO LE PASAMOS EL CODIGO EN EL INSERT
-- ATENCION : DIFICULTAD ALTA


SELECT * FROM clientes c;


DROP TRIGGER IF EXISTS clientesBI;
CREATE TRIGGER clientesBI
BEFORE INSERT
	ON clientes 
	FOR EACH ROW
BEGIN
-- Variable numero para almacenar el id del siguiente rtegistro
DECLARE numero int DEFAULT 0;
SET @@information_schema_stats_expiry = 0;
-- tabla donde  pillas el autoincrement, tabla de la base de datos que tienen todos los mysql
-- solo se puede acceder si eres root 
IF (NEW.codigo=0 ) THEN 
  SELECT AUTO_INCREMENT 
    INTO numero 
  FROM INFORMATION_SCHEMA.TABLES
    WHERE table_name = 'clientes' AND TABLE_SCHEMA='disparadores1';

    SET NEW.referencia= CONCAT(NEW.nombre, numero);

  ELSE

    SET NEW.referencia= CONCAT(NEW.nombre, NEW.codigo);
END IF;
 
END;

INSERT INTO clientes (codigo, nombre, empresa,fechaNacimiento)
  VALUES (1005,'lorena', 'alpe', '2000-1-2');
  
INSERT INTO clientes ( nombre, empresa, fechaNacimiento)
  VALUES('luis', 'alpe', '2000-1-2');


SELECT * FROM clientes c;

-- CREAR UN DISPARADOR PARA CLIENTES QUE CUANDO ACTUALIZO UN CLIENTE
-- ME CALCULE LA REFERENCIA COMO NOMBRE DEL CLIENTE JUNTO CON EL CODIGO
-- NOMBRE=ANA Y CODIGO=2 ==> REFERENCIA=ANA2
DROP TRIGGER IF EXISTS clientesBU;
CREATE TRIGGER clientesBU
BEFORE UPDATE
	ON  clientes
	FOR EACH ROW
BEGIN
SET NEW.referencia= CONCAT(NEW.nombre, NEW.codigo);
END;

-- voy a crear un procedimiento
-- que me actualice los registros que esten mal calculadas las referencias
-- LLAMARLO REFERENCIAS

DROP PROCEDURE IF EXISTS referencias;
CREATE PROCEDURE referencias ()
BEGIN
-- declarar variables
UPDATE clientes c SET c.referencia=CONCAT(c.nombre,c.codigo);
-- procesamiento 

END;
CALL referencias();
SELECT * FROM clientes c;
-- CREAR UN DISPARADOR PARA LA TABLA CLIENTES
-- QUE CUANDO INSERTO UN CLIENTE NUEVO
-- ME COLOQUE COMO EMAIL=[REFERENCIA]@[EMPRESA].COM
DROP TRIGGER IF EXISTS clientesBI2;
CREATE TRIGGER clientesBI2
BEFORE INSERT
	ON clientes
	FOR EACH ROW
BEGIN
  SET NEW.email=CONCAT(NEW.referencia,'@',NEW.empresa,'.com');
END;

INSERT INTO clientes ( nombre, empresa, fechaNacimiento)
  VALUES('luis', 'alpe', '2000-1-2');

  SELECT * FROM clientes c;

-- CREAR UN DISPARADOR PARA LA TABLA CLIENTES
-- QUE CUANDO ACTUALIZO UN CLIENTE 
-- ME COLOQUE COMO EMAIL=[REFERENCIA]@[EMPRESA].COM

DROP TRIGGER IF EXISTS clientesBU3;
CREATE TRIGGER clientesBU3
BEFORE UPDATE 
	ON clientes
	FOR EACH ROW
BEGIN
  SET NEW.email=CONCAT(NEW.referencia,'@',NEW.empresa,'.com');
END;
SELECT * FROM clientes c ;
UPDATE clientes c SET c.nombre = 'pedro' WHERE c.codigo=110;

-- disparador para clientes
-- cuando creo un cliente nuevo
-- tengo que actualizar el campo fechaUltimo de la empresa
-- a la que pertenece ese cliente

DROP TRIGGER IF EXISTS clientesNuevoAI;
CREATE TRIGGER clientesNuevoAI
AFTER INSERT
	ON  clientes
	FOR EACH ROW
BEGIN
  UPDATE empresas e
  SET e.fechaUltimo=NEW.fecha
  WHERE e.empresa=new.empresa;
END;

INSERT INTO clientes ( nombre, empresa)
  VALUES ( 'dani', 'seur' ); 
  SELECT * FROM clientes c;
  SELECT * FROM empresas e;
