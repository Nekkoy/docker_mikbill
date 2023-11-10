--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `dev_types` CHANGE `type` `type` TINYINT(4) NULL DEFAULT '0';
ALTER TABLE `dev_types` ADD `license_count` TINYINT(4) NOT NULL DEFAULT '0' AFTER `type`;
ALTER TABLE `dev_types` ADD `code_activation` TINYINT(4) NOT NULL DEFAULT '0' AFTER `license_count`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
