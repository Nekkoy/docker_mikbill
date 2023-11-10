--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('lifecell_easypay_on', '0');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('lifecell_easypay_cover', '0');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('lifecell_easypay_default_dealer', '0');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('lifecell_easypay_link_with_dealer', '0');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('lifecell_easypay_uid', '1');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('lifecell_easypay_uid_prio', '1');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('lifecell_easypay_login', '1');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('lifecell_easypay_login_prio', '2');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('lifecell_easypay_numdogovor', '1');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('lifecell_easypay_numdogovor_prio', '3');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('lifecell_easypay_network', '');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('lifecell_easypay_procent', '1');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('lifecell_easypay_use_bank_details', '1');


--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
