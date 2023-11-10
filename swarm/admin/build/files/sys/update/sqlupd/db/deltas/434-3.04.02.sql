--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) VALUES ('invoice_country_code', 'UA');
INSERT INTO `system_options` (`key`, `value`) VALUES ('invoice_pvm_value', '18');
INSERT INTO `system_options` (`key`, `value`) VALUES ('invoice_pvm_type', 'PVM1');
INSERT INTO `system_options` (`key`, `value`) VALUES ('invoice_revers_deposit_at_start', 0);

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;