-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-07-2019 a las 06:29:06
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `calidad_modulos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `causales`
--

CREATE TABLE `causales` (
  `idCausales` int(11) NOT NULL,
  `CausalesNombre` varchar(45) NOT NULL,
  `CausalesRequisito` varchar(45) NOT NULL,
  `CausalesTipo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `causales`
--

INSERT INTO `causales` (`idCausales`, `CausalesNombre`, `CausalesRequisito`, `CausalesTipo`) VALUES
(1, 'ROBO O HURTO', 'Debe venir con informe de prevencionista de o', 'SOBRE CONSUMO'),
(2, 'RECURSO NO PRESUPUESTADO', 'Debe adjuntarse informe a departamento presup', 'NO PRESUPUESTADO'),
(3, 'MAYOR CANTIDAD RECURSO', 'Debe estar informado en informe piloto de inn', 'SOBRE CONSUMO'),
(4, 'MERMAS DE BODEGA', 'Debe adjuntarse el informe de mermas (jefe de', 'SOBRE CONSUMO'),
(5, 'CAMBIO DE RECURSO', 'Recurso real a utilizar y resumen (1 linea) d', 'CAMBIO DE RECURSO'),
(6, 'PRESUPUESTO NO EN CONTROL ', 'Cuando el presupuesto no está en control ', 'NO PRESUPUESTADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `is_private_key` tinyint(1) NOT NULL DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `keys`
--

INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 1, 'master', 1, 1, 1, '1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud`
--

CREATE TABLE `solicitud` (
  `idSolicitud` int(11) NOT NULL,
  `Solicitud_cantidad` int(11) NOT NULL,
  `Solicitud_Total` int(11) NOT NULL,
  `SolicitudCantidad_enOrden` int(11) DEFAULT NULL,
  `SolicitudCantidad_porComprar` int(11) DEFAULT NULL,
  `SolicitudCantidad_recepcion` int(11) DEFAULT NULL,
  `SolicitudUltimo_precio` int(11) DEFAULT NULL,
  `SolicitudNumero_orden` varchar(45) DEFAULT NULL,
  `SolicitudArchivo` varchar(45) DEFAULT NULL,
  `SolicitudJustificacion` text DEFAULT NULL,
  `SolicitudObservacion` text DEFAULT NULL,
  `SolicitudRecurso_codigo` varchar(45) NOT NULL,
  `SolicitudRecurso_nombre` varchar(45) NOT NULL,
  `SolicitudRecurso_unidad` varchar(6) NOT NULL,
  `Causales_idCausales` int(11) NOT NULL,
  `idObra` int(11) NOT NULL,
  `SolicitudEstado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `solicitud`
--

INSERT INTO `solicitud` (`idSolicitud`, `Solicitud_cantidad`, `Solicitud_Total`, `SolicitudCantidad_enOrden`, `SolicitudCantidad_porComprar`, `SolicitudCantidad_recepcion`, `SolicitudUltimo_precio`, `SolicitudNumero_orden`, `SolicitudArchivo`, `SolicitudJustificacion`, `SolicitudObservacion`, `SolicitudRecurso_codigo`, `SolicitudRecurso_nombre`, `SolicitudRecurso_unidad`, `Causales_idCausales`, `idObra`, `SolicitudEstado`) VALUES
(52, 25, 2, 2, 320, 2, 2125, '', '', '7', '1.651.125', 'CCACAC0002', 'CEMENTO', 'SACO', 3, 19, 3),
(53, 0, 0, 618, 0, 618, 45788, '', '', '7', '', 'CCACAA0119', 'HORMIGON HN 20(90) 20 18', 'M3', 3, 19, 2),
(54, 0, 0, 180, 0, 179, 57849, '', '', '77', '', 'CCACAA0111', 'HORMIGON HN 30(90) 20 08', 'M3', 3, 19, 2),
(55, 4, 700, 4, 0, 4, 541, NULL, '', '7', NULL, 'CCPCPF0058', 'ZZZZCODO BR HE-SO 1/2\"', 'UNI', 3, 19, 1),
(56, 3, 1, 0, 0, 0, 1747, '', '', '77', '1.357.419', 'CCQCQA0010', 'ZZZZLLAVE PASO BOLA HI-HI 19mm', 'UNI', 3, 19, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_estados`
--

CREATE TABLE `solicitud_estados` (
  `idSolicitud_estados` int(11) NOT NULL,
  `Solicitud_estadosFecha` date NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `Solicitud_estadosEstado` tinyint(1) NOT NULL,
  `Solicitud_estadosNueva_cantidad` int(11) DEFAULT NULL,
  `Solicitud_estadosNuevo_total` int(11) DEFAULT NULL,
  `Solicitud_idSolicitud` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `solicitud_estados`
--

INSERT INTO `solicitud_estados` (`idSolicitud_estados`, `Solicitud_estadosFecha`, `idUsuario`, `Solicitud_estadosEstado`, `Solicitud_estadosNueva_cantidad`, `Solicitud_estadosNuevo_total`, `Solicitud_idSolicitud`) VALUES
(98, '2019-07-25', 66, 1, 777, 1651125, 52),
(99, '2019-07-25', 66, 1, 77, 3525676, 53),
(100, '2019-07-25', 66, 1, 77, 4454373, 54),
(101, '2019-07-25', 66, 1, 7777, 4207357, 55),
(102, '2019-07-25', 66, 1, 777, 1357419, 56),
(103, '2019-07-25', 66, 3, 777, 1, 52),
(104, '2019-07-25', 66, 2, 77, 3525676, 53),
(105, '2019-07-25', 66, 2, 77, 4454373, 54),
(106, '2019-07-25', 66, 3, 777, 1357419, 56);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_recurso`
--

CREATE TABLE `solicitud_recurso` (
  `idSolicitud_recurso` int(11) NOT NULL,
  `Solicitud_recursoCodigo` varchar(45) NOT NULL,
  `Solicitud_recursoDescripcion` varchar(45) NOT NULL,
  `Solicitud_recursoUnidad` varchar(6) NOT NULL,
  `Solicitud_recursoCantidad` int(11) NOT NULL,
  `Solicitud_recursoPrecio` int(11) NOT NULL,
  `Solicitud_idSolicitud` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vp_solicitud`
--

CREATE TABLE `vp_solicitud` (
  `idvp_solicitud` int(11) NOT NULL,
  `idObra` int(11) NOT NULL,
  `vp_solicitudEstado` tinyint(1) NOT NULL,
  `vp_solicitudDescripcion` varchar(200) DEFAULT NULL,
  `vp_solicitudUnidad` varchar(10) DEFAULT NULL,
  `vp_solicitudCantidad` int(11) DEFAULT NULL,
  `vp_solicitudPrecio` int(11) DEFAULT NULL,
  `vp_solicitudActividad` varchar(200) DEFAULT NULL,
  `vp_solicitudRecurso` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vp_solicitud`
--

INSERT INTO `vp_solicitud` (`idvp_solicitud`, `idObra`, `vp_solicitudEstado`, `vp_solicitudDescripcion`, `vp_solicitudUnidad`, `vp_solicitudCantidad`, `vp_solicitudPrecio`, `vp_solicitudActividad`, `vp_solicitudRecurso`) VALUES
(23, 3, 3, 'ABRAZADERA', 'UNI', 0, 0, 'PLANTA ALCANTARILLADO NOGAL ESTANDAR', 'CCPCPF0221');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vp_solicitud_estado`
--

CREATE TABLE `vp_solicitud_estado` (
  `idvp_solicitud_estado` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `vp_solicitud_estadoEstado` tinyint(1) NOT NULL,
  `vp_solicitud_estadoFecha` date NOT NULL,
  `vp_solicitud_estadoCantidad` int(11) DEFAULT NULL,
  `vp_solicitud_estadoPrecio` int(11) DEFAULT NULL,
  `vp_solicitud_idvp_solicitud` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vp_solicitud_estado`
--

INSERT INTO `vp_solicitud_estado` (`idvp_solicitud_estado`, `idUsuario`, `vp_solicitud_estadoEstado`, `vp_solicitud_estadoFecha`, `vp_solicitud_estadoCantidad`, `vp_solicitud_estadoPrecio`, `vp_solicitud_idvp_solicitud`) VALUES
(34, 114, 1, '2019-06-18', 8, 8, 23),
(35, 3, 3, '2019-07-05', 8, 8, 23);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `causales`
--
ALTER TABLE `causales`
  ADD PRIMARY KEY (`idCausales`);

--
-- Indices de la tabla `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD PRIMARY KEY (`idSolicitud`,`Causales_idCausales`),
  ADD KEY `fk_Solicitud_Causales1_idx` (`Causales_idCausales`);

--
-- Indices de la tabla `solicitud_estados`
--
ALTER TABLE `solicitud_estados`
  ADD PRIMARY KEY (`idSolicitud_estados`,`Solicitud_idSolicitud`),
  ADD KEY `fk_Solicitud_estados_Solicitud1_idx` (`Solicitud_idSolicitud`);

--
-- Indices de la tabla `solicitud_recurso`
--
ALTER TABLE `solicitud_recurso`
  ADD PRIMARY KEY (`idSolicitud_recurso`,`Solicitud_idSolicitud`),
  ADD KEY `fk_Solicitud_recurso_Solicitud1_idx` (`Solicitud_idSolicitud`);

--
-- Indices de la tabla `vp_solicitud`
--
ALTER TABLE `vp_solicitud`
  ADD PRIMARY KEY (`idvp_solicitud`);

--
-- Indices de la tabla `vp_solicitud_estado`
--
ALTER TABLE `vp_solicitud_estado`
  ADD PRIMARY KEY (`idvp_solicitud_estado`,`vp_solicitud_idvp_solicitud`),
  ADD KEY `fk_vp_solicitud_estado_vp_solicitud1_idx` (`vp_solicitud_idvp_solicitud`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `causales`
--
ALTER TABLE `causales`
  MODIFY `idCausales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `solicitud`
--
ALTER TABLE `solicitud`
  MODIFY `idSolicitud` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `solicitud_estados`
--
ALTER TABLE `solicitud_estados`
  MODIFY `idSolicitud_estados` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT de la tabla `solicitud_recurso`
--
ALTER TABLE `solicitud_recurso`
  MODIFY `idSolicitud_recurso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `vp_solicitud`
--
ALTER TABLE `vp_solicitud`
  MODIFY `idvp_solicitud` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `vp_solicitud_estado`
--
ALTER TABLE `vp_solicitud_estado`
  MODIFY `idvp_solicitud_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD CONSTRAINT `fk_Solicitud_Causales1` FOREIGN KEY (`Causales_idCausales`) REFERENCES `causales` (`idCausales`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `solicitud_estados`
--
ALTER TABLE `solicitud_estados`
  ADD CONSTRAINT `fk_Solicitud_estados_Solicitud1` FOREIGN KEY (`Solicitud_idSolicitud`) REFERENCES `solicitud` (`idSolicitud`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `solicitud_recurso`
--
ALTER TABLE `solicitud_recurso`
  ADD CONSTRAINT `fk_Solicitud_recurso_Solicitud1` FOREIGN KEY (`Solicitud_idSolicitud`) REFERENCES `solicitud` (`idSolicitud`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vp_solicitud_estado`
--
ALTER TABLE `vp_solicitud_estado`
  ADD CONSTRAINT `fk_vp_solicitud_estado_vp_solicitud1` FOREIGN KEY (`vp_solicitud_idvp_solicitud`) REFERENCES `vp_solicitud` (`idvp_solicitud`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
