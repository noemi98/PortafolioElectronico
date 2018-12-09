-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 09-12-2018 a las 02:10:52
-- Versión del servidor: 5.7.21
-- Versión de PHP: 7.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_portafolio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivo_ex`
--

DROP TABLE IF EXISTS `archivo_ex`;
CREATE TABLE IF NOT EXISTS `archivo_ex` (
  `arex_id` int(11) NOT NULL AUTO_INCREMENT,
  `arex_nombre` varchar(255) NOT NULL,
  `arex_ruta` varchar(255) NOT NULL,
  `arex_descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`arex_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivo_mod`
--

DROP TABLE IF EXISTS `archivo_mod`;
CREATE TABLE IF NOT EXISTS `archivo_mod` (
  `armod_id` int(11) NOT NULL AUTO_INCREMENT,
  `armod_nombre` varchar(255) NOT NULL,
  `armod_ruta` varchar(255) NOT NULL,
  `armod_descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`armod_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `cl_dni` char(8) NOT NULL,
  `cl_nombre` varchar(255) NOT NULL,
  `cl_appaterno` varchar(255) NOT NULL,
  `cl_apmaterno` varchar(255) NOT NULL,
  `cl_telefono` char(9) NOT NULL,
  `cl_direccion` varchar(255) NOT NULL,
  `cl_sexo` char(1) NOT NULL,
  PRIMARY KEY (`cl_dni`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diligencias`
--

DROP TABLE IF EXISTS `diligencias`;
CREATE TABLE IF NOT EXISTS `diligencias` (
  `dil_id` int(11) NOT NULL AUTO_INCREMENT,
  `dil_nombre` varchar(255) NOT NULL,
  `ex_id` int(11) NOT NULL,
  `dil_lugar` varchar(255) NOT NULL,
  `dil_fecha` date NOT NULL,
  `dil_hora` time NOT NULL,
  PRIMARY KEY (`dil_id`),
  KEY `fk_diligencias_expedientes` (`ex_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expedientes`
--

DROP TABLE IF EXISTS `expedientes`;
CREATE TABLE IF NOT EXISTS `expedientes` (
  `ex_id` int(11) NOT NULL AUTO_INCREMENT,
  `ex_numero` varchar(255) NOT NULL,
  `ex_descripcion` varchar(255) NOT NULL,
  `arex_id` int(11) NOT NULL,
  PRIMARY KEY (`ex_id`),
  KEY `fk_expedientes_archivoex` (`arex_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expediente_cliente`
--

DROP TABLE IF EXISTS `expediente_cliente`;
CREATE TABLE IF NOT EXISTS `expediente_cliente` (
  `ex_id` int(11) NOT NULL,
  `cl_dni` char(8) NOT NULL,
  `fecha` datetime NOT NULL,
  UNIQUE KEY `ex_id` (`ex_id`,`cl_dni`),
  KEY `fk_expcli_cliente` (`cl_dni`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelos`
--

DROP TABLE IF EXISTS `modelos`;
CREATE TABLE IF NOT EXISTS `modelos` (
  `mod_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_etiqueta` varchar(255) NOT NULL,
  `armod_id` int(11) NOT NULL,
  `mod_fecha` datetime NOT NULL,
  PRIMARY KEY (`mod_id`),
  KEY `fk_modelo_archivomod` (`armod_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(255) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `primer_nombre` varchar(255) NOT NULL,
  `p_apellido` varchar(255) NOT NULL,
  `m_apellido` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
