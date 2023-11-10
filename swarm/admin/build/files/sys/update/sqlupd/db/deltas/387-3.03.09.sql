--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) VALUES ('click_on', '0');

INSERT INTO `system_options` (`key`, `value`) VALUES ('click_debug_on', '0');

INSERT INTO `system_options` (`key`, `value`) VALUES ('click_merchant_id', '');

INSERT INTO `system_options` (`key`, `value`) VALUES ('click_service_id', '');

INSERT INTO `system_options` (`key`, `value`) VALUES ('click_merchant_user_id', '');

INSERT INTO `system_options` (`key`, `value`) VALUES ('click_secret_key', '');

INSERT INTO `system_options` (`key`, `value`) VALUES ('click_procent', '1');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
