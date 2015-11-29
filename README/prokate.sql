-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: 2015 年 10 月 14 日 08:50
-- サーバのバージョン： 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prokate`
--
CREATE DATABASE IF NOT EXISTS `prokate` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `prokate`;

-- --------------------------------------------------------

--
-- テーブルの構造 `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `created`, `modified`, `user_id`, `teacher_id`) VALUES
(19, 'cakePHP教えて', 'わからんまじで助けて', '2015-10-06 10:51:09', '2015-10-06 10:51:09', 2, NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `teachers`
--

DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers` (
  `id` int(10) unsigned NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prefecture` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `job` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `teachers`
--

INSERT INTO `teachers` (`id`, `username`, `password`, `created`, `modified`, `gender`, `prefecture`, `job`, `language`) VALUES
(8, 'kazuki', '$2a$10$Wt3F.q5kc.1VGdZheY8tfeSeIP8f8v2CVjS29mzTcDYTbjksRTnNm', '2015-10-06 10:51:22', '2015-10-06 10:51:22', NULL, NULL, NULL, NULL),
(9, 'test', '$2a$10$TA/J9cmhdcLew5l.TODlReqrDAlHzqPJCuyb82uVwBSGGXcHdYha6', '2015-10-12 17:07:22', '2015-10-12 17:07:22', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `gender` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `old` int(5) DEFAULT NULL,
  `prefecture` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desire_time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `way` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `programing_skill` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `programin_lang` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `job` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `created`, `modified`, `gender`, `old`, `prefecture`, `desire_time`, `way`, `programing_skill`, `programin_lang`, `job`) VALUES
(2, 'kazuki', '$2a$10$wWb3Bf0ZC1N2lKGWfgdQkO3/4x19xZc..W5PmEhKeqw5Gji3jDuF2', 'admin', '2015-10-02 17:14:38', '2015-10-06 09:01:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'kazuki', '$2a$10$rYKIUkNqkz3JOue6W0eUiuw.4pqhqE2/L31V.ZDIN2OoJvm20p9aa', 'admin', '2015-10-02 17:49:41', '2015-10-02 17:49:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'kazuki', '$2a$10$gZq4SxJqBC0vLiQDFBrQ8etM/gfkcXixdbpBDuhOlQP5RmJnhAHuu', 'admin', '2015-10-03 04:29:20', '2015-10-03 04:29:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'higashi', '$2a$10$WSyBIffGzPF6HxhF5Rph2eTpjWxgmzI.yx1ApGj1zjndBD.cC9b5u', 'admin', '2015-10-03 06:27:45', '2015-10-03 06:27:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'higashi', '$2a$10$NEyCczkUreAz1X1cWu6/N.3RIsoehn5wF91Dur42j.LjgmgJjiSRm', 'admin', '2015-10-04 03:32:22', '2015-10-04 03:32:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'kazuki', '$2a$10$RTtwVrC5e.oBd/fHOKy04u1lrgIfyaEUfhPq.ovNv2VYpft5wNtDG', 'admin', '2015-10-04 03:33:50', '2015-10-04 03:33:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'kazuki', '$2a$10$82DMWfjCgGceEWuYZD1.1u6c33QouqHtWy1yzgTs/lwiMOhdZLq3G', 'admin', '2015-10-06 10:51:33', '2015-10-06 10:51:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'kazuki', '$2a$10$6SjTK6ststitLLLrLW6WteaSyCfA8w/I.79J8UsaiWc1Qkhj3xLmu', 'admin', '2015-10-06 10:51:52', '2015-10-06 10:51:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'kazuki', '$2a$10$B1W/52THdTUvhetOraw/VO0xPaquJ5ZRgDDNFgHyEEzbE61i7bBgO', 'admin', '2015-10-14 06:33:47', '2015-10-14 06:33:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
