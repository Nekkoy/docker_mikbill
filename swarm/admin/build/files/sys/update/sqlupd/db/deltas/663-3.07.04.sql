--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';
ALTER TABLE `services` CHANGE `exclusion_service_id` `exclusion_services` VARCHAR(128) CHARACTER SET koi8r COLLATE koi8r_general_ci NOT NULL DEFAULT '[]';

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
