--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) VALUES ('skat_default_service', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('skat_internet_service', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('skat_nomoney_service', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('skat_nomoney_policing', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('skat_nointernet_service', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('skat_nointernet_policing', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('skat_freeze_service', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('skat_freeze_policing', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('skat_disabled_service', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('skat_disabled_policing', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('skat_deleted_service', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('skat_deleted_policing', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('skat_dhcp_lease', 3600);

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;