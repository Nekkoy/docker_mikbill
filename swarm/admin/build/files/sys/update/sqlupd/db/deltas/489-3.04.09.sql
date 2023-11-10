--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `bonus` ADD `additional_condition_4` TINYINT(1) NOT NULL DEFAULT '0' AFTER `entity_value_3`;
ALTER TABLE `bonus` ADD `condition_equal_4` TINYINT NOT NULL DEFAULT '1' AFTER `additional_condition_4`;
ALTER TABLE `bonus` ADD `entity_id_4` INT NULL DEFAULT NULL AFTER `condition_equal_4`;
ALTER TABLE `bonus` ADD `operator_4` VARCHAR(5) NULL DEFAULT NULL AFTER `entity_id_4`;
ALTER TABLE `bonus` ADD `entity_value_4` VARCHAR(128) NULL DEFAULT NULL AFTER `operator_4`;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
