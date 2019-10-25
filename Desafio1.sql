-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 24-10-2019 a las 10:53:30
-- Versión del servidor: 5.7.27-0ubuntu0.18.04.1
-- Versión de PHP: 7.2.19-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Desafio1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Aula`
--

CREATE TABLE `Aula` (
  `cod_Aula` int(4) NOT NULL,
  `Descripcion` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Aula`
--

INSERT INTO `Aula` (`cod_Aula`, `Descripcion`) VALUES
(101, 'Biologia'),
(102, 'Química'),
(103, 'Arte dramático'),
(104, 'Ocultismo'),
(105, 'Arte'),
(106, 'Psicologia'),
(107, 'Matemáticas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `AulaProfesor`
--

CREATE TABLE `AulaProfesor` (
  `cod_profesor` int(11) NOT NULL,
  `cod_aula` int(11) NOT NULL,
  `numero` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Horario`
--

CREATE TABLE `Horario` (
  `numero` int(2) NOT NULL,
  `Comienzo` varchar(30) NOT NULL,
  `Final` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Horario`
--

INSERT INTO `Horario` (`numero`, `Comienzo`, `Final`) VALUES
(1, '8:30', '9:25'),
(2, '9:25', '10:20'),
(3, '10:20', '11:15'),
(4, '11:45', '12:40'),
(5, '12:40', '13:35'),
(6, '13:35', '14:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `cod_profesor` int(3) NOT NULL,
  `nombre` varchar(90) NOT NULL,
  `usuario` varchar(90) NOT NULL,
  `passwd` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`cod_profesor`, `nombre`, `usuario`, `passwd`) VALUES
(1, 'Clementine', 'clem@tine.com', '1234'),
(2, 'Macbeth', 'mac@teh.com', '1234'),
(3, 'Hamlet', 'ham@prism.com', '1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Roles`
--

CREATE TABLE `Roles` (
  `Rol` int(2) NOT NULL,
  `tipo` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Roles`
--

INSERT INTO `Roles` (`Rol`, `tipo`) VALUES
(1, 'administrador general'),
(2, 'administrador aula'),
(3, 'profesor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RolProfesor`
--

CREATE TABLE `RolProfesor` (
  `cod_profesor` int(11) NOT NULL,
  `rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `RolProfesor`
--

INSERT INTO `RolProfesor` (`cod_profesor`, `rol`) VALUES
(1, 1),
(2, 2),
(3, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Aula`
--
ALTER TABLE `Aula`
  ADD PRIMARY KEY (`cod_Aula`);

--
-- Indices de la tabla `AulaProfesor`
--
ALTER TABLE `AulaProfesor`
  ADD PRIMARY KEY (`cod_profesor`),
  ADD KEY `cod_aula` (`cod_aula`),
  ADD KEY `numero` (`numero`);

--
-- Indices de la tabla `Horario`
--
ALTER TABLE `Horario`
  ADD PRIMARY KEY (`numero`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`cod_profesor`);

--
-- Indices de la tabla `Roles`
--
ALTER TABLE `Roles`
  ADD PRIMARY KEY (`Rol`);

--
-- Indices de la tabla `RolProfesor`
--
ALTER TABLE `RolProfesor`
  ADD KEY `rol` (`rol`),
  ADD KEY `cod_profesor` (`cod_profesor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Aula`
--
ALTER TABLE `Aula`
  MODIFY `cod_Aula` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;
--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `cod_profesor` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `AulaProfesor`
--
ALTER TABLE `AulaProfesor`
  ADD CONSTRAINT `AulaProfesor_ibfk_1` FOREIGN KEY (`cod_aula`) REFERENCES `Aula` (`cod_Aula`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `AulaProfesor_ibfk_2` FOREIGN KEY (`numero`) REFERENCES `Horario` (`numero`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `AulaProfesor_ibfk_3` FOREIGN KEY (`cod_profesor`) REFERENCES `profesores` (`cod_profesor`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `RolProfesor`
--
ALTER TABLE `RolProfesor`
  ADD CONSTRAINT `RolProfesor_ibfk_1` FOREIGN KEY (`rol`) REFERENCES `Roles` (`Rol`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `RolProfesor_ibfk_2` FOREIGN KEY (`cod_profesor`) REFERENCES `profesores` (`cod_profesor`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
