--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) VALUES ('citypaypr_on', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('citypaypr_debug_on', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('citypaypr_network', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('citypaypr_uid', '1');
INSERT INTO `system_options` (`key`, `value`) VALUES ('citypaypr_uid_prio', '1');
INSERT INTO `system_options` (`key`, `value`) VALUES ('citypaypr_login', '1');
INSERT INTO `system_options` (`key`, `value`) VALUES ('citypaypr_login_prio', '2');
INSERT INTO `system_options` (`key`, `value`) VALUES ('citypaypr_numdogovor', '1');
INSERT INTO `system_options` (`key`, `value`) VALUES ('citypaypr_numdogovor_prio ', '3');
INSERT INTO `system_options` (`key`, `value`) VALUES ('citypaypr_procent', '1');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
