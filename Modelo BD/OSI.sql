/*
Navicat MySQL Data Transfer

Source Server         : OSI
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : osi

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-07-05 00:27:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
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
INSERT INTO `admin` VALUES ('19125145-8', 'Anghelo', '123456789', 'alf@alf.alf', '321');
INSERT INTO `admin` VALUES ('9393265-k', 'Eduardo', '67613043', 'correo@correo.com', '123');

-- ----------------------------
-- Table structure for `empresas`
-- ----------------------------
DROP TABLE IF EXISTS `empresas`;
CREATE TABLE `empresas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `posx` double NOT NULL,
  `posy` double NOT NULL,
  `tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of empresas
-- ----------------------------

-- ----------------------------
-- Table structure for `empresas_puntos`
-- ----------------------------
DROP TABLE IF EXISTS `empresas_puntos`;
CREATE TABLE `empresas_puntos` (
  `empresas_id` int(11) NOT NULL,
  `puntos_limpios_id` int(11) NOT NULL,
  PRIMARY KEY (`empresas_id`,`puntos_limpios_id`),
  KEY `fk_empresas_puntos_empresas1_idx` (`empresas_id`),
  KEY `fk_empresas_puntos_puntos_limpios1_idx` (`puntos_limpios_id`),
  CONSTRAINT `fk_empresas_puntos_empresas1` FOREIGN KEY (`empresas_id`) REFERENCES `empresas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_empresas_puntos_puntos_limpios1` FOREIGN KEY (`puntos_limpios_id`) REFERENCES `puntos_limpios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of empresas_puntos
-- ----------------------------

-- ----------------------------
-- Table structure for `estados_puntos_limpios`
-- ----------------------------
DROP TABLE IF EXISTS `estados_puntos_limpios`;
CREATE TABLE `estados_puntos_limpios` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `puntos_limpios_id` int(11) NOT NULL,
  `vaciado` tinyint(4) NOT NULL DEFAULT '0',
  `estado` int(11) NOT NULL,
  `fecha` timestamp NOT NULL,
  PRIMARY KEY (`id_estado`,`puntos_limpios_id`),
  KEY `fk_estados_puntos_limpios_puntos_limpios1_idx` (`puntos_limpios_id`),
  CONSTRAINT `fk_estados_puntos_limpios_puntos_limpios1` FOREIGN KEY (`puntos_limpios_id`) REFERENCES `puntos_limpios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of estados_puntos_limpios
-- ----------------------------
INSERT INTO `estados_puntos_limpios` VALUES ('1', '11', '0', '58', '2016-04-20 14:00:00');
INSERT INTO `estados_puntos_limpios` VALUES ('2', '11', '0', '61', '2016-05-23 13:13:10');
INSERT INTO `estados_puntos_limpios` VALUES ('3', '11', '0', '70', '2016-05-24 13:13:10');
INSERT INTO `estados_puntos_limpios` VALUES ('4', '11', '0', '65', '2016-05-24 15:13:10');
INSERT INTO `estados_puntos_limpios` VALUES ('5', '13', '0', '83', '2016-05-24 09:47:57');
INSERT INTO `estados_puntos_limpios` VALUES ('6', '13', '0', '83', '2016-05-25 10:47:57');
INSERT INTO `estados_puntos_limpios` VALUES ('7', '13', '0', '83', '2016-05-25 11:47:57');
INSERT INTO `estados_puntos_limpios` VALUES ('8', '13', '0', '83', '2016-05-25 12:47:57');
INSERT INTO `estados_puntos_limpios` VALUES ('9', '13', '0', '0', '2016-05-25 13:47:57');
INSERT INTO `estados_puntos_limpios` VALUES ('10', '13', '0', '2', '2016-05-25 14:47:57');
INSERT INTO `estados_puntos_limpios` VALUES ('11', '11', '0', '10', '2016-05-25 15:10:10');
INSERT INTO `estados_puntos_limpios` VALUES ('12', '11', '0', '30', '2016-05-25 16:13:10');
INSERT INTO `estados_puntos_limpios` VALUES ('13', '10', '0', '62', '2016-06-01 12:10:12');
INSERT INTO `estados_puntos_limpios` VALUES ('14', '13', '0', '46', '2016-06-01 13:47:57');
INSERT INTO `estados_puntos_limpios` VALUES ('15', '13', '0', '68', '2016-06-01 14:37:57');
INSERT INTO `estados_puntos_limpios` VALUES ('16', '13', '0', '50', '2016-06-01 15:27:57');
INSERT INTO `estados_puntos_limpios` VALUES ('17', '18', '0', '70', '2016-06-09 11:15:04');
INSERT INTO `estados_puntos_limpios` VALUES ('18', '13', '0', '80', '2016-06-10 08:47:57');
INSERT INTO `estados_puntos_limpios` VALUES ('19', '13', '0', '85', '2016-06-10 10:47:57');
INSERT INTO `estados_puntos_limpios` VALUES ('20', '13', '0', '87', '2016-06-10 11:47:57');
INSERT INTO `estados_puntos_limpios` VALUES ('21', '13', '0', '3', '2016-06-10 14:47:57');
INSERT INTO `estados_puntos_limpios` VALUES ('22', '11', '0', '2', '2016-06-24 23:13:10');
INSERT INTO `estados_puntos_limpios` VALUES ('23', '17', '0', '100', '2016-07-04 17:38:46');

-- ----------------------------
-- Table structure for `juntas_vecinos`
-- ----------------------------
DROP TABLE IF EXISTS `juntas_vecinos`;
CREATE TABLE `juntas_vecinos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `idpunto` int(11) NOT NULL,
  `nombre_contacto` varchar(63) NOT NULL,
  `telefono` varchar(63) NOT NULL,
  `email` varchar(63) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_JUNTAS_VECINOS_1_idx` (`idpunto`),
  CONSTRAINT `fk_JUNTAS_VECINOS_1` FOREIGN KEY (`idpunto`) REFERENCES `puntos_limpios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of juntas_vecinos
-- ----------------------------

-- ----------------------------
-- Table structure for `postulaciones_puntos_limpios`
-- ----------------------------
DROP TABLE IF EXISTS `postulaciones_puntos_limpios`;
CREATE TABLE `postulaciones_puntos_limpios` (
  `id_postulacion` int(11) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(255) NOT NULL,
  `posx` double NOT NULL,
  `posy` double NOT NULL,
  `revisado` tinyint(1) NOT NULL,
  `aceptado` tinyint(1) NOT NULL,
  `juntas_vecinos_id` int(11) NOT NULL,
  `fecha` timestamp NOT NULL,
  PRIMARY KEY (`id_postulacion`,`juntas_vecinos_id`),
  KEY `fk_postulaciones_puntos_limpios_juntas_vecinos1_idx` (`juntas_vecinos_id`),
  CONSTRAINT `fk_postulaciones_puntos_limpios_juntas_vecinos1` FOREIGN KEY (`juntas_vecinos_id`) REFERENCES `juntas_vecinos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of postulaciones_puntos_limpios
-- ----------------------------

-- ----------------------------
-- Table structure for `puntos_limpios`
-- ----------------------------
DROP TABLE IF EXISTS `puntos_limpios`;
CREATE TABLE `puntos_limpios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(255) NOT NULL,
  `tipo` varchar(63) NOT NULL,
  `estado_pl` tinyint(4) NOT NULL,
  `posx` double NOT NULL,
  `posy` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of puntos_limpios
-- ----------------------------
INSERT INTO `puntos_limpios` VALUES ('10', 'Tocornal 63, ValparaÃ­so, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', 'Botellas', '0', '-33.040180013722534', '-71.60214328905568');
INSERT INTO `puntos_limpios` VALUES ('11', 'Molina 316-380, ValparaÃ­so, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', 'Botellas', '0', '-33.04550421736434', '-71.61991024157032');
INSERT INTO `puntos_limpios` VALUES ('12', 'Dante 152, ValparaÃ­so, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', 'Botellas', '0', '-33.042622711749644', '-71.63522529881448');
INSERT INTO `puntos_limpios` VALUES ('13', 'Lara 34-36, ValparaÃ­so, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', 'Botellas', '0', '-33.02636076699375', '-71.63797188084573');
INSERT INTO `puntos_limpios` VALUES ('14', 'Los Placeres 399, ValparaÃ­so, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', 'Botellas', '0', '-33.03669392520552', '-71.59563057124615');
INSERT INTO `puntos_limpios` VALUES ('15', 'Edwards 150, ValparaÃ­so, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', 'Botellas', '0', '-33.04464445243333', '-71.61889538168907');
INSERT INTO `puntos_limpios` VALUES ('17', 'Javiera Carrera 426-504, ValparaÃ­so, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', 'Botellas', '0', '-33.03795310629821', '-71.59065037965775');
INSERT INTO `puntos_limpios` VALUES ('18', 'Guillermo Munnich 339, ValparaÃ­so, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', 'Latas', '0', '-33.04687478818968', '-71.63373738527298');
INSERT INTO `puntos_limpios` VALUES ('19', 'Blanco Viel 415, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', 'Botellas', '0', '-33.04119091789752', '-71.60146504640579');

-- ----------------------------
-- Table structure for `recicladores`
-- ----------------------------
DROP TABLE IF EXISTS `recicladores`;
CREATE TABLE `recicladores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `posx` double NOT NULL,
  `posy` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of recicladores
-- ----------------------------

-- ----------------------------
-- Table structure for `recicladores_puntos_limpios`
-- ----------------------------
DROP TABLE IF EXISTS `recicladores_puntos_limpios`;
CREATE TABLE `recicladores_puntos_limpios` (
  `id_pl` int(11) NOT NULL,
  `recicladores_id` int(11) NOT NULL,
  PRIMARY KEY (`id_pl`,`recicladores_id`),
  KEY `fk_recicladores_puntos_limpios_recicladores1_idx` (`recicladores_id`),
  CONSTRAINT `fk_recicladores_puntos_limpios_estados_puntos_limpios1` FOREIGN KEY (`id_pl`) REFERENCES `puntos_limpios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_recicladores_puntos_limpios_recicladores1` FOREIGN KEY (`recicladores_id`) REFERENCES `recicladores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of recicladores_puntos_limpios
-- ----------------------------

-- ----------------------------
-- Table structure for `solicitud_juntas_vecinos`
-- ----------------------------
DROP TABLE IF EXISTS `solicitud_juntas_vecinos`;
CREATE TABLE `solicitud_juntas_vecinos` (
  `id_soli` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(63) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `posx` double NOT NULL,
  `posy` double NOT NULL,
  `fecha` timestamp NOT NULL,
  `mostrar` tinyint(4) NOT NULL DEFAULT '1',
  `nombre_contacto` varchar(63) NOT NULL,
  `telefono` varchar(63) NOT NULL,
  `email` varchar(63) NOT NULL,
  PRIMARY KEY (`id_soli`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of solicitud_juntas_vecinos
-- ----------------------------
INSERT INTO `solicitud_juntas_vecinos` VALUES ('1', 'Casa Fede', 'ValdÃ©s 157, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', '-33.03497137567222', '-71.59266019240022', '0000-00-00 00:00:00', '1', '', '', '');
INSERT INTO `solicitud_juntas_vecinos` VALUES ('2', 'TEST', 'Paseo Gervasoni 408-488, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', '-33.041369668613214', '-71.62635996937752', '2016-07-04 17:39:50', '1', '', '', '');
INSERT INTO `solicitud_juntas_vecinos` VALUES ('3', 'El bosque', 'Dieciocho 465, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', '-33.051801786369964', '-71.61563113331795', '2016-07-05 00:26:34', '1', 'Juanito Perez', '+569123456789', 'juanito.perez@mail.com');

-- ----------------------------
-- Table structure for `vaciado`
-- ----------------------------
DROP TABLE IF EXISTS `vaciado`;
CREATE TABLE `vaciado` (
  `idVaciado` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL,
  `id_pl` int(11) NOT NULL,
  `recicladores_id` int(11) NOT NULL,
  PRIMARY KEY (`idVaciado`),
  KEY `fk_Vaciado_recicladores_puntos_limpios1_idx` (`id_pl`,`recicladores_id`),
  CONSTRAINT `fk_Vaciado_recicladores_puntos_limpios1` FOREIGN KEY (`id_pl`, `recicladores_id`) REFERENCES `recicladores_puntos_limpios` (`id_pl`, `recicladores_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vaciado
-- ----------------------------
INSERT INTO `vaciado` VALUES ('1', '2016-06-24 13:13:10', '11', '1');
INSERT INTO `vaciado` VALUES ('2', '2016-05-25 13:00:00', '13', '1');
INSERT INTO `vaciado` VALUES ('3', '2016-06-10 13:23:00', '13', '1');
