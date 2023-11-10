--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `connect_template` ADD `default_normal` TINYINT NOT NULL DEFAULT '0' AFTER `switchid`;
ALTER TABLE `connect_template` ADD `default_legal` TINYINT NOT NULL DEFAULT '0' AFTER `default_normal`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;