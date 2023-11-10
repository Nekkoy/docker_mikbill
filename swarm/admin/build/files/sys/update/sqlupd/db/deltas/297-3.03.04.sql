--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `services` CHANGE `service_loyal_recalculation` `service_loyal_recalculation` TINYINT(4) NOT NULL DEFAULT '0' COMMENT 'Лояльное отключение с возвратом средств. Относится ';

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
