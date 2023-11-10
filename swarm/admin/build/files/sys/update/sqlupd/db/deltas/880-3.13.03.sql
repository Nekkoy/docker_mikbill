--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `mod_omnicell_transactions` CHANGE `request_body` `phone_number` VARCHAR(12) NULL COMMENT 'номер телефона';
ALTER TABLE `mod_omnicell_transactions` CHANGE `failed_attempts` `serviceid` INT NOT NULL DEFAULT '0' COMMENT 'id подписки';
ALTER TABLE `mod_omnicell_transactions` CHANGE `phone_number` `phone_number` VARCHAR(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'номер телефона' AFTER `uid`, CHANGE `serviceid` `serviceid` INT NOT NULL DEFAULT '0' COMMENT 'id подписки' AFTER `phone_number`;
ALTER TABLE `mod_omnicell_transactions` ADD `request_code` VARCHAR(16) NULL AFTER `operation_name`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;