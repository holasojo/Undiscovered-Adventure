# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.1.10-MariaDB)
# Database: db
# Generation Time: 2016-04-25 20:35:01 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `event`;

CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_type_id` int(11) NOT NULL,
  `user_1_id` int(11) DEFAULT NULL,
  `user_2_id` int(11) DEFAULT NULL,
  `blog_post_id` int(11) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `old_data` text,
  `new_data` text,
  PRIMARY KEY (`id`),
  KEY `event_type_id` (`event_type_id`) USING BTREE,
  KEY `user_1_id` (`user_1_id`) USING BTREE,
  KEY `user_2_id` (`user_2_id`) USING BTREE,
  KEY `blog_post_id` (`blog_post_id`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`event_type_id`) REFERENCES `event_type` (`id`),
  CONSTRAINT `event_ibfk_2` FOREIGN KEY (`user_1_id`) REFERENCES `users` (`id`),
  CONSTRAINT `event_ibfk_3` FOREIGN KEY (`user_2_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;

INSERT INTO `event` (`id`, `event_type_id`, `user_1_id`, `user_2_id`, `blog_post_id`, `date_created`, `old_data`, `new_data`)
VALUES
	(30,1,1,NULL,27,'2016-04-06 02:21:41','',''),
	(33,1,1,NULL,28,'2016-04-06 02:25:27','',''),
	(36,2,1,NULL,28,'2016-04-06 02:36:05','',''),
	(37,1,1,NULL,29,'2016-04-06 02:38:06','',''),
	(38,2,1,NULL,29,'2016-04-06 02:38:19','',''),
	(39,3,1,NULL,29,'2016-04-06 02:38:36','',''),
	(40,1,9,NULL,30,'2016-04-06 02:53:56','',''),
	(41,3,9,NULL,9,'2016-04-06 02:54:30','',''),
	(42,3,1,NULL,1,'2016-04-06 02:55:07','',''),
	(43,3,6,NULL,6,'2016-04-06 02:55:30','',''),
	(44,1,6,NULL,31,'2016-04-06 02:55:57','',''),
	(45,2,7,NULL,7,'2016-04-06 02:56:20','',''),
	(46,3,7,NULL,7,'2016-04-06 02:56:22','',''),
	(48,4,1,9,NULL,'2016-04-08 01:33:09','',''),
	(49,5,9,1,NULL,'2016-04-08 01:33:09','',''),
	(50,1,1,NULL,32,'2016-04-08 05:09:48','',''),
	(52,6,1,NULL,27,'2016-04-17 12:42:30','dfg','Blog Title 5'),
	(54,9,1,NULL,NULL,'2016-04-17 12:55:17','Blog Title 5',NULL),
	(55,1,1,NULL,33,'2016-04-17 13:02:59',NULL,NULL),
	(56,1,1,NULL,34,'2016-04-17 13:03:48',NULL,NULL),
	(57,1,1,NULL,NULL,'2016-04-17 13:04:01',NULL,NULL),
	(58,1,6,NULL,NULL,'2016-04-17 13:04:49',NULL,NULL),
	(59,1,6,NULL,35,'2016-04-17 13:05:16',NULL,NULL),
	(60,1,6,NULL,36,'2016-04-17 13:05:43',NULL,NULL),
	(61,6,6,NULL,36,'2016-04-17 13:06:20','fwefewf','My cool post'),
	(62,9,6,NULL,NULL,'2016-04-17 13:06:31','he',NULL);

/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table event_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `event_type`;

CREATE TABLE `event_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `event_type` WRITE;
/*!40000 ALTER TABLE `event_type` DISABLE KEYS */;

INSERT INTO `event_type` (`id`, `name`)
VALUES
	(1,'add_blog_post'),
	(2,'edit_blog_post'),
	(3,'delete_blog_post'),
	(4,'followed_user'),
	(5,'got_follower'),
	(6,'edit_title_viz'),
	(9,'delete_post_viz');

/*!40000 ALTER TABLE `event_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table follow
# ------------------------------------------------------------

DROP TABLE IF EXISTS `follow`;

CREATE TABLE `follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `follower` int(11) NOT NULL,
  `followee` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `follower` (`follower`) USING BTREE,
  KEY `followee` (`followee`),
  CONSTRAINT `follow_ibfk_` FOREIGN KEY (`followee`) REFERENCES `users` (`id`),
  CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`follower`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;

INSERT INTO `follow` (`id`, `follower`, `followee`, `date_created`)
VALUES
	(4,1,9,'2016-04-08 01:33:09');

/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `vote` int(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `users` (`author_id`) USING BTREE,
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;

INSERT INTO `posts` (`id`, `title`, `content`, `author_id`, `date_created`, `longitude`, `latitude`, `vote`)
VALUES
	(31,'woohoo','yeah',6,'2016-04-25 15:05:12',126.978,37.5326,2),
	(33,'My new post!','WOOHOO',1,'2016-04-25 15:48:46',127.0473,37.5172,0),
	(34,'Filler','Posts',1,'2016-04-25 16:27:24',127.04,37.5744,0),
	(36,'My cool post','wefwef',6,'2016-04-25 16:28:25',126.9244,37.5214,0);

/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `pw` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `usergroup` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`user_name`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `user_name`, `pw`, `email`, `usergroup`)
VALUES
	(1,'myname','mypass','myemail',1),
	(6,'user1','hihi','some@email.com',1),
	(7,'user2','yoyo','email@email.com',1),
	(8,'ohhih','alskdjflskdf','soso@flkj',1),
	(9,'123','123','so@lkjer',1),
	(30,'admin','adminpw','katee93@vt.edu',5),
	(32,'admin3','admin','katee999@vt.edu',5),
	(33,'admin5','notadmin','cs3744@h.edu',5),
	(34,'notadmin','notadmin','k93@vt.edu',1),
	(35,'admin166','hihi','ad@min.com',5);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
