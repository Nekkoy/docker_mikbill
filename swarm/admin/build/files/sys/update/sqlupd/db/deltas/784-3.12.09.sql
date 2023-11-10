--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO `system_options` (`key`, `value`) VALUES ('builtin_queue', '1');
INSERT INTO `system_options` (`key`, `value`) VALUES ('builtin_pending', '1');
INSERT INTO `system_options` (`key`, `value`) VALUES ('builtin_timecredit', '1');
INSERT INTO `system_options` (`key`, `value`) VALUES ('builtin_statbalance', '1');
INSERT INTO `system_options` (`key`, `value`) VALUES ('builtin_clearportsdd', '1');
INSERT INTO `system_options` (`key`, `value`) VALUES ('builtin_ticketsstatus', '1');
INSERT INTO `system_options` (`key`, `value`) VALUES ('builtin_cyclecleaning', '1');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;