DROP DATABASE IF EXISTS disparadores1;
CREATE DATABASE disparadores1;
USE disparadores1;

CREATE TABLE empresas(
  empresa varchar(100),
  trabajadores int DEFAULT 0,
  fechaUltimo datetime,
  fechaEntrada date,
  diaSemana varchar(100),
  diaMes int,
  mes varchar(100),
  mesNumero int,
  anno int,
  PRIMARY KEY(empresa)
);

INSERT INTO empresas (empresa, fechaEntrada)
  VALUES ('alpe', CURDATE()),('carrefour','2022-12-2'),('seur','2021-11-2');

CREATE TABLE clientes(
  codigo int AUTO_INCREMENT,
  referencia varchar(20),
  nombre varchar(100),
  empresa varchar(100),
  email varchar(100),
  fechaNacimiento date,
  -- si es mysql 8
  fecha date DEFAULT (CURRENT_DATE()),
  -- si es anterior a mysql 8
  -- fecha datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(codigo),
  CONSTRAINT clientesEmpresas FOREIGN KEY (empresa) REFERENCES empresas(empresa) ON DELETE RESTRICT on UPDATE RESTRICT
);

INSERT into clientes (nombre, empresa, fechaNacimiento)
  VALUES ('ramon', 'alpe', '1980-1-2'),('ana','seur','1978-1-2');