--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('fcsistema_on', '0');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('fcsistema_debug_on', '0');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('fcsistema_merchant_id', '');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('fcsistema_provider_id_s', '');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('fcsistema_network', '');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('fcsistema_uid', '1');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('fcsistema_uid_prio', '1');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('fcsistema_login', '1');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('fcsistema_login_prio', '2');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('fcsistema_numdogovor', '1');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('fcsistema_numdogovor_prio', '3');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('fcsistema_procent', '1');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
