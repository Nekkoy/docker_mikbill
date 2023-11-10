--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `radacctbras` ADD `devid` BIGINT NOT NULL DEFAULT '0' AFTER `uid`;
ALTER TABLE `radacctmem` ADD `devid` BIGINT NOT NULL DEFAULT '0' AFTER `uid`;
ALTER TABLE `radacctmem` CHANGE `gid` `gid` INT UNSIGNED NOT NULL COMMENT 'тариф в момент авторизации';

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;