--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO `system_options` (`key`, `value`) VALUES ('freedompay_on', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('freedompay_debug_on', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('freedompay_merchant_id', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('freedompay_merchant_secret', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('freedompay_result_url', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('freedompay_check_url', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('freedompay_success_url', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('freedompay_failure_url', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('freedompay_procent', '1');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;