--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `rad_limit_traffic` (
	`id` BIGINT NOT NULL AUTO_INCREMENT ,
	`uid` INT NOT NULL ,
	`gid` INT NOT NULL ,
	`week_number` TINYINT NOT NULL DEFAULT '0' ,
	`date_created` DATE NULL DEFAULT NULL ,
	`traffic_in` BIGINT NOT NULL DEFAULT '0' ,
	`traffic_out` BIGINT NOT NULL DEFAULT '0' ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

ALTER TABLE `rad_limit_traffic` ADD UNIQUE `uid_gid` (`uid`, `gid`);
ALTER TABLE `rad_limit_traffic` ADD INDEX `uid_gid_week` (`uid`, `gid`, `week_number`);
ALTER TABLE `rad_limit_traffic` ADD INDEX `uid_gid_date` (`uid`, `gid`, `date_created`);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;