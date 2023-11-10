--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('paymo_on', '0');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('paymo_debug_on', '0');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('paymo_test_on', '0');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('paymo_store_id', '');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('paymo_success_redirect', '');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('paymo_fail_redirect', '');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('paymo_api_key', '');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('paymo_procent', '1');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
