--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) VALUES ('vasexperts_filter_packet_on', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('vasexperts_filter_uid_on', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('vasexperts_filter_uid_inverse', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('vasexperts_filter_packet_inverse', '0');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
