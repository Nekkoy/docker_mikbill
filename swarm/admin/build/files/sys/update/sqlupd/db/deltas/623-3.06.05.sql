--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) VALUES ('nokia_nomoney_sla_profile', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('nokia_freeze_sla_profile', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('nokia_disabled_sla_profile', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('nokia_deleted_sla_profile', '');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
