--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `addons_paymaster` CHANGE `uid` `uid` BIGINT(20) UNSIGNED NOT NULL AFTER `order_id`;
ALTER TABLE `addons_paymaster` CHANGE `amount` `amount` DOUBLE(14,2) NULL DEFAULT NULL AFTER `uid`;
ALTER TABLE `addons_paymaster` ADD `txn_id` VARCHAR(128) NULL DEFAULT NULL AFTER `amount`;
ALTER TABLE `addons_paymaster` CHANGE `order_date` `server_time` DATETIME NULL DEFAULT NULL;
ALTER TABLE `addons_paymaster` DROP `payment_system`;
ALTER TABLE `addons_paymaster` ADD `txn_date` DATETIME NULL DEFAULT NULL AFTER `txn_id`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;