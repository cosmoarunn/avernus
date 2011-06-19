-- phpMyAdmin SQL Dump
-- version 3.3.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 14-06-2011 a las 22:46:40
-- Versión del servidor: 5.1.54
-- Versión de PHP: 5.3.5-1ubuntu7.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `Avernus`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL,
  `salt` varchar(40) NOT NULL DEFAULT '',
  `premdays` int(11) NOT NULL DEFAULT '0',
  `lastday` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `key` varchar(128) NOT NULL DEFAULT '',
  `blocked` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'internal usage',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '1',
  `page_access` int(11) DEFAULT NULL,
  `page_lastday` int(11) DEFAULT NULL,
  `email_new` varchar(255) DEFAULT NULL,
  `email_new_time` int(15) DEFAULT NULL,
  `rlname` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `created` int(16) DEFAULT NULL,
  `email_code` varchar(255) DEFAULT NULL,
  `next_email` int(11) DEFAULT NULL,
  `premium_points` int(11) DEFAULT NULL,
  `nickname` char(48) DEFAULT NULL,
  `avatar` char(48) DEFAULT NULL,
  `about_me` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `password`, `salt`, `premdays`, `lastday`, `email`, `key`, `blocked`, `warnings`, `group_id`, `page_access`, `page_lastday`, `email_new`, `email_new_time`, `rlname`, `location`, `created`, `email_code`, `next_email`, `premium_points`, `nickname`, `avatar`, `about_me`) VALUES
(1, '1', '41da8bef22aaef9d7c5821fa0f0de7cccc4dda4d', '', 65535, 1307745480, '', '', 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'baalzephom', 'dfab4dc6b888ac4d3139ddcf44a09bbf7d133feb', '', 30, 1308088139, 't-he-boss@hotmail.com', '', 0, 0, 1, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, 0, 'Dj boss', NULL, NULL);

--
-- (Evento) desencadenante `accounts`
--
DROP TRIGGER IF EXISTS `ondelete_accounts`;
DELIMITER //
CREATE TRIGGER `ondelete_accounts` BEFORE DELETE ON `accounts`
 FOR EACH ROW BEGIN
	DELETE FROM `bans` WHERE `type` IN (3, 4) AND `value` = OLD.`id`;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `account_viplist`
--

CREATE TABLE IF NOT EXISTS `account_viplist` (
  `account_id` int(11) NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL,
  UNIQUE KEY `account_id_2` (`account_id`,`player_id`),
  KEY `account_id` (`account_id`),
  KEY `player_id` (`player_id`),
  KEY `world_id` (`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `account_viplist`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bans`
--

CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL COMMENT '1 - ip banishment, 2 - namelock, 3 - account banishment, 4 - notation, 5 - deletion',
  `value` int(10) unsigned NOT NULL COMMENT 'ip address (integer), player guid or account number',
  `param` int(10) unsigned NOT NULL DEFAULT '4294967295' COMMENT 'used only for ip banishment mask (integer)',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `expires` int(11) NOT NULL,
  `added` int(10) unsigned NOT NULL,
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `reason` int(10) unsigned NOT NULL DEFAULT '0',
  `action` int(10) unsigned NOT NULL DEFAULT '0',
  `statement` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `type` (`type`,`value`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `bans`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bugtracker`
--

CREATE TABLE IF NOT EXISTS `bugtracker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(3) NOT NULL,
  `time` int(11) DEFAULT NULL,
  `author` int(11) NOT NULL,
  `text` text,
  `title` varchar(120) DEFAULT NULL,
  `done` tinyint(3) DEFAULT NULL,
  `priority` tinyint(3) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `author` (`author`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `bugtracker`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) DEFAULT NULL,
  `body` text,
  `time` int(11) DEFAULT '0',
  `author` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `news_id` (`news_id`),
  KEY `author` (`author`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `comments`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `environment_killers`
--

CREATE TABLE IF NOT EXISTS `environment_killers` (
  `kill_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  KEY `kill_id` (`kill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `environment_killers`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forums`
--

CREATE TABLE IF NOT EXISTS `forums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  `description` tinytext,
  `access` smallint(5) DEFAULT '1' COMMENT 'Min. access to see the board',
  `closed` tinyint(1) DEFAULT NULL,
  `moderators` tinytext,
  `order` int(6) DEFAULT NULL,
  `requireLogin` tinyint(1) DEFAULT NULL,
  `guild` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `forums`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `friends`
--

CREATE TABLE IF NOT EXISTS `friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `with` int(11) DEFAULT NULL,
  `friend` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `with` (`with`),
  KEY `friend` (`friend`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `friends`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `global_storage`
--

CREATE TABLE IF NOT EXISTS `global_storage` (
  `key` varchar(32) NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '0',
  UNIQUE KEY `key` (`key`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `global_storage`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guilds`
--

CREATE TABLE IF NOT EXISTS `guilds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` int(11) NOT NULL,
  `checkdata` int(11) NOT NULL,
  `motd` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `guilds`
--


--
-- (Evento) desencadenante `guilds`
--
DROP TRIGGER IF EXISTS `oncreate_guilds`;
DELIMITER //
CREATE TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds`
 FOR EACH ROW BEGIN
	INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Leader', 3, NEW.`id`);
	INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Vice-Leader', 2, NEW.`id`);
	INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('Member', 1, NEW.`id`);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `ondelete_guilds`;
DELIMITER //
CREATE TRIGGER `ondelete_guilds` BEFORE DELETE ON `guilds`
 FOR EACH ROW BEGIN
	UPDATE `players` SET `guildnick` = '', `rank_id` = 0 WHERE `rank_id` IN (SELECT `id` FROM `guild_ranks` WHERE `guild_id` = OLD.`id`);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guild_invites`
--

CREATE TABLE IF NOT EXISTS `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `guild_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `player_id` (`player_id`,`guild_id`),
  KEY `guild_id` (`guild_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `guild_invites`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guild_ranks`
--

CREATE TABLE IF NOT EXISTS `guild_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `level` int(11) NOT NULL COMMENT '1 - leader, 2 - vice leader, 3 - member',
  PRIMARY KEY (`id`),
  KEY `guild_id` (`guild_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `guild_ranks`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `houses`
--

CREATE TABLE IF NOT EXISTS `houses` (
  `id` int(10) unsigned NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL,
  `paid` int(10) unsigned NOT NULL DEFAULT '0',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `lastwarning` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `town` int(10) unsigned NOT NULL DEFAULT '0',
  `size` int(10) unsigned NOT NULL DEFAULT '0',
  `price` int(10) unsigned NOT NULL DEFAULT '0',
  `rent` int(10) unsigned NOT NULL DEFAULT '0',
  `doors` int(10) unsigned NOT NULL DEFAULT '0',
  `beds` int(10) unsigned NOT NULL DEFAULT '0',
  `tiles` int(10) unsigned NOT NULL DEFAULT '0',
  `guild` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `clear` tinyint(1) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `houses`
--

INSERT INTO `houses` (`id`, `world_id`, `owner`, `paid`, `warnings`, `lastwarning`, `name`, `town`, `size`, `price`, `rent`, `doors`, `beds`, `tiles`, `guild`, `clear`) VALUES
(1, 0, 0, 0, 0, 0, 'Rhyves Flats 14', 2, 14, 17000, 0, 0, 1, 17, 0, 0),
(2, 0, 0, 0, 0, 0, 'Rhyves Flats 15', 2, 16, 19000, 0, 0, 1, 19, 0, 0),
(3, 0, 0, 0, 0, 0, 'Rhyves Flats 16', 2, 10, 13000, 0, 0, 1, 13, 0, 0),
(4, 0, 0, 0, 0, 0, 'Baraganor Boulevard 1', 3, 25, 29000, 0, 1, 1, 29, 0, 0),
(5, 0, 0, 0, 0, 0, 'Saund Top 1', 5, 13, 16000, 0, 1, 1, 16, 0, 0),
(6, 0, 0, 0, 0, 0, 'Kazgal Close 1', 3, 30, 32000, 0, 1, 1, 32, 0, 0),
(7, 0, 0, 0, 0, 0, 'Tower Flat', 2, 10, 13000, 0, 1, 1, 13, 0, 0),
(8, 0, 0, 0, 0, 0, 'Castle Street 1', 2, 26, 29000, 0, 1, 1, 29, 0, 0),
(9, 0, 0, 0, 0, 0, 'Seaview 2', 2, 36, 42000, 0, 1, 2, 42, 0, 0),
(10, 0, 0, 0, 0, 0, 'Seaview 1', 2, 26, 29000, 0, 1, 1, 29, 0, 0),
(11, 0, 0, 0, 0, 0, 'Hill Hut 1', 2, 23, 26000, 0, 1, 1, 26, 0, 0),
(12, 0, 0, 0, 0, 0, 'Hill Hut 2', 2, 23, 26000, 0, 1, 1, 26, 0, 0),
(13, 0, 0, 0, 0, 0, 'Farm Lane 1', 2, 16, 20000, 0, 0, 1, 20, 0, 0),
(14, 0, 0, 0, 0, 0, 'Farm Lane 2', 2, 30, 34000, 0, 0, 1, 34, 0, 0),
(15, 0, 0, 0, 0, 0, 'Church Avenue 1', 2, 18, 21000, 0, 1, 1, 21, 0, 0),
(16, 0, 0, 0, 0, 0, 'Church Avenue 2', 2, 18, 21000, 0, 1, 1, 21, 0, 0),
(17, 0, 0, 0, 0, 0, 'Church Avenue 3', 2, 34, 37000, 0, 1, 1, 37, 0, 0),
(18, 0, 0, 0, 0, 0, 'Church Avenue 4', 2, 23, 29000, 0, 1, 1, 29, 0, 0),
(19, 0, 0, 0, 0, 0, 'Church Avenue 5', 2, 16, 19000, 0, 1, 1, 19, 0, 0),
(20, 0, 0, 0, 0, 0, 'Church Avenue 7', 2, 20, 23000, 0, 1, 1, 23, 0, 0),
(23, 0, 0, 0, 0, 0, 'City Walls 1', 2, 26, 29000, 0, 1, 1, 29, 0, 0),
(24, 0, 0, 0, 0, 0, 'City Walls 2', 2, 26, 29000, 0, 1, 1, 29, 0, 0),
(25, 0, 0, 0, 0, 0, 'City Walls 3', 2, 36, 39000, 0, 1, 1, 39, 0, 0),
(26, 0, 0, 0, 0, 0, 'City Walls 4', 2, 36, 39000, 0, 1, 1, 39, 0, 0),
(27, 0, 0, 0, 0, 0, 'Hilltop 1', 2, 28, 31000, 0, 1, 1, 31, 0, 0),
(28, 0, 0, 0, 0, 0, 'Hilltop 2', 2, 33, 36000, 0, 1, 1, 36, 0, 0),
(29, 0, 0, 0, 0, 0, 'Hilltop 3', 2, 42, 45000, 0, 1, 1, 45, 0, 0),
(30, 0, 0, 0, 0, 0, 'Hilltop Hall', 2, 158, 191000, 0, 6, 2, 191, 0, 0),
(31, 0, 0, 0, 0, 0, 'Rhyves Flats 1', 2, 10, 13000, 0, 0, 1, 13, 0, 0),
(32, 0, 0, 0, 0, 0, 'Rhyves Flats 2', 2, 10, 13000, 0, 0, 1, 13, 0, 0),
(33, 0, 0, 0, 0, 0, 'Rhyves Flats 3', 2, 10, 13000, 0, 0, 1, 13, 0, 0),
(34, 0, 0, 0, 0, 0, 'Rhyves Flats 4', 2, 10, 13000, 0, 0, 1, 13, 0, 0),
(35, 0, 0, 0, 0, 0, 'Rhyves Flats 5', 2, 10, 13000, 0, 0, 1, 13, 0, 0),
(36, 0, 0, 0, 0, 0, 'Rhyves Flats 6', 2, 10, 13000, 0, 0, 1, 13, 0, 0),
(37, 0, 0, 0, 0, 0, 'Rhyves Flats 7', 2, 10, 13000, 0, 0, 1, 13, 0, 0),
(38, 0, 0, 0, 0, 0, 'Rhyves Flats 8', 2, 10, 13000, 0, 0, 1, 13, 0, 0),
(39, 0, 0, 0, 0, 0, 'Rhyves Flats 9', 2, 10, 25000, 0, 0, 1, 25, 0, 0),
(40, 0, 0, 0, 0, 0, 'Rhyves Flats 10', 2, 10, 15000, 0, 0, 1, 15, 0, 0),
(41, 0, 0, 0, 0, 0, 'Rhyves Flats 11', 2, 10, 13000, 0, 0, 1, 13, 0, 0),
(42, 0, 0, 0, 0, 0, 'Rhyves Flats 13', 2, 13, 17000, 0, 0, 1, 17, 0, 0),
(43, 0, 0, 0, 0, 0, 'Rhyves Flats 12', 2, 10, 14000, 0, 0, 1, 14, 0, 0),
(44, 0, 0, 0, 0, 0, 'Baraganor Boulevard 2', 3, 29, 33000, 0, 0, 1, 33, 0, 0),
(45, 0, 0, 0, 0, 0, 'Baraganor Boulevard 3', 3, 29, 33000, 0, 0, 1, 33, 0, 0),
(46, 0, 0, 0, 0, 0, 'Baraganor Boulevard 4', 3, 25, 29000, 0, 0, 1, 29, 0, 0),
(47, 0, 0, 0, 0, 0, 'Baraganor Boulevard 5', 3, 25, 29000, 0, 0, 1, 29, 0, 0),
(48, 0, 0, 0, 0, 0, 'Baraganor Boulevard 6', 3, 25, 29000, 0, 0, 1, 29, 0, 0),
(49, 0, 0, 0, 0, 0, 'Baraganor Boulevard 7', 3, 30, 34000, 0, 0, 1, 34, 0, 0),
(50, 0, 0, 0, 0, 0, 'Baraganor Boulevard 8', 3, 30, 34000, 0, 0, 1, 34, 0, 0),
(51, 0, 0, 0, 0, 0, 'Kazgal Close 2', 3, 30, 34000, 0, 1, 1, 34, 0, 0),
(52, 0, 0, 0, 0, 0, 'Kazgal Close 3', 3, 29, 33000, 0, 1, 1, 33, 0, 0),
(53, 0, 0, 0, 0, 0, 'Kazgal Close 4', 3, 31, 34000, 0, 1, 1, 34, 0, 0),
(54, 0, 0, 0, 0, 0, 'Kazgal Close 5', 3, 30, 34000, 0, 1, 1, 34, 0, 0),
(55, 0, 0, 0, 0, 0, 'Kazgal Close6', 3, 30, 34000, 0, 1, 1, 34, 0, 0),
(56, 0, 0, 0, 0, 0, 'Kazgal Close 7', 3, 30, 34000, 0, 1, 1, 34, 0, 0),
(57, 0, 0, 0, 0, 0, 'Kazgal Close 8', 3, 30, 34000, 0, 1, 1, 34, 0, 0),
(58, 0, 0, 0, 0, 0, 'Hammersmith Hall', 3, 164, 203000, 0, 6, 4, 203, 0, 0),
(59, 0, 0, 0, 0, 0, 'Varnack''s Cavern', 3, 185, 224000, 0, 0, 4, 224, 0, 0),
(60, 0, 0, 0, 0, 0, 'Saund Street 1', 5, 10, 13000, 0, 1, 1, 13, 0, 0),
(61, 0, 0, 0, 0, 0, 'Saund Street 2', 5, 14, 17000, 0, 1, 1, 17, 0, 0),
(62, 0, 0, 0, 0, 0, 'Saund Street 3', 5, 10, 13000, 0, 1, 1, 13, 0, 0),
(63, 0, 0, 0, 0, 0, 'Saund Street 4', 0, 14, 17000, 0, 1, 1, 17, 0, 0),
(64, 0, 0, 0, 0, 0, 'Saund Street 5', 5, 10, 13000, 0, 1, 2, 13, 0, 0),
(65, 0, 0, 0, 0, 0, 'Saund Top 2', 5, 14, 17000, 0, 1, 1, 17, 0, 0),
(66, 0, 0, 0, 0, 0, 'Saund Top 3', 5, 11, 16000, 0, 1, 2, 16, 0, 0),
(67, 0, 0, 0, 0, 0, 'Dock Street 1', 4, 18, 21000, 0, 1, 1, 21, 0, 0),
(68, 0, 0, 0, 0, 0, 'Dock Street 2', 4, 19, 23000, 0, 2, 1, 23, 0, 0),
(69, 0, 0, 0, 0, 0, 'Dock Street 3', 4, 41, 45000, 0, 2, 1, 45, 0, 0),
(70, 0, 0, 0, 0, 0, 'Nomad Hill 1', 4, 14, 18000, 0, 2, 1, 18, 0, 0),
(71, 0, 0, 0, 0, 0, 'Nomad Hill 2', 4, 16, 20000, 0, 2, 1, 20, 0, 0),
(72, 0, 0, 0, 0, 0, 'Nomad Hill 3', 4, 22, 28000, 0, 2, 2, 28, 0, 0),
(73, 0, 0, 0, 0, 0, 'Great Hall 1', 4, 22, 26000, 0, 2, 1, 26, 0, 0),
(74, 0, 0, 0, 0, 0, 'Great Hall 2', 4, 24, 30000, 0, 2, 2, 30, 0, 0),
(75, 0, 0, 0, 0, 0, 'Tarat Road 1', 4, 23, 26000, 0, 1, 1, 26, 0, 0),
(76, 0, 0, 0, 0, 0, 'Temple Terrace 1', 4, 33, 36000, 0, 1, 1, 36, 0, 0),
(77, 0, 0, 0, 0, 0, 'Temple Terrace 2', 4, 29, 33000, 0, 1, 1, 33, 0, 0),
(78, 0, 0, 0, 0, 0, 'Temple Terrace 3', 4, 30, 33000, 0, 1, 1, 33, 0, 0),
(79, 0, 0, 0, 0, 0, 'Tarat Road 2', 4, 23, 26000, 0, 1, 1, 26, 0, 0),
(80, 0, 0, 0, 0, 0, 'Tarat Road 3', 4, 31, 35000, 0, 2, 1, 35, 0, 0),
(81, 0, 0, 0, 0, 0, 'Tarat Road 4', 4, 19, 23000, 0, 2, 1, 23, 0, 0),
(82, 0, 0, 0, 0, 0, 'Tarat Road 6', 4, 44, 50000, 0, 2, 2, 50, 0, 0),
(83, 0, 0, 0, 0, 0, 'Tarat Road 7', 4, 13, 16000, 0, 1, 1, 16, 0, 0),
(84, 0, 0, 0, 0, 0, 'Tarat Road 8', 4, 26, 29000, 0, 1, 1, 29, 0, 0),
(85, 0, 0, 0, 0, 0, 'Tarat Road 9', 4, 20, 25000, 0, 1, 2, 25, 0, 0),
(86, 0, 0, 0, 0, 0, 'Smith Lane 1', 4, 23, 26000, 0, 1, 1, 26, 0, 0),
(87, 0, 0, 0, 0, 0, 'Smith Lane 2', 4, 28, 31000, 0, 1, 1, 31, 0, 0),
(88, 0, 0, 0, 0, 0, 'Smith Lane 3', 0, 32, 37000, 0, 1, 2, 37, 0, 0),
(89, 0, 0, 0, 0, 0, 'Smith Lane 4', 4, 26, 29000, 0, 1, 1, 29, 0, 0),
(90, 0, 0, 0, 0, 0, 'Smith Lane 5', 4, 18, 21000, 0, 1, 1, 21, 0, 0),
(91, 0, 0, 0, 0, 0, 'Smith Lane 6', 0, 24, 30000, 0, 2, 2, 30, 0, 0),
(92, 0, 0, 0, 0, 0, 'Smith Lane 7', 4, 26, 30000, 0, 2, 1, 30, 0, 0),
(93, 0, 0, 0, 0, 0, 'Smith Lane Shop', 4, 28, 37000, 0, 3, 1, 37, 0, 0),
(94, 0, 0, 0, 0, 0, 'Snowcapped Street 1', 4, 23, 26000, 0, 1, 1, 26, 0, 0),
(95, 0, 0, 0, 0, 0, 'Snowcapped Street 2', 4, 18, 21000, 0, 1, 1, 21, 0, 0),
(96, 0, 0, 0, 0, 0, 'Snowcapped Street 3', 4, 18, 21000, 0, 1, 1, 21, 0, 0),
(97, 0, 0, 0, 0, 0, 'Wall Flat 1', 4, 13, 17000, 0, 2, 1, 17, 0, 0),
(98, 0, 0, 0, 0, 0, 'Wall Flat 2', 4, 13, 17000, 0, 2, 1, 17, 0, 0),
(99, 0, 0, 0, 0, 0, 'Wall Flat 3', 4, 27, 32000, 0, 3, 1, 32, 0, 0),
(100, 0, 0, 0, 0, 0, 'Wall Flat 4', 4, 10, 13000, 0, 1, 1, 13, 0, 0),
(101, 0, 0, 0, 0, 0, 'Farm Lane 3', 2, 24, 29000, 0, 0, 2, 29, 0, 0),
(102, 0, 0, 0, 0, 0, 'Farm Lane 4', 2, 30, 35000, 0, 0, 1, 35, 0, 0),
(103, 0, 0, 0, 0, 0, 'The Square 1', 2, 22, 25000, 0, 0, 1, 25, 0, 0),
(104, 0, 0, 0, 0, 0, 'The Square 2 (Shop)', 2, 26, 37000, 0, 0, 2, 37, 0, 0),
(105, 0, 0, 0, 0, 0, 'Central Hall', 2, 163, 209000, 0, 0, 8, 209, 0, 0),
(106, 0, 0, 0, 0, 0, 'The Square 3', 2, 18, 21000, 0, 0, 1, 21, 0, 0),
(107, 0, 0, 0, 0, 0, 'The Square 4 (Shop)', 2, 33, 42000, 0, 0, 1, 42, 0, 0),
(108, 0, 0, 0, 0, 0, 'Church Avenue 6', 2, 20, 24000, 0, 0, 1, 24, 0, 0),
(109, 0, 0, 0, 0, 0, 'Castle Street 2', 2, 23, 26000, 0, 0, 1, 26, 0, 0),
(110, 0, 0, 0, 0, 0, 'Castle Street 3', 2, 24, 28000, 0, 0, 1, 28, 0, 0),
(111, 0, 0, 0, 0, 0, 'Armory Flat 1', 2, 20, 26000, 0, 0, 2, 26, 0, 0),
(112, 0, 0, 0, 0, 0, 'Armory Flat 2', 2, 20, 24000, 0, 0, 1, 24, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `house_auctions`
--

CREATE TABLE IF NOT EXISTS `house_auctions` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL,
  `bid` int(10) unsigned NOT NULL DEFAULT '0',
  `limit` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` bigint(20) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `house_id` (`house_id`,`world_id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `house_auctions`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `house_data`
--

CREATE TABLE IF NOT EXISTS `house_data` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `data` longblob NOT NULL,
  UNIQUE KEY `house_id` (`house_id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `house_data`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `house_lists`
--

CREATE TABLE IF NOT EXISTS `house_lists` (
  `house_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `listid` int(11) NOT NULL,
  `list` text NOT NULL,
  UNIQUE KEY `house_id` (`house_id`,`world_id`,`listid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `house_lists`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `killers`
--

CREATE TABLE IF NOT EXISTS `killers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `death_id` int(11) NOT NULL,
  `final_hit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `unjustified` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `death_id` (`death_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `killers`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` int(11) DEFAULT NULL,
  `to` int(11) DEFAULT NULL,
  `title` varchar(120) DEFAULT NULL,
  `text` tinytext,
  `time` int(11) DEFAULT NULL,
  `delete_from` tinyint(1) DEFAULT NULL,
  `delete_to` tinyint(1) DEFAULT NULL,
  `unread` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `from` (`from`),
  KEY `to` (`to`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `messages`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) DEFAULT '',
  `body` text,
  `time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `news`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '1',
  `account_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `vocation` int(11) NOT NULL DEFAULT '0',
  `health` int(11) NOT NULL DEFAULT '150',
  `healthmax` int(11) NOT NULL DEFAULT '150',
  `experience` bigint(20) unsigned NOT NULL DEFAULT '0',
  `lookbody` int(11) NOT NULL DEFAULT '0',
  `lookfeet` int(11) NOT NULL DEFAULT '0',
  `lookhead` int(11) NOT NULL DEFAULT '0',
  `looklegs` int(11) NOT NULL DEFAULT '0',
  `looktype` int(11) NOT NULL DEFAULT '136',
  `lookaddons` int(11) NOT NULL DEFAULT '0',
  `currmount` int(11) NOT NULL DEFAULT '0',
  `maglevel` int(11) NOT NULL DEFAULT '0',
  `mana` int(11) NOT NULL DEFAULT '0',
  `manamax` int(11) NOT NULL DEFAULT '0',
  `manaspent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `soul` int(10) unsigned NOT NULL DEFAULT '0',
  `town_id` int(11) NOT NULL DEFAULT '0',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `conditions` blob NOT NULL,
  `cap` int(11) NOT NULL DEFAULT '0',
  `sex` int(11) NOT NULL DEFAULT '0',
  `lastlogin` bigint(20) unsigned NOT NULL DEFAULT '0',
  `lastip` int(10) unsigned NOT NULL DEFAULT '0',
  `save` tinyint(1) NOT NULL DEFAULT '1',
  `skull` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `skulltime` int(11) NOT NULL DEFAULT '0',
  `rank_id` int(11) NOT NULL DEFAULT '0',
  `guildnick` varchar(255) NOT NULL DEFAULT '',
  `lastlogout` bigint(20) unsigned NOT NULL DEFAULT '0',
  `blessings` tinyint(2) NOT NULL DEFAULT '0',
  `balance` bigint(20) NOT NULL DEFAULT '0',
  `stamina` bigint(20) unsigned NOT NULL DEFAULT '151200000' COMMENT 'stored in miliseconds',
  `direction` int(11) NOT NULL DEFAULT '2',
  `loss_experience` int(11) NOT NULL DEFAULT '100',
  `loss_mana` int(11) NOT NULL DEFAULT '100',
  `loss_skills` int(11) NOT NULL DEFAULT '100',
  `loss_containers` int(11) NOT NULL DEFAULT '100',
  `loss_items` int(11) NOT NULL DEFAULT '100',
  `premend` int(11) NOT NULL DEFAULT '0' COMMENT 'NOT IN USE BY THE SERVER',
  `online` tinyint(1) NOT NULL DEFAULT '0',
  `marriage` int(10) unsigned NOT NULL DEFAULT '0',
  `promotion` int(11) NOT NULL DEFAULT '0',
  `deleted` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(17) NOT NULL DEFAULT '0',
  `old_name` varchar(255) DEFAULT NULL,
  `hide_char` int(11) DEFAULT NULL,
  `worldtransfer` int(11) DEFAULT NULL,
  `created` int(16) DEFAULT NULL,
  `nick_verify` int(11) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`deleted`),
  KEY `account_id` (`account_id`),
  KEY `group_id` (`group_id`),
  KEY `online` (`online`),
  KEY `deleted` (`deleted`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcar la base de datos para la tabla `players`
--

INSERT INTO `players` (`id`, `name`, `world_id`, `group_id`, `account_id`, `level`, `vocation`, `health`, `healthmax`, `experience`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `currmount`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `conditions`, `cap`, `sex`, `lastlogin`, `lastip`, `save`, `skull`, `skulltime`, `rank_id`, `guildnick`, `lastlogout`, `blessings`, `balance`, `stamina`, `direction`, `loss_experience`, `loss_mana`, `loss_skills`, `loss_containers`, `loss_items`, `premend`, `online`, `marriage`, `promotion`, `deleted`, `description`, `ip`, `old_name`, `hide_char`, `worldtransfer`, `created`, `nick_verify`, `comment`) VALUES
(1, 'Account Manager', 0, 1, 1, 1, 0, 150, 150, 0, 0, 0, 0, 0, 110, 0, 0, 0, 0, 0, 0, 0, 0, 50, 50, 7, '', 400, 0, 1307656765, 16777343, 0, 4, 0, 0, '', 1307656782, 0, 0, 151200000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '127.0.0.1', NULL, 0, NULL, NULL, NULL, NULL),
(3, 'Rook Sample', 0, 1, 1, 1, 0, 150, 150, 0, 0, 0, 0, 0, 110, 0, 0, 0, 0, 0, 0, 0, 0, 50, 50, 7, '', 400, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 201660000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '0', '', 0, 0, 0, 0, 'This player has no comment at this moment.'),
(4, 'Sorcerer Sample', 0, 1, 1, 8, 1, 185, 185, 4200, 0, 0, 0, 0, 110, 0, 0, 0, 35, 35, 0, 0, 1, 50, 50, 7, '', 440, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 201660000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '0', '', 0, 0, 0, 0, 'This player has no comment at this moment.'),
(5, 'Druid Sample', 0, 1, 1, 8, 2, 185, 185, 4200, 0, 0, 0, 0, 110, 0, 0, 0, 35, 35, 0, 0, 1, 50, 50, 7, '', 440, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 201660000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '0', '', 0, 0, 0, 0, 'This player has no comment at this moment.'),
(6, 'Paladin Sample', 0, 1, 1, 8, 3, 185, 185, 4200, 0, 0, 0, 0, 110, 0, 0, 0, 35, 35, 0, 0, 1, 50, 50, 7, '', 440, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 201660000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '0', '', 0, 0, 0, 0, 'This player has no comment at this moment.'),
(7, 'Knight Sample', 0, 1, 1, 8, 4, 185, 185, 4200, 0, 0, 0, 0, 110, 0, 0, 0, 35, 35, 0, 0, 1, 50, 50, 7, '', 440, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 201660000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '0', '', 0, 0, 0, 0, 'This player has no comment at this moment.'),
(8, 'Pyromaniack', 0, 1, 3, 8, 4, 185, 185, 4200, 0, 0, 0, 0, 110, 0, 0, 0, 35, 35, 0, 0, 1, 1000, 1000, 7, '', 440, 1, 0, 0, 1, 0, 0, 0, '', 0, 0, 0, 151200000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '', '0', NULL, NULL, NULL, 1308088149, NULL, NULL);

--
-- (Evento) desencadenante `players`
--
DROP TRIGGER IF EXISTS `oncreate_players`;
DELIMITER //
CREATE TRIGGER `oncreate_players` AFTER INSERT ON `players`
 FOR EACH ROW BEGIN
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 0, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 1, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 2, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 3, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 4, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 5, 10);
	INSERT INTO `player_skills` (`player_id`, `skillid`, `value`) VALUES (NEW.`id`, 6, 10);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `ondelete_players`;
DELIMITER //
CREATE TRIGGER `ondelete_players` BEFORE DELETE ON `players`
 FOR EACH ROW BEGIN
	DELETE FROM `bans` WHERE `type` IN (2, 5) AND `value` = OLD.`id`;
	UPDATE `houses` SET `owner` = 0 WHERE `owner` = OLD.`id`;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_deaths`
--

CREATE TABLE IF NOT EXISTS `player_deaths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `date` bigint(20) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `player_deaths`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_depotitems`
--

CREATE TABLE IF NOT EXISTS `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range, eg. 0-100 is reserved for depot lockers and all above 100 will be normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `player_depotitems`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_items`
--

CREATE TABLE IF NOT EXISTS `player_items` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `player_items`
--

INSERT INTO `player_items` (`player_id`, `pid`, `sid`, `itemtype`, `count`, `attributes`) VALUES
(1, 1, 101, 2457, 1, ''),
(1, 2, 102, 2661, 1, ''),
(1, 3, 103, 1988, 1, ''),
(1, 4, 104, 2465, 1, ''),
(1, 5, 105, 2518, 1, ''),
(1, 6, 106, 2478, 1, ''),
(1, 8, 107, 2643, 1, ''),
(1, 9, 108, 2124, 1, ''),
(1, 10, 109, 2152, 1, 0x0f01),
(1, 103, 110, 7620, 15, 0x0f0f),
(1, 103, 111, 2554, 1, ''),
(1, 103, 112, 7618, 10, 0x0f0a),
(1, 103, 113, 2120, 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_killers`
--

CREATE TABLE IF NOT EXISTS `player_killers` (
  `kill_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  KEY `kill_id` (`kill_id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `player_killers`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_namelocks`
--

CREATE TABLE IF NOT EXISTS `player_namelocks` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `new_name` varchar(255) NOT NULL,
  `date` bigint(20) NOT NULL DEFAULT '0',
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `player_namelocks`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_skills`
--

CREATE TABLE IF NOT EXISTS `player_skills` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `skillid` tinyint(2) NOT NULL DEFAULT '0',
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `player_id_2` (`player_id`,`skillid`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `player_skills`
--

INSERT INTO `player_skills` (`player_id`, `skillid`, `value`, `count`) VALUES
(3, 0, 10, 0),
(3, 1, 10, 0),
(3, 2, 10, 0),
(3, 3, 10, 0),
(3, 4, 10, 0),
(3, 5, 10, 0),
(3, 6, 10, 0),
(4, 0, 10, 0),
(4, 1, 10, 0),
(4, 2, 10, 0),
(4, 3, 10, 0),
(4, 4, 10, 0),
(4, 5, 10, 0),
(4, 6, 10, 0),
(5, 0, 10, 0),
(5, 1, 10, 0),
(5, 2, 10, 0),
(5, 3, 10, 0),
(5, 4, 10, 0),
(5, 5, 10, 0),
(5, 6, 10, 0),
(6, 0, 10, 0),
(6, 1, 10, 0),
(6, 2, 10, 0),
(6, 3, 10, 0),
(6, 4, 10, 0),
(6, 5, 10, 0),
(6, 6, 10, 0),
(7, 0, 10, 0),
(7, 1, 10, 0),
(7, 2, 10, 0),
(7, 3, 10, 0),
(7, 4, 10, 0),
(7, 5, 10, 0),
(7, 6, 10, 0),
(8, 0, 10, 0),
(8, 1, 10, 0),
(8, 2, 10, 0),
(8, 3, 10, 0),
(8, 4, 10, 0),
(8, 5, 10, 0),
(8, 6, 10, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_spells`
--

CREATE TABLE IF NOT EXISTS `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`name`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `player_spells`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_storage`
--

CREATE TABLE IF NOT EXISTS `player_storage` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `key` varchar(32) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '0',
  UNIQUE KEY `player_id_2` (`player_id`,`key`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `player_storage`
--

INSERT INTO `player_storage` (`player_id`, `key`, `value`) VALUES
(1, '40046', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player_viplist`
--

CREATE TABLE IF NOT EXISTS `player_viplist` (
  `player_id` int(11) NOT NULL,
  `vip_id` int(11) NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`vip_id`),
  KEY `player_id` (`player_id`),
  KEY `vip_id` (`vip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `player_viplist`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `poll`
--

CREATE TABLE IF NOT EXISTS `poll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(150) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `question` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `poll`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `poll_answer`
--

CREATE TABLE IF NOT EXISTS `poll_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) NOT NULL,
  `answer` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `poll_answer`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `poll_votes`
--

CREATE TABLE IF NOT EXISTS `poll_votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_id` int(11) DEFAULT NULL,
  `poll_id` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `answer_id` (`answer_id`),
  KEY `poll_id` (`poll_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `poll_votes`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(120) DEFAULT NULL,
  `text` text,
  `time` int(11) DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL,
  `board_id` int(11) DEFAULT NULL,
  `thread_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `board_id` (`board_id`),
  KEY `thread_id` (`thread_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `posts`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `server_config`
--

CREATE TABLE IF NOT EXISTS `server_config` (
  `config` varchar(35) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `config` (`config`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `server_config`
--

INSERT INTO `server_config` (`config`, `value`) VALUES
('db_version', '29'),
('encryption', '2'),
('vahash_key', 'I9N8-5X78-272E-7Y4N');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `server_motd`
--

CREATE TABLE IF NOT EXISTS `server_motd` (
  `id` int(10) unsigned NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  UNIQUE KEY `id` (`id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `server_motd`
--

INSERT INTO `server_motd` (`id`, `world_id`, `text`) VALUES
(1, 0, 'Welcome to The Forgotten Server!'),
(2, 0, 'Welcome to the Forgotten Server!');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `server_record`
--

CREATE TABLE IF NOT EXISTS `server_record` (
  `record` int(11) NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL,
  UNIQUE KEY `record` (`record`,`world_id`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `server_record`
--

INSERT INTO `server_record` (`record`, `world_id`, `timestamp`) VALUES
(0, 0, 0),
(1, 0, 1307651540);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `server_reports`
--

CREATE TABLE IF NOT EXISTS `server_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL DEFAULT '1',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `timestamp` bigint(20) NOT NULL DEFAULT '0',
  `report` text NOT NULL,
  `reads` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `world_id` (`world_id`),
  KEY `reads` (`reads`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `server_reports`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `threads`
--

CREATE TABLE IF NOT EXISTS `threads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  `sticked` tinyint(1) DEFAULT NULL,
  `closed` tinyint(1) DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `board_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `board_id` (`board_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `threads`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiles`
--

CREATE TABLE IF NOT EXISTS `tiles` (
  `id` int(10) unsigned NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `house_id` int(10) unsigned NOT NULL,
  `x` int(5) unsigned NOT NULL,
  `y` int(5) unsigned NOT NULL,
  `z` tinyint(2) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`,`world_id`),
  KEY `x` (`x`,`y`,`z`),
  KEY `house_id` (`house_id`,`world_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `tiles`
--

INSERT INTO `tiles` (`id`, `world_id`, `house_id`, `x`, `y`, `z`) VALUES
(0, 0, 1, 165, 355, 6),
(1, 0, 1, 165, 356, 6),
(2, 0, 1, 167, 359, 6),
(3, 0, 2, 164, 362, 6),
(4, 0, 2, 161, 365, 6),
(5, 0, 2, 162, 365, 6),
(6, 0, 3, 161, 355, 6),
(7, 0, 3, 161, 356, 6),
(8, 0, 3, 163, 359, 6),
(9, 0, 4, 251, 481, 12),
(10, 0, 4, 253, 481, 11),
(11, 0, 4, 255, 481, 11),
(12, 0, 4, 255, 482, 11),
(13, 0, 5, 223, 559, 5),
(14, 0, 5, 223, 560, 5),
(15, 0, 5, 228, 560, 5),
(16, 0, 6, 228, 481, 11),
(17, 0, 6, 232, 481, 12),
(18, 0, 7, 135, 351, 4),
(19, 0, 7, 132, 352, 4),
(20, 0, 7, 135, 352, 4),
(21, 0, 8, 112, 348, 7),
(22, 0, 8, 112, 349, 7),
(23, 0, 8, 116, 349, 7),
(24, 0, 9, 118, 351, 6),
(25, 0, 9, 119, 351, 6),
(26, 0, 9, 114, 355, 6),
(27, 0, 9, 116, 353, 6),
(28, 0, 9, 118, 354, 6),
(29, 0, 9, 119, 354, 6),
(30, 0, 10, 112, 348, 5),
(31, 0, 10, 113, 348, 5),
(32, 0, 10, 116, 353, 5),
(33, 0, 11, 130, 363, 6),
(34, 0, 11, 135, 361, 6),
(35, 0, 11, 135, 362, 6),
(36, 0, 12, 134, 360, 5),
(37, 0, 12, 131, 365, 5),
(38, 0, 12, 132, 365, 5),
(39, 0, 13, 110, 375, 7),
(40, 0, 13, 111, 375, 7),
(41, 0, 13, 113, 377, 7),
(42, 0, 13, 116, 379, 7),
(43, 0, 14, 110, 392, 6),
(44, 0, 14, 109, 396, 6),
(45, 0, 14, 110, 396, 6),
(46, 0, 14, 115, 391, 7),
(47, 0, 15, 148, 375, 7),
(48, 0, 15, 152, 373, 7),
(49, 0, 15, 152, 374, 7),
(50, 0, 16, 148, 382, 7),
(51, 0, 16, 152, 382, 7),
(52, 0, 16, 152, 383, 7),
(53, 0, 17, 149, 393, 7),
(54, 0, 17, 149, 394, 7),
(55, 0, 17, 151, 399, 7),
(56, 0, 18, 151, 405, 7),
(57, 0, 18, 148, 408, 7),
(58, 0, 18, 149, 408, 7),
(59, 0, 19, 156, 396, 7),
(60, 0, 19, 156, 397, 7),
(61, 0, 19, 159, 399, 7),
(62, 0, 20, 159, 409, 7),
(63, 0, 20, 159, 410, 7),
(64, 0, 20, 162, 405, 7),
(65, 0, 23, 108, 413, 7),
(66, 0, 23, 108, 414, 7),
(67, 0, 23, 114, 414, 7),
(68, 0, 24, 108, 413, 6),
(69, 0, 24, 108, 414, 6),
(70, 0, 24, 114, 414, 6),
(71, 0, 25, 189, 357, 7),
(72, 0, 25, 189, 358, 7),
(73, 0, 25, 193, 361, 7),
(74, 0, 26, 189, 357, 6),
(75, 0, 26, 189, 358, 6),
(76, 0, 26, 193, 361, 6),
(77, 0, 27, 159, 406, 6),
(78, 0, 27, 160, 406, 6),
(79, 0, 27, 165, 409, 6),
(80, 0, 28, 180, 392, 6),
(81, 0, 28, 180, 393, 6),
(82, 0, 28, 177, 399, 6),
(83, 0, 29, 179, 412, 6),
(84, 0, 29, 180, 413, 5),
(85, 0, 29, 181, 413, 5),
(86, 0, 30, 188, 408, 4),
(87, 0, 30, 188, 412, 4),
(88, 0, 30, 190, 414, 5),
(89, 0, 30, 188, 417, 5),
(90, 0, 30, 189, 417, 5),
(91, 0, 30, 191, 417, 5),
(92, 0, 30, 192, 406, 5),
(93, 0, 30, 193, 406, 5),
(94, 0, 30, 195, 411, 4),
(95, 0, 30, 192, 417, 5),
(96, 0, 31, 161, 365, 7),
(97, 0, 31, 162, 365, 7),
(98, 0, 31, 165, 364, 7),
(99, 0, 32, 161, 359, 7),
(100, 0, 32, 162, 359, 7),
(101, 0, 32, 165, 360, 7),
(102, 0, 33, 161, 355, 7),
(103, 0, 33, 162, 355, 7),
(104, 0, 33, 165, 357, 7),
(105, 0, 34, 169, 359, 7),
(106, 0, 34, 169, 360, 7),
(107, 0, 34, 171, 362, 7),
(108, 0, 35, 179, 363, 7),
(109, 0, 35, 180, 363, 7),
(110, 0, 35, 176, 364, 7),
(111, 0, 36, 179, 359, 7),
(112, 0, 36, 180, 359, 7),
(113, 0, 36, 176, 360, 7),
(114, 0, 37, 179, 355, 7),
(115, 0, 37, 180, 355, 7),
(116, 0, 37, 176, 356, 7),
(117, 0, 38, 169, 355, 7),
(118, 0, 38, 170, 355, 7),
(119, 0, 38, 173, 357, 7),
(120, 0, 39, 180, 355, 6),
(121, 0, 39, 176, 357, 6),
(122, 0, 39, 180, 356, 6),
(123, 0, 39, 254, 437, 12),
(124, 0, 40, 180, 359, 6),
(125, 0, 40, 176, 360, 6),
(126, 0, 40, 180, 360, 6),
(127, 0, 41, 180, 363, 6),
(128, 0, 41, 176, 364, 6),
(129, 0, 41, 180, 364, 6),
(130, 0, 42, 170, 362, 6),
(131, 0, 42, 168, 365, 6),
(132, 0, 42, 169, 365, 6),
(133, 0, 43, 170, 355, 6),
(134, 0, 43, 170, 356, 6),
(135, 0, 43, 171, 359, 6),
(136, 0, 44, 260, 474, 11),
(137, 0, 44, 260, 472, 12),
(138, 0, 44, 260, 476, 11),
(139, 0, 44, 261, 476, 11),
(140, 0, 45, 266, 474, 11),
(141, 0, 45, 266, 472, 12),
(142, 0, 45, 266, 476, 11),
(143, 0, 45, 267, 476, 11),
(144, 0, 46, 271, 469, 11),
(145, 0, 46, 269, 469, 12),
(146, 0, 46, 273, 469, 11),
(147, 0, 46, 273, 470, 11),
(148, 0, 47, 271, 463, 11),
(149, 0, 47, 269, 463, 12),
(150, 0, 47, 273, 463, 11),
(151, 0, 47, 273, 464, 11),
(152, 0, 48, 271, 457, 11),
(153, 0, 48, 269, 457, 12),
(154, 0, 48, 273, 457, 11),
(155, 0, 48, 273, 458, 11),
(156, 0, 49, 266, 449, 11),
(157, 0, 49, 266, 451, 11),
(158, 0, 49, 267, 449, 11),
(159, 0, 49, 266, 453, 12),
(160, 0, 50, 260, 449, 11),
(161, 0, 50, 260, 451, 11),
(162, 0, 50, 261, 449, 11),
(163, 0, 50, 260, 453, 12),
(164, 0, 51, 224, 474, 11),
(165, 0, 51, 224, 472, 12),
(166, 0, 51, 224, 476, 11),
(167, 0, 51, 225, 476, 11),
(168, 0, 52, 218, 474, 11),
(169, 0, 52, 218, 472, 12),
(170, 0, 52, 218, 476, 11),
(171, 0, 52, 219, 476, 11),
(172, 0, 53, 210, 469, 11),
(173, 0, 53, 210, 470, 11),
(174, 0, 53, 214, 469, 12),
(175, 0, 54, 210, 463, 11),
(176, 0, 54, 212, 463, 11),
(177, 0, 54, 214, 463, 12),
(178, 0, 54, 210, 464, 11),
(179, 0, 55, 210, 457, 11),
(180, 0, 55, 210, 458, 11),
(181, 0, 55, 212, 457, 11),
(182, 0, 55, 214, 457, 12),
(183, 0, 56, 218, 449, 11),
(184, 0, 56, 218, 451, 11),
(185, 0, 56, 219, 449, 11),
(186, 0, 56, 218, 453, 12),
(187, 0, 57, 224, 449, 11),
(188, 0, 57, 224, 451, 11),
(189, 0, 57, 225, 449, 11),
(190, 0, 57, 224, 453, 12),
(191, 0, 58, 222, 438, 12),
(192, 0, 58, 219, 440, 11),
(193, 0, 58, 217, 443, 12),
(194, 0, 58, 217, 445, 11),
(195, 0, 58, 218, 445, 11),
(196, 0, 58, 219, 445, 11),
(197, 0, 58, 217, 444, 12),
(198, 0, 58, 217, 445, 12),
(199, 0, 58, 220, 445, 11),
(200, 0, 58, 222, 445, 11),
(201, 0, 58, 223, 445, 11),
(202, 0, 58, 229, 438, 12),
(203, 0, 58, 229, 439, 12),
(204, 0, 58, 224, 440, 11),
(205, 0, 58, 227, 441, 12),
(206, 0, 58, 224, 445, 11),
(207, 0, 58, 225, 445, 11),
(208, 0, 59, 254, 444, 12),
(209, 0, 59, 257, 438, 11),
(210, 0, 59, 260, 437, 12),
(211, 0, 59, 257, 441, 12),
(212, 0, 59, 260, 440, 11),
(213, 0, 59, 265, 440, 11),
(214, 0, 59, 258, 445, 11),
(215, 0, 59, 259, 445, 11),
(216, 0, 59, 260, 445, 11),
(217, 0, 59, 261, 445, 11),
(218, 0, 59, 263, 445, 11),
(219, 0, 59, 260, 444, 12),
(220, 0, 59, 264, 445, 11),
(221, 0, 59, 266, 445, 11),
(222, 0, 59, 267, 445, 11),
(223, 0, 60, 229, 545, 6),
(224, 0, 60, 230, 545, 6),
(225, 0, 60, 231, 549, 6),
(226, 0, 61, 224, 545, 6),
(227, 0, 61, 225, 545, 6),
(228, 0, 61, 226, 549, 6),
(229, 0, 62, 242, 554, 6),
(230, 0, 62, 246, 553, 6),
(231, 0, 62, 246, 554, 6),
(232, 0, 63, 233, 559, 6),
(233, 0, 63, 234, 559, 6),
(234, 0, 63, 237, 558, 6),
(235, 0, 64, 242, 558, 6),
(236, 0, 64, 245, 557, 6),
(237, 0, 64, 246, 557, 6),
(238, 0, 65, 232, 558, 5),
(239, 0, 65, 236, 556, 5),
(240, 0, 65, 236, 557, 5),
(241, 0, 66, 223, 555, 5),
(242, 0, 66, 223, 557, 5),
(243, 0, 66, 224, 555, 5),
(244, 0, 66, 224, 557, 5),
(245, 0, 66, 228, 557, 5),
(246, 0, 67, 428, 233, 6),
(247, 0, 67, 429, 233, 6),
(248, 0, 67, 430, 237, 6),
(249, 0, 68, 411, 230, 7),
(250, 0, 68, 411, 231, 7),
(251, 0, 68, 411, 235, 7),
(252, 0, 68, 413, 237, 7),
(253, 0, 69, 412, 210, 6),
(254, 0, 69, 413, 210, 6),
(255, 0, 69, 411, 213, 6),
(256, 0, 69, 414, 212, 7),
(257, 0, 70, 404, 215, 6),
(258, 0, 70, 405, 215, 6),
(259, 0, 70, 405, 217, 6),
(260, 0, 70, 406, 221, 6),
(261, 0, 71, 392, 231, 6),
(262, 0, 71, 393, 231, 6),
(263, 0, 71, 395, 229, 6),
(264, 0, 71, 399, 229, 6),
(265, 0, 72, 390, 215, 5),
(266, 0, 72, 391, 215, 5),
(267, 0, 72, 390, 218, 5),
(268, 0, 72, 391, 218, 5),
(269, 0, 72, 394, 218, 5),
(270, 0, 72, 397, 221, 5),
(271, 0, 73, 429, 210, 6),
(272, 0, 73, 429, 211, 6),
(273, 0, 73, 433, 211, 6),
(274, 0, 73, 436, 209, 6),
(275, 0, 74, 438, 207, 6),
(276, 0, 74, 439, 211, 6),
(277, 0, 74, 441, 209, 6),
(278, 0, 74, 442, 211, 6),
(279, 0, 74, 439, 212, 6),
(280, 0, 74, 442, 212, 6),
(281, 0, 75, 428, 193, 7),
(282, 0, 75, 428, 194, 7),
(283, 0, 75, 433, 195, 7),
(284, 0, 76, 479, 190, 7),
(285, 0, 76, 484, 187, 7),
(286, 0, 76, 484, 188, 7),
(287, 0, 77, 483, 183, 7),
(288, 0, 77, 486, 187, 7),
(289, 0, 77, 487, 187, 7),
(290, 0, 78, 487, 177, 6),
(291, 0, 78, 488, 177, 6),
(292, 0, 78, 491, 176, 6),
(293, 0, 79, 441, 187, 7),
(294, 0, 79, 441, 188, 7),
(295, 0, 79, 440, 192, 7),
(296, 0, 80, 443, 187, 7),
(297, 0, 80, 444, 187, 7),
(298, 0, 80, 444, 190, 7),
(299, 0, 80, 446, 195, 7),
(300, 0, 81, 447, 189, 7),
(301, 0, 81, 448, 189, 7),
(302, 0, 81, 449, 188, 7),
(303, 0, 81, 451, 191, 7),
(304, 0, 82, 452, 201, 7),
(305, 0, 82, 453, 206, 7),
(306, 0, 82, 455, 207, 7),
(307, 0, 82, 454, 209, 7),
(308, 0, 82, 455, 208, 7),
(309, 0, 82, 455, 209, 7),
(310, 0, 83, 455, 186, 7),
(311, 0, 83, 456, 186, 7),
(312, 0, 83, 455, 191, 7),
(313, 0, 84, 462, 200, 7),
(314, 0, 84, 468, 200, 7),
(315, 0, 84, 468, 201, 7),
(316, 0, 85, 443, 187, 6),
(317, 0, 85, 444, 187, 6),
(318, 0, 85, 447, 187, 6),
(319, 0, 85, 446, 191, 6),
(320, 0, 85, 448, 187, 6),
(321, 0, 86, 469, 180, 7),
(322, 0, 86, 470, 180, 7),
(323, 0, 86, 474, 183, 7),
(324, 0, 87, 474, 175, 7),
(325, 0, 87, 469, 178, 7),
(326, 0, 87, 470, 178, 7),
(327, 0, 88, 466, 166, 7),
(328, 0, 88, 467, 166, 7),
(329, 0, 88, 466, 171, 7),
(330, 0, 88, 467, 171, 7),
(331, 0, 88, 472, 168, 7),
(332, 0, 89, 467, 161, 7),
(333, 0, 89, 467, 162, 7),
(334, 0, 89, 474, 163, 7),
(335, 0, 90, 469, 156, 7),
(336, 0, 90, 469, 157, 7),
(337, 0, 90, 474, 158, 7),
(338, 0, 91, 472, 164, 6),
(339, 0, 91, 468, 170, 6),
(340, 0, 91, 468, 171, 6),
(341, 0, 91, 470, 168, 6),
(342, 0, 91, 471, 170, 6),
(343, 0, 91, 471, 171, 6),
(344, 0, 92, 468, 161, 6),
(345, 0, 92, 468, 162, 6),
(346, 0, 92, 470, 160, 6),
(347, 0, 92, 473, 160, 6),
(348, 0, 93, 483, 159, 7),
(349, 0, 93, 486, 159, 7),
(350, 0, 93, 487, 157, 7),
(351, 0, 93, 488, 157, 7),
(352, 0, 93, 480, 160, 7),
(353, 0, 94, 427, 195, 6),
(354, 0, 94, 432, 196, 6),
(355, 0, 94, 432, 197, 6),
(356, 0, 95, 427, 186, 6),
(357, 0, 95, 427, 187, 6),
(358, 0, 95, 425, 191, 6),
(359, 0, 96, 419, 186, 6),
(360, 0, 96, 420, 186, 6),
(361, 0, 96, 421, 191, 6),
(362, 0, 97, 436, 179, 7),
(363, 0, 97, 437, 179, 7),
(364, 0, 97, 436, 181, 7),
(365, 0, 97, 438, 183, 7),
(366, 0, 98, 436, 182, 6),
(367, 0, 98, 437, 183, 6),
(368, 0, 98, 438, 181, 6),
(369, 0, 98, 437, 184, 6),
(370, 0, 99, 462, 179, 5),
(371, 0, 99, 460, 183, 5),
(372, 0, 99, 462, 185, 5),
(373, 0, 99, 466, 178, 5),
(374, 0, 99, 466, 179, 5),
(375, 0, 100, 462, 155, 6),
(376, 0, 100, 465, 153, 6),
(377, 0, 100, 465, 154, 6),
(378, 0, 101, 108, 393, 7),
(379, 0, 101, 109, 393, 7),
(380, 0, 101, 108, 396, 7),
(381, 0, 101, 109, 396, 7),
(382, 0, 101, 115, 395, 7),
(383, 0, 102, 114, 393, 6),
(384, 0, 102, 114, 394, 6),
(385, 0, 102, 113, 397, 6),
(386, 0, 102, 115, 399, 7),
(387, 0, 103, 127, 405, 7),
(388, 0, 103, 129, 401, 7),
(389, 0, 103, 129, 402, 7),
(390, 0, 104, 122, 398, 7),
(391, 0, 104, 125, 397, 7),
(392, 0, 104, 129, 395, 7),
(393, 0, 104, 130, 395, 7),
(394, 0, 104, 128, 397, 7),
(395, 0, 104, 129, 399, 7),
(396, 0, 104, 130, 399, 7),
(397, 0, 105, 125, 382, 7),
(398, 0, 105, 125, 388, 6),
(399, 0, 105, 125, 388, 7),
(400, 0, 105, 129, 384, 5),
(401, 0, 105, 129, 387, 5),
(402, 0, 105, 130, 384, 5),
(403, 0, 105, 130, 387, 5),
(404, 0, 105, 131, 387, 5),
(405, 0, 105, 128, 386, 6),
(406, 0, 105, 128, 385, 7),
(407, 0, 105, 132, 387, 5),
(408, 0, 105, 128, 391, 6),
(409, 0, 105, 131, 389, 6),
(410, 0, 105, 131, 390, 6),
(411, 0, 105, 131, 391, 6),
(412, 0, 105, 131, 389, 7),
(413, 0, 105, 132, 389, 6),
(414, 0, 105, 132, 390, 6),
(415, 0, 105, 132, 391, 6),
(416, 0, 105, 131, 392, 6),
(417, 0, 105, 131, 393, 6),
(418, 0, 105, 128, 392, 7),
(419, 0, 105, 132, 392, 6),
(420, 0, 105, 132, 393, 6),
(421, 0, 106, 136, 381, 7),
(422, 0, 106, 137, 385, 7),
(423, 0, 106, 138, 385, 7),
(424, 0, 107, 134, 387, 7),
(425, 0, 107, 134, 388, 7),
(426, 0, 107, 136, 389, 7),
(427, 0, 107, 139, 388, 7),
(428, 0, 107, 141, 389, 7),
(429, 0, 107, 142, 391, 7),
(430, 0, 108, 158, 404, 7),
(431, 0, 108, 156, 408, 7),
(432, 0, 108, 156, 410, 7),
(433, 0, 108, 157, 410, 7),
(434, 0, 109, 106, 344, 7),
(435, 0, 109, 106, 345, 7),
(436, 0, 109, 111, 345, 7),
(437, 0, 110, 111, 338, 7),
(438, 0, 110, 112, 336, 7),
(439, 0, 110, 112, 337, 7),
(440, 0, 110, 115, 341, 7),
(441, 0, 111, 181, 379, 6),
(442, 0, 111, 182, 379, 6),
(443, 0, 111, 186, 378, 6),
(444, 0, 111, 181, 382, 6),
(445, 0, 111, 182, 382, 6),
(446, 0, 111, 183, 381, 6),
(447, 0, 112, 183, 371, 6),
(448, 0, 112, 182, 373, 6),
(449, 0, 112, 183, 372, 6),
(450, 0, 112, 184, 376, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tile_items`
--

CREATE TABLE IF NOT EXISTS `tile_items` (
  `tile_id` int(10) unsigned NOT NULL,
  `world_id` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL,
  UNIQUE KEY `tile_id` (`tile_id`,`world_id`,`sid`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `tile_items`
--

INSERT INTO `tile_items` (`tile_id`, `world_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(0, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(1, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(2, 0, 1, 0, 1212, 1, ''),
(3, 0, 1, 0, 1212, 1, ''),
(4, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(5, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(6, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(7, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(8, 0, 1, 0, 1212, 1, ''),
(9, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e015f00000049742062656c6f6e677320746f20686f75736520274261726167616e6f7220426f756c65766172642031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323930303020676f6c6420636f696e732e0600646f6f7269640201000000),
(10, 0, 1, 0, 5107, 1, ''),
(11, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(12, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(13, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(14, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(15, 0, 1, 0, 1209, 1, 0x8002000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f75736520275361756e6420546f702031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e0600646f6f7269640201000000),
(16, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(17, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274b617a67616c20436c6f73652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333230303020676f6c6420636f696e732e0600646f6f7269640201000000),
(18, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(19, 0, 1, 0, 6249, 1, 0x8002000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f7573652027546f77657220466c6174272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313330303020676f6c6420636f696e732e0600646f6f7269640201000000),
(20, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(21, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(22, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(23, 0, 1, 0, 6249, 1, 0x8002000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027436173746c65205374726565742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323930303020676f6c6420636f696e732e0600646f6f7269640201000000),
(24, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(25, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(26, 0, 1, 0, 6252, 1, 0x8002000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f7573652027536561766965772032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343230303020676f6c6420636f696e732e0600646f6f7269640201000000),
(27, 0, 1, 0, 6249, 1, ''),
(28, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(29, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(30, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(31, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(32, 0, 1, 0, 6249, 1, 0x8002000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f7573652027536561766965772031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323930303020676f6c6420636f696e732e0600646f6f7269640201000000),
(33, 0, 1, 0, 6249, 1, 0x8002000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f757365202748696c6c204875742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e0600646f6f7269640201000000),
(34, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(35, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(36, 0, 1, 0, 6252, 1, 0x8002000b006465736372697074696f6e015400000049742062656c6f6e677320746f20686f757365202748696c6c204875742032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e0600646f6f7269640201000000),
(37, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(38, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(39, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(40, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(41, 0, 1, 0, 1213, 1, ''),
(42, 0, 1, 0, 1210, 1, ''),
(43, 0, 1, 0, 1213, 1, ''),
(44, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(45, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(46, 0, 1, 0, 1210, 1, ''),
(47, 0, 1, 0, 1209, 1, 0x8002000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027436875726368204176656e75652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323130303020676f6c6420636f696e732e0600646f6f7269640201000000),
(48, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(49, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(50, 0, 1, 0, 1209, 1, 0x8002000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027436875726368204176656e75652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323130303020676f6c6420636f696e732e0600646f6f7269640201000000),
(51, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(52, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(53, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(54, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(55, 0, 1, 0, 1212, 1, 0x8002000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027436875726368204176656e75652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333730303020676f6c6420636f696e732e0600646f6f7269640201000000),
(56, 0, 1, 0, 1212, 1, 0x8002000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027436875726368204176656e75652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323930303020676f6c6420636f696e732e0600646f6f7269640201000000),
(57, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(58, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(59, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(60, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(61, 0, 1, 0, 1212, 1, 0x8002000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027436875726368204176656e75652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313930303020676f6c6420636f696e732e0600646f6f7269640201000000),
(62, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(63, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(64, 0, 1, 0, 1212, 1, 0x8002000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027436875726368204176656e75652037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e0600646f6f7269640201000000),
(65, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(66, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(67, 0, 1, 0, 6249, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027436974792057616c6c732031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323930303020676f6c6420636f696e732e0600646f6f7269640201000000),
(68, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(69, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(70, 0, 1, 0, 6249, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027436974792057616c6c732032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323930303020676f6c6420636f696e732e0600646f6f7269640201000000),
(71, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(72, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(73, 0, 1, 0, 6252, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027436974792057616c6c732033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e0600646f6f7269640201000000),
(74, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(75, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(76, 0, 1, 0, 6252, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027436974792057616c6c732034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333930303020676f6c6420636f696e732e0600646f6f7269640201000000),
(77, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(78, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(79, 0, 1, 0, 1209, 1, 0x8002000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f757365202748696c6c746f702031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333130303020676f6c6420636f696e732e0600646f6f7269640201000000),
(80, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(81, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(82, 0, 1, 0, 6252, 1, 0x8002000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f757365202748696c6c746f702032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e0600646f6f7269640201000000),
(83, 0, 1, 0, 6249, 1, 0x8002000b006465736372697074696f6e015300000049742062656c6f6e677320746f20686f757365202748696c6c746f702033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343530303020676f6c6420636f696e732e0600646f6f7269640201000000),
(84, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(85, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(86, 0, 1, 0, 6249, 1, 0x8002000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202748696c6c746f702048616c6c272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393130303020676f6c6420636f696e732e0600646f6f7269640206000000),
(87, 0, 1, 0, 6249, 1, 0x8002000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202748696c6c746f702048616c6c272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393130303020676f6c6420636f696e732e0600646f6f7269640205000000),
(88, 0, 1, 0, 6252, 1, 0x8002000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202748696c6c746f702048616c6c272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393130303020676f6c6420636f696e732e0600646f6f7269640203000000),
(89, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(90, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(91, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(92, 0, 1, 0, 6252, 1, 0x8002000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202748696c6c746f702048616c6c272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393130303020676f6c6420636f696e732e0600646f6f7269640202000000),
(93, 0, 1, 0, 6252, 1, 0x8002000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202748696c6c746f702048616c6c272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393130303020676f6c6420636f696e732e0600646f6f7269640201000000),
(94, 0, 1, 0, 6249, 1, 0x8002000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f757365202748696c6c746f702048616c6c272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732031393130303020676f6c6420636f696e732e0600646f6f7269640204000000),
(95, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(96, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(97, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(98, 0, 1, 0, 1209, 1, ''),
(99, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(100, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(101, 0, 1, 0, 1209, 1, ''),
(102, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(103, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(104, 0, 1, 0, 1209, 1, ''),
(105, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(106, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(107, 0, 1, 0, 1212, 1, ''),
(108, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(109, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(110, 0, 1, 0, 1209, 1, ''),
(111, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(112, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(113, 0, 1, 0, 1209, 1, ''),
(114, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(115, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(116, 0, 1, 0, 1209, 1, ''),
(117, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(118, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(119, 0, 1, 0, 1209, 1, ''),
(120, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(121, 0, 1, 0, 1209, 1, ''),
(122, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(123, 0, 1, 0, 1818, 1, ''),
(124, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(125, 0, 1, 0, 1209, 1, ''),
(126, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(127, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(128, 0, 1, 0, 1209, 1, ''),
(129, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(130, 0, 1, 0, 1212, 1, ''),
(131, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(132, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(133, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(134, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(135, 0, 1, 0, 1212, 1, ''),
(136, 0, 1, 0, 5098, 1, ''),
(137, 0, 1, 0, 5098, 1, ''),
(138, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(139, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(140, 0, 1, 0, 5098, 1, ''),
(141, 0, 1, 0, 5098, 1, ''),
(142, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(143, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(144, 0, 1, 0, 5107, 1, ''),
(145, 0, 1, 0, 5107, 1, ''),
(146, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(147, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(148, 0, 1, 0, 5107, 1, ''),
(149, 0, 1, 0, 5107, 1, ''),
(150, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(151, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(152, 0, 1, 0, 5107, 1, ''),
(153, 0, 1, 0, 5107, 1, ''),
(154, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(155, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(156, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(157, 0, 1, 0, 5098, 1, ''),
(158, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(159, 0, 1, 0, 5098, 1, ''),
(160, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(161, 0, 1, 0, 5098, 1, ''),
(162, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(163, 0, 1, 0, 5098, 1, ''),
(164, 0, 1, 0, 5098, 1, ''),
(165, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274b617a67616c20436c6f73652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333430303020676f6c6420636f696e732e0600646f6f7269640201000000),
(166, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(167, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(168, 0, 1, 0, 5098, 1, ''),
(169, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274b617a67616c20436c6f73652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333330303020676f6c6420636f696e732e0600646f6f7269640201000000),
(170, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(171, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(172, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(173, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(174, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274b617a67616c20436c6f73652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333430303020676f6c6420636f696e732e0600646f6f7269640201000000),
(175, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(176, 0, 1, 0, 5107, 1, ''),
(177, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274b617a67616c20436c6f73652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333430303020676f6c6420636f696e732e0600646f6f7269640201000000),
(178, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(179, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(180, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(181, 0, 1, 0, 5107, 1, ''),
(182, 0, 1, 0, 5107, 1, 0x8002000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f75736520274b617a67616c20436c6f736536272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333430303020676f6c6420636f696e732e0600646f6f7269640201000000),
(183, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(184, 0, 1, 0, 5098, 1, ''),
(185, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(186, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274b617a67616c20436c6f73652037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333430303020676f6c6420636f696e732e0600646f6f7269640201000000),
(187, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(188, 0, 1, 0, 5098, 1, ''),
(189, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(190, 0, 1, 0, 5098, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520274b617a67616c20436c6f73652038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333430303020676f6c6420636f696e732e0600646f6f7269640201000000),
(191, 0, 1, 0, 1209, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202748616d6d6572736d6974682048616c6c272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303330303020676f6c6420636f696e732e0600646f6f7269640204000000),
(192, 0, 1, 0, 1212, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202748616d6d6572736d6974682048616c6c272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303330303020676f6c6420636f696e732e0600646f6f7269640205000000),
(193, 0, 1, 0, 1721, 1, ''),
(194, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(195, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(196, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(197, 0, 1, 0, 1722, 1, ''),
(198, 0, 1, 0, 1723, 1, ''),
(199, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(200, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(201, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(202, 0, 1, 0, 1209, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202748616d6d6572736d6974682048616c6c272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303330303020676f6c6420636f696e732e0600646f6f7269640202000000),
(203, 0, 1, 0, 1209, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202748616d6d6572736d6974682048616c6c272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303330303020676f6c6420636f696e732e0600646f6f7269640201000000),
(204, 0, 1, 0, 1212, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202748616d6d6572736d6974682048616c6c272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303330303020676f6c6420636f696e732e0600646f6f7269640206000000),
(205, 0, 1, 0, 1212, 1, 0x8002000b006465736372697074696f6e015b00000049742062656c6f6e677320746f20686f757365202748616d6d6572736d6974682048616c6c272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f7374732032303330303020676f6c6420636f696e732e0600646f6f7269640203000000),
(206, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(207, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(208, 0, 1, 0, 1209, 1, ''),
(209, 0, 1, 0, 1209, 1, ''),
(210, 0, 1, 0, 1209, 1, ''),
(211, 0, 1, 0, 1212, 1, ''),
(212, 0, 1, 0, 1212, 1, ''),
(213, 0, 1, 0, 1212, 1, ''),
(214, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(215, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(216, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(217, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(218, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(219, 0, 1, 0, 1209, 1, ''),
(220, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(221, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(222, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(223, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(224, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(225, 0, 1, 0, 1212, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275361756e64205374726565742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313330303020676f6c6420636f696e732e0600646f6f7269640201000000),
(226, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(227, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(228, 0, 1, 0, 1212, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275361756e64205374726565742032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313730303020676f6c6420636f696e732e0600646f6f7269640201000000),
(229, 0, 1, 0, 1209, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275361756e64205374726565742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313330303020676f6c6420636f696e732e0600646f6f7269640201000000),
(230, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(231, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(232, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(233, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(234, 0, 1, 0, 1209, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275361756e64205374726565742034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313730303020676f6c6420636f696e732e0600646f6f7269640201000000),
(235, 0, 1, 0, 1209, 1, 0x8002000b006465736372697074696f6e015800000049742062656c6f6e677320746f20686f75736520275361756e64205374726565742035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313330303020676f6c6420636f696e732e0600646f6f7269640201000000),
(236, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(237, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(237, 0, 2, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(238, 0, 1, 0, 1209, 1, 0x8002000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f75736520275361756e6420546f702032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313730303020676f6c6420636f696e732e0600646f6f7269640201000000),
(239, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(240, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(241, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(242, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(243, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(244, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(245, 0, 1, 0, 1209, 1, 0x8002000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f75736520275361756e6420546f702033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e0600646f6f7269640201000000),
(246, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(247, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(248, 0, 1, 0, 6891, 1, 0x8002000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f7573652027446f636b205374726565742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323130303020676f6c6420636f696e732e0600646f6f7269640201000000),
(249, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(250, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(251, 0, 1, 0, 6891, 1, 0x8002000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f7573652027446f636b205374726565742032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e0600646f6f7269640202000000),
(252, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f7573652027446f636b205374726565742032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e0600646f6f7269640201000000),
(253, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(254, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(255, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f7573652027446f636b205374726565742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343530303020676f6c6420636f696e732e0600646f6f7269640202000000),
(256, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e015700000049742062656c6f6e677320746f20686f7573652027446f636b205374726565742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320343530303020676f6c6420636f696e732e0600646f6f7269640201000000),
(257, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(258, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(259, 0, 1, 0, 6795, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f75736520274e6f6d61642048696c6c2031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313830303020676f6c6420636f696e732e0600646f6f7269640202000000),
(260, 0, 1, 0, 7056, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f75736520274e6f6d61642048696c6c2031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313830303020676f6c6420636f696e732e0600646f6f7269640201000000),
(261, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(262, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(263, 0, 1, 0, 6797, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f75736520274e6f6d61642048696c6c2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(264, 0, 1, 0, 7054, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f75736520274e6f6d61642048696c6c2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(265, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(266, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(267, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(268, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(269, 0, 1, 0, 6797, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f75736520274e6f6d61642048696c6c2033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e0600646f6f7269640202000000),
(270, 0, 1, 0, 7056, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f75736520274e6f6d61642048696c6c2033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323830303020676f6c6420636f696e732e0600646f6f7269640201000000),
(271, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(272, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(273, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f757365202747726561742048616c6c2031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e0600646f6f7269640202000000),
(274, 0, 1, 0, 6891, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f757365202747726561742048616c6c2031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e0600646f6f7269640201000000),
(275, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f757365202747726561742048616c6c2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(276, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(277, 0, 1, 0, 6891, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f757365202747726561742048616c6c2032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(278, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(279, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(280, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(281, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(282, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(283, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546172617420526f61642031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e0600646f6f7269640201000000),
(284, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202754656d706c6520546572726163652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333630303020676f6c6420636f696e732e0600646f6f7269640201000000),
(285, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(286, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(287, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202754656d706c6520546572726163652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333330303020676f6c6420636f696e732e0600646f6f7269640201000000),
(288, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(289, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(290, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(291, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(292, 0, 1, 0, 7045, 1, 0x8002000b006465736372697074696f6e015a00000049742062656c6f6e677320746f20686f757365202754656d706c6520546572726163652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333330303020676f6c6420636f696e732e0600646f6f7269640201000000),
(293, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(294, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(295, 0, 1, 0, 6891, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546172617420526f61642032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e0600646f6f7269640201000000),
(296, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(297, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(298, 0, 1, 0, 6891, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546172617420526f61642033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333530303020676f6c6420636f696e732e0600646f6f7269640202000000),
(299, 0, 1, 0, 6891, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546172617420526f61642033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333530303020676f6c6420636f696e732e0600646f6f7269640201000000),
(300, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(301, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(302, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546172617420526f61642034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e0600646f6f7269640202000000),
(303, 0, 1, 0, 6891, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546172617420526f61642034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323330303020676f6c6420636f696e732e0600646f6f7269640201000000),
(304, 0, 1, 0, 6891, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546172617420526f61642036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(305, 0, 1, 0, 6891, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546172617420526f61642036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320353030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(306, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(307, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(308, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(309, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(310, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(311, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(312, 0, 1, 0, 6891, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546172617420526f61642037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313630303020676f6c6420636f696e732e0600646f6f7269640201000000),
(313, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546172617420526f61642038272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323930303020676f6c6420636f696e732e0600646f6f7269640201000000),
(314, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(315, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(316, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(317, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(318, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(319, 0, 1, 0, 6891, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027546172617420526f61642039272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323530303020676f6c6420636f696e732e0600646f6f7269640201000000),
(320, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(321, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(322, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(323, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027536d697468204c616e652031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e0600646f6f7269640201000000),
(324, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027536d697468204c616e652032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333130303020676f6c6420636f696e732e0600646f6f7269640201000000),
(325, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(326, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(327, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(328, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(329, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(330, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(331, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027536d697468204c616e652033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333730303020676f6c6420636f696e732e0600646f6f7269640201000000),
(332, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(333, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(334, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027536d697468204c616e652034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323930303020676f6c6420636f696e732e0600646f6f7269640201000000),
(335, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(336, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(337, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027536d697468204c616e652035272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323130303020676f6c6420636f696e732e0600646f6f7269640201000000),
(338, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027536d697468204c616e652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(339, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(340, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(341, 0, 1, 0, 6891, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027536d697468204c616e652036272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(342, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(343, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(344, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(345, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(346, 0, 1, 0, 6891, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027536d697468204c616e652037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333030303020676f6c6420636f696e732e0600646f6f7269640202000000),
(347, 0, 1, 0, 6891, 1, 0x8002000b006465736372697074696f6e015600000049742062656c6f6e677320746f20686f7573652027536d697468204c616e652037272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333030303020676f6c6420636f696e732e0600646f6f7269640201000000),
(348, 0, 1, 0, 1634, 1, 0x8002000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027536d697468204c616e652053686f70272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333730303020676f6c6420636f696e732e0600646f6f7269640202000000);
INSERT INTO `tile_items` (`tile_id`, `world_id`, `sid`, `pid`, `itemtype`, `count`, `attributes`) VALUES
(349, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027536d697468204c616e652053686f70272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333730303020676f6c6420636f696e732e0600646f6f7269640203000000),
(350, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(351, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(352, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e015900000049742062656c6f6e677320746f20686f7573652027536d697468204c616e652053686f70272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333730303020676f6c6420636f696e732e0600646f6f7269640201000000),
(353, 0, 1, 0, 6900, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027536e6f77636170706564205374726565742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323630303020676f6c6420636f696e732e0600646f6f7269640201000000),
(354, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(355, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(356, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(357, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(358, 0, 1, 0, 6891, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027536e6f77636170706564205374726565742032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323130303020676f6c6420636f696e732e0600646f6f7269640201000000),
(359, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(360, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(361, 0, 1, 0, 6891, 1, 0x8002000b006465736372697074696f6e015d00000049742062656c6f6e677320746f20686f7573652027536e6f77636170706564205374726565742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320323130303020676f6c6420636f696e732e0600646f6f7269640201000000),
(362, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(363, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(364, 0, 1, 0, 7033, 1, 0x8002000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f757365202757616c6c20466c61742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313730303020676f6c6420636f696e732e0600646f6f7269640202000000),
(365, 0, 1, 0, 7042, 1, 0x8002000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f757365202757616c6c20466c61742031272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313730303020676f6c6420636f696e732e0600646f6f7269640201000000),
(366, 0, 1, 0, 7033, 1, 0x8002000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f757365202757616c6c20466c61742032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313730303020676f6c6420636f696e732e0600646f6f7269640202000000),
(367, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(368, 0, 1, 0, 7042, 1, 0x8002000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f757365202757616c6c20466c61742032272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313730303020676f6c6420636f696e732e0600646f6f7269640201000000),
(369, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(370, 0, 1, 0, 7042, 1, 0x8002000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f757365202757616c6c20466c61742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333230303020676f6c6420636f696e732e0600646f6f7269640203000000),
(371, 0, 1, 0, 7033, 1, 0x8002000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f757365202757616c6c20466c61742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333230303020676f6c6420636f696e732e0600646f6f7269640202000000),
(372, 0, 1, 0, 7042, 1, 0x8002000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f757365202757616c6c20466c61742033272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320333230303020676f6c6420636f696e732e0600646f6f7269640201000000),
(373, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(374, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(375, 0, 1, 0, 7042, 1, 0x8002000b006465736372697074696f6e015500000049742062656c6f6e677320746f20686f757365202757616c6c20466c61742034272e204e6f626f6479206f776e73207468697320686f7573652e20497420636f73747320313330303020676f6c6420636f696e732e0600646f6f7269640201000000),
(376, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(377, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(378, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(379, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(380, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(381, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(382, 0, 1, 0, 1210, 1, ''),
(383, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(384, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(385, 0, 1, 0, 1213, 1, ''),
(386, 0, 1, 0, 1210, 1, ''),
(387, 0, 1, 0, 6253, 1, ''),
(388, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(389, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(390, 0, 1, 0, 6250, 1, ''),
(391, 0, 1, 0, 1634, 1, ''),
(392, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(393, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(394, 0, 1, 0, 6250, 1, ''),
(395, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(396, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(397, 0, 1, 0, 6253, 1, ''),
(398, 0, 1, 0, 6253, 1, ''),
(399, 0, 1, 0, 6253, 1, ''),
(400, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(401, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(402, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(403, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(404, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(405, 0, 1, 0, 6250, 1, ''),
(406, 0, 1, 0, 6255, 1, ''),
(407, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(408, 0, 1, 0, 6250, 1, ''),
(409, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(410, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(411, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(412, 0, 1, 0, 6253, 1, ''),
(413, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(414, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(415, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(416, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(417, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(418, 0, 1, 0, 6250, 1, ''),
(419, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(420, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(421, 0, 1, 0, 6253, 1, ''),
(422, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(423, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(424, 0, 1, 0, 1758, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(425, 0, 1, 0, 1759, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(426, 0, 1, 0, 6253, 1, ''),
(427, 0, 1, 0, 6250, 1, ''),
(428, 0, 1, 0, 6257, 1, ''),
(429, 0, 1, 0, 6250, 1, ''),
(430, 0, 1, 0, 1212, 1, ''),
(431, 0, 1, 0, 1212, 1, ''),
(432, 0, 1, 0, 1756, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(433, 0, 1, 0, 1757, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(434, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(435, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(436, 0, 1, 0, 6249, 1, ''),
(437, 0, 1, 0, 6253, 1, ''),
(438, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(439, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(440, 0, 1, 0, 6249, 1, ''),
(441, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(442, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(443, 0, 1, 0, 6252, 1, ''),
(444, 0, 1, 0, 1760, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(445, 0, 1, 0, 1761, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(446, 0, 1, 0, 6250, 1, ''),
(447, 0, 1, 0, 1754, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(448, 0, 1, 0, 6252, 1, ''),
(449, 0, 1, 0, 1755, 1, 0x8001000b006465736372697074696f6e01190000004e6f626f647920697320736c656570696e672074686572652e),
(450, 0, 1, 0, 6250, 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videos`
--

CREATE TABLE IF NOT EXISTS `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` int(11) DEFAULT NULL,
  `title` varchar(120) DEFAULT NULL,
  `description` tinytext,
  `youtube` varchar(45) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author` (`author`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `videos`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video_comments`
--

CREATE TABLE IF NOT EXISTS `video_comments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `author` int(11) DEFAULT NULL,
  `video` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `text` tinytext,
  PRIMARY KEY (`id`),
  KEY `video` (`video`),
  KEY `author` (`author`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `video_comments`
--


--
-- Filtros para las tablas descargadas (dump)
--

--
-- Filtros para la tabla `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD CONSTRAINT `account_viplist_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_viplist_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `bugtracker`
--
ALTER TABLE `bugtracker`
  ADD CONSTRAINT `bugtracker_ibfk_1` FOREIGN KEY (`author`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`author`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `environment_killers`
--
ALTER TABLE `environment_killers`
  ADD CONSTRAINT `environment_killers_ibfk_1` FOREIGN KEY (`kill_id`) REFERENCES `killers` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`with`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `friends_ibfk_2` FOREIGN KEY (`friend`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD CONSTRAINT `guild_invites_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD CONSTRAINT `guild_ranks_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `house_auctions`
--
ALTER TABLE `house_auctions`
  ADD CONSTRAINT `house_auctions_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `house_auctions_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `house_data`
--
ALTER TABLE `house_data`
  ADD CONSTRAINT `house_data_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `house_lists`
--
ALTER TABLE `house_lists`
  ADD CONSTRAINT `house_lists_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `killers`
--
ALTER TABLE `killers`
  ADD CONSTRAINT `killers_ibfk_1` FOREIGN KEY (`death_id`) REFERENCES `player_deaths` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD CONSTRAINT `player_deaths_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD CONSTRAINT `player_depotitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `player_items`
--
ALTER TABLE `player_items`
  ADD CONSTRAINT `player_items_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `player_killers`
--
ALTER TABLE `player_killers`
  ADD CONSTRAINT `player_killers_ibfk_1` FOREIGN KEY (`kill_id`) REFERENCES `killers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_killers_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD CONSTRAINT `player_namelocks_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `player_skills`
--
ALTER TABLE `player_skills`
  ADD CONSTRAINT `player_skills_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `player_spells`
--
ALTER TABLE `player_spells`
  ADD CONSTRAINT `player_spells_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `player_storage`
--
ALTER TABLE `player_storage`
  ADD CONSTRAINT `player_storage_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `player_viplist`
--
ALTER TABLE `player_viplist`
  ADD CONSTRAINT `player_viplist_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_viplist_ibfk_2` FOREIGN KEY (`vip_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `poll_answer`
--
ALTER TABLE `poll_answer`
  ADD CONSTRAINT `poll_answer_ibfk_1` FOREIGN KEY (`poll_id`) REFERENCES `poll` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `poll_votes`
--
ALTER TABLE `poll_votes`
  ADD CONSTRAINT `poll_votes_ibfk_1` FOREIGN KEY (`answer_id`) REFERENCES `poll_answer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `poll_votes_ibfk_2` FOREIGN KEY (`poll_id`) REFERENCES `poll` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `poll_votes_ibfk_3` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`board_id`) REFERENCES `forums` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`thread_id`) REFERENCES `threads` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `server_reports`
--
ALTER TABLE `server_reports`
  ADD CONSTRAINT `server_reports_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `threads`
--
ALTER TABLE `threads`
  ADD CONSTRAINT `threads_ibfk_1` FOREIGN KEY (`board_id`) REFERENCES `forums` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tiles`
--
ALTER TABLE `tiles`
  ADD CONSTRAINT `tiles_ibfk_1` FOREIGN KEY (`house_id`, `world_id`) REFERENCES `houses` (`id`, `world_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tile_items`
--
ALTER TABLE `tile_items`
  ADD CONSTRAINT `tile_items_ibfk_1` FOREIGN KEY (`tile_id`) REFERENCES `tiles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`author`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `video_comments`
--
ALTER TABLE `video_comments`
  ADD CONSTRAINT `video_comments_ibfk_1` FOREIGN KEY (`video`) REFERENCES `videos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `video_comments_ibfk_2` FOREIGN KEY (`author`) REFERENCES `players` (`id`) ON DELETE CASCADE;
