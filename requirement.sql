-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: 2015 年 11 月 09 日 05:46
-- サーバのバージョン： 5.5.38
-- PHP Version: 5.6.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `categories`
--

CREATE TABLE `categories` (
`id` int(11) NOT NULL COMMENT 'サロゲートキー',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'カテゴリ名',
  `created` datetime DEFAULT NULL COMMENT '作成日時',
  `modified` datetime DEFAULT NULL COMMENT '更新日時'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `categories`
--

INSERT INTO `categories` (`id`, `name`, `created`, `modified`) VALUES
(1, 'ダイアリー', '2015-07-09 20:43:11', '2015-07-09 20:43:11'),
(2, 'サークル', '2015-07-09 20:39:41', '2015-07-09 20:39:41'),
(3, 'お気に入り', '2015-07-09 20:39:53', '2015-07-09 20:39:53'),
(4, 'フレンド', '2015-07-09 20:40:02', '2015-07-09 20:40:02'),
(5, 'ゲーム', '2015-07-09 20:40:34', '2015-07-09 20:40:34');

-- --------------------------------------------------------

--
-- テーブルの構造 `comments`
--

CREATE TABLE `comments` (
`id` int(11) NOT NULL COMMENT 'サロゲートキー',
  `post_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ポストID',
  `body` text COMMENT 'コメント内容',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'コメント記述ユーザーID',
  `created` datetime DEFAULT NULL COMMENT '作成日時',
  `modified` datetime DEFAULT NULL COMMENT '更新日時'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `posts`
--

CREATE TABLE `posts` (
`id` int(11) NOT NULL COMMENT 'サロゲートキー',
  `category_id` int(11) DEFAULT NULL COMMENT 'カテゴリID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '記事タイトル',
  `body` text COMMENT '記事内容',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '記事投稿ユーザーID',
  `created` datetime DEFAULT NULL COMMENT '作成日時',
  `modified` datetime DEFAULT NULL COMMENT '更新日時'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `tag_posts`
--

CREATE TABLE `tag_posts` (
`id` int(11) NOT NULL COMMENT 'サロゲートキー',
  `tag_id` int(11) NOT NULL DEFAULT '0' COMMENT 'タグID',
  `post_id` int(11) NOT NULL DEFAULT '0' COMMENT '記事ID',
  `created` datetime DEFAULT NULL COMMENT '作成日時',
  `modified` datetime DEFAULT NULL COMMENT '更新日時'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `tags`
--

CREATE TABLE `tags` (
`id` int(11) NOT NULL COMMENT 'サロゲートキー',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'タグ名',
  `created` datetime DEFAULT NULL COMMENT '作成日時',
  `modified` datetime DEFAULT NULL COMMENT '更新日時'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
`id` int(11) NOT NULL COMMENT 'サロゲートキー',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'ユーザー名',
  `created` datetime DEFAULT NULL COMMENT '作成日時',
  `modified` datetime DEFAULT NULL COMMENT '更新日時'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `name`, `created`, `modified`) VALUES
(1, '山田太朗', '2015-07-09 20:12:20', '2015-07-09 20:12:20'),
(3, '佐藤林太郎', '2015-07-09 20:13:20', '2015-07-09 20:13:20'),
(4, 'しんご', '2015-07-09 20:13:04', '2015-07-09 20:13:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
 ADD PRIMARY KEY (`id`), ADD KEY `FK_comments_post_id_idx` (`post_id`), ADD KEY `FK_comments_user_id_idx` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
 ADD PRIMARY KEY (`id`), ADD KEY `FK_posts_user_id_idx` (`user_id`), ADD KEY `FK_posts_category_id_idx` (`category_id`);

--
-- Indexes for table `tag_posts`
--
ALTER TABLE `tag_posts`
 ADD PRIMARY KEY (`id`), ADD KEY `FK_tag_posts_tag_id_idx` (`tag_id`), ADD KEY `FK_tag_posts_post_id_idx` (`post_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'サロゲートキー',AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'サロゲートキー';
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'サロゲートキー';
--
-- AUTO_INCREMENT for table `tag_posts`
--
ALTER TABLE `tag_posts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'サロゲートキー';
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'サロゲートキー';
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'サロゲートキー',AUTO_INCREMENT=5;
--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `comments`
--
ALTER TABLE `comments`
ADD CONSTRAINT `FK_comments_post_id` FOREIGN KEY (`post_id`) REFERENCES `oneday_blog`.`posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `FK_comments_user_id` FOREIGN KEY (`user_id`) REFERENCES `oneday_blog`.`users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- テーブルの制約 `posts`
--
ALTER TABLE `posts`
ADD CONSTRAINT `FK_posts_category_id` FOREIGN KEY (`category_id`) REFERENCES `oneday_blog`.`categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `FK_posts_user_id` FOREIGN KEY (`user_id`) REFERENCES `oneday_blog`.`users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- テーブルの制約 `tag_posts`
--
ALTER TABLE `tag_posts`
ADD CONSTRAINT `FK_tag_posts_post_id` FOREIGN KEY (`post_id`) REFERENCES `oneday_blog`.`posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `FK_tag_posts_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `oneday_blog`.`tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Database: `blog2`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `categories`
--

CREATE TABLE `categories` (
`id` int(11) NOT NULL COMMENT 'サロゲートキー',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'カテゴリ名',
  `created` datetime DEFAULT NULL COMMENT '作成日時',
  `modified` datetime DEFAULT NULL COMMENT '更新日時'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `categories`
--

INSERT INTO `categories` (`id`, `name`, `created`, `modified`) VALUES
(1, '日記', '2015-07-09 04:36:38', '2015-07-09 04:36:38'),
(2, '仕事', '2015-07-09 04:36:38', '2015-07-09 04:36:38'),
(3, 'グルメ', '2015-07-09 04:36:38', '2015-07-09 04:36:38'),
(4, '本', '2015-07-09 04:36:38', '2015-07-09 04:36:38'),
(5, '健康', '2015-07-09 04:36:38', '2015-07-09 04:36:38'),
(6, '音楽', '2015-07-09 04:36:38', '2015-07-09 04:36:38'),
(7, '趣味', '2015-07-09 04:36:38', '2015-07-09 04:36:38');

-- --------------------------------------------------------

--
-- テーブルの構造 `comments`
--

CREATE TABLE `comments` (
`id` int(11) NOT NULL COMMENT 'サロゲートキー',
  `post_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ポストID',
  `body` text COMMENT 'コメント内容',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'コメント記述ユーザーID',
  `created` datetime DEFAULT NULL COMMENT '作成日時',
  `modified` datetime DEFAULT NULL COMMENT '更新日時'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `posts`
--

CREATE TABLE `posts` (
`id` int(11) NOT NULL COMMENT 'サロゲートキー',
  `category_id` int(11) DEFAULT NULL COMMENT 'カテゴリID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '記事タイトル',
  `body` text COMMENT '記事内容',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '記事投稿ユーザーID',
  `created` datetime DEFAULT NULL COMMENT '作成日時',
  `modified` datetime DEFAULT NULL COMMENT '更新日時'
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `posts`
--

INSERT INTO `posts` (`id`, `category_id`, `title`, `body`, `user_id`, `created`, `modified`) VALUES
(1, 1, 'ブログタイトル１', 'ブログ記事１', 1, '2015-07-09 04:44:06', '2015-07-09 04:44:06'),
(2, 2, 'ブログタイトル２', 'ブログ記事２', 1, '2015-07-09 04:44:06', '2015-07-09 04:44:06'),
(3, 2, 'ブログタイトル３', 'ブログ記事３', 1, '2015-07-09 04:44:06', '2015-07-09 04:44:06'),
(4, 2, 'ブログタイトル４', 'ブログ記事４', 1, '2015-07-09 04:44:06', '2015-07-09 04:44:06'),
(5, 3, 'ブログタイトル５', 'ブログ記事５', 1, '2015-07-09 04:44:06', '2015-07-09 04:44:06'),
(6, 3, 'ブログタイトル６', 'ブログ記事６', 2, '2015-07-09 04:44:06', '2015-07-09 04:44:06'),
(7, 3, 'ブログタイトル７', 'ブログ記事７', 2, '2015-07-09 04:44:06', '2015-07-09 04:44:06'),
(8, 4, 'ブログタイトル８', 'ブログ記事８', 3, '2015-07-09 04:44:06', '2015-07-09 04:44:06'),
(9, 4, 'ブログタイトル９', 'ブログ記事９', 4, '2015-07-09 04:44:06', '2015-07-09 04:44:06'),
(10, 4, 'ブログタイトル１０', 'ブログ記事１０', 4, '2015-07-09 04:44:06', '2015-07-09 04:44:06'),
(11, 4, 'ブログタイトル１１', 'ブログ記事１１', 4, '2015-07-09 04:44:06', '2015-07-09 04:44:06'),
(12, 5, 'ブログタイトル１２', 'ブログ記事１２', 6, '2015-07-09 04:44:06', '2015-07-09 04:44:06'),
(13, 6, 'ブログタイトル１３', 'ブログ記事１３', 7, '2015-07-09 04:44:06', '2015-07-09 04:44:06'),
(14, 6, 'ブログタイトル１４', 'ブログ記事１４', 7, '2015-07-09 04:44:06', '2015-07-09 04:44:06'),
(15, 6, 'ブログタイトル１５', 'ブログ記事１５', 7, '2015-07-09 04:44:06', '2015-07-09 04:44:06'),
(16, 6, 'ブログタイトル１６', 'ブログ記事１６', 8, '2015-07-09 04:44:06', '2015-07-09 04:44:06'),
(17, 6, 'ブログタイトル１７', 'ブログ記事１７', 8, '2015-07-09 04:44:06', '2015-07-09 04:44:06'),
(18, 6, 'ブログタイトル１８', 'ブログ記事１８', 8, '2015-07-09 04:44:06', '2015-07-09 04:44:06'),
(19, 6, 'ブログタイトル１９', 'ブログ記事１９', 8, '2015-07-09 04:44:06', '2015-07-09 04:44:06'),
(20, 6, 'ブログタイトル２０', 'ブログ記事２０', 8, '2015-07-09 04:44:06', '2015-07-09 04:44:06');

-- --------------------------------------------------------

--
-- テーブルの構造 `tag_posts`
--

CREATE TABLE `tag_posts` (
`id` int(11) NOT NULL COMMENT 'サロゲートキー',
  `tag_id` int(11) NOT NULL DEFAULT '0' COMMENT 'タグID',
  `post_id` int(11) NOT NULL DEFAULT '0' COMMENT '記事ID',
  `created` datetime DEFAULT NULL COMMENT '作成日時',
  `modified` datetime DEFAULT NULL COMMENT '更新日時'
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `tag_posts`
--

INSERT INTO `tag_posts` (`id`, `tag_id`, `post_id`, `created`, `modified`) VALUES
(1, 1, 1, '2015-07-09 04:53:44', '2015-07-09 04:53:44'),
(2, 2, 1, '2015-07-09 04:53:44', '2015-07-09 04:53:44'),
(3, 3, 1, '2015-07-09 04:53:44', '2015-07-09 04:53:44'),
(4, 4, 1, '2015-07-09 04:53:44', '2015-07-09 04:53:44'),
(5, 2, 2, '2015-07-09 04:53:44', '2015-07-09 04:53:44'),
(6, 3, 2, '2015-07-09 04:53:44', '2015-07-09 04:53:44'),
(7, 2, 3, '2015-07-09 04:53:44', '2015-07-09 04:53:44'),
(8, 3, 3, '2015-07-09 04:53:44', '2015-07-09 04:53:44'),
(9, 4, 3, '2015-07-09 04:53:44', '2015-07-09 04:53:44'),
(10, 5, 3, '2015-07-09 04:53:44', '2015-07-09 04:53:44'),
(11, 2, 7, '2015-07-09 04:53:44', '2015-07-09 04:53:44'),
(12, 2, 8, '2015-07-09 04:53:44', '2015-07-09 04:53:44'),
(13, 2, 9, '2015-07-09 04:53:44', '2015-07-09 04:53:44'),
(14, 2, 10, '2015-07-09 04:53:44', '2015-07-09 04:53:44'),
(15, 2, 11, '2015-07-09 04:53:44', '2015-07-09 04:53:44'),
(16, 2, 12, '2015-07-09 04:53:44', '2015-07-09 04:53:44'),
(17, 2, 13, '2015-07-09 04:53:44', '2015-07-09 04:53:44'),
(18, 2, 14, '2015-07-09 04:53:44', '2015-07-09 04:53:44'),
(19, 2, 15, '2015-07-09 04:53:44', '2015-07-09 04:53:44'),
(20, 2, 16, '2015-07-09 04:53:44', '2015-07-09 04:53:44'),
(21, 2, 16, '2015-07-09 04:53:44', '2015-07-09 04:53:44'),
(22, 2, 16, '2015-07-09 04:53:44', '2015-07-09 04:53:44'),
(23, 2, 16, '2015-07-09 04:53:44', '2015-07-09 04:53:44'),
(24, 2, 16, '2015-07-09 04:53:44', '2015-07-09 04:53:44');

-- --------------------------------------------------------

--
-- テーブルの構造 `tags`
--

CREATE TABLE `tags` (
`id` int(11) NOT NULL COMMENT 'サロゲートキー',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'タグ名',
  `created` datetime DEFAULT NULL COMMENT '作成日時',
  `modified` datetime DEFAULT NULL COMMENT '更新日時'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `tags`
--

INSERT INTO `tags` (`id`, `name`, `created`, `modified`) VALUES
(1, 'ラーメン', '2015-07-09 04:40:54', '2015-07-09 04:40:54'),
(2, 'プログラミング', '2015-07-09 04:40:54', '2015-07-09 04:40:54'),
(3, 'デザイン', '2015-07-09 04:40:54', '2015-07-09 04:40:54'),
(4, '旅行', '2015-07-09 04:40:54', '2015-07-09 04:40:54'),
(5, '寿司', '2015-07-09 04:40:54', '2015-07-09 04:40:54'),
(6, '小説', '2015-07-09 04:40:54', '2015-07-09 04:40:54'),
(7, 'ゲーム', '2015-07-09 04:40:54', '2015-07-09 04:40:54');

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
`id` int(11) NOT NULL COMMENT 'サロゲートキー',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'ユーザー名',
  `created` datetime DEFAULT NULL COMMENT '作成日時',
  `modified` datetime DEFAULT NULL COMMENT '更新日時'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `name`, `created`, `modified`) VALUES
(1, 'テスト１太郎', '2015-07-09 04:37:36', '2015-07-09 04:37:36'),
(2, 'テスト２太郎', '2015-07-09 04:37:36', '2015-07-09 04:37:36'),
(3, 'テスト３太郎', '2015-07-09 04:37:36', '2015-07-09 04:37:36'),
(4, 'テスト４太郎', '2015-07-09 04:37:36', '2015-07-09 04:37:36'),
(5, 'テスト５太郎', '2015-07-09 04:37:36', '2015-07-09 04:37:36'),
(6, 'テスト６太郎', '2015-07-09 04:37:36', '2015-07-09 04:37:36'),
(7, 'テスト７太郎', '2015-07-09 04:37:36', '2015-07-09 04:37:36'),
(8, 'テスト８太郎', '2015-07-09 04:37:36', '2015-07-09 04:37:36'),
(9, 'テスト９太郎', '2015-07-09 04:37:36', '2015-07-09 04:37:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
 ADD PRIMARY KEY (`id`), ADD KEY `FK_comments_post_id_idx` (`post_id`), ADD KEY `FK_comments_user_id_idx` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
 ADD PRIMARY KEY (`id`), ADD KEY `FK_posts_user_id_idx` (`user_id`), ADD KEY `FK_posts_category_id_idx` (`category_id`);

--
-- Indexes for table `tag_posts`
--
ALTER TABLE `tag_posts`
 ADD PRIMARY KEY (`id`), ADD KEY `FK_tag_posts_tag_id_idx` (`tag_id`), ADD KEY `FK_tag_posts_post_id_idx` (`post_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'サロゲートキー',AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'サロゲートキー';
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'サロゲートキー',AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `tag_posts`
--
ALTER TABLE `tag_posts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'サロゲートキー',AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'サロゲートキー',AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'サロゲートキー',AUTO_INCREMENT=10;
--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `comments`
--
ALTER TABLE `comments`
ADD CONSTRAINT `FK_comments_post_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `FK_comments_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- テーブルの制約 `posts`
--
ALTER TABLE `posts`
ADD CONSTRAINT `FK_posts_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `FK_posts_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- テーブルの制約 `tag_posts`
--
ALTER TABLE `tag_posts`
ADD CONSTRAINT `FK_tag_posts_post_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `FK_tag_posts_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Database: `deltcross4`
--
--
-- Database: `mydata`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `janken_tbl`
--

CREATE TABLE `janken_tbl` (
  `judge` varchar(5) NOT NULL,
  `myname` varchar(10) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `janken_tbl`
--

INSERT INTO `janken_tbl` (`judge`, `myname`, `time`) VALUES
('あいこ', 'しんご', '2015-10-25 11:39:56'),
('勝ち', 'あああ', '2015-10-25 11:40:05'),
('あいこ', 'あいう', '2015-10-25 11:40:10'),
('負け', 'りおん', '2015-10-25 11:40:16'),
('あいこ', '', '2015-10-25 11:50:18'),
('勝ち', 'a', '2015-10-25 11:50:38'),
('あいこ', '名無しさん', '2015-10-25 11:51:06'),
('あいこ', 'あ', '2015-10-25 11:51:46'),
('負け', 'dd', '2015-10-25 17:04:14'),
('勝ち', 'dd', '2015-10-25 17:04:20'),
('あいこ', '名無しさん', '2015-10-25 17:06:52'),
('勝ち', 'aa', '2015-10-25 17:06:57'),
('負け', '', '0000-00-00 00:00:00'),
('勝ち', '', '0000-00-00 00:00:00'),
('あいこ', '名無しさん', '2015-10-26 07:38:07'),
('あいこ', 'a', '2015-10-26 07:40:39'),
('負け', '名無しさん', '2015-10-26 07:42:33'),
('負け', '', '0000-00-00 00:00:00'),
('勝ち', '', '0000-00-00 00:00:00'),
('あいこ', '名無しさん', '2015-10-26 07:47:28'),
('勝ち', '名無しさん', '2015-10-26 07:47:31'),
('勝ち', 'まま', '2015-10-26 07:49:23'),
('あいこ', '名無しさん', '2015-10-26 13:31:22'),
('', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- テーブルの構造 `myprofile`
--

CREATE TABLE `myprofile` (
  `name` varchar(55) NOT NULL,
  `birthday` varchar(255) DEFAULT NULL,
`id` int(11) NOT NULL,
  `university` varchar(55) DEFAULT NULL,
  `gakubu` varchar(55) DEFAULT NULL,
  `gakka` varchar(55) DEFAULT NULL,
  `students_id` varchar(255) DEFAULT NULL,
  `prefecture` varchar(25) DEFAULT NULL,
  `hobby` varchar(255) DEFAULT NULL,
  `programings` varchar(255) DEFAULT NULL,
  `grade` varchar(255) NOT NULL,
  `fb_id` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `introduction` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `myprofile`
--

INSERT INTO `myprofile` (`name`, `birthday`, `id`, `university`, `gakubu`, `gakka`, `students_id`, `prefecture`, `hobby`, `programings`, `grade`, `fb_id`, `link`, `introduction`) VALUES
('高橋良成', '9/9', 1, '同志社', '理工学研究科', '数理環境科学専攻', NULL, '京都', 'カラオケアニメ旅行', 'HTML,CSS,PHP,javascript,jQuery,swift,Objective-C,java,ruby', 'M2', 'Ryousei Takahashi', '', 'こんにちわ。同志社大学理工学研究科の高橋良成です。現在、とあるベンチャー企業で、新規事業の開発を行っています。プログラミング経験自体は１年少しですが、前から数学を研究などで勉強していたので、計算系は得意です。毎日研究や開発の日々で忙しいですが、頑張りたいです。');

-- --------------------------------------------------------

--
-- テーブルの構造 `test_tbl`
--

CREATE TABLE `test_tbl` (
`id` int(8) NOT NULL,
  `str` char(200) DEFAULT NULL,
  `number` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
`id` int(10) unsigned NOT NULL,
  `username` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(20) CHARACTER SET latin1 NOT NULL,
  `role` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `gender` varchar(5) CHARACTER SET latin1 NOT NULL,
  `old` int(2) NOT NULL,
  `addres` varchar(30) CHARACTER SET latin1 NOT NULL,
  `hobby` varchar(80) CHARACTER SET latin1 NOT NULL,
  `comment` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `role`, `created`, `modified`, `gender`, `old`, `addres`, `hobby`, `comment`) VALUES
(1, 'singo', '0000', '', NULL, NULL, NULL, '', 0, '', '', ''),
(2, 'name', 'passward', 'email', NULL, NULL, NULL, 'man', 24, 'toyama', 'sing', 'hi'),
(3, '?', '2222', 'econoics0it0bem0116@', NULL, NULL, NULL, '', 0, '', '', ''),
(4, '?dsafdsaf', 'ffff', 'ddd@dddd', NULL, NULL, NULL, '', 0, '', '', ''),
(5, '??', 'fdsfsf', 'fdsf@efwfe', NULL, NULL, NULL, '', 0, '', '', ''),
(6, 'safdf', 'dfsf', 'sdaa@fdsfdd', NULL, NULL, NULL, '', 0, '', '', ''),
(7, 'sds?????', 'aa', 'eee@sss', NULL, NULL, NULL, '', 0, '', '', ''),
(8, 'j?????', 'weer', 'sssd@dsdsds', NULL, NULL, NULL, '', 0, '', '', ''),
(9, 'j?????', '6o,k', 'jlkhk@oiyuo', NULL, NULL, NULL, '', 0, '', '', ''),
(10, 'a', '1', 'a@a', NULL, NULL, NULL, '?', 22, '$addres', '$hobby', '$comment'),
(12, 'singo', '0000', 'trsei21@yahoo.co.jp', NULL, NULL, NULL, '', 0, '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `myprofile`
--
ALTER TABLE `myprofile`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_tbl`
--
ALTER TABLE `test_tbl`
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
-- AUTO_INCREMENT for table `myprofile`
--
ALTER TABLE `myprofile`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `test_tbl`
--
ALTER TABLE `test_tbl`
MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;--
-- Database: `mydatabase`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `ApliComment_tbl`
--

CREATE TABLE `ApliComment_tbl` (
`com_id` int(3) NOT NULL,
  `userid` int(10) NOT NULL,
  `nusi` varchar(30) NOT NULL,
  `user` varchar(30) NOT NULL,
  `contents` varchar(300) NOT NULL,
  `datetime` datetime NOT NULL,
  `com` int(3) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `ApliComment_tbl`
--

INSERT INTO `ApliComment_tbl` (`com_id`, `userid`, `nusi`, `user`, `contents`, `datetime`, `com`) VALUES
(1, 0, '', 'Ryousei Takahashi', 'すてき', '2015-05-04 02:31:27', 0),
(2, 15, '', 'リリル', '神', '2015-05-04 03:00:24', 0),
(3, 15, '', 'リリル', 'リリル様〜！！', '2015-05-04 05:10:24', 0),
(4, 15, '', '', 'リリル様', '2015-05-04 05:13:42', 0),
(5, 16, '', '', 'まあまあ', '2015-05-04 05:24:37', 0),
(6, 9, '', 'Ryousei Takahashi', 'やあ', '2015-05-04 05:26:38', 0),
(7, 2, '', 'Ryousei Takahashi', 'やあ', '2015-05-04 05:26:46', 0),
(8, 2, '', 'Ryousei Takahashi', 'さて', '2015-05-04 05:29:54', 0),
(9, 13, '', 'Ryousei Takahashi', 'aaaa', '2015-05-04 05:31:06', 1),
(14, 15, '', 'Ryousei Takahashi', 'まあね', '2015-05-04 06:22:54', 0),
(15, 17, '', 'Ryousei Takahashi', 'いいいいd', '2015-05-09 06:21:06', 0),
(16, 17, '', 'Ryousei Takahashi', 'kk', '2015-05-09 06:21:38', 0),
(17, 12, '', 'Ryousei Takahashi', 'fadfdsdfs', '2015-08-05 01:29:32', 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `User_profile`
--

CREATE TABLE `User_profile` (
`id` int(10) NOT NULL,
  `name` varchar(25) NOT NULL,
  `gender` varchar(3) NOT NULL,
  `old` varchar(2) NOT NULL,
  `pref` varchar(6) NOT NULL,
  `purpose` varchar(30) NOT NULL,
  `twitter` varchar(30) NOT NULL,
  `facebook` varchar(30) NOT NULL,
  `github` varchar(30) NOT NULL,
  `design` varchar(30) NOT NULL,
  `program` varchar(30) NOT NULL,
  `others` varchar(150) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `email` varchar(30) NOT NULL,
  `passward` varchar(20) NOT NULL,
  `fb_id` int(18) NOT NULL,
  `iine` int(3) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `User_profile`
--

INSERT INTO `User_profile` (`id`, `name`, `gender`, `old`, `pref`, `purpose`, `twitter`, `facebook`, `github`, `design`, `program`, `others`, `comment`, `email`, `passward`, `fb_id`, `iine`) VALUES
(1, 'akarasama', '男', '22', '青森県', '', '', '', '', 'illlustrator', 'IOSアプリ', 'unity', 'よろしく', 'acc@softbank.ne.jp', '0000', 0, 0),
(2, 'あかい', '', '', '', '', '', '', '', '', '', '', '', 'りんご', 'おいしい', 0, 0),
(3, 'fsdfsd', '', '', '', '', '', '', '', '', '', '', '', 'aaa', '0123', 0, 0),
(5, 'しんご', '女', '13', '兵庫県', '動画', 'edef', '""', '""', 'illustrator', 'IOSアプリ', '""', '是非メッセージまってます！', 'trsei21@yahoo.co.jp', 'cccc', 0, 0),
(8, 'ぴあ', '', '', '', '', '', '', '', '', '', '', '', 'asdfg@zxcv.co.jp', 'zxcvb', 0, 0),
(9, 'リリル', '', '', '', '', '', '', '', '', '', '', '', 'zexel01@softbank.ne.jp', '2489', 0, 0),
(10, 'test', '', '', '', '', '', '', '', '', '', '', '', 'test@test', 'test', 0, 0),
(12, 'アダム', '', '', '', '', '', '', '', '', '', '', '', 'z@gmail.com', '090', 0, 0),
(13, 're', '', '', '', '', '', '', '', '', '', '', '', 'e@e', 'e', 0, 0),
(14, 'しん', '', '', '', '', '', '', '', '', '', '', '', 'trsei21@yahoo.co.jp', 'y210', 0, 0),
(15, 'fdsfsafsdas', '', '', '', '', '', '', '', '', '', '', '', 'e@wer', '00988', 0, 0),
(16, 'アクセラレータ', '', '', '', '', '', '', '', '', '', '', '', 'zerus@softbank.ne.jp', '0000', 0, 0),
(17, '渋谷和也', '', '', '', '', '', '', '', '', '', '', '', 'zexei01@i.softbank.jp', '0123', 0, 0),
(18, 'アクセラレータ', '', '', '', '', '', '', '', '', '', '', '', 'trsei21@yahoo.co.jp', '0123', 0, 0),
(19, 'みる', '', '', '', '', '', '', '', '', '', '', '', 'zexel0@i.softbank.jp', '7890', 0, 0),
(20, 'namae', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0),
(21, 'ryosei', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0),
(31, 'Ryousei Takahashi', '女', '15', '北海道', '', '', '', '', 'illustrator', 'IOSアプリ', '(例)　Scrach', '緒に開発する仲間募集中です！', '', '', 0, 0),
(33, 'hogehogeマン', '', '', '', '', '', '', '', '', '', '', '', 'misokatukueyo@gmail.com', 'hogehoge', 0, 0),
(34, 'シャナ', '', '', '', '', 'shana', '', '', '', '', '', '', 'zexel8716@gmail.com', '2568', 0, 0),
(35, 'xzcvxzvcxv', '', '', '', '', '', '', '', '', '', '', '', 'xzvcxzvcxz@dsfaf', 'cvxzvzv', 0, 0),
(36, 'しん', '', '', '', '', '', '', '', '', '', '', '', 'trsei21@yahoo.co.jp', '9000', 0, 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `tweet_tbl`
--

CREATE TABLE `tweet_tbl` (
`tweet_id` int(3) NOT NULL,
  `account_name` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `url` varchar(100) NOT NULL,
  `contents` varchar(140) NOT NULL,
  `tseet_time` datetime NOT NULL,
  `iine` int(3) NOT NULL,
  `comment` int(3) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `tweet_tbl`
--

INSERT INTO `tweet_tbl` (`tweet_id`, `account_name`, `title`, `url`, `contents`, `tseet_time`, `iine`, `comment`) VALUES
(2, 'junchiba', '', '', '開発楽しみましょう！', '2015-02-21 01:50:23', 3, 0),
(4, 'takashin', '', '', 'fdsfs', '2015-04-15 08:44:38', 3, 0),
(5, 'takashin', '', '', 'ああああ', '2015-04-15 08:49:42', 5, 0),
(6, 'takashin', '', '', 'ああ楽しい', '2015-04-15 08:51:11', 2, 0),
(7, 'takashin', '', '', 'ふふふ', '2015-04-15 10:18:51', 5, 0),
(8, 'takashin', '', '', 'fdsfds', '2015-04-15 10:34:00', 4, 0),
(9, 'takashin', '', '', 'dsffw', '2015-04-15 10:34:59', 4, 0),
(10, 'takashin', '', '', 'あいうえお', '2015-04-15 12:25:37', 2, 0),
(11, 'takashin', '', '', 'マックス', '2015-04-15 12:27:20', 3, 0),
(12, 'takashin', '', '', 'まま', '2015-04-15 12:28:05', 3, 3),
(13, 'takashin', '', '', 'あかさたな', '2015-04-15 12:28:57', 3, 0),
(14, 'しんご', '', '', 'アプリ最高だ', '2015-04-15 12:32:28', 3, 0),
(15, 'リリル', '', '', '能力、もらうよ〜♪', '2015-04-15 15:01:11', 6, 3),
(16, 're', '', '', 'ははは', '2015-04-16 01:12:29', 4, 0),
(17, 're', '', '', '雲量会', '2015-04-16 01:14:35', 3, 2),
(42, 'Ryousei Takahashi', 'データベースurl', 'http://a1.zeroprm.com/phpmyadmin/index.php?db=b31_c467&table=tweet_tbl&target=sql.php&token=a78334b2', 'phpmyadmin', '2015-05-04 01:15:21', 2, 0),
(47, 'シャナ', 'Ruby', 'http://mukaer.com/archives/2012/04/19/ruby_2/', 'Railsやりてえ', '2015-05-14 21:08:31', 7, 0),
(48, 'Ryousei Takahashi', 'ブックバー', 'http://a1.zeroprm.com/b31_c554/BOOK_VS/top.php ', '読書によるゲーミフィケーション！', '2015-06-01 15:34:59', 4, 0),
(50, 'Ryousei Takahashi', 'gdfsgsdf', 'dsg', 'dsgfsdfgds', '2015-08-05 01:29:12', 1, 0),
(52, 'Ryousei Takahashi', 'asdada', 'asdd', 'asdadadadada', '2015-08-12 06:57:45', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ApliComment_tbl`
--
ALTER TABLE `ApliComment_tbl`
 ADD PRIMARY KEY (`com_id`);

--
-- Indexes for table `User_profile`
--
ALTER TABLE `User_profile`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tweet_tbl`
--
ALTER TABLE `tweet_tbl`
 ADD PRIMARY KEY (`tweet_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ApliComment_tbl`
--
ALTER TABLE `ApliComment_tbl`
MODIFY `com_id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `User_profile`
--
ALTER TABLE `User_profile`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `tweet_tbl`
--
ALTER TABLE `tweet_tbl`
MODIFY `tweet_id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=53;--
-- Database: `oneday_blog`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `categories`
--

CREATE TABLE `categories` (
`id` int(11) NOT NULL COMMENT 'サロゲートキー',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'カテゴリ名',
  `created` datetime DEFAULT NULL COMMENT '作成日時',
  `modified` datetime DEFAULT NULL COMMENT '更新日時'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `categories`
--

INSERT INTO `categories` (`id`, `name`, `created`, `modified`) VALUES
(1, 'テストカテゴリー1', '2015-04-16 19:09:28', '2015-04-16 19:09:28'),
(2, 'テストカテゴリー2', '2015-04-16 19:09:28', '2015-04-16 19:09:28');

-- --------------------------------------------------------

--
-- テーブルの構造 `comments`
--

CREATE TABLE `comments` (
`id` int(11) NOT NULL COMMENT 'サロゲートキー',
  `post_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ポストID',
  `body` text COMMENT 'コメント内容',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'コメント記述ユーザーID',
  `created` datetime DEFAULT NULL COMMENT '作成日時',
  `modified` datetime DEFAULT NULL COMMENT '更新日時'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `body`, `user_id`, `created`, `modified`) VALUES
(1, 1, 'コメント1', 1, '2015-04-16 19:09:28', '2015-04-16 19:09:28'),
(2, 1, 'コメント2', 1, '2015-04-16 19:09:28', '2015-04-16 19:09:28');

-- --------------------------------------------------------

--
-- テーブルの構造 `posts`
--

CREATE TABLE `posts` (
`id` int(11) NOT NULL COMMENT 'サロゲートキー',
  `category_id` int(11) DEFAULT NULL COMMENT 'カテゴリID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '記事タイトル',
  `body` text COMMENT '記事内容',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '記事投稿ユーザーID',
  `created` datetime DEFAULT NULL COMMENT '作成日時',
  `modified` datetime DEFAULT NULL COMMENT '更新日時'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `posts`
--

INSERT INTO `posts` (`id`, `category_id`, `title`, `body`, `user_id`, `created`, `modified`) VALUES
(1, 1, 'テストタイトル1', '記事本文記事本文記事本文記事本文記事本文記事本文記事本文記事本文記事本文記事本文記事本文', 1, '2015-04-16 19:09:28', '2015-04-16 19:09:28'),
(2, 1, 'テストタイトル2', '記事本文記事本文記事本文記事本文記事本文記事本文記事本文記事本文記事本文記事本文記事本文', 2, '2015-04-16 19:09:28', '2015-04-16 19:09:28'),
(3, 1, 'dfsf', 'fsdfdsf', 1, '2015-04-16 13:42:16', '2015-04-16 13:42:16'),
(4, 1, 'あらら', 'やほ', 1, '2015-04-16 14:03:36', '2015-04-16 14:03:36'),
(5, 1, 'メイン', 'トピックスへ急ぐ', 1, '2015-04-18 16:37:38', '2015-04-18 16:37:38'),
(6, 1, 'やほお', '遊ぼう', 1, '2015-04-21 14:39:33', '2015-04-21 14:39:33'),
(7, 1, 'っっd', 'っっf', 1, '2015-05-01 16:54:23', '2015-05-01 16:54:23');

-- --------------------------------------------------------

--
-- テーブルの構造 `tag_posts`
--

CREATE TABLE `tag_posts` (
`id` int(11) NOT NULL COMMENT 'サロゲートキー',
  `tag_id` int(11) NOT NULL DEFAULT '0' COMMENT 'タグID',
  `post_id` int(11) NOT NULL DEFAULT '0' COMMENT '記事ID',
  `created` datetime DEFAULT NULL COMMENT '作成日時',
  `modified` datetime DEFAULT NULL COMMENT '更新日時'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `tag_posts`
--

INSERT INTO `tag_posts` (`id`, `tag_id`, `post_id`, `created`, `modified`) VALUES
(1, 1, 1, '2015-04-16 19:09:28', '2015-04-16 19:09:28'),
(2, 1, 2, '2015-04-16 19:09:28', '2015-04-16 19:09:28'),
(3, 2, 2, '2015-04-16 19:09:28', '2015-04-16 19:09:28');

-- --------------------------------------------------------

--
-- テーブルの構造 `tags`
--

CREATE TABLE `tags` (
`id` int(11) NOT NULL COMMENT 'サロゲートキー',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'タグ名',
  `created` datetime DEFAULT NULL COMMENT '作成日時',
  `modified` datetime DEFAULT NULL COMMENT '更新日時'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `tags`
--

INSERT INTO `tags` (`id`, `name`, `created`, `modified`) VALUES
(1, 'テストタグ1', '2015-04-16 19:09:28', '2015-04-16 19:09:28'),
(2, 'テストタグ2', '2015-04-16 19:09:28', '2015-04-16 19:09:28');

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
`id` int(11) NOT NULL COMMENT 'サロゲートキー',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'ユーザー名',
  `created` datetime DEFAULT NULL COMMENT '作成日時',
  `modified` datetime DEFAULT NULL COMMENT '更新日時'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `name`, `created`, `modified`) VALUES
(1, 'テストユーザ1', '2015-04-16 19:09:28', '2015-04-16 19:09:28'),
(2, 'テストユーザ2', '2015-04-16 19:09:28', '2015-04-16 19:09:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
 ADD PRIMARY KEY (`id`), ADD KEY `FK_comments_post_id_idx` (`post_id`), ADD KEY `FK_comments_user_id_idx` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
 ADD PRIMARY KEY (`id`), ADD KEY `FK_posts_user_id_idx` (`user_id`), ADD KEY `FK_posts_category_id_idx` (`category_id`);

--
-- Indexes for table `tag_posts`
--
ALTER TABLE `tag_posts`
 ADD PRIMARY KEY (`id`), ADD KEY `FK_tag_posts_tag_id_idx` (`tag_id`), ADD KEY `FK_tag_posts_post_id_idx` (`post_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'サロゲートキー',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'サロゲートキー',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'サロゲートキー',AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tag_posts`
--
ALTER TABLE `tag_posts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'サロゲートキー',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'サロゲートキー',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'サロゲートキー',AUTO_INCREMENT=3;
--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `comments`
--
ALTER TABLE `comments`
ADD CONSTRAINT `FK_comments_post_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `FK_comments_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- テーブルの制約 `posts`
--
ALTER TABLE `posts`
ADD CONSTRAINT `FK_posts_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `FK_posts_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- テーブルの制約 `tag_posts`
--
ALTER TABLE `tag_posts`
ADD CONSTRAINT `FK_tag_posts_post_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `FK_tag_posts_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
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
  `user_id` int(8) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `body` varchar(255) NOT NULL,
  `Comment.teacher_id` int(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `treated_value` int(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `comments`
--

INSERT INTO `comments` (`id`, `commenter`, `teacher_id`, `user_id`, `created`, `modified`, `body`, `Comment.teacher_id`, `password`, `treated_value`) VALUES
(1, 'fff', '1', 0, '2015-09-23 00:00:00', '0000-00-00 00:00:00', '', 0, '0', 0),
(4, 'b3', '', 0, '2015-10-19 22:49:42', '2015-10-19 22:49:42', 'c3', 0, '0', 0),
(5, 'aaa', '', 0, '2015-10-22 16:18:20', '2015-10-22 16:18:20', 'aa', 0, '$2a$10$D8rj5BCVWRFnU', 0),
(8, 'dd', '', 0, '2015-10-22 20:11:27', '2015-10-22 20:11:27', 'd', 0, '$2a$10$A17kcCXePiXZ0', 0),
(9, 'd', '', 0, '2015-10-22 20:12:05', '2015-10-22 20:12:05', 'aa', 0, '$2a$10$8wgAnFlZ/8yWa', 0),
(10, '1', '', 0, '2015-10-24 06:19:02', '2015-10-24 06:19:02', '???', 0, '$2a$10$H1SajjH7a8Wvm', 0),
(20, 'dsf', '', 0, '2015-10-26 11:35:15', NULL, 'sfds', 0, '', 0),
(21, 'sd', '', 0, '2015-10-26 11:36:30', NULL, 'sdf', 0, '', 0),
(22, 'dfs', '', 0, '2015-10-26 11:36:50', NULL, 'sdf', 0, '', 0),
(23, 'dfs', '', 0, '2015-10-26 11:37:02', NULL, 'sdf', 0, '', 0),
(24, '名無しさん', '', 0, '2015-10-26 11:37:46', NULL, 'dsf', 0, '', 0),
(25, '名無しさん', '', 0, '2015-10-26 11:40:09', NULL, 'sdf', 0, '', 0),
(26, '名無しさん', '', 0, '2015-10-26 11:46:39', NULL, 'test', 0, '', 0),
(27, '名無しさん', '', 0, '2015-10-26 11:53:06', NULL, 'test', 0, '', 0),
(28, '名無しさん', '', 0, '2015-10-26 11:55:42', NULL, 'test', 0, '', 0),
(29, 'dfs', '', 0, '2015-10-26 11:55:53', NULL, 'sdfs', 0, '', 0),
(30, 'fdsf', '', 0, '2015-10-26 11:57:13', NULL, 'sdfds', 0, '', 0),
(31, 'あいう', '', 0, '2015-10-26 11:57:45', NULL, 'テスト', 0, '', 0),
(32, 'aaa', '', 0, '2015-10-26 11:58:12', NULL, 'ddfs', 0, '', 0),
(33, '名無しさん', '', 0, '2015-10-26 12:03:44', NULL, 'test', 0, '', 0),
(34, 'sdf', '', 0, '2015-10-26 12:10:26', NULL, 'sdf', 0, '2', 0),
(35, 'sdf', '', 0, '2015-10-26 12:12:58', NULL, 'sdfsdf', 0, '2', 0),
(36, 'sdf', '', 0, '2015-10-26 12:13:09', NULL, 'sdfsdffds', 0, '2', 0),
(37, 'あいうえお', '', 0, '2015-10-26 12:16:25', NULL, '日本語', 0, '3', 0),
(38, 'あいうえお', '', 0, '2015-10-26 12:18:08', NULL, '日本語', 0, '3', 0),
(39, '名無しさん', '', 0, '2015-10-26 13:21:22', NULL, 'test', 0, '0', 0),
(40, '名無しさん', '', 0, '2015-10-26 13:21:55', NULL, 'test', 0, '0', 0),
(41, '名無しさん', '', 0, '2015-10-26 13:27:01', NULL, 'test', 0, '0', 0),
(42, '名無しさん', '', 0, '2015-10-26 13:27:50', NULL, 'test', 0, '0', 0),
(43, '名無しさん', '', 0, '2015-10-26 13:28:33', NULL, 'test', 0, '0', 0),
(44, '名無しさん', '', 0, '2015-10-26 13:29:00', NULL, 'test', 0, '0', 0),
(45, '名無しさん', '', 0, '2015-10-26 13:30:01', NULL, 'test', 0, '0', 0),
(46, '名無しさん', '', 0, '2015-10-26 13:30:16', NULL, 'test', 0, '0', 0),
(47, '名無しさん', '', 0, '2015-10-26 13:30:36', NULL, 'test', 0, '0', 0),
(48, '名無しさん', '', 0, '2015-10-27 01:50:28', NULL, 'test', 0, '0', 0),
(49, '名無しさん', '', 0, '2015-10-28 22:16:29', NULL, 'test', 0, '0', 0),
(50, 'kazuki', '8', 0, '2015-11-07 17:44:25', '2015-11-07 17:44:25', '教えます。', 0, '', 0),
(51, 'kazuki', '8', 0, '2015-11-07 17:44:43', '2015-11-07 17:44:43', '教えます。', 0, '', 0),
(52, 'kazuki', '', 8, '2015-11-08 05:46:38', '2015-11-08 05:46:38', '教えて', 0, '', 0),
(53, 'kazuki', '', 8, '2015-11-08 05:46:50', '2015-11-08 05:46:50', '教えて', 0, '', 0),
(54, 'kazuki', '', 10, '2015-11-08 05:46:57', '2015-11-08 05:46:57', 'おセイレ', 0, '', 0),
(55, 'kazuki', '', 10, '2015-11-08 05:52:03', '2015-11-08 05:52:03', 'klj;j', 0, '', 0),
(56, 'kazuki', '', 10, '2015-11-08 05:55:19', '2015-11-08 05:55:19', 'dsfsfds', 0, '', 0),
(57, 'kazuki', '', 10, '2015-11-08 05:56:55', '2015-11-08 05:56:55', 'dsfsfdsdsf', 0, '', 0),
(58, 'kazuki', '10', 0, '2015-11-08 05:57:00', '2015-11-08 05:57:00', 'fdsfds', 0, '', 0),
(59, 'kazuki', '41', 10, '2015-11-08 12:02:25', '2015-11-08 12:02:25', '興味あり', 0, '', 0),
(60, 'kazuki', '13', 10, '2015-11-08 12:15:01', '2015-11-08 12:15:01', 'ffff', 0, '', 0),
(61, 'kazuki', '10', 0, '2015-11-08 12:19:05', '2015-11-08 12:19:05', '俺も教えて', 0, '', 0),
(62, 'kazuki', '17', 10, '2015-11-08 12:22:53', '2015-11-08 12:22:53', 'これいいな', 0, '', 0),
(63, 'kazuki', '8', 5, '2015-11-08 21:38:01', '2015-11-08 21:38:01', '', 0, '', 0),
(64, 'kazuki', '8', 5, '2015-11-08 21:38:08', '2015-11-08 21:38:08', 'ddfdfs', 0, '', 0),
(65, 'kazuki', '9', 10, '2015-11-09 08:31:39', '2015-11-09 08:31:39', 'fff', 0, '', 0),
(66, 'kazuki', '9', 10, '2015-11-09 09:43:50', '2015-11-09 09:43:50', '詳細聞きたい', 0, '', 0),
(67, 'kazuki', '41', 10, '2015-11-09 09:54:04', '2015-11-09 09:54:04', '追加', 0, '', 0),
(68, 'kazuki', '9', 10, '2015-11-09 13:37:58', '2015-11-09 13:37:58', 'わかりました', 0, '', 0);

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
-- テーブルの構造 `notices`
--

CREATE TABLE `notices` (
`id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `body` varchar(255) DEFAULT NULL,
  `photo` varchar(200) NOT NULL,
  `photo_dir` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `notices`
--

INSERT INTO `notices` (`id`, `title`, `body`, `photo`, `photo_dir`, `created`, `modified`) VALUES
(1, '初リリース\r\n', '今後とも宜しくお願いします。', '', '', '2015-11-05 18:00:00', NULL),
(2, '使い方ガイド', '試してみて', '', '', '2015-11-05 19:00:00', NULL);

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
  `teacher_id` int(11) DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `photo_dir` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `created`, `modified`, `user_id`, `teacher_id`, `photo`, `photo_dir`) VALUES
(19, 'cakePHP教えて', 'わからんまじで助けて', '2015-10-06 10:51:09', '2015-10-06 10:51:09', 2, NULL, '', ''),
(20, 'ds', 'dsfsdf', '2015-11-05 13:38:07', '2015-11-05 13:38:07', NULL, NULL, 'cat.jpeg', ''),
(21, 'sfds', 'sfdsf', '2015-11-05 13:40:00', '2015-11-05 13:40:00', NULL, NULL, '12.png', '21'),
(22, 'd', 'd', '2015-11-05 15:43:14', '2015-11-05 15:43:14', NULL, NULL, 'haikeiSkymugi.jpg', '22'),
(23, 'ddd', 'sdfdsf', '2015-11-06 09:50:32', '2015-11-06 09:50:32', NULL, NULL, 'スクリーンショット 2015-02-05 17.42.34.png', '23');

-- --------------------------------------------------------

--
-- テーブルの構造 `profiles`
--

CREATE TABLE `profiles` (
`id` int(8) NOT NULL,
  `C` tinyint(1) DEFAULT NULL,
  `Java` tinyint(1) DEFAULT NULL,
  `HTML` tinyint(1) DEFAULT NULL,
  `CSS` tinyint(1) DEFAULT NULL,
  `javascript` tinyint(1) DEFAULT NULL,
  `php` tinyint(1) DEFAULT NULL,
  `MySQL` tinyint(1) DEFAULT NULL,
  `swift` tinyint(1) DEFAULT NULL,
  `python` tinyint(1) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `photo_dir` varchar(255) DEFAULT NULL,
  `userid` int(8) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `profiles`
--

INSERT INTO `profiles` (`id`, `C`, `Java`, `HTML`, `CSS`, `javascript`, `php`, `MySQL`, `swift`, `python`, `photo`, `photo_dir`, `userid`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'hwheell.jpg', '1', 0),
(2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images.jpeg', '2', 0),
(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'fantastic.png', '3', 0),
(4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '16.png', '4', 0),
(5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cat.jpeg', '5', 0),
(6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cat.jpeg', '6', 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

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
(14, '', 5, 12, NULL, '', '', '', NULL, '2015-11-03 13:03:19'),
(15, '', 5, 14, NULL, '', '', '', NULL, '2015-11-03 15:41:55'),
(16, '', 5, 38, NULL, '', '', '', NULL, '2015-11-04 17:04:38'),
(17, '', 5, 13, NULL, '', '', '', NULL, '2015-11-06 16:52:29'),
(18, '', 5, 9, NULL, '', '', '', NULL, '2015-11-06 16:52:37'),
(19, '', 5, 16, NULL, '', '', '', NULL, '2015-11-06 16:55:37'),
(20, '', 5, 10, NULL, '', '', '', NULL, '2015-11-06 18:12:13'),
(21, '', 5, 17, NULL, '', '', '', NULL, '2015-11-06 18:12:37'),
(22, '', 5, 8, NULL, '', '', '', NULL, '2015-11-06 23:42:19'),
(23, '', 5, 8, NULL, '', '', '', NULL, '2015-11-06 23:42:23'),
(24, '', 5, 9, NULL, '', '', '', NULL, '2015-11-07 00:13:57'),
(25, '', 0, 2, NULL, '', '', '', NULL, '2015-11-07 00:17:03'),
(26, '', 5, 13, NULL, '', '', '', NULL, '2015-11-07 00:18:40'),
(27, 'singo', 5, 17, NULL, '', '', '', NULL, '2015-11-07 00:20:01'),
(28, 'kazuki', 5, 8, NULL, '', '', '', NULL, '2015-11-07 00:20:56'),
(29, '', 13, 2, NULL, '', '', '', NULL, '2015-11-07 00:24:27'),
(30, 'kazuki', 3, 2, NULL, '', '', '', NULL, '2015-11-07 11:19:55'),
(31, 'higashi', 5, 2, NULL, '', '', '', NULL, '2015-11-07 17:10:09');

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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(25, 'singo', '646546', NULL, NULL, NULL, NULL, '大学生', NULL, '', '', 0, '', '', '', '', '', 0),
(26, NULL, NULL, '2015-11-01 01:49:53', '2015-11-01 01:49:53', NULL, NULL, NULL, NULL, '', 'teachers/userphoto/&', 0, '', '', '', '', '', 0),
(27, NULL, NULL, '2015-11-01 01:51:06', '2015-11-01 01:51:06', NULL, NULL, NULL, NULL, '', 'teachers/userphoto/&', 0, '', '', '', '', '', 0),
(28, NULL, NULL, '2015-11-01 01:51:30', '2015-11-01 01:51:30', NULL, NULL, NULL, NULL, '', 'teachers/userphoto/&', 0, '', '', '', '', '', 0),
(29, NULL, NULL, '2015-11-01 01:52:44', '2015-11-01 01:52:44', NULL, NULL, NULL, NULL, '', 'teachers/userphoto/&', 0, '', '', '', '', '', 0),
(30, NULL, NULL, '2015-11-01 01:56:39', '2015-11-01 01:56:39', NULL, NULL, NULL, NULL, '', 'teachers/userphoto/&', 0, '', '', '', '', '', 0),
(31, NULL, NULL, '2015-11-01 09:39:14', '2015-11-01 09:39:14', NULL, NULL, NULL, NULL, '', 'teachers/userphoto/&', 0, '', '', '', '', '', 0),
(32, NULL, NULL, '2015-11-01 11:06:57', '2015-11-01 11:06:57', NULL, NULL, NULL, NULL, '', 'teachers/userphoto/&', 0, '', '', '', '', '', 0),
(33, 'dsfs', '$2a$10$n776Nv0jCTpIGTNZz5n9f.qyykjXu3saZ83lvsseDuvcItwqVZ3tS', '2015-11-01 11:12:07', '2015-11-01 11:12:07', NULL, NULL, NULL, NULL, 'sfaf@yahoo.co.jp', '', 0, '', '', '', '', '', 0),
(34, NULL, NULL, '2015-11-01 23:14:40', '2015-11-01 23:14:40', NULL, NULL, NULL, NULL, '', 'http://localhost:8888/prokate_cake/teachers/mypicture&id=', 0, '', '', '', '', '', 0),
(35, NULL, NULL, '2015-11-01 23:29:59', '2015-11-01 23:29:59', NULL, NULL, NULL, NULL, '', 'http://localhost:8888/prokate_cake/teachers/mypicture/', 0, '', '', '', '', '', 0),
(36, NULL, NULL, '2015-11-01 23:30:28', '2015-11-01 23:30:28', NULL, NULL, NULL, NULL, '', 'http://localhost:8888/prokate_cake/teachers/mypicture/', 0, '', '', '', '', '', 0),
(37, NULL, NULL, '2015-11-02 07:12:13', '2015-11-02 07:12:13', NULL, NULL, NULL, NULL, '', 'http://localhost:8888/prokate_cake/teachers/mypicture/', 0, '', '', '', '', '', 0),
(38, 'singo', '$2a$10$Saof2g3qE7yBs/FCVZFKD.Ol9/jQu7mWEX73O6/K/7FnkYKRams6m', '2015-11-02 20:40:15', '2015-11-02 20:40:15', NULL, NULL, NULL, NULL, 'trsei21@yahoo.co.jp', '', 0, '', '', '', '', '', 0),
(39, 'singo', '$2a$10$NPPpiZUfpZw/RgWVSeqRa.eJVsUhmOqDaja0QocjrEZyHeOwNKblK', '2015-11-02 20:42:36', '2015-11-02 20:42:36', NULL, NULL, NULL, NULL, 'trsei21@yahoo.co.jp', '', 0, '', '', '', '', '', 0),
(40, NULL, NULL, '2015-11-02 23:06:07', '2015-11-02 23:06:07', NULL, NULL, NULL, NULL, '', 'http://localhost:8888/prokate_cake/teachers/mypicture/', 0, '', '', '', '', '', 0),
(41, NULL, NULL, '2015-11-03 20:07:01', '2015-11-03 20:07:01', NULL, NULL, NULL, NULL, '', 'http://localhost:8888/prokate_cake/teachers/mypicture/', 0, '', '', '', '', '', 0),
(42, NULL, NULL, '2015-11-06 09:17:11', '2015-11-06 09:17:11', NULL, NULL, NULL, NULL, '', '', 0, '', '', '', '', '', 0),
(43, NULL, NULL, '2015-11-06 09:21:55', '2015-11-06 09:21:55', NULL, NULL, NULL, NULL, '', '', 0, '', '', '', '', '', 0);

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
  `introduction` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `photo_dir` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `isStudent` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `created`, `modified`, `gender`, `old`, `prefecture`, `desire_time`, `way`, `programing_skill`, `programin_lang`, `job`, `introduction`, `photo_dir`, `isStudent`) VALUES
(2, 'kazuki', '$2a$10$wWb3Bf0ZC1N2lKGWfgdQkO3/4x19xZc..W5PmEhKeqw5Gji3jDuF2', 'admin', '2015-10-02 17:14:38', '2015-10-06 09:01:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 1),
(3, 'kazuki', '$2a$10$rYKIUkNqkz3JOue6W0eUiuw.4pqhqE2/L31V.ZDIN2OoJvm20p9aa', 'admin', '2015-10-02 17:49:41', '2015-10-02 17:49:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 1),
(4, 'kazuki', '$2a$10$gZq4SxJqBC0vLiQDFBrQ8etM/gfkcXixdbpBDuhOlQP5RmJnhAHuu', 'admin', '2015-10-03 04:29:20', '2015-10-03 04:29:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 1),
(5, 'higashi', '$2a$10$WSyBIffGzPF6HxhF5Rph2eTpjWxgmzI.yx1ApGj1zjndBD.cC9b5u', 'admin', '2015-10-03 06:27:45', '2015-10-03 06:27:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大学生', '', '', 1),
(6, 'higashi', '$2a$10$NEyCczkUreAz1X1cWu6/N.3RIsoehn5wF91Dur42j.LjgmgJjiSRm', 'admin', '2015-10-04 03:32:22', '2015-10-04 03:32:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 1),
(7, 'kazuki', '$2a$10$RTtwVrC5e.oBd/fHOKy04u1lrgIfyaEUfhPq.ovNv2VYpft5wNtDG', 'admin', '2015-10-04 03:33:50', '2015-10-04 03:33:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 1),
(8, 'kazuki', '$2a$10$82DMWfjCgGceEWuYZD1.1u6c33QouqHtWy1yzgTs/lwiMOhdZLq3G', 'admin', '2015-10-06 10:51:33', '2015-10-06 10:51:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 1),
(9, 'kazuki', '$2a$10$6SjTK6ststitLLLrLW6WteaSyCfA8w/I.79J8UsaiWc1Qkhj3xLmu', 'admin', '0000-00-00 00:00:00', '2015-10-06 10:51:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 0),
(10, 'kazuki', '$2a$10$B1W/52THdTUvhetOraw/VO0xPaquJ5ZRgDDNFgHyEEzbE61i7bBgO', 'admin', '2015-10-14 06:33:47', '2015-10-14 06:33:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 0),
(11, 'しんご', '00000', '', '2015-10-18 18:12:57', NULL, '男', 22, '京都府', NULL, '直接又はスカイプ', '中級者レベル', 'php,iOS,MySQL,javascript', '大学生', 'こんにちは。同志社大学理工学研究科の高橋良成です。現在、APパートナーズというベンチャー企業で、新規事業の開発を行っています。プログラミング経験自体は１年強ですが、前から数学を研究などで勉強していたので、演算系は得意です。毎日研究や開発の日々で忙しいですが、機会があればよろしくお願いします。', '', 0),
(12, NULL, NULL, NULL, '2015-11-05 11:07:55', '2015-11-05 11:07:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 0),
(13, NULL, NULL, NULL, '2015-11-05 11:08:27', '2015-11-05 11:08:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 0);

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
-- Indexes for table `notices`
--
ALTER TABLE `notices`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
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
-- Indexes for table `user_matchings`
--
ALTER TABLE `user_matchings`
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
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=69;
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
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
MODIFY `id` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `teachermatchings`
--
ALTER TABLE `teachermatchings`
MODIFY `id` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `user_matchings`
--
ALTER TABLE `user_matchings`
MODIFY `id` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;--
-- Database: `security_seminar`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `posts`
--

CREATE TABLE `posts` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text,
  `pass` varchar(255) NOT NULL DEFAULT '',
  `postdate` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- テーブルのデータのダンプ `posts`
--

INSERT INTO `posts` (`id`, `name`, `title`, `content`, `pass`, `postdate`) VALUES
(12, 'ghffgjhgj', '1', 'a', 'a', '2015-09-24 21:00:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;--
-- Database: `study`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `todo_lists`
--

CREATE TABLE `todo_lists` (
`id` int(10) unsigned NOT NULL COMMENT 'id',
  `todo` varchar(200) DEFAULT NULL COMMENT 'やること',
  `status` int(10) unsigned NOT NULL COMMENT 'ステータス 0:todo',
  `owner` int(10) unsigned NOT NULL COMMENT 'オーナー',
  `assignee` int(10) unsigned NOT NULL COMMENT '担当'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='ToDoリスト';

--
-- テーブルのデータのダンプ `todo_lists`
--

INSERT INTO `todo_lists` (`id`, `todo`, `status`, `owner`, `assignee`) VALUES
(1, 'aaa', 1, 1, 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
`id` int(10) unsigned NOT NULL COMMENT 'id',
  `username` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT 'ユーザー名',
  `password` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT 'パスワード',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '氏名'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`) VALUES
(1, 'roots', '$2a$10$zFH9Z9F18PczgaRh5JjuzOVWP07JsungeJAsDD.7r244mty.mOg5S', 'roots');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `todo_lists`
--
ALTER TABLE `todo_lists`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `todo_lists`
--
ALTER TABLE `todo_lists`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',AUTO_INCREMENT=2;--
-- Database: `test_db`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `json_tbl`
--

CREATE TABLE `json_tbl` (
  `json1` char(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- テーブルの構造 `tests`
--

CREATE TABLE `tests` (
  `url1` char(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
`id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` char(128) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='User';

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `status`, `created`, `modified`) VALUES
(1, 'trsei21@yahoo.co.jp', '$2a$10$/gFTSy1ouilOGVemZDJ/7O4N8O3wYxSzHjYWsALFZ7h29N5OfntcG', 1, '2015-10-11 16:35:56', '2015-10-11 16:35:56'),
(3, 'ds@fds', '$2a$10$U66urGEhHraYW5O1VLhL6eXFbhWyA/JpVQ67V7F2ntO4HbbBWfnJ.', 1, '2015-10-11 16:39:09', '2015-10-11 16:39:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;--
-- Database: `twitter`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `tweets`
--

CREATE TABLE `tweets` (
`id` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 NOT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `tweets`
--

INSERT INTO `tweets` (`id`, `username`, `content`, `created`) VALUES
(1, 'hasebe', 'goodfindのセミナーなう', '2014-11-27 21:43:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tweets`
--
ALTER TABLE `tweets`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tweets`
--
ALTER TABLE `tweets`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;