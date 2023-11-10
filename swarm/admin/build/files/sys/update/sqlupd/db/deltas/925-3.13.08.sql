--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `switch_modules` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`switch_id` INT(10) UNSIGNED NOT NULL,
	`module_id` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
	`module_name` VARCHAR(255) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	`module_type` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `switch_id_module_id` (`switch_id`, `module_id`) USING BTREE,
	INDEX `switchid` (`switch_id`) USING BTREE
) COLLATE='utf8mb4_general_ci' ENGINE=InnoDB AUTO_INCREMENT=1;
INSERT INTO `switch_modules` SELECT NULL, `swid`, `swmodule`, 'default', 0 FROM switches;

CREATE TABLE `switch_slots` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`switch_id` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`slot_id` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
	`slot_name` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`slot_type` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `switch_id_slot_id` (`switch_id`, `slot_id`) USING BTREE,
	INDEX `switchid` (`switch_id`) USING BTREE
) COLLATE='utf8mb4_general_ci' ENGINE=InnoDB AUTO_INCREMENT=1;
INSERT INTO `switch_slots` SELECT NULL, swid, 0, 'default', 0 FROM switches;

ALTER TABLE `switch_ip_unnumbered` CHANGE COLUMN `port` `port` SMALLINT UNSIGNED NOT NULL DEFAULT 0 AFTER `swid`;
ALTER TABLE `switch_ip_unnumbered` CHANGE COLUMN `vlan` `vlan` SMALLINT UNSIGNED NOT NULL DEFAULT 0 AFTER `port`;
ALTER TABLE `switch_ip_unnumbered` CHANGE COLUMN `qnq` `qnq` SMALLINT(6) UNSIGNED NULL DEFAULT NULL AFTER `vlan`;
ALTER TABLE `switch_ip_unnumbered` ADD COLUMN `module_id` TINYINT(6) UNSIGNED NULL DEFAULT NULL AFTER `qnq`;
ALTER TABLE `switch_ip_unnumbered` ADD COLUMN `slot_id` TINYINT(6) UNSIGNED NULL DEFAULT NULL AFTER `module_id`;
ALTER TABLE `switch_ip_unnumbered` ADD COLUMN `virtual_ports` TINYINT UNSIGNED NOT NULL DEFAULT '0' AFTER `slot_id`;

UPDATE switch_ip_unnumbered AS siu, switch_modules AS sm SET siu.module_id = sm.module_id WHERE siu.swid = sm.switch_id AND sm.module_id > 0;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;