--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `mod_reports` CHANGE `created_at` `date_start` DATETIME NULL DEFAULT NULL;
ALTER TABLE `mod_reports` ADD `date_stop` DATETIME NULL DEFAULT NULL AFTER `date_start`;
ALTER TABLE `mod_reports` ADD INDEX(`date_stop`);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
