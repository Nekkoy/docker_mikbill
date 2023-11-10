--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `mod_camera_packets` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`enabled` TINYINT NOT NULL DEFAULT '0' ,
	`name` VARCHAR(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
	`description` VARCHAR(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
	`devices` BLOB NOT NULL ,
	`preset` INT NULL DEFAULT '0' ,
	`period` ENUM('d','m','a') NOT NULL DEFAULT 'd' ,
	`dev_condition` BLOB NULL DEFAULT NULL ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE `mod_camera_presets` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`name` VARCHAR(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
	`middleware` INT NOT NULL , PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

CREATE TABLE `mod_camera_presets_options` (
	`id` INT NOT NULL ,
	`key` VARCHAR(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
	`value` VARCHAR(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

ALTER TABLE `mod_camera_presets_options` ADD UNIQUE `uniq` (`id`, `key`);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

