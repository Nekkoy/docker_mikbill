--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `packets`
	CHANGE COLUMN `fixed_cost` `fixed_cost` DOUBLE(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Цена тарифа' AFTER `fixed`,
	CHANGE COLUMN `fixed_cost2` `fixed_cost2` DOUBLE(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Минимальная сумма для активации интернета' AFTER `fixed_cost`,
	ADD COLUMN `fixed_cost3` DOUBLE(20,6) NOT NULL DEFAULT '0' COMMENT 'Тип4, сколько снимать каждый день' AFTER `fixed_cost2`,
	ADD COLUMN `fixed_type4` TINYINT NOT NULL DEFAULT '0' COMMENT 'Тип4, снимать пропорцеонально/фиксировано' AFTER `fixed_cost3`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;