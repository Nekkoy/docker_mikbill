--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `bonus_shop` ADD `ticket_on` TINYINT NOT NULL DEFAULT '0' AFTER `active`, ADD `ticket_category` INT NULL DEFAULT NULL AFTER `ticket_on`;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
