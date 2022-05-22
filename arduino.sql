-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-05-2022 a las 13:12:34
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `arduino`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historico_panel`
--

CREATE TABLE `historico_panel` (
  `id` int(11) DEFAULT NULL,
  `vatios` decimal(5,2) DEFAULT NULL,
  `voltios` decimal(5,2) DEFAULT NULL,
  `amperios` decimal(5,2) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tipo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `historico_panel`
--

INSERT INTO `historico_panel` (`id`, `vatios`, `voltios`, `amperios`, `fecha`, `tipo`) VALUES
(45, NULL, NULL, NULL, '2022-05-14 11:02:00', 'delete'),
(46, NULL, NULL, NULL, '2022-05-14 11:02:03', 'insert'),
(46, NULL, NULL, NULL, '2022-05-14 11:04:28', 'delete'),
(4, '1.20', '2.96', '0.00', '2022-05-14 11:04:35', 'update'),
(47, NULL, NULL, NULL, '2022-05-14 11:08:07', 'insert');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `panel`
--

CREATE TABLE `panel` (
  `id` int(11) NOT NULL,
  `vatios` decimal(5,2) DEFAULT NULL,
  `voltios` decimal(5,2) DEFAULT NULL,
  `amperios` decimal(5,2) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `panel`
--

INSERT INTO `panel` (`id`, `vatios`, `voltios`, `amperios`, `fecha`) VALUES
(1, '3.10', '5.10', '0.20', '2022-05-14 10:47:19'),
(4, '1.20', '2.96', '5.00', '2022-05-14 11:04:35'),
(47, NULL, NULL, NULL, '2022-05-14 11:08:07');

--
-- Disparadores `panel`
--
DELIMITER $$
CREATE TRIGGER `deleted_historico` AFTER DELETE ON `panel` FOR EACH ROW INSERT into historico_panel (id,vatios,voltios,amperios,tipo) VALUES (old.id,old.vatios,old.voltios,old.amperios,'delete')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertar_historico` AFTER INSERT ON `panel` FOR EACH ROW insert into historico_panel(vatios,voltios,amperios,id,tipo) values (new.vatios,new.voltios,new.amperios,new.id,'insert')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_historico` AFTER UPDATE ON `panel` FOR EACH ROW INSERT into historico_panel(voltios,vatios,amperios,id,tipo) values (old.voltios,old.vatios,old.amperios,old.id,'update')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `panel_fecha`
--

CREATE TABLE `panel_fecha` (
  `id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `panel_fecha`
--

INSERT INTO `panel_fecha` (`id`, `fecha`) VALUES
(1, '2022-03-20 21:37:08'),
(4, '2022-05-14 12:48:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prueba`
--

CREATE TABLE `prueba` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `prueba`
--

INSERT INTO `prueba` (`id`) VALUES
(890),
(870),
(876),
(476),
(926),
(929),
(934),
(931),
(928),
(927),
(927),
(927),
(925),
(945),
(894),
(889),
(879),
(885),
(883),
(953),
(942),
(952),
(943),
(948),
(890),
(917);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`id`, `nombre`) VALUES
(1, 'consultor'),
(2, 'admin'),
(3, 'creador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `email` varchar(50) NOT NULL,
  `contra` varchar(100) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `tipo` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`email`, `contra`, `nombre`, `tipo`) VALUES
('asd', '$2y$10$4w9N9cSuBzNoU5cTDA1Et.S1l7hQeMMnw1IKjdB9ZMvll2oa5NcNC', 'asd', 'admin'),
('wilsonjara13@gmail.com', '$2y$10$1hlQEuqfRZCgaAfoB2w5CeMKazh7epdtLaNFIkxOcvjgFcNEoneFy', 'Administrador', 'creador');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `panel`
--
ALTER TABLE `panel`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `panel_fecha`
--
ALTER TABLE `panel_fecha`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id`,`nombre`) USING BTREE;

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `panel`
--
ALTER TABLE `panel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `panel_fecha`
--
ALTER TABLE `panel_fecha`
  ADD CONSTRAINT `fk_pan_cop` FOREIGN KEY (`id`) REFERENCES `panel` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
