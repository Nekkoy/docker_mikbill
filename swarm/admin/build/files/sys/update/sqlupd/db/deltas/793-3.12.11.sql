--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO `system_options` (`key`, `value`) VALUES ('api_us_pon_enabled', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('api_us_pon_demo', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('api_us_pon_debug', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('api_us_pon_key', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('api_us_pon_host', '');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;