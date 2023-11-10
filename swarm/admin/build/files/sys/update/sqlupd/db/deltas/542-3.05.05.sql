--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) VALUES ('abank_on', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('abank_debug_on', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('abank_payer_info_new', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('abank_network', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('abank_procent', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('abank_uid', '1');
INSERT INTO `system_options` (`key`, `value`) VALUES ('abank_login', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('abank_numdogovor', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('abank_link_with_dealer', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('abank_use_bank_details', '0');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
