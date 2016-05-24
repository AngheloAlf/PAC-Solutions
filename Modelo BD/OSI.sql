/*
Navicat MySQL Data Transfer

Source Server         : OSI
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : osi

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-05-24 00:12:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `rut` varchar(25) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `contrasenna` varchar(45) NOT NULL,
  PRIMARY KEY (`rut`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('9393265-k', 'Eduardo', '67613043', 'correo@correo.com', '123');

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
-- Records of empresas
-- ----------------------------

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
-- Records of empresas_puntos
-- ----------------------------

-- ----------------------------
-- Table structure for estados_puntos_limpios
-- ----------------------------
DROP TABLE IF EXISTS `estados_puntos_limpios`;
CREATE TABLE `estados_puntos_limpios` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `id_punto_limpio` int(11) NOT NULL,
  `vaciado` tinyint(4) NOT NULL DEFAULT '0',
  `estado` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of estados_puntos_limpios
-- ----------------------------
INSERT INTO `estados_puntos_limpios` VALUES ('1', '11', '0', '58', '0000-00-00 00:00:00');
INSERT INTO `estados_puntos_limpios` VALUES ('2', '11', '0', '61', '2016-05-23 13:13:10');

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
-- Records of juntas_vecinos
-- ----------------------------

-- ----------------------------
-- Table structure for postulaciones_puntos_limpios
-- ----------------------------
DROP TABLE IF EXISTS `postulaciones_puntos_limpios`;
CREATE TABLE `postulaciones_puntos_limpios` (
  `id_postulacion` int(11) NOT NULL AUTO_INCREMENT,
  `posx` varchar(255) NOT NULL,
  `posy` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `revisado` tinyint(1) NOT NULL DEFAULT '0',
  `aceptado` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_postulacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of postulaciones_puntos_limpios
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of puntos_limpios
-- ----------------------------
INSERT INTO `puntos_limpios` VALUES ('10', 'Tocornal 63, ValparaÃ­so, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', 'Botellas', '0', '-33.040180013722534', '-71.60214328905568');
INSERT INTO `puntos_limpios` VALUES ('11', 'Molina 316-380, ValparaÃ­so, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', 'Botellas', '0', '-33.04550421736434', '-71.61991024157032');
INSERT INTO `puntos_limpios` VALUES ('12', 'Dante 152, ValparaÃ­so, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', 'Botellas', '0', '-33.042622711749644', '-71.63522529881448');
INSERT INTO `puntos_limpios` VALUES ('13', 'Lara 34-36, ValparaÃ­so, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', 'Botellas', '0', '-33.02636076699375', '-71.63797188084573');
INSERT INTO `puntos_limpios` VALUES ('14', 'Los Placeres 399, ValparaÃ­so, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', 'Botellas', '0', '-33.03669392520552', '-71.59563057124615');

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

-- ----------------------------
-- Records of recicladores
-- ----------------------------
