--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';
SET sql_mode='';

ALTER TABLE `services` ADD `trial_price` DOUBLE(20,6) NOT NULL DEFAULT '0' AFTER `trial`;
ALTER TABLE `services` ADD `trial_period_on` TINYINT NOT NULL DEFAULT '0' AFTER `trial_price`;
ALTER TABLE `services` ADD `trial_period_days` TINYINT NOT NULL DEFAULT '0' AFTER `trial_period_on`;
ALTER TABLE `services` ADD `trial_change_on` TINYINT NOT NULL DEFAULT '0' AFTER `trial_period_days`;
ALTER TABLE `services` ADD `trial_change_serviceid` MEDIUMINT NOT NULL DEFAULT '0' AFTER `trial_change_on`;
  
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
