//2015年10月30日追加sql
ALTER TABLE `users` DROP `role`;

ALTER TABLE `teachers` ADD `programing_skill` VARCHAR(250) NOT NULL AFTER `language`, ADD `price` INT NOT NULL AFTER `programing_skill`, ADD `introduction` VARCHAR(250) NOT NULL AFTER `price`;

ALTER TABLE `teachers` ADD `desire_time` VARCHAR(250) NOT NULL AFTER `introduction`, ADD `way` VARCHAR(250) NOT NULL AFTER `desire_time`;

ALTER TABLE `teachers` ADD `old` INT NOT NULL AFTER `way`;

