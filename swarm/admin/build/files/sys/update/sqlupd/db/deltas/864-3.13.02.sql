--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO `system_options` (`key`, `value`) VALUES ('user_card_legal_hide_phone', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('user_card_legal_hide_fax', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('user_card_legal_hide_email', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('user_card_legal_hide_numdogovor', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('user_card_legal_hide_1c_code', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('user_card_legal_hide_director', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('user_card_legal_hide_booker', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('user_card_legal_hide_contact_person', '0');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;