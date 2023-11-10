--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

--
-- Изменить таблицу "dev_types"
--
INSERT INTO `system_options` (`key`, `value`) VALUES ('docsis_enabled', '0') ON DUPLICATE KEY UPDATE `value`=`value`;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
