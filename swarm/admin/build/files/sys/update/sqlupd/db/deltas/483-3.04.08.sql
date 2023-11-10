--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `bonus` CHANGE `additional_condition` `additional_condition_2` TINYINT(1) NOT NULL DEFAULT '0' COMMENT 'Использовать дополнительное условие. 1-да, 0 -нет';
ALTER TABLE `bonus` CHANGE `condition_equal` `condition_equal_2` TINYINT(1) NULL DEFAULT '1' COMMENT 'Дополнительное условие \r\n\r\n1=and \r\n0=or';
ALTER TABLE `bonus` ADD `additional_condition_3` TINYINT(1) NOT NULL DEFAULT '0' AFTER `entity_value_2`;
ALTER TABLE `bonus` ADD `condition_equal_3` TINYINT NOT NULL DEFAULT '1' AFTER `additional_condition_3`;
ALTER TABLE `bonus` ADD `entity_id_3` INT NULL DEFAULT NULL AFTER `condition_equal_3`;
ALTER TABLE `bonus` ADD `operator_3` VARCHAR(5) NULL DEFAULT NULL AFTER `entity_id_3`;
ALTER TABLE `bonus` ADD `entity_value_3` VARCHAR(128) NULL DEFAULT NULL AFTER `operator_3`;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
