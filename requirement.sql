-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: 2015 年 11 月 03 日 07:33
-- サーバのバージョン： 5.5.38
-- PHP Version: 5.6.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `prokate`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `comments`
--

CREATE TABLE `comments` (
`id` int(11) NOT NULL,
  `commenter` varchar(255) DEFAULT NULL,
  `teacher_id` varchar(11) CHARACTER SET latin1 NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `body` varchar(255) NOT NULL,
  `Comment.teacher_id` int(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `treated_value` int(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `comments`
--

INSERT INTO `comments` (`id`, `commenter`, `teacher_id`, `created`, `modified`, `body`, `Comment.teacher_id`, `password`, `treated_value`) VALUES
(1, 'fff', '1', '2015-09-23 00:00:00', '0000-00-00 00:00:00', '', 0, '0', 0),
(4, 'b3', '', '2015-10-19 22:49:42', '2015-10-19 22:49:42', 'c3', 0, '0', 0),
(5, 'aaa', '', '2015-10-22 16:18:20', '2015-10-22 16:18:20', 'aa', 0, '$2a$10$D8rj5BCVWRFnU', 0),
(8, 'dd', '', '2015-10-22 20:11:27', '2015-10-22 20:11:27', 'd', 0, '$2a$10$A17kcCXePiXZ0', 0),
(9, 'd', '', '2015-10-22 20:12:05', '2015-10-22 20:12:05', 'aa', 0, '$2a$10$8wgAnFlZ/8yWa', 0),
(10, '1', '', '2015-10-24 06:19:02', '2015-10-24 06:19:02', '???', 0, '$2a$10$H1SajjH7a8Wvm', 0),
(20, 'dsf', '', '2015-10-26 11:35:15', NULL, 'sfds', 0, '', 0),
(21, 'sd', '', '2015-10-26 11:36:30', NULL, 'sdf', 0, '', 0),
(22, 'dfs', '', '2015-10-26 11:36:50', NULL, 'sdf', 0, '', 0),
(23, 'dfs', '', '2015-10-26 11:37:02', NULL, 'sdf', 0, '', 0),
(24, '名無しさん', '', '2015-10-26 11:37:46', NULL, 'dsf', 0, '', 0),
(25, '名無しさん', '', '2015-10-26 11:40:09', NULL, 'sdf', 0, '', 0),
(26, '名無しさん', '', '2015-10-26 11:46:39', NULL, 'test', 0, '', 0),
(27, '名無しさん', '', '2015-10-26 11:53:06', NULL, 'test', 0, '', 0),
(28, '名無しさん', '', '2015-10-26 11:55:42', NULL, 'test', 0, '', 0),
(29, 'dfs', '', '2015-10-26 11:55:53', NULL, 'sdfs', 0, '', 0),
(30, 'fdsf', '', '2015-10-26 11:57:13', NULL, 'sdfds', 0, '', 0),
(31, 'あいう', '', '2015-10-26 11:57:45', NULL, 'テスト', 0, '', 0),
(32, 'aaa', '', '2015-10-26 11:58:12', NULL, 'ddfs', 0, '', 0),
(33, '名無しさん', '', '2015-10-26 12:03:44', NULL, 'test', 0, '', 0),
(34, 'sdf', '', '2015-10-26 12:10:26', NULL, 'sdf', 0, '2', 0),
(35, 'sdf', '', '2015-10-26 12:12:58', NULL, 'sdfsdf', 0, '2', 0),
(36, 'sdf', '', '2015-10-26 12:13:09', NULL, 'sdfsdffds', 0, '2', 0),
(37, 'あいうえお', '', '2015-10-26 12:16:25', NULL, '日本語', 0, '3', 0),
(38, 'あいうえお', '', '2015-10-26 12:18:08', NULL, '日本語', 0, '3', 0),
(39, '名無しさん', '', '2015-10-26 13:21:22', NULL, 'test', 0, '0', 0),
(40, '名無しさん', '', '2015-10-26 13:21:55', NULL, 'test', 0, '0', 0),
(41, '名無しさん', '', '2015-10-26 13:27:01', NULL, 'test', 0, '0', 0),
(42, '名無しさん', '', '2015-10-26 13:27:50', NULL, 'test', 0, '0', 0),
(43, '名無しさん', '', '2015-10-26 13:28:33', NULL, 'test', 0, '0', 0),
(44, '名無しさん', '', '2015-10-26 13:29:00', NULL, 'test', 0, '0', 0),
(45, '名無しさん', '', '2015-10-26 13:30:01', NULL, 'test', 0, '0', 0),
(46, '名無しさん', '', '2015-10-26 13:30:16', NULL, 'test', 0, '0', 0),
(47, '名無しさん', '', '2015-10-26 13:30:36', NULL, 'test', 0, '0', 0),
(48, '名無しさん', '', '2015-10-27 01:50:28', NULL, 'test', 0, '0', 0),
(49, '名無しさん', '', '2015-10-28 22:16:29', NULL, 'test', 0, '0', 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `individual_messages`
--

CREATE TABLE `individual_messages` (
  `id` int(11) NOT NULL,
  `opponent_name` varchar(60) CHARACTER SET utf8 NOT NULL,
  `send_title` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `body` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `opponent_id` int(8) DEFAULT NULL,
  `status` int(2) NOT NULL,
  `sended_time` datetime NOT NULL,
  `message_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- テーブルのデータのダンプ `individual_messages`
--

INSERT INTO `individual_messages` (`id`, `opponent_name`, `send_title`, `body`, `opponent_id`, `status`, `sended_time`, `message_id`) VALUES
(1, 'b1', NULL, 'c1', 3, 0, '2015-10-24 12:36:32', 0),
(2, 'b2', NULL, 'c2', 4, 0, '2015-10-24 12:36:32', 0),
(3, 'b3', NULL, 'c3', 3, 0, '2015-10-24 12:36:32', 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `menters`
--

CREATE TABLE `menters` (
`id` int(11) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `gender` varchar(25) DEFAULT NULL,
  `old` int(11) NOT NULL,
  `programingskills` varchar(255) DEFAULT NULL,
  `designskills` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `facebook_account` varchar(255) DEFAULT NULL,
  `google_account` varchar(255) DEFAULT NULL,
  `text_url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- テーブルの構造 `messages`
--

CREATE TABLE `messages` (
`id` int(11) NOT NULL,
  `opponent_name` varchar(60) CHARACTER SET utf8 NOT NULL,
  `send_title` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `body` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `opponent_id` int(8) DEFAULT NULL,
  `status` varchar(30) CHARACTER SET utf8 NOT NULL,
  `sended_time` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- テーブルのデータのダンプ `messages`
--

INSERT INTO `messages` (`id`, `opponent_name`, `send_title`, `body`, `opponent_id`, `status`, `sended_time`) VALUES
(1, 'b1', NULL, 'c1', 3, '', '2015-10-24 12:36:32'),
(2, 'b2', NULL, 'c2', 4, '', '2015-10-24 12:36:32'),
(3, 'b3', NULL, 'c3', 3, '', '2015-10-24 12:36:32');

-- --------------------------------------------------------

--
-- テーブルの構造 `posts`
--

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
-- テーブルの構造 `teachermatchings`
--

CREATE TABLE `teachermatchings` (
`id` int(8) NOT NULL,
  `name` varchar(50) NOT NULL,
  `user_id` int(8) NOT NULL,
  `teacher_id` int(8) NOT NULL,
  `status` varchar(8) DEFAULT NULL,
  `offer_to_me` varchar(50) NOT NULL,
  `offer_from_me` varchar(50) NOT NULL,
  `matched` varchar(50) NOT NULL,
  `isRead` tinyint(1) DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `teachermatchings`
--

INSERT INTO `teachermatchings` (`id`, `name`, `user_id`, `teacher_id`, `status`, `offer_to_me`, `offer_from_me`, `matched`, `isRead`, `created`) VALUES
(1, '', 11, 0, NULL, '', '', '', NULL, '2015-11-02 04:14:00'),
(2, '', 11, 0, NULL, '', '', '', NULL, '2015-11-02 07:00:00'),
(3, '', 11, 2, NULL, '', '', '', NULL, '2015-11-01 08:00:00'),
(4, '', 11, 2, NULL, '', '', '', NULL, '2015-11-03 01:00:09'),
(5, '', 11, 2, NULL, '', '', '', NULL, '2015-11-02 06:00:00'),
(6, '', 2, 14, NULL, '', '', '', NULL, '2015-11-03 03:00:00'),
(7, '', 5, 14, NULL, '', '', '', NULL, '0000-00-00 00:00:00'),
(8, '', 3, 2, NULL, '', '', '', NULL, '2015-11-01 05:12:07'),
(9, '', 5, 17, NULL, '', '', '', NULL, '2015-11-03 10:16:08'),
(10, '', 5, 28, NULL, '', '', '', NULL, '2015-11-03 12:53:06'),
(11, '', 6, 2, NULL, '', '', '', NULL, '2015-11-03 12:56:54'),
(12, '', 5, 39, NULL, '', '', '', NULL, '2015-11-03 13:00:47'),
(13, '', 5, 40, NULL, '', '', '', NULL, '2015-11-03 13:01:58'),
(14, '', 5, 12, NULL, '', '', '', NULL, '2015-11-03 13:03:19');

-- --------------------------------------------------------

--
-- テーブルの構造 `teachers`
--

CREATE TABLE `teachers` (
`id` int(10) unsigned NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prefecture` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `job` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `photo_url` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `年齢` int(2) NOT NULL,
  `photo_data` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `teachers`
--

INSERT INTO `teachers` (`id`, `username`, `password`, `created`, `modified`, `gender`, `prefecture`, `job`, `language`, `email`, `photo_url`, `年齢`, `photo_data`) VALUES
(8, 'kazuki', '$2a$10$Wt3F.q5kc.1VGdZheY8tfeSeIP8f8v2CVjS29mzTcDYTbjksRTnNm', '2015-10-06 10:51:22', '2015-10-06 10:51:22', NULL, NULL, NULL, 'java', '', '', 0, ''),
(9, 'test', '$2a$10$TA/J9cmhdcLew5l.TODlReqrDAlHzqPJCuyb82uVwBSGGXcHdYha6', '2015-10-12 17:07:22', '2015-10-12 17:07:22', NULL, NULL, NULL, 'php,java', '', '', 0, ''),
(10, 'singo', NULL, NULL, NULL, NULL, NULL, '大学生', 'swift,php,java', '', '', 0, ''),
(11, '谷端', NULL, NULL, NULL, NULL, NULL, '大学生', 'swift', '', '', 0, ''),
(12, '森ちゃん', NULL, NULL, NULL, NULL, NULL, '大学生', 'php,java', '', '', 0, ''),
(13, '小島氏', NULL, NULL, NULL, NULL, NULL, '大学生', 'php', '', '', 0, ''),
(14, '三輪', NULL, NULL, NULL, NULL, NULL, '大学生', 'ruby', '', '', 0, ''),
(15, '矢神', NULL, NULL, NULL, NULL, NULL, '大学生', 'C', '', '', 0, ''),
(16, '笠島', NULL, NULL, NULL, NULL, NULL, 'エンジニア', 'C,php,java', '', '', 0, ''),
(17, 'singo', NULL, NULL, NULL, NULL, NULL, '大学生', 'java', '', '', 0, ''),
(18, 'singo', '00000', NULL, NULL, NULL, NULL, '大学生', 'php,java', '', '', 0, ''),
(19, '谷端', '01234', NULL, NULL, NULL, NULL, '', NULL, '', '', 0, ''),
(20, '森ちゃん', '23455', NULL, NULL, NULL, NULL, '大学生', NULL, '', '', 0, ''),
(21, '小島氏', '23456', NULL, NULL, NULL, NULL, '大学生', NULL, '', '', 0, ''),
(22, '三輪', '34567', NULL, NULL, NULL, NULL, '大学生', NULL, '', '', 0, ''),
(23, '矢神', '45678', NULL, NULL, NULL, NULL, '大学生', NULL, '', '', 0, ''),
(24, '笠島', '56789', NULL, NULL, NULL, NULL, 'エンジニア', NULL, '', '', 0, ''),
(25, 'singo', '646546', NULL, NULL, NULL, NULL, '大学生', NULL, '', '', 0, ''),
(26, NULL, NULL, '2015-11-01 01:49:53', '2015-11-01 01:49:53', NULL, NULL, NULL, NULL, '', 'teachers/userphoto/&', 0, ''),
(27, NULL, NULL, '2015-11-01 01:51:06', '2015-11-01 01:51:06', NULL, NULL, NULL, NULL, '', 'teachers/userphoto/&', 0, ''),
(28, NULL, NULL, '2015-11-01 01:51:30', '2015-11-01 01:51:30', NULL, NULL, NULL, NULL, '', 'teachers/userphoto/&', 0, ''),
(29, NULL, NULL, '2015-11-01 01:52:44', '2015-11-01 01:52:44', NULL, NULL, NULL, NULL, '', 'teachers/userphoto/&', 0, ''),
(30, NULL, NULL, '2015-11-01 01:56:39', '2015-11-01 01:56:39', NULL, NULL, NULL, NULL, '', 'teachers/userphoto/&', 0, ''),
(31, NULL, NULL, '2015-11-01 09:39:14', '2015-11-01 09:39:14', NULL, NULL, NULL, NULL, '', 'teachers/userphoto/&', 0, ''),
(32, NULL, NULL, '2015-11-01 11:06:57', '2015-11-01 11:06:57', NULL, NULL, NULL, NULL, '', 'teachers/userphoto/&', 0, ''),
(33, 'dsfs', '$2a$10$n776Nv0jCTpIGTNZz5n9f.qyykjXu3saZ83lvsseDuvcItwqVZ3tS', '2015-11-01 11:12:07', '2015-11-01 11:12:07', NULL, NULL, NULL, NULL, 'sfaf@yahoo.co.jp', '', 0, ''),
(34, NULL, NULL, '2015-11-01 23:14:40', '2015-11-01 23:14:40', NULL, NULL, NULL, NULL, '', 'http://localhost:8888/prokate_cake/teachers/mypicture&id=', 0, ''),
(35, NULL, NULL, '2015-11-01 23:29:59', '2015-11-01 23:29:59', NULL, NULL, NULL, NULL, '', 'http://localhost:8888/prokate_cake/teachers/mypicture/', 0, ''),
(36, NULL, NULL, '2015-11-01 23:30:28', '2015-11-01 23:30:28', NULL, NULL, NULL, NULL, '', 'http://localhost:8888/prokate_cake/teachers/mypicture/', 0, ''),
(37, NULL, NULL, '2015-11-02 07:12:13', '2015-11-02 07:12:13', NULL, NULL, NULL, NULL, '', 'http://localhost:8888/prokate_cake/teachers/mypicture/', 0, ''),
(38, 'singo', '$2a$10$Saof2g3qE7yBs/FCVZFKD.Ol9/jQu7mWEX73O6/K/7FnkYKRams6m', '2015-11-02 20:40:15', '2015-11-02 20:40:15', NULL, NULL, NULL, NULL, 'trsei21@yahoo.co.jp', '', 0, ''),
(39, 'singo', '$2a$10$NPPpiZUfpZw/RgWVSeqRa.eJVsUhmOqDaja0QocjrEZyHeOwNKblK', '2015-11-02 20:42:36', '2015-11-02 20:42:36', NULL, NULL, NULL, NULL, 'trsei21@yahoo.co.jp', '', 0, ''),
(40, NULL, NULL, '2015-11-02 23:06:07', '2015-11-02 23:06:07', NULL, NULL, NULL, NULL, '', 'http://localhost:8888/prokate_cake/teachers/mypicture/', 0, '');

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

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
  `job` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `introduction` varchar(300) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `created`, `modified`, `gender`, `old`, `prefecture`, `desire_time`, `way`, `programing_skill`, `programin_lang`, `job`, `introduction`) VALUES
(2, 'kazuki', '$2a$10$wWb3Bf0ZC1N2lKGWfgdQkO3/4x19xZc..W5PmEhKeqw5Gji3jDuF2', 'admin', '2015-10-02 17:14:38', '2015-10-06 09:01:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(3, 'kazuki', '$2a$10$rYKIUkNqkz3JOue6W0eUiuw.4pqhqE2/L31V.ZDIN2OoJvm20p9aa', 'admin', '2015-10-02 17:49:41', '2015-10-02 17:49:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(4, 'kazuki', '$2a$10$gZq4SxJqBC0vLiQDFBrQ8etM/gfkcXixdbpBDuhOlQP5RmJnhAHuu', 'admin', '2015-10-03 04:29:20', '2015-10-03 04:29:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(5, 'higashi', '$2a$10$WSyBIffGzPF6HxhF5Rph2eTpjWxgmzI.yx1ApGj1zjndBD.cC9b5u', 'admin', '2015-10-03 06:27:45', '2015-10-03 06:27:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(6, 'higashi', '$2a$10$NEyCczkUreAz1X1cWu6/N.3RIsoehn5wF91Dur42j.LjgmgJjiSRm', 'admin', '2015-10-04 03:32:22', '2015-10-04 03:32:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(7, 'kazuki', '$2a$10$RTtwVrC5e.oBd/fHOKy04u1lrgIfyaEUfhPq.ovNv2VYpft5wNtDG', 'admin', '2015-10-04 03:33:50', '2015-10-04 03:33:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(8, 'kazuki', '$2a$10$82DMWfjCgGceEWuYZD1.1u6c33QouqHtWy1yzgTs/lwiMOhdZLq3G', 'admin', '2015-10-06 10:51:33', '2015-10-06 10:51:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(9, 'kazuki', '$2a$10$6SjTK6ststitLLLrLW6WteaSyCfA8w/I.79J8UsaiWc1Qkhj3xLmu', 'admin', '2015-10-06 10:51:52', '2015-10-06 10:51:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(10, 'kazuki', '$2a$10$B1W/52THdTUvhetOraw/VO0xPaquJ5ZRgDDNFgHyEEzbE61i7bBgO', 'admin', '2015-10-14 06:33:47', '2015-10-14 06:33:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(11, 'しんご', '00000', '', '2015-10-18 18:12:57', NULL, '男', 22, '京都府', NULL, '直接又はスカイプ', '中級者レベル', 'php,iOS,MySQL,javascript', '大学生', 'こんにちは。同志社大学理工学研究科の高橋良成です。現在、APパートナーズというベンチャー企業で、新規事業の開発を行っています。プログラミング経験自体は１年強ですが、前から数学を研究などで勉強していたので、演算系は得意です。毎日研究や開発の日々で忙しいですが、機会があればよろしくお願いします。');

-- --------------------------------------------------------

--
-- テーブルの構造 `user_matchings`
--

CREATE TABLE `user_matchings` (
`id` int(8) NOT NULL,
  `name` varchar(50) NOT NULL,
  `teacher_id` int(8) NOT NULL,
  `user_id` int(8) NOT NULL,
  `status` varchar(8) DEFAULT NULL,
  `offer_to_me` varchar(50) NOT NULL,
  `offer_from_me` varchar(50) NOT NULL,
  `matched` varchar(50) NOT NULL,
  `isRead` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `user_matchings`
--

INSERT INTO `user_matchings` (`id`, `name`, `teacher_id`, `user_id`, `status`, `offer_to_me`, `offer_from_me`, `matched`, `isRead`) VALUES
(1, 'しん', 11, 0, NULL, '', '', '', NULL),
(2, 'abc', 6, 0, NULL, '', '', '', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menters`
--
ALTER TABLE `menters`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teachermatchings`
--
ALTER TABLE `teachermatchings`
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
-- Indexes for table `user_matchings`
--
ALTER TABLE `user_matchings`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `menters`
--
ALTER TABLE `menters`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `teachermatchings`
--
ALTER TABLE `teachermatchings`
MODIFY `id` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `user_matchings`
--
ALTER TABLE `user_matchings`
MODIFY `id` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;