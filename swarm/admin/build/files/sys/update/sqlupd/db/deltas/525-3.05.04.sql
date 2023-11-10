--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

DROP TABLE IF EXISTS `snmp_data`;
DROP INDEX IF EXISTS `type` ON `snmp_devices`;
DROP INDEX IF EXISTS `owner_type` ON `snmp_devices`;
ALTER TABLE `snmp_devices` DROP `type`;

INSERT INTO `snmp_commands_type` VALUES (NULL, 'onu_count');
INSERT INTO `snmp_commands_type` VALUES (NULL, 'onu_sn');

CREATE TABLE `snmp_devices_proper` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`olt_id` INT NOT NULL ,
	`key` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL ,
	`value` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8mb4 COLLATE utf8mb4_general_ci;


CREATE TABLE `snmp_devices_sfp` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`olt_id` INT NOT NULL ,
	`sfp_index` INT NOT NULL ,
	`update_date` INT NULL ) ,
	PRIMARY KEY (`id`)
ENGINE = InnoDB CHARSET=utf8mb4 COLLATE utf8mb4_general_ci;

CREATE TABLE `snmp_devices_sfp_proper` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`sfp_id` INT NOT NULL ,
	`key` VARCHAR(128) NOT NULL ,
	`value` VARCHAR(255) NULL ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8mb4 COLLATE utf8mb4_general_ci;

ALTER TABLE `snmp_devices_sfp_proper` ADD INDEX `sfp_id` (`sfp_id`);
ALTER TABLE `snmp_devices_sfp_proper` ADD INDEX `sfp_id_key` (`sfp_id`, `key`);









CREATE TABLE `snmp_devices_onu` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`olt_id` INT NOT NULL ,
	`onu_index` BLOB NOT NULL ,
	`update_date` INT NULL DEFAULT NULL ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8mb4 COLLATE utf8mb4_general_ci;

ALTER TABLE `snmp_devices_onu` ADD `onu_mac` VARCHAR(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL AFTER `onu_index`;
ALTER TABLE `snmp_devices_onu` CHANGE `onu_index` `onu_index` VARCHAR(255) NOT NULL;
ALTER TABLE `snmp_devices_onu` ADD INDEX `onu_mac` (`onu_mac`);
ALTER TABLE `snmp_devices_onu` ADD INDEX `devid` (`devid`);
ALTER TABLE `snmp_devices_onu` ADD INDEX `devid_index` (`devid`, `onu_index`);




CREATE TABLE `snmp_devices_onu_proper` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`onu_id` INT NOT NULL ,
	`key` VARCHAR(128) NOT NULL ,
	`value` VARCHAR(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8mb4 COLLATE utf8mb4_general_ci;

ALTER TABLE `snmp_devices_onu_proper` ADD INDEX `onu_id` (`onu_id`);
ALTER TABLE `snmp_devices_onu_proper` ADD INDEX `onu_id key` (`onu_id`, `key`);
ALTER TABLE `snmp_devices_onu_proper` ADD INDEX `key_value` (`key`, `value`);



CREATE TABLE `snmp_devices_onu_customers` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`uid` INT NOT NULL ,
	`olt_id` INT NOT NULL ,
	`onu_id` INT NULL ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8mb4 COLLATE utf8mb4_general_ci;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
