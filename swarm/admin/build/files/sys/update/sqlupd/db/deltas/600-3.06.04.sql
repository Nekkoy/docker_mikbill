--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) VALUES ('flussonic_user_api_on', '0');

INSERT INTO `system_options` (`key`, `value`) VALUES ('flussonic_user_api_login', '');

INSERT INTO `system_options` (`key`, `value`) VALUES ('flussonic_user_api_key', '');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
