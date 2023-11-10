--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `connect_template` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`templatetypeid` INT NOT NULL ,
	`userdevid` INT NOT NULL DEFAULT '0' ,
	`segments` BLOB NULL DEFAULT NULL ,
	`bras` BLOB NULL DEFAULT NULL ,
	`switchid` INT NOT NULL DEFAULT '0' ,
	`settlementid` INT NOT NULL DEFAULT '0' ,
	`neighborhoodid` INT NOT NULL DEFAULT '0' ,
	`laneid` INT NOT NULL DEFAULT '0' ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

ALTER TABLE `connect_template` ADD `templatename` VARCHAR(128) NOT NULL AFTER `id`;
ALTER TABLE `connect_template` ADD `usersgroupid` INT NOT NULL DEFAULT '0' AFTER `templatetypeid`;
ALTER TABLE `connect_template` ADD `userlegaldevid` INT NOT NULL DEFAULT '0' AFTER `userdevid`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
