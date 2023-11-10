--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `connect_template_type` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`name` VARCHAR(64) NULL ,
	`usersgroupid` SMALLINT NOT NULL ,
	`segment` TINYINT NOT NULL DEFAULT '1' ,
	`local_ip` TINYINT NOT NULL DEFAULT '1' ,
	`local_mac` TINYINT NOT NULL DEFAULT '1' ,
	`switch` TINYINT NOT NULL DEFAULT '1' ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

ALTER TABLE `connect_template_type` CHANGE `usersgroupid` `usersgroupid` SMALLINT(6) NOT NULL DEFAULT '0';

INSERT INTO `connect_template_type` (`id`, `name`, `usersgroupid`) VALUES (NULL, "FTTH", 0);
INSERT INTO `connect_template_type` (`id`, `name`, `usersgroupid`) VALUES (NULL, "ADSL", 0);
INSERT INTO `connect_template_type` (`id`, `name`, `usersgroupid`) VALUES (NULL, "Wifi", 0);
INSERT INTO `connect_template_type` (`id`, `name`, `usersgroupid`) VALUES (NULL, "Docsis", 0);
INSERT INTO `connect_template_type` (`id`, `name`, `usersgroupid`) VALUES (NULL, "EPon", 0);
INSERT INTO `connect_template_type` (`id`, `name`, `usersgroupid`) VALUES (NULL, "GPon", 0);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
