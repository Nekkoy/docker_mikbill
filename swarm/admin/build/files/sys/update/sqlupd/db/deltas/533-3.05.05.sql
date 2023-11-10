--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) VALUES ('nokia_normal_msap_id', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('nokia_normal_msap_iface', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('nokia_realip_msap_id', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('nokia_realip_msap_iface', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('nokia_nomoney_msap_id', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('nokia_nomoney_msap_iface', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('nokia_freeze_msap_id', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('nokia_freeze_msap_iface', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('nokia_disabled_msap_id', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('nokia_disabled_msap_iface', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('nokia_deleted_msap_id', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('nokia_deleted_msap_iface', '');

INSERT INTO `system_options` (`key`, `value`) VALUES ('nokia_unknown_allowed', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('nokia_unknown_timeout', '300');
INSERT INTO `system_options` (`key`, `value`) VALUES ('nokia_unknown_msap_id', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('nokia_unknown_msap_iface', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('nokia_unknown_sla_profile', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('nokia_unknown_poolid', '0');

INSERT INTO `system_options` (`key`, `value`) VALUES ('nokia_dhcp_lease', '300');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
