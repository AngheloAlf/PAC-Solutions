-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 05-07-2016 a las 21:33:09
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
('19125145-8', 'Anghelo', '123456789', 'alf@alf.alf', '321'),
('9393265-k', 'Eduardo', '67613043', 'correo@correo.com', '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `posx` double NOT NULL,
  `posy` double NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas_puntos`
--

CREATE TABLE `empresas_puntos` (
  `empresas_id` int(11) NOT NULL,
  `puntos_limpios_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_puntos_limpios`
--

CREATE TABLE `estados_puntos_limpios` (
  `id_estado` int(11) NOT NULL,
  `puntos_limpios_id` int(11) NOT NULL,
  `vaciado` tinyint(4) NOT NULL DEFAULT '0',
  `estado` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estados_puntos_limpios`
--

INSERT INTO `estados_puntos_limpios` (`id_estado`, `puntos_limpios_id`, `vaciado`, `estado`, `fecha`) VALUES
(1, 11, 1, 58, '2016-07-05 02:28:27'),
(2, 11, 0, 61, '2016-05-23 21:13:10'),
(3, 11, 0, 70, '2016-05-24 21:13:10'),
(4, 11, 1, 65, '2016-07-05 02:28:27'),
(5, 13, 1, 83, '2016-07-05 02:28:28'),
(6, 13, 1, 83, '2016-07-05 02:28:28'),
(7, 13, 1, 83, '2016-07-05 02:28:28'),
(8, 13, 1, 83, '2016-07-05 02:28:28'),
(9, 13, 1, 0, '2016-07-05 02:28:27'),
(10, 13, 1, 2, '2016-07-05 02:28:27'),
(11, 11, 1, 10, '2016-07-05 02:28:27'),
(12, 11, 1, 30, '2016-07-05 02:28:27'),
(13, 10, 0, 62, '2016-06-01 20:10:12'),
(14, 13, 1, 46, '2016-07-05 02:28:27'),
(15, 13, 0, 68, '2016-06-01 22:37:57'),
(16, 13, 1, 50, '2016-07-05 02:28:27'),
(17, 18, 0, 70, '2016-06-09 19:15:04'),
(18, 13, 1, 80, '2016-07-05 02:28:27'),
(19, 13, 1, 85, '2016-07-05 02:28:27'),
(20, 13, 1, 87, '2016-07-05 02:28:27'),
(21, 13, 0, 3, '2016-06-10 22:47:57'),
(22, 11, 0, 2, '2016-06-25 07:13:10'),
(23, 15, 36, 0, '2016-07-05 08:48:51'),
(24, 15, 44, 0, '2016-07-05 08:49:04'),
(25, 15, 49, 0, '2016-07-05 08:49:18'),
(26, 15, 42, 0, '2016-07-05 08:49:30'),
(27, 15, 0, 47, '2016-07-05 09:07:18'),
(28, 15, 0, 45, '2016-07-05 09:07:33'),
(29, 15, 0, 40, '2016-07-05 09:07:45'),
(30, 15, 0, 46, '2016-07-05 09:07:58'),
(31, 18, 0, 44, '2016-07-05 11:20:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juntas_vecinos`
--

CREATE TABLE `juntas_vecinos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `idpunto` int(11) NOT NULL,
  `nombre_contacto` varchar(63) NOT NULL,
  `telefono` varchar(63) NOT NULL,
  `email` varchar(63) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `postulaciones_puntos_limpios`
--

CREATE TABLE `postulaciones_puntos_limpios` (
  `id_postulacion` int(11) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `posx` double NOT NULL,
  `posy` double NOT NULL,
  `revisado` tinyint(1) NOT NULL,
  `aceptado` tinyint(1) NOT NULL,
  `juntas_vecinos_id` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntos_limpios`
--

CREATE TABLE `puntos_limpios` (
  `id` int(11) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `tipo` varchar(63) NOT NULL,
  `estado_pl` tinyint(4) NOT NULL,
  `posx` double NOT NULL,
  `posy` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `puntos_limpios`
--

INSERT INTO `puntos_limpios` (`id`, `direccion`, `tipo`, `estado_pl`, `posx`, `posy`) VALUES
(10, 'Tocornal 63, ValparaÃ­so, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', 'Botellas', 0, -33.040180013722534, -71.60214328905568),
(11, 'Molina 316-380, ValparaÃ­so, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', 'Botellas', 0, -33.04550421736434, -71.61991024157032),
(12, 'Dante 152, ValparaÃ­so, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', 'Botellas', 0, -33.042622711749644, -71.63522529881448),
(13, 'Lara 34-36, ValparaÃ­so, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', 'Botellas', 0, -33.02636076699375, -71.63797188084573),
(14, 'Los Placeres 399, ValparaÃ­so, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', 'Botellas', 0, -33.03669392520552, -71.59563057124615),
(15, 'Edwards 150, ValparaÃ­so, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', 'Botellas', 0, -33.04464445243333, -71.61889538168907),
(17, 'Javiera Carrera 426-504, ValparaÃ­so, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', 'Botellas', 0, -33.03795310629821, -71.59065037965775),
(18, 'Guillermo Munnich 339, ValparaÃ­so, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', 'Latas', 0, -33.04687478818968, -71.63373738527298),
(19, 'Blanco Viel 415, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', 'Botellas', 0, -33.04119091789752, -71.60146504640579),
(20, 'ErrÃ¡zuriz 2190, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', 'Latas', 0, -33.044077866208724, -71.61251876503229);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recicladores`
--

CREATE TABLE `recicladores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contacto` varchar(12) NOT NULL,
  `password` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `posx` double NOT NULL,
  `posy` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `recicladores`
--

INSERT INTO `recicladores` (`id`, `nombre`, `correo`, `contacto`, `password`, `direccion`, `descripcion`, `posx`, `posy`) VALUES
(1, 'Perico', 'email@email.com', '238282', '123', 'VicuÃ±a Mackenna 180-274, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', NULL, -33.05125615384735, -71.61936235323083);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recicladores_puntos_limpios`
--

CREATE TABLE `recicladores_puntos_limpios` (
  `id_pl` int(11) NOT NULL,
  `recicladores_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_juntas_vecinos`
--

CREATE TABLE `solicitud_juntas_vecinos` (
  `id_soli` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(63) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `posx` double NOT NULL,
  `posy` double NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mostrar` tinyint(4) NOT NULL DEFAULT '1',
  `nombre_contacto` varchar(63) NOT NULL,
  `telefono` varchar(63) NOT NULL,
  `email` varchar(63) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `solicitud_juntas_vecinos`
--

INSERT INTO `solicitud_juntas_vecinos` (`id_soli`, `nombre`, `direccion`, `posx`, `posy`, `fecha`, `mostrar`, `nombre_contacto`, `telefono`, `email`) VALUES
(1, 'Nombre', 'ValdÃ©s 157, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', -33.03497137567222, -71.59266019240022, '2016-07-03 17:25:14', 1, 'Nombre', '+56932165498', 'fulanito.delmal@correo.correo'),
(2, 'TEST', 'Paseo Gervasoni 408-488, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', -33.041369668613214, -71.62635996937752, '2016-07-04 21:39:50', 1, 'Otra persona', '+56985285285', 'maldad@mail.net'),
(3, 'El bosque', 'Dieciocho 465, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', -33.051801786369964, -71.61563113331795, '2016-07-05 04:26:34', 1, 'Juanito Perez', '+569123456789', 'juanito.perez@mail.com'),
(4, 'Junta', 'JosÃ© TomÃ¡s Ramos 693, ValparaÃ­so, RegiÃ³n de ValparaÃ­so, Chile', -33.04358266236688, -71.63320161402225, '2016-07-05 15:26:19', 1, 'Sr. Don Contacto', '+5691234598', 'correofalso@mentiras.muajajaja');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vaciado`
--

CREATE TABLE `vaciado` (
  `idVaciado` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_pl` int(11) NOT NULL,
  `recicladores_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vaciado`
--

INSERT INTO `vaciado` (`idVaciado`, `fecha`, `id_pl`, `recicladores_id`) VALUES
(1, '2016-06-24 17:13:10', 11, 1),
(2, '2016-05-25 17:00:00', 13, 1),
(3, '2016-06-10 17:23:00', 13, 1);

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
  ADD PRIMARY KEY (`empresas_id`,`puntos_limpios_id`),
  ADD KEY `fk_empresas_puntos_empresas1_idx` (`empresas_id`),
  ADD KEY `fk_empresas_puntos_puntos_limpios1_idx` (`puntos_limpios_id`);

--
-- Indices de la tabla `estados_puntos_limpios`
--
ALTER TABLE `estados_puntos_limpios`
  ADD PRIMARY KEY (`id_estado`,`puntos_limpios_id`),
  ADD KEY `fk_estados_puntos_limpios_puntos_limpios1_idx` (`puntos_limpios_id`);

--
-- Indices de la tabla `juntas_vecinos`
--
ALTER TABLE `juntas_vecinos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_JUNTAS_VECINOS_1_idx` (`idpunto`);

--
-- Indices de la tabla `postulaciones_puntos_limpios`
--
ALTER TABLE `postulaciones_puntos_limpios`
  ADD PRIMARY KEY (`id_postulacion`,`juntas_vecinos_id`),
  ADD KEY `fk_postulaciones_puntos_limpios_juntas_vecinos1_idx` (`juntas_vecinos_id`);

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
-- Indices de la tabla `recicladores_puntos_limpios`
--
ALTER TABLE `recicladores_puntos_limpios`
  ADD PRIMARY KEY (`id_pl`,`recicladores_id`),
  ADD KEY `fk_recicladores_puntos_limpios_recicladores1_idx` (`recicladores_id`);

--
-- Indices de la tabla `solicitud_juntas_vecinos`
--
ALTER TABLE `solicitud_juntas_vecinos`
  ADD PRIMARY KEY (`id_soli`);

--
-- Indices de la tabla `vaciado`
--
ALTER TABLE `vaciado`
  ADD PRIMARY KEY (`idVaciado`),
  ADD KEY `fk_Vaciado_recicladores_puntos_limpios1_idx` (`id_pl`,`recicladores_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `estados_puntos_limpios`
--
ALTER TABLE `estados_puntos_limpios`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT de la tabla `juntas_vecinos`
--
ALTER TABLE `juntas_vecinos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `postulaciones_puntos_limpios`
--
ALTER TABLE `postulaciones_puntos_limpios`
  MODIFY `id_postulacion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `puntos_limpios`
--
ALTER TABLE `puntos_limpios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `recicladores`
--
ALTER TABLE `recicladores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `solicitud_juntas_vecinos`
--
ALTER TABLE `solicitud_juntas_vecinos`
  MODIFY `id_soli` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `vaciado`
--
ALTER TABLE `vaciado`
  MODIFY `idVaciado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empresas_puntos`
--
ALTER TABLE `empresas_puntos`
  ADD CONSTRAINT `fk_empresas_puntos_empresas1` FOREIGN KEY (`empresas_id`) REFERENCES `empresas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empresas_puntos_puntos_limpios1` FOREIGN KEY (`puntos_limpios_id`) REFERENCES `puntos_limpios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estados_puntos_limpios`
--
ALTER TABLE `estados_puntos_limpios`
  ADD CONSTRAINT `fk_estados_puntos_limpios_puntos_limpios1` FOREIGN KEY (`puntos_limpios_id`) REFERENCES `puntos_limpios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `juntas_vecinos`
--
ALTER TABLE `juntas_vecinos`
  ADD CONSTRAINT `fk_JUNTAS_VECINOS_1` FOREIGN KEY (`idpunto`) REFERENCES `puntos_limpios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `postulaciones_puntos_limpios`
--
ALTER TABLE `postulaciones_puntos_limpios`
  ADD CONSTRAINT `fk_postulaciones_puntos_limpios_juntas_vecinos1` FOREIGN KEY (`juntas_vecinos_id`) REFERENCES `juntas_vecinos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `recicladores_puntos_limpios`
--
ALTER TABLE `recicladores_puntos_limpios`
  ADD CONSTRAINT `fk_recicladores_puntos_limpios_estados_puntos_limpios1` FOREIGN KEY (`id_pl`) REFERENCES `puntos_limpios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_recicladores_puntos_limpios_recicladores1` FOREIGN KEY (`recicladores_id`) REFERENCES `recicladores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vaciado`
--
ALTER TABLE `vaciado`
  ADD CONSTRAINT `fk_Vaciado_recicladores_puntos_limpios1` FOREIGN KEY (`id_pl`,`recicladores_id`) REFERENCES `recicladores_puntos_limpios` (`id_pl`, `recicladores_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
