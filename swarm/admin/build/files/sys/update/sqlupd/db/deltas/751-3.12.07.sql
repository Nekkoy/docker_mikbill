--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `mod_trueip_objects` ADD `sip_server_address` VARCHAR(128) NULL DEFAULT NULL AFTER `token`;
ALTER TABLE `mod_trueip_objects` ADD `sip_server_port` INT NULL DEFAULT NULL AFTER `sip_server_address`;
ALTER TABLE `mod_trueip_objects` ADD `concierge_sip_number` VARCHAR(128) NULL DEFAULT NULL AFTER `sip_server_port`;
ALTER TABLE `mod_trueip_objects` ADD `email` VARCHAR(128) NULL DEFAULT NULL AFTER `concierge_sip_number`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;