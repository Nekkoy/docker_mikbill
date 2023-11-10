--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `iptv_requests_log` CHANGE `package_id` `package_id` VARCHAR(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '';
ALTER TABLE `iptv_requests_log` CHANGE `order_id` `order_id` VARCHAR(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE `iptv_requests_log` CHANGE `order_name` `order_name` VARCHAR(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE `iptv_requests_log` CHANGE `status_message` `status_message` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
