-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2016 at 09:19 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `finaldb2`
--

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `event_type_id` int(11) NOT NULL,
  `user_1_id` int(11) DEFAULT NULL,
  `user_2_id` int(11) DEFAULT NULL,
  `blog_post_id` int(11) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `old_data` text,
  `new_data` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `event_type_id`, `user_1_id`, `user_2_id`, `blog_post_id`, `date_created`, `old_data`, `new_data`) VALUES
(30, 1, 1, NULL, 27, '2016-04-06 06:21:41', '', ''),
(33, 1, 1, NULL, 28, '2016-04-06 06:25:27', '', ''),
(36, 2, 1, NULL, 28, '2016-04-06 06:36:05', '', ''),
(37, 1, 1, NULL, 29, '2016-04-06 06:38:06', '', ''),
(38, 2, 1, NULL, 29, '2016-04-06 06:38:19', '', ''),
(39, 3, 1, NULL, 29, '2016-04-06 06:38:36', '', ''),
(40, 1, 9, NULL, 30, '2016-04-06 06:53:56', '', ''),
(41, 3, 9, NULL, 9, '2016-04-06 06:54:30', '', ''),
(42, 3, 1, NULL, 1, '2016-04-06 06:55:07', '', ''),
(43, 3, 6, NULL, 6, '2016-04-06 06:55:30', '', ''),
(44, 1, 6, NULL, 31, '2016-04-06 06:55:57', '', ''),
(45, 2, 7, NULL, 7, '2016-04-06 06:56:20', '', ''),
(46, 3, 7, NULL, 7, '2016-04-06 06:56:22', '', ''),
(48, 4, 1, 9, NULL, '2016-04-08 05:33:09', '', ''),
(49, 5, 9, 1, NULL, '2016-04-08 05:33:09', '', ''),
(50, 1, 1, NULL, 32, '2016-04-08 09:09:48', '', ''),
(52, 6, 1, NULL, 27, '2016-04-17 16:42:30', 'dfg', 'Blog Title 5'),
(54, 9, 1, NULL, NULL, '2016-04-17 16:55:17', 'Blog Title 5', NULL),
(55, 1, 1, NULL, 33, '2016-04-17 17:02:59', NULL, NULL),
(56, 1, 1, NULL, 34, '2016-04-17 17:03:48', NULL, NULL),
(57, 1, 1, NULL, NULL, '2016-04-17 17:04:01', NULL, NULL),
(58, 1, 6, NULL, NULL, '2016-04-17 17:04:49', NULL, NULL),
(59, 1, 6, NULL, 35, '2016-04-17 17:05:16', NULL, NULL),
(60, 1, 6, NULL, 36, '2016-04-17 17:05:43', NULL, NULL),
(61, 6, 6, NULL, 36, '2016-04-17 17:06:20', 'fwefewf', 'My cool post'),
(62, 9, 6, NULL, NULL, '2016-04-17 17:06:31', 'he', NULL),
(63, 6, 1, NULL, 34, '2016-04-18 03:38:02', 'Filler', 'Filler!!!'),
(64, 6, 30, NULL, 34, '2016-04-18 03:38:54', 'Filler!!!', 'Filler'),
(65, 1, 30, NULL, 37, '2016-04-18 04:05:26', NULL, NULL),
(66, 10, 1, NULL, 39, '2016-04-18 04:14:08', NULL, NULL),
(67, 10, 1, NULL, 40, '2016-04-26 01:00:25', NULL, NULL),
(68, 10, 1, NULL, 41, '2016-04-26 01:29:56', NULL, NULL),
(69, 10, 1, NULL, 42, '2016-04-26 01:33:03', NULL, NULL),
(70, 10, 1, NULL, 43, '2016-04-26 01:47:29', NULL, NULL),
(71, 1, 1, NULL, 44, '2016-04-26 01:49:25', NULL, NULL),
(72, 10, 1, NULL, 45, '2016-05-05 18:09:58', NULL, NULL),
(73, 9, 1, NULL, NULL, '2016-05-05 18:10:31', 'Hello', NULL),
(74, 3, 1, NULL, 44, '2016-05-05 18:11:38', NULL, NULL),
(75, 10, 1, NULL, 46, '2016-05-05 18:17:32', NULL, NULL),
(76, 1, 1, NULL, 47, '2016-05-05 18:18:19', NULL, NULL),
(77, 4, 9, 1, NULL, '2016-05-06 05:12:08', NULL, NULL),
(78, 5, 1, 9, NULL, '2016-05-06 05:12:08', NULL, NULL),
(79, 4, 9, 1, NULL, '2016-05-06 05:12:12', NULL, NULL),
(80, 5, 1, 9, NULL, '2016-05-06 05:12:12', NULL, NULL),
(81, 4, 9, 1, NULL, '2016-05-06 05:27:32', NULL, NULL),
(82, 5, 1, 9, NULL, '2016-05-06 05:27:32', NULL, NULL),
(83, 4, 9, 1, NULL, '2016-05-06 05:27:37', NULL, NULL),
(84, 5, 1, 9, NULL, '2016-05-06 05:27:37', NULL, NULL),
(85, 4, 9, 1, NULL, '2016-05-06 05:28:15', NULL, NULL),
(86, 5, 1, 9, NULL, '2016-05-06 05:28:15', NULL, NULL),
(87, 1, 9, NULL, 48, '2016-05-06 05:44:43', NULL, NULL),
(88, 3, 9, NULL, 48, '2016-05-06 05:44:59', NULL, NULL),
(89, 1, 9, NULL, 49, '2016-05-06 05:45:11', NULL, NULL),
(90, 3, 1, NULL, 43, '2016-05-06 07:07:12', NULL, NULL),
(91, 3, 1, NULL, 47, '2016-05-06 07:07:18', NULL, NULL),
(92, 3, 1, NULL, 46, '2016-05-06 07:08:03', NULL, NULL),
(93, 3, 1, NULL, 42, '2016-05-06 07:08:08', NULL, NULL),
(94, 3, 1, NULL, 41, '2016-05-06 07:08:13', NULL, NULL),
(95, 3, 1, NULL, 40, '2016-05-06 07:08:17', NULL, NULL),
(96, 3, 1, NULL, 39, '2016-05-06 07:08:25', NULL, NULL),
(97, 3, 1, NULL, 34, '2016-05-06 07:08:30', NULL, NULL),
(98, 3, 1, NULL, 33, '2016-05-06 07:08:34', NULL, NULL),
(99, 1, 1, NULL, 50, '2016-05-06 07:09:48', NULL, NULL),
(100, 3, 9, NULL, 49, '2016-05-06 07:10:05', NULL, NULL),
(101, 1, 9, NULL, 51, '2016-05-06 07:11:21', NULL, NULL),
(102, 3, 30, NULL, 38, '2016-05-06 07:11:35', NULL, NULL),
(103, 3, 30, NULL, 37, '2016-05-06 07:11:38', NULL, NULL),
(104, 1, 30, NULL, 52, '2016-05-06 07:12:23', NULL, NULL),
(105, 3, 6, NULL, 36, '2016-05-06 07:12:37', NULL, NULL),
(106, 3, 6, NULL, 31, '2016-05-06 07:12:40', NULL, NULL),
(107, 1, 6, NULL, 53, '2016-05-06 07:13:10', NULL, NULL),
(108, 1, 7, NULL, 54, '2016-05-06 07:13:47', NULL, NULL),
(109, 4, 7, 30, NULL, '2016-05-06 07:14:25', NULL, NULL),
(110, 5, 30, 7, NULL, '2016-05-06 07:14:25', NULL, NULL),
(111, 4, 6, 30, NULL, '2016-05-06 07:15:05', NULL, NULL),
(112, 5, 30, 6, NULL, '2016-05-06 07:15:05', NULL, NULL),
(113, 4, 30, 7, NULL, '2016-05-06 07:15:40', NULL, NULL),
(114, 5, 7, 30, NULL, '2016-05-06 07:15:40', NULL, NULL),
(115, 10, 1, NULL, 55, '2016-05-06 07:18:05', NULL, NULL),
(116, 4, 1, 30, NULL, '2016-05-06 07:18:29', NULL, NULL),
(117, 5, 30, 1, NULL, '2016-05-06 07:18:29', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event_type`
--

CREATE TABLE `event_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_type`
--

INSERT INTO `event_type` (`id`, `name`) VALUES
(1, 'add_blog_post'),
(2, 'edit_blog_post'),
(3, 'delete_blog_post'),
(4, 'followed_user'),
(5, 'got_follower'),
(6, 'edit_title_viz'),
(9, 'delete_post_viz'),
(10, 'create_post_viz');

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `id` int(11) NOT NULL,
  `follower` int(11) NOT NULL,
  `followee` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`id`, `follower`, `followee`, `date_created`) VALUES
(4, 1, 9, '2016-04-08 05:33:09'),
(5, 7, 30, '2016-05-06 07:14:25'),
(6, 6, 30, '2016-05-06 07:15:05'),
(7, 30, 7, '2016-05-06 07:15:40'),
(8, 1, 30, '2016-05-06 07:18:29');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `author_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `vote` int(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `author_id`, `date_created`, `longitude`, `latitude`, `vote`) VALUES
(50, 'Lousy London', 'I love me some tea, so I went to London to try their classic earl grey tea. The tea itself was superb. London was a bit lack luster. Most of the time it was dark and rainy. Everywhere you went it was just a bunch of Brits enjoying a nice queue. I do not enjoy queues. Unfortunate. But at least I got to drink a ton of freaking tea! Woohoo!', 1, '2016-05-06 07:15:35', -0.12775829999998223, 51.5073509, 3),
(51, 'Down Under in Austrailia', 'Wowzers Australia is such a wild place! As soon as I got there I was attacked by at least 5 deadly animals and insects, what a blast! I got to go head-to-head with a kangaroo in an epic 12 round boxing match! I got my ass beat but it was #worth! I also got super scared by the impossible to flush spider, oh boy! Australia really is a scary place, I love it!', 9, '2016-05-06 07:16:56', 151.20699020000006, -33.8674869, 4),
(52, 'Paris!', 'Paris! What a city of pretentious, baguette eating French men! It is everything I had hoped it would be, and I feel like I fit right in, unlike in my home country of the United States of America. While America is great with its guns and all, it has got nothing on Paris. The sheer amount of baguettes alone are enough to make Paris the superior nation. God bless baguettes. ', 30, '2016-05-06 07:17:04', 2.3522219000000177, 48.85661400000001, 3),
(53, 'Living in Tokyo', 'I lived in Tokyo, Japan for a few years. It is no doubt one of the most lively and vibrant cities in the world! Great food to eat and tons of fun activities to do. The only unfortunate part is the lingering xenophobic tendencies of the Japanese culture. Even though I can speak Japanese fluently, it feels like I will never be accepted into Japanese society and will always be seen as an outsider. ', 6, '2016-05-06 07:14:10', 139.69170639999993, 35.6894875, 1),
(54, ' Shanghai Food For the Win', 'Shanghai, China was not the greatest. But I only went for that sweet, sweet authentic Chinese food baby. That was some good stuff!! But the other aspects of Shanghai really killed it for me. It really is overcrowded and it has a lot of smog. I guess the culture of over population leads to the lack of order. Every where is just one large mob. But the food experience was worth it!', 7, '2016-05-06 07:14:05', 121.473701, 31.230416, 1),
(55, 'My Trip To Seoul!', 'This is my first time visiting Asia. Korea was amazing and exceptional. Good food, good people, good atmostphere. I absolutely loved everything about the country. I would like to share my experience.. Day 1, my friend(Korean American) and I landed in Incheon. Then, we took a bus to get into the city area. The trip took about an hour or so. Thankfully, there was no traffic. ', 1, '2016-05-06 07:18:13', 126.97796919999996, 37.566535, 1);

-- --------------------------------------------------------

--
-- Table structure for table `post_likers`
--

CREATE TABLE `post_likers` (
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_likers`
--

INSERT INTO `post_likers` (`post_id`, `user_id`) VALUES
(46, 1),
(43, 1),
(54, 7),
(53, 7),
(52, 7),
(51, 7),
(50, 7),
(50, 6),
(51, 6),
(52, 6),
(51, 30),
(50, 30),
(51, 9),
(52, 9),
(55, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `pw` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `usergroup` int(10) NOT NULL DEFAULT '1',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `gender` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `pw`, `email`, `usergroup`, `lastname`, `firstname`, `gender`) VALUES
(1, 'myname', 'mypass', 'myemail', 1, 'Smith', 'Joe', 'male'),
(6, 'user1', 'hihi', 'some@email.com', 1, 'Kong', 'Kim', 'female'),
(7, 'user2', 'yoyo', 'email@email.com', 1, 'John', 'Jimmy', 'male'),
(9, '123', '123', 'so@yahoo.com', 1, 'Kelker', 'Helen', 'female'),
(30, 'admin', 'adminpw', 'katee93@vt.edu', 5, 'Kilington', 'Carl', 'male');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_type_id` (`event_type_id`) USING BTREE,
  ADD KEY `user_1_id` (`user_1_id`) USING BTREE,
  ADD KEY `user_2_id` (`user_2_id`) USING BTREE,
  ADD KEY `blog_post_id` (`blog_post_id`);

--
-- Indexes for table `event_type`
--
ALTER TABLE `event_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `follower` (`follower`) USING BTREE,
  ADD KEY `followee` (`followee`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users` (`author_id`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`user_name`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;
--
-- AUTO_INCREMENT for table `event_type`
--
ALTER TABLE `event_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`event_type_id`) REFERENCES `event_type` (`id`),
  ADD CONSTRAINT `event_ibfk_2` FOREIGN KEY (`user_1_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `event_ibfk_3` FOREIGN KEY (`user_2_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `follow_ibfk_` FOREIGN KEY (`followee`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`follower`) REFERENCES `users` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
