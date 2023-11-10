--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `addons_ibox` CHANGE `prv_txn` `order_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE `addons_ibox` CHANGE `sum` `amount` DOUBLE(14,2) NULL DEFAULT NULL;
ALTER TABLE `addons_ibox` CHANGE `txn_id` `txn_id` VARCHAR(128) CHARACTER SET koi8r COLLATE koi8r_general_ci NULL DEFAULT NULL;
ALTER TABLE `addons_ibox` CHANGE `time_stamp` `server_time` DATETIME NULL DEFAULT NULL;
ALTER TABLE `addons_ibox` CHANGE `time_from_osmp` `txn_date` DATETIME NULL DEFAULT NULL;
ALTER TABLE `addons_ibox` CHANGE `accaunt` `account` VARCHAR(128) CHARACTER SET koi8r COLLATE koi8r_general_ci NULL DEFAULT NULL;
ALTER TABLE `addons_ibox` DROP `check_time`;
ALTER TABLE `addons_ibox` ADD `uid` BIGINT(20) NULL DEFAULT NULL AFTER `order_id`;
ALTER TABLE `addons_ibox` ADD `status` TINYINT(1) NOT NULL DEFAULT '0' AFTER `server_time`;
ALTER TABLE `addons_ibox` ADD INDEX(`uid`);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;