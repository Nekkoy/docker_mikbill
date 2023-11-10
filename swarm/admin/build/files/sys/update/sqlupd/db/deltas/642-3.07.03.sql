--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) VALUES ('trueip_def_sip_ip', '127.0.0.1');
INSERT INTO `system_options` (`key`, `value`) VALUES ('trueip_def_sip_port', '5060');
INSERT INTO `system_options` (`key`, `value`) VALUES ('trueip_def_sip_concierge', '7000');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
