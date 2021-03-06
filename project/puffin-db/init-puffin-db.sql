# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.1.20-MariaDB-1~jessie)
# Database: puffin
# Generation Time: 2017-02-13 07:42:55 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `referat_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `element_id` bigint(20) NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `referat_id` (`referat_id`,`element_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;

INSERT INTO `comments` (`id`, `referat_id`, `element_id`, `comment`, `user_id`)
VALUES
	(1,'81051_1_5',37,'във -> в',9999),
	(2,'80922_1_19',27,'Time to get the idea, and then give it to others! :-)',9999),
	(3,'81011_2_71',24,'[MP] Изглежда да работи кирилицата?!',-1);

/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_recovery_code
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_recovery_code`;

CREATE TABLE `password_recovery_code` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `password_recovery_code_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `password_recovery_code` WRITE;
/*!40000 ALTER TABLE `password_recovery_code` DISABLE KEYS */;

INSERT INTO `password_recovery_code` (`user_id`, `code`)
VALUES
	(1,'650c12cdb331909add098ae6ccfcb1df');

/*!40000 ALTER TABLE `password_recovery_code` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table projects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `projects`;

CREATE TABLE `projects` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(20) unsigned NOT NULL,
  `version` int(20) NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `theme` int(20) unsigned NOT NULL,
  `uploaded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(16) DEFAULT 'unlocked',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;

INSERT INTO `projects` (`id`, `user_id`, `version`, `comment`, `theme`, `uploaded`, `status`)
VALUES
	(28,1,1,'Първоначална версия. Не са коригирани датите.',128,'2016-11-10 18:43:53','unlocked'),
	(29,2,1,'nz версия',129,'2017-02-11 21:18:47','unlocked'),
  (30,3,1,'Test version.',300,'2016-11-12 18:43:53','locked'),
	(31,4,1,'First commit',120,'2017-03-11 21:18:47','unlocked'),
  (32,5,1,'Финална версия.',12,'2015-11-10 22:43:53','unlocked'),
	(33,6,1,'Финална версия!',67,'2017-02-11 22:18:47','locked');

/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table scores
# ------------------------------------------------------------

DROP TABLE IF EXISTS `scores`;

CREATE TABLE `scores` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `referat_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `score` bigint(20) NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `referat_id` (`referat_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `scores` WRITE;
/*!40000 ALTER TABLE `scores` DISABLE KEYS */;

INSERT INTO `scores` (`id`, `referat_id`, `score`, `comment`, `user_id`)
VALUES
	(1,'81081_1_37',9,'Много ми харесва страницата като структуриране и съдържание! Забележките са минимални и то във външния вид, така да се каже - леки козметични недостатъци.',80846);

/*!40000 ALTER TABLE `scores` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `theme_id` int(20) DEFAULT NULL,
  `num_of_changes` int(11) NOT NULL,
  `role` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `full_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_blocked` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`,`username`),
  KEY `by_username_id` (`username`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `username`, `password`, `email`, `theme_id`, `num_of_changes`, `role`, `full_name`)
VALUES
	(1,'mihael','efe6398127928f1b2e9ef3207fb82663','mihael.dimitroff@gmail.com',128,0,'admin','Mihael Dimitrov'),
	(2,'atanas','098f6bcd4621d373cade4e832627b4f6','atanas.yanchevski@gmail.com',129,0,'user','Atanas Yanchevski'),
  (3,'milen','cc03e747a6afbbcbf8be7668acfebee5','atanas.yanchevski+milen@gmail.com',67,0,'user','Milen Komitov'),
	(4,'galin','cc03e747a6afbbcbf8be7668acfebee5','atanas.yanchevski+galin@gmail.com',12,0,'user','Galin Angelov'),
  (5,'svilen','cc03e747a6afbbcbf8be7668acfebee5','mihael.dimitroff+svilen@gmail.com',30,0,'user','Svilen Bashov'),
	(6,'emil','cc03e747a6afbbcbf8be7668acfebee5','atanas.yanchevsk+emil@gmail.com',120,0,'user','Emil Velikov');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
