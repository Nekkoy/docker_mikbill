--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) VALUES ('terminal_2click_on', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('terminal_2click_service_id_uid', '1');
INSERT INTO `system_options` (`key`, `value`) VALUES ('terminal_2click_service_id_login', '2');
INSERT INTO `system_options` (`key`, `value`) VALUES ('terminal_2click_service_id_numdogovor', '3');
INSERT INTO `system_options` (`key`, `value`) VALUES ('terminal_2click_secret', '1234567890');
INSERT INTO `system_options` (`key`, `value`) VALUES ('terminal_2click_min_amount', '1');
INSERT INTO `system_options` (`key`, `value`) VALUES ('terminal_2click_max_amount', '99999');
INSERT INTO `system_options` (`key`, `value`) VALUES ('terminal_2click_procent', '0');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
