/*  USAR DOBLE GUIN (--) PARA COMENTARIO DE LINEA, Y EL DE LOS LATERALES PARA COMENTARIOS DE MAS LINEAS*/
#TAMBIEN CON LA ALMUHADILLA

DROP DATABASE  IF EXISTS ejemploclase;  -- este para borrar database, cpon el in exist para que no borre si no existe
CREATE DATABASE ejemploClase;           -- crea base de datos, usar el use para seleccionar la base a usar 
USE ejemploClase;                       -- seleccionar la base de datos
/*
creando tabla de coches
*/
CREATE TABLE coches(
  id int ,              -- campo de tipo entero
  marca varchar(20),    # campo texto, es char (la diferencia es que var no es dinamico, pero el otro siempre ocupa un espacio más
  modelo varchar(200),
  annoCompra year,      -- evitar poner ñ o tildes por problemas de codificación
  usado bool,           -- bool paa que pregunte si si o no(un si o no), es como un tinyint (1) (no lo tiene mysql, al guardar cambia a este formato)
  propietario int,      -- añadido para la clave ajena
  PRIMARY KEY (id)      -- clave principal
);
/*
fin de la creación de tabla
*/
/*
nueva tabla clientes
*/
CREATE TABLE clientes(
  id int,
  nombre varchar (100),
  apellidos varchar(200),
  poblacion varchar (100) DEFAULT "santander", -- default pone por defecto el texto que pongas
  telefono varchar(20), 
  correo varchar (100) NOT NULL,               -- not null para que no lo dejen vacio
  PRIMARY KEY(id),
  CONSTRAINT uk1 UNIQUE KEY (correo)           -- constrain pone nombre a las claves (aunque no hace falta ponerla porque pone por defecto el del campo
                                               -- el unique key es clave unica, que no se pueda repetir aunque si se puede dejar vacio
);
/*
acabar tabla, empezar relacion
*/
ALTER TABLE coches
  ADD CONSTRAINT fkcliente FOREIGN KEY (propietario) REFERENCES clientes(id)
    ON DELETE CASCADE ON UPDATE CASCADE;
    -- se modifica la tabla añadiendo la clave ajena, pero tiene que existir la tabla propietario
    -- on delete cascade y on cascade con el cascade si borras un dato los relacionados se borran (ej, borras un cliente y sus 3 coches en cascada)
/* 
introducir datos en la tabla clientes
*/
INSERT INTO clientes (id, nombre, apellidos, poblacion, telefono, correo)
  VALUES
  (1, 'Eva', 'gomez', 'laredo', '666333444', 'evag@alpe.es'),
  (2, 'luis', 'vazquez', DEFAULT, '634634634', 'luisv@alpe.es');
    -- fin de añadir datos a la tabla clientes
    -- inicio añadir datos a la tabla coche
  INSERT INTO coches (id, marca, modelo, annoCompra, usado, propietario)
  VALUES
  (1, 'seat', 'leon', 2010, FALSE, 1),
  (2, 'renault', 'clio', 2012, TRUE, 2);
    -- fin datos coche
    -- consulta manipulacion de datos, en este caso mostrar
SELECT 
  c.id,
  c.nombre,
  c.apellidos,
  c.poblacion,
  c.telefono,
  c.correo        -- el * es para sacar todos los campos, si pones los campos puedes seleccionar el tipo de campo que quieres sacar.
FROM 
  clientes c;     -- tabla a utilizar

-- mostrar coches
SELECT * FROM coches c;

/*
listar coches con los datos del dueño
*/
SELECT * FROM coches c 
  JOIN clientes c1 
ON c.propietario = c1.id;