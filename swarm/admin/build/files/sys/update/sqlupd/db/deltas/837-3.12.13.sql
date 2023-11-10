--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO `system_options` (`key`, `value`) VALUES ('huawei_ne40e_internet_domain', 'cgnat');
INSERT INTO `system_options` (`key`, `value`) VALUES ('huawei_ne40e_nomoney_domain', 'blocked');
INSERT INTO `system_options` (`key`, `value`) VALUES ('huawei_ne40e_nomoney_filter', 'ug-blocked');
INSERT INTO `system_options` (`key`, `value`) VALUES ('huawei_ne40e_freezed_domain', 'blocked');
INSERT INTO `system_options` (`key`, `value`) VALUES ('huawei_ne40e_freezed_filter', 'ug-blocked');
INSERT INTO `system_options` (`key`, `value`) VALUES ('huawei_ne40e_disabled_domain', 'blocked');
INSERT INTO `system_options` (`key`, `value`) VALUES ('huawei_ne40e_disabled_filter', 'ug-blocked');
INSERT INTO `system_options` (`key`, `value`) VALUES ('huawei_ne40e_deleted_domain', 'blocked');
INSERT INTO `system_options` (`key`, `value`) VALUES ('huawei_ne40e_deleted_filter', 'ug-blocked');
INSERT INTO `system_options` (`key`, `value`) VALUES ('huawei_ne40e_unknown_domain', 'newuser');
INSERT INTO `system_options` (`key`, `value`) VALUES ('huawei_ne40e_unknown_filter', 'ug-newuser');
INSERT INTO `system_options` (`key`, `value`) VALUES ('huawei_ne40e_unknown_enabled', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('huawei_ne40e_unknown_poolid', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('huawei_ne40e_unknown_timeout', '300');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;