--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `mbp_devices_onut` CHANGE COLUMN `onut_mac` `onut_mac` VARCHAR(64) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci' AFTER `onut_index`;
	
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;