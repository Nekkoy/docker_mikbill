--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `mod_omnicell_transactions` CHANGE `request_code` `request_code` VARCHAR(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'код запроса';
ALTER TABLE `mod_omnicell_transactions` ADD `request_time` DATETIME NULL DEFAULT NULL COMMENT 'время отправки запроса' AFTER `operation_name`;
ALTER TABLE `mod_omnicell_transactions` ADD `response_time` DATETIME NULL DEFAULT NULL COMMENT 'время приёма ответа' AFTER `request_time`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;