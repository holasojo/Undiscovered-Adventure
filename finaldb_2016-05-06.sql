# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.1.10-MariaDB)
# Database: finaldb
# Generation Time: 2016-05-06 06:40:14 +0000
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
	(62,9,6,NULL,NULL,'2016-04-17 13:06:31','he',NULL),
	(63,6,1,NULL,34,'2016-04-17 23:38:02','Filler','Filler!!!'),
	(64,6,30,NULL,34,'2016-04-17 23:38:54','Filler!!!','Filler'),
	(65,1,30,NULL,37,'2016-04-18 00:05:26',NULL,NULL),
	(66,10,1,NULL,39,'2016-04-18 00:14:08',NULL,NULL),
	(67,10,1,NULL,40,'2016-04-25 21:00:25',NULL,NULL),
	(68,10,1,NULL,41,'2016-04-25 21:29:56',NULL,NULL),
	(69,10,1,NULL,42,'2016-04-25 21:33:03',NULL,NULL),
	(70,10,1,NULL,43,'2016-04-25 21:47:29',NULL,NULL),
	(71,1,1,NULL,44,'2016-04-25 21:49:25',NULL,NULL),
	(72,10,1,NULL,45,'2016-05-05 14:09:58',NULL,NULL),
	(73,9,1,NULL,NULL,'2016-05-05 14:10:31','Hello',NULL),
	(74,3,1,NULL,44,'2016-05-05 14:11:38',NULL,NULL),
	(75,10,1,NULL,46,'2016-05-05 14:17:32',NULL,NULL),
	(76,1,1,NULL,47,'2016-05-05 14:18:19',NULL,NULL),
	(77,4,9,1,NULL,'2016-05-06 01:12:08',NULL,NULL),
	(78,5,1,9,NULL,'2016-05-06 01:12:08',NULL,NULL),
	(79,4,9,1,NULL,'2016-05-06 01:12:12',NULL,NULL),
	(80,5,1,9,NULL,'2016-05-06 01:12:12',NULL,NULL),
	(81,4,9,1,NULL,'2016-05-06 01:27:32',NULL,NULL),
	(82,5,1,9,NULL,'2016-05-06 01:27:32',NULL,NULL),
	(83,4,9,1,NULL,'2016-05-06 01:27:37',NULL,NULL),
	(84,5,1,9,NULL,'2016-05-06 01:27:37',NULL,NULL),
	(85,4,9,1,NULL,'2016-05-06 01:28:15',NULL,NULL),
	(86,5,1,9,NULL,'2016-05-06 01:28:15',NULL,NULL),
	(87,1,9,NULL,48,'2016-05-06 01:44:43',NULL,NULL),
	(88,3,9,NULL,48,'2016-05-06 01:44:59',NULL,NULL),
	(89,1,9,NULL,49,'2016-05-06 01:45:11',NULL,NULL);

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
	(9,'delete_post_viz'),
	(10,'create_post_viz');

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


# Dump of table post_likers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post_likers`;

CREATE TABLE `post_likers` (
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `post_likers` WRITE;
/*!40000 ALTER TABLE `post_likers` DISABLE KEYS */;

INSERT INTO `post_likers` (`post_id`, `user_id`)
VALUES
	(46,1),
	(43,1);

/*!40000 ALTER TABLE `post_likers` ENABLE KEYS */;
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
	(31,'woohoo','yeah',6,'2016-04-08 04:33:13',0,0,4),
	(33,'My new post!','WOOHOO',1,'2016-04-17 13:02:59',0,0,0),
	(34,'Filler','Posts',1,'2016-04-17 13:03:48',0,0,0),
	(36,'My cool post','wefwef',6,'2016-04-17 13:05:43',0,0,0),
	(37,'Visual','',30,'2016-04-18 00:05:26',0,0,0),
	(38,'Test visual create','',30,'2016-05-05 14:14:32',0,0,5),
	(39,'Event','Test',1,'2016-04-18 00:14:08',-86.5804473,35.5174913,0),
	(40,'ge','ge',1,'2016-04-25 21:00:25',0,0,0),
	(41,'n','n',1,'2016-04-25 21:29:56',0,0,0),
	(42,'gr','gr',1,'2016-04-25 21:33:03',0,0,0),
	(43,'grg','gr',1,'2016-05-05 17:04:17',-79.9414266,37.2709704,2),
	(46,'hehe','yyy',1,'2016-05-05 17:02:07',6.960278600000038,50.937531,1),
	(47,'hoho','fsdf',1,'2016-05-06 01:13:57',-91.96233269999999,30.9842977,6),
	(49,'etet','wetwet',9,'2016-05-06 01:46:12',-81.63169299999998,36.75269,0);

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
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `gender` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`user_name`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `user_name`, `pw`, `email`, `usergroup`, `lastname`, `firstname`, `gender`)
VALUES
	(1,'myname','mypass','myemail',1,'','',''),
	(6,'user1','hihi','some@email.com',1,'','',''),
	(7,'user2','yoyo','email@email.com',1,'','',''),
	(8,'ohhih','alskdjflskdf','soso@flkj',1,'','',''),
	(9,'123','123','so@lkjer',1,'','',''),
	(30,'admin','adminpw','katee93@vt.edu',5,'','',''),
	(32,'admin3','admin','katee999@vt.edu',5,'','',''),
	(33,'admin5','notadmin','cs3744@h.edu',5,'','',''),
	(34,'notadmin','notadmin','k93@vt.edu',1,'','',''),
	(35,'admin166','hihi','ad@min.com',5,'','',''),
	(36,'wte','wetwet','werwe@tete',1,'','',''),
	(37,'124aaa','erwwetwet','wewe@erwerwr',1,'wetwetwerwer','nemrqwerqwerqwerqwerqwr',''),
	(38,'44t4t','4t4t','qwerqwre@wewe',1,'qweqwe','qweqwe','female');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
