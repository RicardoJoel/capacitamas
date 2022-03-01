-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-12-2021 a las 04:07:55
-- Versión del servidor: 10.1.40-MariaDB
-- Versión de PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `precisoo_capacitamas`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_answers_insert` (IN `p_surveys_id` BIGINT(20) UNSIGNED, IN `p_months_id` BIGINT(20) UNSIGNED, IN `p_courses` INT UNSIGNED, IN `p_position` VARCHAR(100), IN `p_name` VARCHAR(100), IN `p_lastname` VARCHAR(100), IN `p_telephone` VARCHAR(100), IN `p_authority` VARCHAR(100), IN `p_email` VARCHAR(100), IN `p_created_at` TIMESTAMP, IN `p_updated_at` TIMESTAMP)  NO SQL
insert into answers (surveys_id, questions_id, is_affirmative, months_id, courses, position, name, lastname, telephone, authority, email, created_at, updated_at) values 
(p_surveys_id, 1, p_months_id != '', p_months_id, 0, '', '', '', '', '', '', p_created_at, p_updated_at),
(p_surveys_id, 2, p_courses > 0, 0, p_courses, '', '', '', '', '', '', p_created_at, p_updated_at),
(p_surveys_id, 3, true, 0, 0, p_position, '', '', '', '', '', p_created_at, p_updated_at),
(p_surveys_id, 4, p_authority = '', 0, 0, '', p_name, p_lastname, p_telephone, p_authority, p_email, p_created_at, p_updated_at)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_contacts_insert` (IN `p_name` VARCHAR(100), IN `p_lastname` VARCHAR(100), IN `p_position` VARCHAR(100), IN `p_telephone` VARCHAR(100), IN `p_email` VARCHAR(100), IN `p_created_at` TIMESTAMP, IN `p_updated_at` TIMESTAMP)  NO SQL
insert into contacts (name, lastname, position, telephone, email, created_at, updated_at) values (p_name, p_lastname, p_position, p_telephone, p_email, p_created_at, p_updated_at)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_months_all` ()  NO SQL
SELECT id, name
FROM months 
ORDER BY id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_questions_all` ()  NO SQL
SELECT id, statement, substatement1, substatement2 
FROM questions 
WHERE deleted_at is NULL
ORDER BY id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_rejections_insert` (IN `p_reason` VARCHAR(500), IN `p_created_at` TIMESTAMP, IN `p_updated_at` TIMESTAMP)  NO SQL
insert into rejections (reason, created_at, updated_at) values (p_reason, p_created_at, p_updated_at)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_surveys_insert` (IN `p_created_at` TIMESTAMP, IN `p_updated_at` TIMESTAMP)  NO SQL
insert into surveys (created_at, updated_at) values (p_created_at, p_updated_at)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `answers`
--

CREATE TABLE `answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `surveys_id` bigint(20) UNSIGNED NOT NULL,
  `questions_id` bigint(20) UNSIGNED NOT NULL,
  `is_affirmative` tinyint(4) NOT NULL,
  `months_id` bigint(20) UNSIGNED NOT NULL,
  `courses` int(10) UNSIGNED DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `telephone` varchar(100) DEFAULT NULL,
  `authority` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `answers`
--

INSERT INTO `answers` (`id`, `surveys_id`, `questions_id`, `is_affirmative`, `months_id`, `courses`, `position`, `name`, `lastname`, `telephone`, `authority`, `email`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 9, 0, '', '', '', '', '', '', '2020-08-14 10:11:24', '2020-08-14 10:11:24', NULL),
(2, 1, 2, 1, 0, 45, '', '', '', '', '', '', '2020-08-14 10:11:24', '2020-08-14 10:11:24', NULL),
(3, 1, 3, 1, 0, 0, 'Barrendero', '', '', '', '', '', '2020-08-14 10:11:24', '2020-08-14 10:11:24', NULL),
(4, 1, 4, 1, 0, 0, '', 'Roxana', 'Bejar', '999999999', '', '', '2020-08-14 10:11:24', '2020-08-14 10:11:24', NULL),
(5, 2, 1, 1, 1, 0, '', '', '', '', '', '', '2020-08-14 20:32:29', '2020-08-14 20:32:29', NULL),
(6, 2, 2, 0, 0, 0, '', '', '', '', '', '', '2020-08-14 20:32:29', '2020-08-14 20:32:29', NULL),
(7, 2, 3, 1, 0, 0, 'Lmiana', '', '', '', '', '', '2020-08-14 20:32:29', '2020-08-14 20:32:29', NULL),
(8, 2, 4, 1, 0, 0, '', 'd', 'd', '999999999', '', '', '2020-08-14 20:32:29', '2020-08-14 20:32:29', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `telephone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `lastname`, `position`, `telephone`, `email`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'alfjsdlakj', 'kljflkfjdsklj', '999999999', 'lkjsdlfk432', 'r@g.co', '2020-08-14 10:10:17', '2020-08-14 10:10:17', NULL),
(2, 'fskljdkl', 'lkfjkldfjsdkl', '999999999', 'lkjfsdlkjsdkl', 'a@b.cd', '2020-08-14 20:22:01', '2020-08-14 20:22:01', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `months`
--

CREATE TABLE `months` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `months`
--

INSERT INTO `months` (`id`, `name`) VALUES
(1, 'Enero'),
(2, 'Febrero'),
(3, 'Marzo'),
(4, 'Abril'),
(5, 'Mayo'),
(6, 'Junio'),
(7, 'Julio'),
(8, 'Agosto'),
(9, 'Septiembre'),
(10, 'Octubre'),
(11, 'Noviembre'),
(12, 'Diciembre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `statement` varchar(500) NOT NULL,
  `substatement1` varchar(500) DEFAULT NULL,
  `substatement2` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `questions`
--

INSERT INTO `questions` (`id`, `statement`, `substatement1`, `substatement2`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Para empezar, nos gustaría saber si el centro de capacitación al que perteneces elabora un plan anual de capacitación previo al año calendario siguiente.', '¿En qué mes del año está listo ese plan?', NULL, '2020-08-12 00:00:00', '2020-08-12 00:00:00', NULL),
(2, '¿En 2019 has brindado alguna capacitación a alguna entidad pública?', '¿Cuántos cursos le han contratado a tu centro de capacitación?', NULL, '2020-08-12 00:00:00', '2020-08-12 00:00:00', NULL),
(3, '¿Puedes indicarnos cuál es tu cargo?', NULL, NULL, '2020-08-12 00:00:00', '2020-08-12 00:00:00', NULL),
(4, '¿Tienes la representación de tu centro de estudios?', 'Por favor, completa estos datos para contactarte e iniciar el proceso de inscripción de tu centro de estudios:', 'Es necesario que la autoridad máxima de tu institución sea quien la inscriba en la plataforma Capacita+. Bríndanos sus datos de contacto para avisarle de tu interés:', '2020-08-12 00:00:00', '2020-08-12 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rejections`
--

CREATE TABLE `rejections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rejections`
--

INSERT INTO `rejections` (`id`, `reason`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Probando 1', '2020-08-14 09:59:20', '2020-08-14 09:59:20', NULL),
(2, 'Probando 2', '2020-08-14 10:01:46', '2020-08-14 10:01:46', NULL),
(3, 'kdjlalskañlsk', '2020-08-14 14:01:44', '2020-08-14 14:01:44', NULL),
(4, 'ds', '2020-08-14 17:01:58', '2020-08-14 17:01:58', NULL),
(5, 'car', '2020-08-14 17:17:15', '2020-08-14 17:17:15', NULL),
(6, 'dasdasdas', '2020-08-14 17:18:31', '2020-08-14 17:18:31', NULL),
(7, 'kfñalsdklkañsldfk', '2020-08-14 17:19:16', '2020-08-14 17:19:16', NULL),
(8, 'ljkflkñfdasjklfaadsfjkafdñkskjsklj', '2020-08-14 17:21:45', '2020-08-14 17:21:45', NULL),
(9, 're', '2020-08-14 17:21:58', '2020-08-14 17:21:58', NULL),
(10, 'fdfd', '2020-08-14 17:23:40', '2020-08-14 17:23:40', NULL),
(11, 'Responder', '2020-08-15 03:02:41', '2020-08-15 03:02:41', NULL),
(12, 'Smart TV', '2020-08-14 20:13:32', '2020-08-14 20:13:32', NULL),
(13, 'Rapida', '2020-08-14 20:22:22', '2020-08-14 20:22:22', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `surveys`
--

CREATE TABLE `surveys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `surveys`
--

INSERT INTO `surveys` (`id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2020-08-14 10:11:24', '2020-08-14 10:11:24', NULL),
(2, '2020-08-14 20:32:29', '2020-08-14 20:32:29', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`,`questions_id`,`surveys_id`,`months_id`),
  ADD UNIQUE KEY `ID_UNIQUE` (`id`),
  ADD KEY `fk_answers_questions_idx` (`questions_id`),
  ADD KEY `fk_answers_surveys1_idx` (`surveys_id`),
  ADD KEY `ID_INDEX` (`id`);

--
-- Indices de la tabla `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ID_UNIQUE` (`id`),
  ADD KEY `ID_INDEX` (`id`);

--
-- Indices de la tabla `months`
--
ALTER TABLE `months`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ID_UNIQUE` (`id`),
  ADD KEY `ID_INDEX` (`id`);

--
-- Indices de la tabla `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ID_UNIQUE` (`id`),
  ADD KEY `ID_INDEX` (`id`);

--
-- Indices de la tabla `rejections`
--
ALTER TABLE `rejections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ID_UNIQUE` (`id`),
  ADD KEY `ID_INDEX` (`id`);

--
-- Indices de la tabla `surveys`
--
ALTER TABLE `surveys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ID_UNIQUE` (`id`),
  ADD KEY `ID_INDEX` (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `answers`
--
ALTER TABLE `answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `months`
--
ALTER TABLE `months`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `rejections`
--
ALTER TABLE `rejections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `surveys`
--
ALTER TABLE `surveys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `fk_answers_questions` FOREIGN KEY (`questions_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_answers_surveys1` FOREIGN KEY (`surveys_id`) REFERENCES `surveys` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
