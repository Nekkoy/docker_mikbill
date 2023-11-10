--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `stuff_aclid` ADD `usersgroupid` SMALLINT NOT NULL DEFAULT '0' AFTER `acl`;
ALTER TABLE `stuff_koef_stavki` ADD `usersgroupid` SMALLINT NOT NULL DEFAULT '0' AFTER `koef`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;