--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `stuff_personal` ADD `tickets_performed_without_visit` TINYINT NOT NULL DEFAULT '1' COMMENT 'выполнено без выезда на место' AFTER `tickets_performer`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
