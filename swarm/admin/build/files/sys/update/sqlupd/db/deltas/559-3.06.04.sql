--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) VALUES ('ipay_uid', '1');
INSERT INTO `system_options` (`key`, `value`) VALUES ('ipay_uid_prio', '1');
INSERT INTO `system_options` (`key`, `value`) VALUES ('ipay_login', '1');
INSERT INTO `system_options` (`key`, `value`) VALUES ('ipay_login_prio', '2');
INSERT INTO `system_options` (`key`, `value`) VALUES ('ipay_numdogovor', '1');
INSERT INTO `system_options` (`key`, `value`) VALUES ('ipay_numdogovor_prio', '3');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
