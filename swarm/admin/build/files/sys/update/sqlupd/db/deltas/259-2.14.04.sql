--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('nkorr_on', '0');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('nkorr_debug_on', '0');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('nkorr_network', '');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('nkorr_procent', '0');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('nkorr_uid', '1');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('nkorrr_uid_prio', '1');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('nkorr_login', '1');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('nkorr_login_prio', '2');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('nkorr_numdogovor', '1');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('nkorr_numdogovor_prio', '3');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
