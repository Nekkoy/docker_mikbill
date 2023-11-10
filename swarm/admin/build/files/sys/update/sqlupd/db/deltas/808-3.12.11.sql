--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `packets`
	ADD `real_pay_period` TINYINT NOT NULL DEFAULT '0' COMMENT 'Период снятия: 0-день,1-месяц' AFTER `real_price`,
	ADD `real_pay_on_connect` TINYINT NOT NULL DEFAULT '0' COMMENT 'АП при подключении' AFTER `real_pay_period`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;