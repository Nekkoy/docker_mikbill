--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `iptv_requests_log` CHANGE `package_id` `package_id` VARCHAR(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '', CHANGE `subscription_id` `subscription_id` SMALLINT(6) NULL DEFAULT '0';

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
