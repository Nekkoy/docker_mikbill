--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) VALUES ('SE100ipoe_useshaper', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('SE100ipoe_ServiceName', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('SE100ipoe_ServiceAction', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('SE100ipoe_HTTPRedirProfNegBal', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('SE100ipoe_RedirForPolNegBal', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('SE100ipoe_HTTPRedirProfBlocked', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('SE100ipoe_RedirForPolBlocked', '');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
