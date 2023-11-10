--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('monobank_on', '0');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('monobank_debug_on', '0');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('monobank_network', '');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('monobank_procent', '0');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('monobank_uid', '1');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('monobank_uid_prio', '1');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('monobank_login', '1');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('monobank_login_prio', '2');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('monobank_numdogovor', '1');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('monobank_numdogovor_prio', '3');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
