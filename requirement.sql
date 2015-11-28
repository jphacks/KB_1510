-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: 2015 年 11 月 28 日 15:45
-- サーバのバージョン： 5.5.38
-- PHP Version: 5.6.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `monepokey`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `places`
--

CREATE TABLE `places` (
  `name` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `detail` varchar(200) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
`id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(300) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `is_session` tinyint(1) NOT NULL,
  `point` int(7) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created`, `modified`, `is_session`, `point`) VALUES
(1, 'aaa', '', '$2a$10$eiOFCS0eFMgaGAs9bdBpXurD5LuAAgOhOgaH637h.yjkGo033w82a', '2015-11-28 15:47:30', '2015-11-28 15:47:30', 0, 0),
(2, 'fff', 'a@a', '$2a$10$lU8ixu7EFabG5whKkaBDauTAo7K8ZhT0ww4cTV7lVuw.mxvAzyr8G', '2015-11-28 16:09:21', '2015-11-28 16:09:21', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;