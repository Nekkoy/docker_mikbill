--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `packets_limits` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`gid` INT NOT NULL ,
	`day1` BLOB NULL ,
	`day2` BLOB NULL ,
	`day3` BLOB NULL ,
	`day4` BLOB NULL ,
	`day5` BLOB NULL ,
	`day6` BLOB NULL ,
	`day7` BLOB NULL ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci COMMENT = 'Расписание учета лимит. трафика';
ALTER TABLE `packets_limits` ADD UNIQUE `gid` (`gid`);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;