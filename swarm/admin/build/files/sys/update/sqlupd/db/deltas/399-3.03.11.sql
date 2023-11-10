--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

UPDATE `services` SET `servicename` = 'Аренда оборудования' WHERE `serviceid` = 8;

UPDATE `services` SET `servicename` = 'Услуга: Реальный IP' WHERE `serviceid` = 9;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;