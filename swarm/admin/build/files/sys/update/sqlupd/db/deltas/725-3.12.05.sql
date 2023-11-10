--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `addons_reeves` CHANGE `txn_id` `txn_id` VARCHAR(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;

INSERT INTO `system_options` (`key`, `value`) VALUES ('reeves_public_key', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('reeves_notification_url', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('reeves_return_url', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('reeves_language', 'ru');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
