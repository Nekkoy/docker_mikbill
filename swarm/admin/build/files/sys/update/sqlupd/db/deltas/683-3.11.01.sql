--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO `system_options` (`key`, `value`) VALUES ('qiwi_on', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('qiwi_debug_on', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('qiwi_network', '0.0.0.0/0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('qiwi_public_key', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('qiwi_site_id', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('qiwi_procent', '1');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
