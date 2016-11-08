-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 08-11-2016 a las 10:03:07
-- Versión del servidor: 5.5.50-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `db_fruteria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_clientes`
--

CREATE TABLE IF NOT EXISTS `tbl_clientes` (
  `cedula` int(12) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `direccion` varchar(40) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_clientes`
--

INSERT INTO `tbl_clientes` (`cedula`, `nombres`, `apellidos`, `direccion`, `telefono`) VALUES
(12, 'Allan', 'Perez', 'Santos', '123'),
(11, '11', '113', '11', '11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_productos`
--

CREATE TABLE IF NOT EXISTS `tbl_productos` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `precio` int(10) NOT NULL,
  `cantidad` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `tbl_productos`
--

INSERT INTO `tbl_productos` (`id`, `nombre`, `precio`, `cantidad`) VALUES
(3, 'chocorramo', 1000, 10),
(4, '2', 2, 2),
(5, 'Bimbo', 0, 35),
(6, 'Pan tajado', 0, 200);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_proveedores`
--

CREATE TABLE IF NOT EXISTS `tbl_proveedores` (
  `nit` int(12) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `telefono` varchar(40) DEFAULT NULL,
  `producto` varchar(30) NOT NULL,
  `precio` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_proveedores`
--

INSERT INTO `tbl_proveedores` (`nit`, `nombre`, `direccion`, `telefono`, `producto`, `precio`) VALUES
(1, '1', '1', '1', '1', 1),
(890066066, 'Bimbo', 'Crr 11 ', '89191', 'Pan tajado', 2000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuarios`
--

CREATE TABLE IF NOT EXISTS `tbl_usuarios` (
  `cedula` int(12) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `direccion` varchar(40) DEFAULT NULL,
  `usuario` varchar(20) NOT NULL,
  `contrasena` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_usuarios`
--

INSERT INTO `tbl_usuarios` (`cedula`, `nombres`, `apellidos`, `direccion`, `usuario`, `contrasena`) VALUES
(123123, 'allan', 'perez', 'crr', 'allan', 'allan'),
(1053, 'dniel', 'garcia', 'santos', 'dani', 'dani'),
(123, '14', '14', '14', '14', '14'),
(123, '21312312', '123123123', '3123123', '213123123', '123'),
(45, 'DC', 'HM', 'BO', 'DC', 'DC'),
(1, '1', '1', '1', '1', '1'),
(12, '12', '1', '1', '1', '1'),
(123, '12', '1', '1', '1', '1'),
(1234, '12', '1', '1', '1', '1'),
(12345, '12', '1', '1', '1', '1'),
(123456, '12', '1', '1', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ventas`
--

CREATE TABLE IF NOT EXISTS `tbl_ventas` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `producto` varchar(40) NOT NULL,
  `cliente` varchar(40) NOT NULL,
  `cantidad` int(3) NOT NULL,
  `precio` int(8) NOT NULL,
  `total` int(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `tbl_ventas`
--

INSERT INTO `tbl_ventas` (`id`, `producto`, `cliente`, `cantidad`, `precio`, `total`) VALUES
(1, 'chocorramo', '12', 0, 0, 0),
(2, 'chocorramo', '12', 0, 0, 0),
(3, 'Pan tajado', '12', 10, 0, 0),
(4, 'chocorramo', '12', 60, 0, 0),
(5, 'chocorramo', '12', 5, 0, 0),
(6, 'chocorramo', '12', 23, 3, 69),
(7, 'chocorramo', '12', 22, 1000, 22000),
(8, 'chocorramo', '12', 56, 1000, 56000);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
