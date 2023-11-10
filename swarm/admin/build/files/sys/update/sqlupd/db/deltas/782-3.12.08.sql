--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO `system_options` (`key`, `value`) VALUES ('junv2_dns_sub_on', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('junv2_dns_sub_id', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('junv2_dns_sub_first', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('junv2_dns_sub_second', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('junv2_dns_sub_service', '');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;