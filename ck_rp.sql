-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           10.4.11-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour onset
CREATE DATABASE IF NOT EXISTS `onset` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `onset`;

-- Listage de la structure de la table onset. accounts
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `steam_id` varchar(20) DEFAULT NULL,
  `health` smallint(6) DEFAULT 100,
  `armor` smallint(6) DEFAULT 100,
  `player_name` varchar(50) DEFAULT NULL,
  `cash` int(11) DEFAULT 0,
  `cash_account` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table onset. account_administrator
CREATE TABLE IF NOT EXISTS `account_administrator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `admin_level` int(11) NOT NULL,
  `last_at_admin_state` timestamp NULL DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la procédure onset. add_administrator
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_administrator`(
	IN `a_id` INT,
	IN `privilege_level` INT




)
BEGIN
INSERT INTO onset.account_administrator (account_id, level, create_at) VALUES (a_id, privilege_level, NOW());
END//
DELIMITER ;

-- Listage de la structure de la table onset. ban
CREATE TABLE IF NOT EXISTS `ban` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reason` varchar(50) NOT NULL DEFAULT 'none',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Les données exportées n'étaient pas sélectionnées.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
