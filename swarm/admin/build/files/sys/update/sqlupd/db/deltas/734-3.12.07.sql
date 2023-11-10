--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `stuff_personal` ADD `do_timecredit` TINYINT NOT NULL DEFAULT '0' AFTER `do_credit_like_cabinet`;
ALTER TABLE `stuff_personal` ADD `timecredit_change_start` TINYINT NOT NULL DEFAULT '0' AFTER `do_timecredit`;
ALTER TABLE `stuff_personal` ADD `timecredit_change_stop` TINYINT NOT NULL DEFAULT '0' AFTER `timecredit_change_start`;
ALTER TABLE `stuff_personal` ADD `timecredit_miminum_days` SMALLINT NOT NULL DEFAULT '1' AFTER `timecredit_change_stop`;
ALTER TABLE `stuff_personal` ADD `timecredit_maximum_days` SMALLINT NOT NULL DEFAULT '7' AFTER `timecredit_miminum_days`;
ALTER TABLE `stuff_personal` ADD `timecredit_value_change` TINYINT NOT NULL DEFAULT '0' AFTER `do_timecredit`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;