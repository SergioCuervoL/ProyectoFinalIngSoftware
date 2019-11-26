-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-11-2019 a las 18:34:37
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdSistemaBecasIngSoftware`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aspirante`
--

CREATE TABLE `aspirante` (
  `idAspirante` int(11) NOT NULL,
  `nombres` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `apellidos` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `correo` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `cc` varchar(12) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `beca`
--

CREATE TABLE `beca` (
  `idBeca` int(11) NOT NULL,
  `estado` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `tipoBeca` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `contrasena` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `FUNCIONARIO_idFuncionario` int(11) NOT NULL,
  `ASPIRANTE_idAspirante` int(11) NOT NULL,
  `PROYECTO_idProyecto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `becado`
--

CREATE TABLE `becado` (
  `idBecado` int(11) NOT NULL,
  `anexo` mediumblob NOT NULL,
  `keySecret` int(10) UNSIGNED NOT NULL DEFAULT '1926',
  `BECA_idBeca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcionario`
--

CREATE TABLE `funcionario` (
  `idFuncionario` int(11) NOT NULL,
  `nombres` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `apellidos` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `contrasena` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `keySecret` int(10) UNSIGNED NOT NULL DEFAULT '7476',
  `correo` varchar(45) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE `proyecto` (
  `idProyecto` int(11) NOT NULL,
  `categoriaProyecto` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `area` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `FUNCIONARIO_idFuncionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aspirante`
--
ALTER TABLE `aspirante`
  ADD PRIMARY KEY (`idAspirante`);

--
-- Indices de la tabla `beca`
--
ALTER TABLE `beca`
  ADD PRIMARY KEY (`idBeca`,`FUNCIONARIO_idFuncionario`,`ASPIRANTE_idAspirante`,`PROYECTO_idProyecto`),
  ADD KEY `fk_BECA_FUNCIONARIO1_idx` (`FUNCIONARIO_idFuncionario`),
  ADD KEY `fk_BECA_ASPIRANTE1_idx` (`ASPIRANTE_idAspirante`),
  ADD KEY `fk_BECA_PROYECTO1_idx` (`PROYECTO_idProyecto`);

--
-- Indices de la tabla `becado`
--
ALTER TABLE `becado`
  ADD PRIMARY KEY (`idBecado`,`BECA_idBeca`),
  ADD KEY `fk_BECADO_BECA_idx` (`BECA_idBeca`);

--
-- Indices de la tabla `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`idFuncionario`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`idProyecto`,`FUNCIONARIO_idFuncionario`),
  ADD KEY `fk_PROYECTO_FUNCIONARIO1_idx` (`FUNCIONARIO_idFuncionario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `beca`
--
ALTER TABLE `beca`
  ADD CONSTRAINT `fk_BECA_ASPIRANTE1` FOREIGN KEY (`ASPIRANTE_idAspirante`) REFERENCES `aspirante` (`idAspirante`),
  ADD CONSTRAINT `fk_BECA_FUNCIONARIO1` FOREIGN KEY (`FUNCIONARIO_idFuncionario`) REFERENCES `funcionario` (`idFuncionario`),
  ADD CONSTRAINT `fk_BECA_PROYECTO1` FOREIGN KEY (`PROYECTO_idProyecto`) REFERENCES `proyecto` (`idProyecto`);

--
-- Filtros para la tabla `becado`
--
ALTER TABLE `becado`
  ADD CONSTRAINT `fk_BECADO_BECA` FOREIGN KEY (`BECA_idBeca`) REFERENCES `beca` (`idBeca`);

--
-- Filtros para la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD CONSTRAINT `fk_PROYECTO_FUNCIONARIO1` FOREIGN KEY (`FUNCIONARIO_idFuncionario`) REFERENCES `funcionario` (`idFuncionario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
