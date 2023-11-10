--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE IF NOT EXISTS `snmp_devices_sfp` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`olt_id` INT NOT NULL ,
	`sfp_index` INT NOT NULL ,
	`update_date` INT NULL ) ,
	PRIMARY KEY (`id`)
ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
