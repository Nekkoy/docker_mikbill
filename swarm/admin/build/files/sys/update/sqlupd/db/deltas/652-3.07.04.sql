--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) VALUES ('drecrypt_on', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('drecrypt_host', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('drecrypt_login', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('drecrypt_password', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('drecrypt_encoding', '');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
