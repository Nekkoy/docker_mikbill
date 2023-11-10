--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `fiscalization_report` CHANGE `created` `created` INT NULL DEFAULT NULL;
ALTER TABLE `fiscalization_report` CHANGE `completed` `completed` INT NULL DEFAULT NULL;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
