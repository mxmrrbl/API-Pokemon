-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-11-2022 a las 04:15:22
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pokemon`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `img` varchar(250) DEFAULT NULL,
  `contenido` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`id`, `fecha`, `titulo`, `img`, `contenido`) VALUES
(1, '2022-11-11', 'Feria pokemon', 'https://ligapokemon', 'No te pierdas la feria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maestro`
--

CREATE TABLE `maestro` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `clave` varchar(100) DEFAULT NULL,
  `whatsapp` varchar(40) DEFAULT NULL,
  `ciudad` varchar(40) DEFAULT NULL,
  `token` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `maestro`
--

INSERT INTO `maestro` (`id`, `nombre`, `apellido`, `correo`, `clave`, `whatsapp`, `ciudad`, `token`) VALUES
(1, 'mario', 'perez', 'mario@gmail.com', '4c0a917e959b1e3dd4b492c13188a175', '8094344334', 'Santiago', '8a23120fbd263353d71ad97f36e9849e'),
(2, 'felix', 'vargas', 'fv@gmail.com', '4c0a917e959b1e3dd4b492c13188a175', '8294765664', 'Santiago', '894656054d67da37d0662f9e55a20b01'),
(3, 'juan', 'gonzales', 'jg@gmail.com', '4c0a917e959b1e3dd4b492c13188a175', '8294765626', 'Pedernales', 'f8b7c859b90e0b1d1e56c9197eefdfab');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pokemon`
--

CREATE TABLE `pokemon` (
  `id` int(11) NOT NULL,
  `maestro` int(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `nivel` decimal(12,2) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `comentario` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pokemon`
--

INSERT INTO `pokemon` (`id`, `maestro`, `nombre`, `nivel`, `tipo`, `comentario`) VALUES
(1, 1, 'Ditto', '10.00', 'normal', 'es muy amistoso'),
(2, 1, 'Charizard', '20.00', 'fuego', 'Le gustan las empanadas'),
(3, 1, 'Charizard', '25.00', 'fuego', 'No come de la calle'),
(5, 3, 'Blaziken', '30.00', 'fuego-lucha', 'Si te pega te quema');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `maestro`
--
ALTER TABLE `maestro`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unico` (`correo`,`whatsapp`);

--
-- Indices de la tabla `pokemon`
--
ALTER TABLE `pokemon`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `maestro`
--
ALTER TABLE `maestro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pokemon`
--
ALTER TABLE `pokemon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
