/*
Navicat MySQL Data Transfer

Source Server         : OSI
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : osi

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-05-21 21:30:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for empresas
-- ----------------------------
DROP TABLE IF EXISTS `empresas`;
CREATE TABLE `empresas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `posx` double NOT NULL,
  `posy` double NOT NULL,
  `tipo` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for empresas_puntos
-- ----------------------------
DROP TABLE IF EXISTS `empresas_puntos`;
CREATE TABLE `empresas_puntos` (
  `idempresa` int(11) NOT NULL,
  `idpunto` int(11) NOT NULL,
  PRIMARY KEY (`idempresa`,`idpunto`),
  KEY `fk_EMPRESAS_has_PUNTOS_ACOPIO_PUNTOS_ACOPIO1_idx` (`idpunto`),
  KEY `fk_EMPRESAS_has_PUNTOS_ACOPIO_EMPRESAS1_idx` (`idempresa`),
  CONSTRAINT `fk_EMPRESAS_has_PUNTOS_ACOPIO_EMPRESAS1` FOREIGN KEY (`idempresa`) REFERENCES `empresas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPRESAS_has_PUNTOS_ACOPIO_PUNTOS_ACOPIO1` FOREIGN KEY (`idpunto`) REFERENCES `puntos_limpios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for estados_puntos_limpios
-- ----------------------------
DROP TABLE IF EXISTS `estados_puntos_limpios`;
CREATE TABLE `estados_puntos_limpios` (
  `id_estado` int(11) NOT NULL,
  `id_punto_limpio` int(11) NOT NULL,
  `vaciado` tinyint(4) NOT NULL DEFAULT '0',
  `estado` int(11) NOT NULL,
  `fecha` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for juntas_vecinos
-- ----------------------------
DROP TABLE IF EXISTS `juntas_vecinos`;
CREATE TABLE `juntas_vecinos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `idpunto` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_JUNTAS_VECINOS_1_idx` (`idpunto`),
  CONSTRAINT `fk_JUNTAS_VECINOS_1` FOREIGN KEY (`idpunto`) REFERENCES `puntos_limpios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for puntos_limpios
-- ----------------------------
DROP TABLE IF EXISTS `puntos_limpios`;
CREATE TABLE `puntos_limpios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(255) NOT NULL,
  `tipo` varchar(63) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `posx` double NOT NULL,
  `posy` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for recicladores
-- ----------------------------
DROP TABLE IF EXISTS `recicladores`;
CREATE TABLE `recicladores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `posx` double NOT NULL,
  `posy` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
