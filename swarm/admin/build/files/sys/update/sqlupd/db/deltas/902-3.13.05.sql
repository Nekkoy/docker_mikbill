--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `mod_forpost_profiles` CHANGE COLUMN `profile_name` `profile_name` VARCHAR(128) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci' AFTER `id`;
ALTER TABLE `mod_forpost_profiles` ADD COLUMN `serviceid` INT NOT NULL DEFAULT 0 COMMENT 'подписка' AFTER `profile_name`;
	
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;