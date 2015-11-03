//2015年10月30日追加sql
ALTER TABLE `users` DROP `role`;

ALTER TABLE `teachers` ADD `programing_skill` VARCHAR(250) NOT NULL AFTER `language`, ADD `price` INT NOT NULL AFTER `programing_skill`, ADD `introduction` VARCHAR(250) NOT NULL AFTER `price`;

ALTER TABLE `teachers` ADD `desire_time` VARCHAR(250) NOT NULL AFTER `introduction`, ADD `way` VARCHAR(250) NOT NULL AFTER `desire_time`;

ALTER TABLE `teachers` ADD `old` INT NOT NULL AFTER `way`;

//2015年年11月2日追加sql
ALTER TABLE `teachers` ADD `facebook_id` BIGINT(20) UNSIGNED NOT NULL;
ALTER TABLE `users` ADD `facebook_id` BIGINT(20) UNSIGNED NOT NULL;

ALTER TABLE `teachers` ADD `email` VARCHAR(255) NOT NULL AFTER `password`;

ALTER TABLE `users` ADD `email` VARCHAR(255) NOT NULL AFTER `password`;

create table matchings(id int(8) not null auto_increment primary key, opponents_id int(8) not null, status varchar(8));

ALTER TABLE `matchings` ADD `offer_to_me` VARCHAR(50) NOT NULL , ADD `offer_from_me` VARCHAR(50) NOT NULL , ADD `matched` VARCHAR(50) NOT NULL ;

DROP TABLE `matchings`;

CREATE TABLE `teacher_matchings` ( `id` int(8) NOT NULL, `teacher_id` int(8) NOT NULL, `status` varchar(8) DEFAULT NULL, `offer_to_me` varchar(50) NOT NULL, `offer_from_me` varchar(50) NOT NULL, `matched` varchar(50) NOT NULL ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_matchings` ( `id` int(8) NOT NULL, `user_id` int(8) NOT NULL, `status` varchar(8) DEFAULT NULL, `offer_to_me` varchar(50) NOT NULL, `offer_from_me` varchar(50) NOT NULL, `matched` varchar(50) NOT NULL ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `teacher_matchings` ADD `teacher_id` INT(8) NOT NULL AFTER `user_id`;

RENAME TABLE `prokate`.`teacher_matchings` TO `prokate`.`teachermatchings`;