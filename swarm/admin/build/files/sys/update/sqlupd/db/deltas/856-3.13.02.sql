--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO `system_options` (`key`, `value`) VALUES ('easypay_isp_name', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('easypay_inn', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('easypay_name', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('easypay_bank_name', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('easypay_bank_mfo', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('easypay_bank_account', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('easypay_purpose_name', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('easypay_purpose_vat', '0');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;