--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('ckassa_on', '0');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('ckassa_password', '');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('ckassa_provider_code', '');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('ckassa_network', '');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('ckassa_procent', '0');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('ckassa_next_url', '');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('ckassa_uid', '1');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('ckassa_uid_prio', '1');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('ckassa_login', '1');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('ckassa_login_prio', '2');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('ckassa_numdogovor', '1');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('ckassa_numdogovor_prio', '3');


--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
