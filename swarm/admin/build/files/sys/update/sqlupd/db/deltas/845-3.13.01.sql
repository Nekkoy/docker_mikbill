--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO `system_options` (`key`, `value`) VALUES ('ibox_iban', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('ibox_bank_name', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('ibox_provider_name', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('ibox_okpo', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('ibox_bank_account_id', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('ibox_use_subprovider_on', '0');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;