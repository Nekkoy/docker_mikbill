--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';


CREATE TABLE `report_users_count` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`create_time` DATE NULL ,
	`usersgroupid` INT NOT NULL DEFAULT '0' ,
	`gid` INT NOT NULL DEFAULT '0' ,
	`users_count` INT NOT NULL DEFAULT '0' ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

ALTER TABLE `report_users_count` ADD INDEX `time_gid` (`create_time`, `gid`);
ALTER TABLE `report_users_count` ADD INDEX `time_usersgroupid` (`create_time`, `usersgroupid`);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;