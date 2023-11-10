--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO `bugh_plategi_type` (`typename`, `sign`, `deposit_action`, `deposit_action_by_user`) VALUES ('Пополнение Paynet', '+', '+', '+');

INSERT INTO `system_options` (`key`, `value`) VALUES ('paynet_on', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('paynet_debug', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('paynet_network', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('paynet_username', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('paynet_password', '');

INSERT INTO `system_options` (`key`, `value`) VALUES ('paynet_uid', '1');
INSERT INTO `system_options` (`key`, `value`) VALUES ('paynet_uid_prio', '1');

INSERT INTO `system_options` (`key`, `value`) VALUES ('paynet_login', '1');
INSERT INTO `system_options` (`key`, `value`) VALUES ('paynet_login_prio', '2');

INSERT INTO `system_options` (`key`, `value`) VALUES ('paynet_numdogovor', '1');
INSERT INTO `system_options` (`key`, `value`) VALUES ('paynet_numdogovor_prio', '3');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;