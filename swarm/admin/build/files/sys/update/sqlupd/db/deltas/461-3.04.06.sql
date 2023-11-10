--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `dev_types` ADD `installments_price` INT NOT NULL DEFAULT '0' AFTER `description`;
ALTER TABLE `dev_types` ADD `installments_count` SMALLINT NOT NULL DEFAULT '0' AFTER `installments_price`;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;