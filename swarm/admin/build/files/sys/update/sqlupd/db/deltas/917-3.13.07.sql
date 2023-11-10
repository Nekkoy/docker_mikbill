--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `mod_omnicell_info` (
	`phoneNumber` VARCHAR(13) NOT NULL COLLATE 'utf8mb4_general_ci',
	`serviceid` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`key` VARCHAR(128) NOT NULL COLLATE 'utf8mb4_general_ci',
	`value` VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`phoneNumber`, `serviceid`, `key`) USING BTREE,
	INDEX `Phone_Serviceid` (`phoneNumber`, `serviceid`) USING BTREE
) ENGINE=InnoDB COLLATE='utf8mb4_general_ci';

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;