--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `addons_cloudpayments` CHANGE `txn_id` `txn_id` INT(11) NULL DEFAULT NULL AFTER `amount`;
ALTER TABLE `addons_cloudpayments` CHANGE `order_time` `txn_date` VARCHAR(30) CHARACTER SET koi8r COLLATE koi8r_general_ci NOT NULL AFTER `txn_id`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;