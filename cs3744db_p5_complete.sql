-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2016 at 07:43 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jesus_cs3744db`
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
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `event_type_id`, `user_1_id`, `user_2_id`, `blog_post_id`, `date_created`) VALUES
(30, 1, 1, NULL, 27, '2016-04-06 06:21:41'),
(33, 1, 1, NULL, 28, '2016-04-06 06:25:27'),
(36, 2, 1, NULL, 28, '2016-04-06 06:36:05'),
(37, 1, 1, NULL, 29, '2016-04-06 06:38:06'),
(38, 2, 1, NULL, 29, '2016-04-06 06:38:19'),
(39, 3, 1, NULL, 29, '2016-04-06 06:38:36'),
(40, 1, 9, NULL, 30, '2016-04-06 06:53:56'),
(41, 3, 9, NULL, 9, '2016-04-06 06:54:30'),
(42, 3, 1, NULL, 1, '2016-04-06 06:55:07'),
(43, 3, 6, NULL, 6, '2016-04-06 06:55:30'),
(44, 1, 6, NULL, 31, '2016-04-06 06:55:57'),
(45, 2, 7, NULL, 7, '2016-04-06 06:56:20'),
(46, 3, 7, NULL, 7, '2016-04-06 06:56:22'),
(48, 4, 1, 9, NULL, '2016-04-08 05:33:09'),
(49, 5, 9, 1, NULL, '2016-04-08 05:33:09');

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
(5, 'got_follower');

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
(4, 1, 9, '2016-04-08 05:33:09');

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
(27, 'dfg', 'dfg', 1, '2016-04-06 06:21:41', 0, 0, 0),
(28, 'sdfth', 'sdfdsf', 1, '2016-04-06 06:36:05', 0, 0, 0),
(30, '1233333', '12223', 9, '2016-04-06 06:53:56', 0, 0, 0),
(31, 'woohoo', 'yeah', 6, '2016-04-06 06:55:57', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `pw` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `usergroup` int(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `pw`, `email`, `usergroup`) VALUES
(1, 'myname', 'mypass', 'myemail2', 1),
(6, 'user1', 'hihi', 'some@email.com', 1),
(7, 'user2', 'yoyo', 'email@email.com', 1),
(8, 'ohhih', 'alskdjflskdf', 'soso@flkj', 1),
(9, '123', '123', 'so@lkjer', 1),
(30, 'admin', 'adminpw', 'katee93@vt.edu', 5),
(32, 'admin3', 'admin', 'katee999@vt.edu', 5),
(33, 'admin5', 'notadmin', 'cs3744@h.edu', 5),
(34, 'notadmin', 'notadmin', 'k93@vt.edu', 1),
(35, 'admin166', 'hihi', 'ad@min.com', 5);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `event_type`
--
ALTER TABLE `event_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
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
