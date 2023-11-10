--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `addons_rnkb_soap` ADD `payment_system_id` VARCHAR(128) NULL DEFAULT NULL AFTER `payment_system`;

ALTER TABLE `addons_rnkb_soap` ADD `service_id` VARCHAR(128) NULL DEFAULT NULL AFTER `service`;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;