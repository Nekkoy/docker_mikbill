--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO `system_options` (`key`, `value`) VALUES ('api_network', '0.0.0.0/0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('pmon_network', '0.0.0.0/0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('pmon_on', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('pmon_key', '');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
