--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

DROP TABLE IF EXISTS `snmp_commands_type`;
DROP TABLE IF EXISTS `snmp_commands`;
DROP TABLE IF EXISTS `snmp_commands_type`;
DROP TABLE IF EXISTS `snmp_devices`;
DROP TABLE IF EXISTS `snmp_devices_onu`;
DROP TABLE IF EXISTS `snmp_devices_onu_customers`;
DROP TABLE IF EXISTS `snmp_devices_onu_proper`;
DROP TABLE IF EXISTS `snmp_devices_proper`;
DROP TABLE IF EXISTS `snmp_devices_sfp`;
DROP TABLE IF EXISTS `snmp_devices_sfp_proper`;
DROP TABLE IF EXISTS `snmp_programm`;

ALTER TABLE `snmp_templates`
	ADD COLUMN `mode` ENUM('b', 'f') NOT NULL DEFAULT 'b' AFTER `name`,
	ADD COLUMN `path` VARCHAR(255) NULL AFTER `mode`;

ALTER TABLE `snmp_templates` ADD COLUMN `usersgroupid` SMALLINT NOT NULL DEFAULT '0' AFTER `path`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;