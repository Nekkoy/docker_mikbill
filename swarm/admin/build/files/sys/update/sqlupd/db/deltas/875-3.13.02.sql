--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `mod_omnicell_bundles` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`name` VARCHAR(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
	`packets` BLOB NULL DEFAULT NULL ,
	`usersgroupid` SMALLINT NOT NULL DEFAULT '0' ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;
ALTER TABLE `mod_omnicell_bundles` ADD `serviceid` INT NOT NULL AFTER `name`;

CREATE TABLE `mod_omnicell_packets` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`name` VARCHAR(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
	`usersgroupid` INT NOT NULL DEFAULT '0' ,
	`enabled` TINYINT NOT NULL DEFAULT '1' ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO `system_options` (`key`, `value`) VALUES ('omnicell_enabled', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('omnicell_testing', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('omnicell_logging', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('omnicell_login', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('omnicell_password', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('omnicell_secret', '');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;