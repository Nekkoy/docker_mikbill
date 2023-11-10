--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO `system_options` (`key`, `value`) VALUES ('forpost_enabled', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('forpost_logging', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('forpost_host', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('forpost_cabinet', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('forpost_login', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('forpost_password', '');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;