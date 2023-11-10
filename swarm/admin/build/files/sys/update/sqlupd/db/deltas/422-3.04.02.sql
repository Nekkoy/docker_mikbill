--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) VALUES ('ap_client_logs_on', '0');

INSERT INTO `system_options` (`key`, `value`) VALUES ('ap_client_logs_timeout', '300');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;