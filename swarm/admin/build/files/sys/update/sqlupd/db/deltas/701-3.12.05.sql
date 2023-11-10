--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `connect_template_type` ADD `dev_mac` TINYINT NOT NULL DEFAULT '1' AFTER `switch`, ADD `dev_sn` TINYINT NOT NULL DEFAULT '1' AFTER `dev_mac`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
