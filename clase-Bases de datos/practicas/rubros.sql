﻿--
-- Script was generated by Devart dbForge Studio 2019 for MySQL, Version 8.2.23.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 16/02/2021 1:39:27
-- Server version: 5.7.31-log
-- Client version: 4.1
--

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

DROP DATABASE IF EXISTS rubros;

CREATE DATABASE IF NOT EXISTS rubros
CHARACTER SET utf8
COLLATE utf8_spanish_ci;

--
-- Set default database
--
USE rubros;

--
-- Create table `rubros`
--
CREATE TABLE IF NOT EXISTS rubros (
  `COD-RUBRO` int(11) NOT NULL,
  `DESC-RUBRO` varchar(12) DEFAULT NULL,
  IVA double DEFAULT NULL,
  DESCUENTO double DEFAULT NULL,
  PRIMARY KEY (`COD-RUBRO`)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8,
COLLATE utf8_spanish_ci;

--
-- Create table `productos`
--
CREATE TABLE IF NOT EXISTS productos (
  `COD-PRODUCTO` int(11) NOT NULL,
  `DESC-PRODUCTO` varchar(25) DEFAULT NULL,
  `COD-RUBRO` int(11) NOT NULL,
  `DESC-RUBRO` varchar(12),
  PRIMARY KEY (`COD-PRODUCTO`)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 712,
CHARACTER SET utf8,
COLLATE utf8_spanish_ci;

--
-- Create index `COD-RUBRO_index` on table `productos`
--
ALTER TABLE productos
ADD INDEX `COD-RUBRO_index` (`COD-RUBRO`);

--
-- Create table `precios`
--
CREATE TABLE IF NOT EXISTS precios (
  precios_id int(11) NOT NULL AUTO_INCREMENT,
  `COD-PRODUCTO` int(11) NOT NULL,
  `DESC-PRODUCTO` varchar(255) DEFAULT NULL,
  `COD-RUBRO` int(11) DEFAULT NULL,
  `DESC-RUBRO` varchar(255) DEFAULT NULL,
  UNIDAD varchar(12) DEFAULT NULL,
  `COD-MARCA` int(11) NOT NULL,
  `DESC-MARCA` varchar(255) DEFAULT NULL,
  `COD-ARTICULO` int(11) NOT NULL,
  IMPORTE double DEFAULT NULL,
  `IVA_Incl.` varchar(255) DEFAULT NULL,
  PRIMARY KEY (precios_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 73,
AVG_ROW_LENGTH = 227,
CHARACTER SET utf8,
COLLATE utf8_spanish_ci;

--
-- Create index `COD-ARTICULO_index` on table `precios`
--
ALTER TABLE precios
ADD INDEX `COD-ARTICULO_index` (`COD-ARTICULO`);

--
-- Create index `COD-MARCA_index` on table `precios`
--
ALTER TABLE precios
ADD INDEX `COD-MARCA_index` (`COD-MARCA`);

--
-- Create index `COD-RUBRO_index` on table `precios`
--
ALTER TABLE precios
ADD INDEX `COD-RUBRO_index` (`COD-RUBRO`);

--
-- Create table `marcas`
--
CREATE TABLE IF NOT EXISTS marcas (
  `COD-MARCA` int(11) NOT NULL,
  `DESC-MARCA` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`COD-MARCA`)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 910,
CHARACTER SET utf8,
COLLATE utf8_spanish_ci;

--
-- Create table `gestion`
--
CREATE TABLE IF NOT EXISTS gestion (
  gestion_id int(11) NOT NULL AUTO_INCREMENT,
  FECHA datetime DEFAULT NULL,
  `COD-PRODUCTO` int(11) NOT NULL,
  `COD-MARCA` int(11) NOT NULL,
  `COD-ARTICULO` int(11) NOT NULL,
  CANTIDAD double DEFAULT NULL,
  `PRECIO_UNIT.` float DEFAULT 0,
  IMPORTE float DEFAULT NULL,
  DESCUENTO float DEFAULT 0,
  SUBTOTAL float DEFAULT 0,
  IVA float DEFAULT 0,
  TOTAL float DEFAULT 0,
  `DESC-PRODUCTO` varchar(255) DEFAULT NULL,
  `DESC-RUBRO` varchar(255) DEFAULT NULL,
  `DESC-MARCA` varchar(255) DEFAULT NULL,
  PRIMARY KEY (gestion_id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 47,
AVG_ROW_LENGTH = 356,
CHARACTER SET utf8,
COLLATE utf8_spanish_ci;

--
-- Create index `COD-ARTICULO_index` on table `gestion`
--
ALTER TABLE gestion
ADD INDEX `COD-ARTICULO_index` (`COD-ARTICULO`);

--
-- Create index `COD-MARCA_index` on table `gestion`
--
ALTER TABLE gestion
ADD INDEX `COD-MARCA_index` (`COD-MARCA`);

--
-- Create index `COD-PRODUCTO_index` on table `gestion`
--
ALTER TABLE gestion
ADD INDEX `COD-PRODUCTO_index` (`COD-PRODUCTO`);

-- 
-- Dumping data for table rubros
--
INSERT INTO rubros VALUES
(1, 'fiambres', 0.23, 0.1),
(2, 'lacteos', 0.14, 0.05),
(3, 'panaderia', 0, 0.15);

-- 
-- Dumping data for table productos
--
INSERT INTO productos VALUES
(1, 'salame', 1, NULL),
(2, 'mortadela', 1, NULL),
(3, 'paleta', 1, NULL),
(4, 'jamon', 1, NULL),
(5, 'leonesa', 1, NULL),
(6, 'panchos', 1, NULL),
(7, 'queso muzarela', 2, NULL),
(8, 'queso sandwich', 2, NULL),
(9, 'queso dambo', 2, NULL),
(10, 'queso rallado', 2, NULL),
(11, 'leche entera', 2, NULL),
(12, 'yogurt', 2, NULL),
(13, 'queso colonia', 2, NULL),
(14, 'queso semiduro', 2, NULL),
(15, 'manteca', 2, NULL),
(16, 'leche descremada', 2, NULL),
(17, 'pan viena', 3, NULL),
(18, 'pan sandwich', 3, NULL),
(19, 'pan felipe', 3, NULL),
(20, 'pan manteca', 3, NULL),
(21, 'pan tortuga', 3, NULL),
(22, 'pan flauta', 3, NULL),
(23, 'pan porteño', 3, NULL);

-- 
-- Dumping data for table precios
--
INSERT INTO precios VALUES
(1, 1, NULL, NULL, NULL, 'kilo', 4, NULL, 0, 140, NULL),
(2, 1, NULL, NULL, NULL, 'kilo', 2, NULL, 0, 145, NULL),
(3, 1, NULL, NULL, NULL, 'kilo', 3, NULL, 0, 139, NULL),
(4, 2, NULL, NULL, NULL, 'kilo', 2, NULL, 0, 88, NULL),
(5, 2, NULL, NULL, NULL, 'kilo', 3, NULL, 0, 90, NULL),
(6, 2, NULL, NULL, NULL, 'kilo', 6, NULL, 0, 110, NULL),
(7, 2, NULL, NULL, NULL, 'kilo', 5, NULL, 0, 90, NULL),
(8, 2, NULL, NULL, NULL, 'kilo', 8, NULL, 0, 92, NULL),
(9, 3, NULL, NULL, NULL, 'kilo', 7, NULL, 0, 78, NULL),
(10, 3, NULL, NULL, NULL, 'kilo', 8, NULL, 0, 117, NULL),
(11, 3, NULL, NULL, NULL, 'kilo', 4, NULL, 0, 104, NULL),
(12, 4, NULL, NULL, NULL, 'kilo', 2, NULL, 0, 165, NULL),
(13, 4, NULL, NULL, NULL, 'kilo', 3, NULL, 0, 162, NULL),
(14, 4, NULL, NULL, NULL, 'kilo', 6, NULL, 0, 143, NULL),
(15, 4, NULL, NULL, NULL, 'kilo', 8, NULL, 0, 121, NULL),
(16, 4, NULL, NULL, NULL, 'kilo', 5, NULL, 0, 117, NULL),
(17, 5, NULL, NULL, NULL, 'kilo', 6, NULL, 0, 78, NULL),
(18, 5, NULL, NULL, NULL, 'kilo', 7, NULL, 0, 82, NULL),
(19, 5, NULL, NULL, NULL, 'kilo', 5, NULL, 0, 67, NULL),
(20, 6, NULL, NULL, NULL, 'kilo', 3, NULL, 0, 58, NULL),
(21, 6, NULL, NULL, NULL, 'kilo', 8, NULL, 0, 72, NULL),
(22, 7, NULL, NULL, NULL, 'kilo', 9, NULL, 0, 74, NULL),
(23, 7, NULL, NULL, NULL, 'kilo', 10, NULL, 0, 84, NULL),
(24, 7, NULL, NULL, NULL, 'kilo', 13, NULL, 0, 60, NULL),
(25, 7, NULL, NULL, NULL, 'kilo', 11, NULL, 0, 92, NULL),
(26, 8, NULL, NULL, NULL, 'kilo', 9, NULL, 0, 79, NULL),
(27, 8, NULL, NULL, NULL, 'kilo', 10, NULL, 0, 81, NULL),
(28, 8, NULL, NULL, NULL, 'kilo', 13, NULL, 0, 77, NULL),
(29, 8, NULL, NULL, NULL, 'kilo', 14, NULL, 0, 65, NULL),
(30, 9, NULL, NULL, NULL, 'kilo', 9, NULL, 0, 110, NULL),
(31, 9, NULL, NULL, NULL, 'kilo', 10, NULL, 0, 112, NULL),
(32, 9, NULL, NULL, NULL, 'kilo', 13, NULL, 0, 98, NULL),
(33, 10, NULL, NULL, NULL, 'kilo', 12, NULL, 0, 125, NULL),
(34, 10, NULL, NULL, NULL, 'kilo', 11, NULL, 0, 117, NULL),
(35, 10, NULL, NULL, NULL, 'kilo', 14, NULL, 0, 109, NULL),
(36, 11, NULL, NULL, NULL, 'litro', 9, NULL, 0, 11, NULL),
(37, 11, NULL, NULL, NULL, 'litro', 10, NULL, 0, 11.5, NULL),
(38, 11, NULL, NULL, NULL, 'litro', 11, NULL, 0, 12, NULL),
(39, 11, NULL, NULL, NULL, 'litro', 14, NULL, 0, 10, NULL),
(40, 12, NULL, NULL, NULL, 'litro', 9, NULL, 0, 18, NULL),
(41, 12, NULL, NULL, NULL, 'litro', 14, NULL, 0, 19, NULL),
(42, 12, NULL, NULL, NULL, 'litro', 13, NULL, 0, 15, NULL),
(43, 12, NULL, NULL, NULL, 'litro', 12, NULL, 0, 15.5, NULL),
(44, 12, NULL, NULL, NULL, 'litro', 11, NULL, 0, 16, NULL),
(45, 12, NULL, NULL, NULL, 'litro', 10, NULL, 0, 21, NULL),
(46, 13, NULL, NULL, NULL, 'kilo', 13, NULL, 0, 70, NULL),
(47, 13, NULL, NULL, NULL, 'kilo', 14, NULL, 0, 76, NULL),
(48, 13, NULL, NULL, NULL, 'kilo', 12, NULL, 0, 89, NULL),
(49, 13, NULL, NULL, NULL, 'kilo', 11, NULL, 0, 112, NULL),
(50, 14, NULL, NULL, NULL, 'kilo', 13, NULL, 0, 98, NULL),
(51, 14, NULL, NULL, NULL, 'kilo', 14, NULL, 0, 95, NULL),
(52, 14, NULL, NULL, NULL, 'kilo', 12, NULL, 0, 70.5, NULL),
(53, 14, NULL, NULL, NULL, 'kilo', 11, NULL, 0, 104, NULL),
(54, 15, NULL, NULL, NULL, 'kilo', 10, NULL, 0, 122, NULL),
(55, 15, NULL, NULL, NULL, 'kilo', 9, NULL, 0, 119, NULL),
(56, 16, NULL, NULL, NULL, 'litro', 9, NULL, 0, 12, NULL),
(57, 16, NULL, NULL, NULL, 'litro', 10, NULL, 0, 11.5, NULL),
(58, 16, NULL, NULL, NULL, 'litro', 11, NULL, 0, 11, NULL),
(59, 16, NULL, NULL, NULL, 'litro', 14, NULL, 0, 10.5, NULL),
(60, 17, NULL, NULL, NULL, 'unidad', 17, NULL, 0, 4, NULL),
(61, 17, NULL, NULL, NULL, 'unidad', 16, NULL, 0, 4, NULL),
(62, 17, NULL, NULL, NULL, 'unidad', 15, NULL, 0, 5, NULL),
(63, 18, NULL, NULL, NULL, 'kilo', 15, NULL, 0, 40, NULL),
(64, 18, NULL, NULL, NULL, 'kilo', 17, NULL, 0, 45, NULL),
(65, 18, NULL, NULL, NULL, 'kilo', 16, NULL, 0, 42, NULL),
(66, 19, NULL, NULL, NULL, 'kilo', 18, NULL, 0, 35, NULL),
(67, 20, NULL, NULL, NULL, 'kilo', 18, NULL, 0, 45, NULL),
(68, 21, NULL, NULL, NULL, 'unidad', 17, NULL, 0, 4, NULL),
(69, 21, NULL, NULL, NULL, 'unidad', 16, NULL, 0, 4, NULL),
(70, 21, NULL, NULL, NULL, 'unidad', 15, NULL, 0, 5, NULL),
(71, 22, NULL, NULL, NULL, 'kilo', 18, NULL, 0, 30, NULL),
(72, 23, NULL, NULL, NULL, 'kilo', 18, NULL, 0, 32, NULL);

-- 
-- Dumping data for table marcas
--
INSERT INTO marcas VALUES
(1, 'CONSTANCIA'),
(2, 'CATTIVELLI'),
(3, 'OTTONELO'),
(4, 'SARUBI'),
(5, 'RAUSA'),
(6, 'CENTENARIO'),
(7, 'KALI'),
(8, 'SHNECK'),
(9, 'PARMALAT'),
(10, 'CONAPROLE'),
(11, 'CAPROLET'),
(12, 'CLALDY'),
(13, 'MILKY'),
(14, 'LACTERIA'),
(15, 'SORCHANTES'),
(16, 'MALLORQUINA'),
(17, 'FARGO'),
(18, 'PROPIO');

-- 
-- Dumping data for table gestion
--
INSERT INTO gestion VALUES
(1, '2005-03-05 00:00:00', 4, 2, 0, 0.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '2005-03-05 00:00:00', 8, 9, 0, 0.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '2005-03-05 00:00:00', 11, 11, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, '2005-03-05 00:00:00', 23, 18, 0, 0.5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '2005-03-03 00:00:00', 5, 6, 0, 0.1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '2005-03-03 00:00:00', 4, 8, 0, 0.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, '2005-03-03 00:00:00', 13, 11, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '2005-03-03 00:00:00', 22, 18, 0, 0.5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '2005-03-06 00:00:00', 17, 17, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, '2005-03-06 00:00:00', 11, 14, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, '2005-03-06 00:00:00', 8, 10, 0, 0.4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, '2005-03-06 00:00:00', 12, 13, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '2005-03-06 00:00:00', 13, 11, 0, 1.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, '2005-03-06 00:00:00', 3, 4, 0, 0.25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, '2005-03-07 00:00:00', 5, 7, 0, 0.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, '2005-03-07 00:00:00', 19, 18, 0, 0.5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, '2005-03-07 00:00:00', 16, 11, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, '2005-03-07 00:00:00', 14, 12, 0, 0.8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, '2005-03-07 00:00:00', 6, 8, 0, 1.5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, '2005-03-07 00:00:00', 4, 3, 0, 0.4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, '2005-03-07 00:00:00', 18, 17, 0, 0.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, '2005-03-07 00:00:00', 1, 2, 0, 0.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, '2005-03-07 00:00:00', 3, 7, 0, 0.7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, '2005-03-07 00:00:00', 9, 9, 0, 0.2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, '2005-03-04 00:00:00', 10, 11, 0, 0.1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, '2005-03-04 00:00:00', 12, 14, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, '2005-03-04 00:00:00', 7, 13, 0, 0.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, '2005-03-04 00:00:00', 15, 10, 0, 0.2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, '2005-03-04 00:00:00', 16, 11, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, '2005-03-04 00:00:00', 12, 10, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, '2005-03-04 00:00:00', 3, 4, 0, 0.5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, '2005-03-04 00:00:00', 5, 7, 0, 0.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, '2005-03-04 00:00:00', 8, 14, 0, 0.1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, '2005-03-04 00:00:00', 17, 16, 0, 0.5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, '2005-03-01 00:00:00', 21, 17, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, '2005-03-01 00:00:00', 22, 18, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, '2005-03-01 00:00:00', 20, 18, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, '2005-03-01 00:00:00', 11, 9, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, '2005-03-01 00:00:00', 6, 3, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, '2005-03-01 00:00:00', 4, 5, 0, 0.25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, '2005-03-01 00:00:00', 10, 12, 0, 0.35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, '2005-03-02 00:00:00', 12, 12, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, '2005-03-02 00:00:00', 22, 18, 0, 1.5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, '2005-03-02 00:00:00', 2, 5, 0, 0.8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, '2005-03-02 00:00:00', 8, 10, 0, 0.45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, '2005-03-02 00:00:00', 13, 11, 0, 1.45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;