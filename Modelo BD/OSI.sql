-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 22-05-2016 a las 22:47:00
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `OSI`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `rut` varchar(25) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `contrasenna` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`rut`, `nombre`, `telefono`, `correo`, `contrasenna`) VALUES
('9393265-k', 'Eduardo', '67613043', 'correo@correo.com', '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `posx` double NOT NULL,
  `posy` double NOT NULL,
  `tipo` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas_puntos`
--

CREATE TABLE `empresas_puntos` (
  `idempresa` int(11) NOT NULL,
  `idpunto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_puntos_limpios`
--

CREATE TABLE `estados_puntos_limpios` (
  `id_estado` int(11) NOT NULL,
  `id_punto_limpio` int(11) NOT NULL,
  `vaciado` tinyint(4) NOT NULL DEFAULT '0',
  `estado` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juntas_vecinos`
--

CREATE TABLE `juntas_vecinos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `idpunto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntos_limpios`
--

CREATE TABLE `puntos_limpios` (
  `id` int(11) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `tipo` varchar(63) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `posx` double NOT NULL,
  `posy` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `puntos_limpios`
--

INSERT INTO `puntos_limpios` (`id`, `direccion`, `tipo`, `estado`, `posx`, `posy`) VALUES
(10, 'Tocornal 63, ValparaÃ­so, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', 'Botellas', 0, -33.040180013722534, -71.60214328905568),
(11, 'Molina 316-380, ValparaÃ­so, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', 'Botellas', 0, -33.04550421736434, -71.61991024157032),
(12, 'Dante 152, ValparaÃ­so, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', 'Botellas', 0, -33.042622711749644, -71.63522529881448),
(13, 'Lara 34-36, ValparaÃ­so, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', 'Botellas', 0, -33.02636076699375, -71.63797188084573);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recicladores`
--

CREATE TABLE `recicladores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `posx` double NOT NULL,
  `posy` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`rut`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empresas_puntos`
--
ALTER TABLE `empresas_puntos`
  ADD PRIMARY KEY (`idempresa`,`idpunto`),
  ADD KEY `fk_EMPRESAS_has_PUNTOS_ACOPIO_PUNTOS_ACOPIO1_idx` (`idpunto`),
  ADD KEY `fk_EMPRESAS_has_PUNTOS_ACOPIO_EMPRESAS1_idx` (`idempresa`);

--
-- Indices de la tabla `estados_puntos_limpios`
--
ALTER TABLE `estados_puntos_limpios`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `juntas_vecinos`
--
ALTER TABLE `juntas_vecinos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_JUNTAS_VECINOS_1_idx` (`idpunto`);

--
-- Indices de la tabla `puntos_limpios`
--
ALTER TABLE `puntos_limpios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `recicladores`
--
ALTER TABLE `recicladores`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `puntos_limpios`
--
ALTER TABLE `puntos_limpios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empresas_puntos`
--
ALTER TABLE `empresas_puntos`
  ADD CONSTRAINT `fk_EMPRESAS_has_PUNTOS_ACOPIO_EMPRESAS1` FOREIGN KEY (`idempresa`) REFERENCES `empresas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_EMPRESAS_has_PUNTOS_ACOPIO_PUNTOS_ACOPIO1` FOREIGN KEY (`idpunto`) REFERENCES `puntos_limpios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `juntas_vecinos`
--
ALTER TABLE `juntas_vecinos`
  ADD CONSTRAINT `fk_JUNTAS_VECINOS_1` FOREIGN KEY (`idpunto`) REFERENCES `puntos_limpios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
