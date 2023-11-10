--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO `system_options` (`key`, `value`) VALUES ('platon_on', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('platon_debug_on', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('platon_api_key', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('platon_api_password', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('platon_procent', '1');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;