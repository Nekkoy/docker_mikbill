--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('payme_on', '0');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('payme_debug_on', '0');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('payme_test_on', '0');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('payme_store_id', '');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('payme_success_redirect', '');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('payme_fail_redirect', '');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('payme_api_key', '');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('payme_procent', '1');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
