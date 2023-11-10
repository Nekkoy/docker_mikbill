--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) VALUES ('alfabankru_on', '0');

INSERT INTO `system_options` (`key`, `value`) VALUES ('alfabankru_test', '0');

INSERT INTO `system_options` (`key`, `value`) VALUES ('alfabankru_debug_on', '0');

INSERT INTO `system_options` (`key`, `value`) VALUES ('alfabankru_api_username', '');

INSERT INTO `system_options` (`key`, `value`) VALUES ('alfabankru_api_password', '');

INSERT INTO `system_options` (`key`, `value`) VALUES ('alfabankru_redirect_url', '');

INSERT INTO `system_options` (`key`, `value`) VALUES ('alfabankru_return_url', '');

INSERT INTO `system_options` (`key`, `value`) VALUES ('alfabankru_procent', '1');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;