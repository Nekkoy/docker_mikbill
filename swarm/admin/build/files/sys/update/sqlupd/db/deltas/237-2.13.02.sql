--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('paysoft_on', '0');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('paysoft_MrchID', '');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('paysoft_network', '');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('paysoft_procent', '0');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('paysoft_secretkey', '');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('paysoft_test', '0');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
