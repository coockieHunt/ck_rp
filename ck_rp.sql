-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           10.4.10-MariaDB - mariadb.org binary distribution
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
  `food` smallint(11) DEFAULT NULL,
  `thirst` smallint(11) DEFAULT NULL,
  `max_weight` int(11) DEFAULT NULL,
  `cur_weight` int(11) DEFAULT NULL,
  `player_name` varchar(50) DEFAULT NULL,
  `cash` int(11) DEFAULT 0,
  `cash_account` int(11) DEFAULT 0,
  `inventory` longtext DEFAULT '{}',
  `clothing` longtext DEFAULT '{}',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- Les données exportées n'étaient pas sélectionnées.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
