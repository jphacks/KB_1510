-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: 2015 年 11 月 10 日 08:24
-- サーバのバージョン： 5.5.38
-- PHP Version: 5.6.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `prokate`
--

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
  `photo` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `old` int(2) NOT NULL,
  `photo_dir` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `C` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `java` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `javascript` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `C+` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `isStudent` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `teachers`
--

INSERT INTO `teachers` (`id`, `username`, `password`, `created`, `modified`, `gender`, `prefecture`, `job`, `language`, `email`, `photo`, `old`, `photo_dir`, `C`, `java`, `javascript`, `C+`, `isStudent`) VALUES
(8, 'kazuki', '$2a$10$Wt3F.q5kc.1VGdZheY8tfeSeIP8f8v2CVjS29mzTcDYTbjksRTnNm', '2015-10-06 10:51:22', '2015-10-06 10:51:22', NULL, NULL, NULL, 'java', '', '', 0, '', '', '', '', '', 0),
(9, 'test', '$2a$10$TA/J9cmhdcLew5l.TODlReqrDAlHzqPJCuyb82uVwBSGGXcHdYha6', '2015-10-12 17:07:22', '2015-10-12 17:07:22', NULL, NULL, NULL, 'php,java', '', '', 0, '', '', '', '', '', 0),
(10, 'singo', NULL, NULL, NULL, NULL, NULL, '大学生', 'swift,php,java', '', '', 0, '', '', '', '', '', 0),
(11, '谷端', NULL, NULL, NULL, NULL, NULL, '大学生', 'swift', '', '', 0, '', '', '', '', '', 0),
(12, '森ちゃん', NULL, NULL, NULL, NULL, NULL, '大学生', 'php,java', '', '', 0, '', '', '', '', '', 0),
(13, '小島氏', NULL, NULL, NULL, NULL, NULL, '大学生', 'php', '', '', 0, '', '', '', '', '', 0),
(14, '三輪', NULL, NULL, NULL, NULL, NULL, '大学生', 'ruby', '', '', 0, '', '', '', '', '', 0),
(15, '矢神', NULL, NULL, NULL, NULL, NULL, '大学生', 'C', '', '', 0, '', '', '', '', '', 0),
(16, '笠島', NULL, NULL, NULL, NULL, NULL, 'エンジニア', 'C,php,java', '', '', 0, '', '', '', '', '', 0),
(17, 'singo', NULL, NULL, NULL, NULL, NULL, '大学生', 'java', '', '', 0, '', '', '', '', '', 0),
(18, 'singo', '00000', NULL, NULL, NULL, NULL, '大学生', 'php,java', '', '', 0, '', '', '', '', '', 0),
(19, '谷端', '01234', NULL, NULL, NULL, NULL, '', NULL, '', '', 0, '', '', '', '', '', 0),
(20, '森ちゃん', '23455', NULL, NULL, NULL, NULL, '大学生', NULL, '', '', 0, '', '', '', '', '', 0),
(21, '小島氏', '23456', NULL, NULL, NULL, NULL, '大学生', NULL, '', '', 0, '', '', '', '', '', 0),
(22, '三輪', '34567', NULL, NULL, NULL, NULL, '大学生', NULL, '', '', 0, '', '', '', '', '', 0),
(23, '矢神', '45678', NULL, NULL, NULL, NULL, '大学生', NULL, '', '', 0, '', '', '', '', '', 0),
(24, '笠島', '56789', NULL, NULL, NULL, NULL, 'エンジニア', NULL, '', '', 0, '', '', '', '', '', 0),
(33, 'dsfs', '$2a$10$n776Nv0jCTpIGTNZz5n9f.qyykjXu3saZ83lvsseDuvcItwqVZ3tS', '2015-11-01 11:12:07', '2015-11-01 11:12:07', NULL, NULL, NULL, NULL, 'sfaf@yahoo.co.jp', '', 0, '', '', '', '', '', 0),
(38, 'singo', '$2a$10$Saof2g3qE7yBs/FCVZFKD.Ol9/jQu7mWEX73O6/K/7FnkYKRams6m', '2015-11-02 20:40:15', '2015-11-02 20:40:15', NULL, NULL, NULL, NULL, 'trsei21@yahoo.co.jp', '', 0, '', '', '', '', '', 0),
(39, 'singo', '$2a$10$NPPpiZUfpZw/RgWVSeqRa.eJVsUhmOqDaja0QocjrEZyHeOwNKblK', '2015-11-02 20:42:36', '2015-11-02 20:42:36', NULL, NULL, NULL, NULL, 'trsei21@yahoo.co.jp', '', 0, '', '', '', '', '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=45;