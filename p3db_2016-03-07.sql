# ************************************************************
# Sequel Pro SQL dump
# Version 4529
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.1.9-MariaDB)
# Database: p3db
# Generation Time: 2016-03-07 19:00:19 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;

INSERT INTO `posts` (`id`, `title`, `content`, `author_id`, `date_created`)
VALUES
	(1,'My Trip to Seoul 2K15','This is my first time visiting Asia. Korea was amazing and exceptional. Good food, good people, good atmostphere. I absolutely loved everything about the country. I would like to share my experience.. Day 1, my friend(Korean American) and I landed in Incheon. Then, we took a bus to get into the city area. The trip took about an hour or so. Thankfully, there was no trLorem ipsum dolor sit amet, consectetur adipiscing elit. Ut diam sem, suscipit vel purus ac, vestibulum convallis metus. In nec ornare nunc. Nulla et urna in lacus tempus hendrerit quis at nibh. Cras venenatis posuere neque, sit amet varius felis rutrum nec. Curabitur pharetra tellus quis est consectetur, ut ullamcorper erat laoreet. Phasellus nisl turpis, malesuada non felis ac, pulvinar hendrerit dolor. Vestibulum velit eros, accumsan ut velit ac, imperdiet dapibus tellus. Ut viverra risus quam. Pellentesque in sem laoreet, vestibulum mi ac, rutrum ipsum. Nam lacus magna, fermentum sit amet laoreet at, sagittis ac diam. Aliquam vulputate nisl et felis feugiat, non accumsan ante sagittis. Mauris suscipit lacus sed pharetra facilisis.\n\n',1,'2016-02-25 19:24:32'),
	(2,'Living in Seoul 2','I have lived in Seoul for 5 years. A few of probably knows that I lived in Japan for 3 years as well. While I lived in Japan, I made a couple of trips to Korea and I enjoyed it very much. Of course, that is not the main reason why I moved to Seoul. But yes, I ended up here. Living in Seoul is very difficult than it seems.1. The language is different. Not that I don\'t want to learn Korean ...s est consectetur, ut ullamcorper erat laoreet. Phasellus nisl turpis, malesuada non felis ac, pulvinar hendrerit dolor. Vestibulum velit eros, accumsan ut velit ac, imperdiet dapibus tellus. Ut viverra risus quam. Pellentesque in sem laoreet, vestibulum mi ac, rutrum ipsum. Nam lacus magna, fermentum sit amet laoreet at, sagittis ac diam. Aliquam vulputate nisl et felis feugiat, non accumsan ante sagittis. Mauris suscipit lacus sed pharetra facilisis.\n\n',1,'2016-03-07 01:44:51'),
	(3,'My Favorite City 2','I have lived in Seoul for 5 years. A few of probably knows that I lived in Japan for 3 years as well. While I lived in Japan, I made a couple of trips to Korea and I enjoyed it very much. Of course, that is not the main reason why I moved to Seoul. But yes, I ended up here. Living in Seoul is very difficult than it seems.1. The language is different. Not that I don\'t want to learn Korean ...tetur adipiscing elit. Ut diam sem, suscipit vel purus ac, vestibulum convallis metus. In nec ornare nunc. Nulla et urna in lacus tempus hendrerit quis at nibh. Cras venenatis posuere neque, sit amet varius felis rutrum nec. Curabitur pharetra tellus quis est consectetur, ut ullamcorper erat laoreet. Phasellus nisl turpis, malesuada non felis ac, pulvinar hendrerit dolor. Vestibulum velit eros, accumsan ut velit ac, imperdiet dapibus tellus. Ut viverra risus quam. Pellentesque in sem laoreet, vestibulum mi ac, rutrum ipsum. Nam lacus magna, fermentum sit amet laoreet at, sagittis ac diam. Aliquam vulputate nisl et felis feugiat, non accumsan ante sagittis. Mauris suscipit lacus sed pharetra facilisis.\n\n',1,'2016-03-07 01:44:52'),
	(8,'My Trip to Seoul 2K15 4','This is my first time visiting Asia. Korea was amazing and exceptional. Good food, good people, good atmostphere. I absolutely loved everything about the country. I would like to share my experience.. Day 1, my friend(Korean American) and I landed in Incheon. Then, we took a bus to get into the city area. The trip took about an hour or so. Thankfully, there was no trLorem ipsum dolor sit amet, consectetur adipiscing elit. Ut diam sem, suscipit vel purus ac, vestibulum convallis metus. In nec ornare nunc. Nulla et urna in lacus tempus hendrerit quis at nibh. Cras venenatis posuere neque, sit amet varius felis rutrum nec. Curabitur pharetra tellus quis est consectetur, ut ullamcorper erat laoreet. Phasellus nisl turpis, malesuada non felis ac, pulvinar hendrerit dolor. Vestibulum velit eros, accumsan ut velit ac, imperdiet dapibus tellus. Ut viverra risus quam. Pellentesque in sem laoreet, vestibulum mi ac, rutrum ipsum. Nam lacus magna, fermentum sit amet laoreet at, sagittis ac diam. Aliquam vulputate nisl et felis feugiat, non accumsan ante sagittis. Mauris suscipit lacus sed pharetra facilisis.\n\n',1,'2016-03-07 00:42:48'),
	(9,'Living in Seoul 4','I have lived in Seoul for 5 years. A few of probably knows that I lived in Japan for 3 years as well. While I lived in Japan, I made a couple of trips to Korea and I enjoyed it very much. Of course, that is not the main reason why I moved to Seoul. But yes, I ended up here. Living in Seoul is very difficult than it seems.1. The language is different. Not that I don\'t want to learn Korean ...s est consectetur, ut ullamcorper erat laoreet. Phasellus nisl turpis, malesuada non felis ac, pulvinar hendrerit dolor. Vestibulum velit eros, accumsan ut velit ac, imperdiet dapibus tellus. Ut viverra risus quam. Pellentesque in sem laoreet, vestibulum mi ac, rutrum ipsum. Nam lacus magna, fermentum sit amet laoreet at, sagittis ac diam. Aliquam vulputate nisl et felis feugiat, non accumsan ante sagittis. Mauris suscipit lacus sed pharetra facilisis.\n\n',1,'2016-03-07 01:44:53'),
	(11,'My Favorite City 4','I have lived in Seoul for 5 years. A few of probably knows that I lived in Japan for 3 years as well. While I lived in Japan, I made a couple of trips to Korea and I enjoyed it vejgorjg',1,'2016-03-07 02:08:08'),
	(18,'wefwefw','erwefwef',1,'2016-03-07 13:21:04');

/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_name` varchar(50) NOT NULL DEFAULT '',
  `user_pw` varchar(50) NOT NULL,
  `user_firstname` varchar(11) NOT NULL DEFAULT '',
  `user_lastname` varchar(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `user_email`, `user_name`, `user_pw`, `user_firstname`, `user_lastname`)
VALUES
	(1,'admin@undiscovered.com','admin','123','',''),
	(2,'sohyun@vt.edu','sohyun','123','',''),
	(3,'joso930115@gmail.com','joso930115','123','','');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
