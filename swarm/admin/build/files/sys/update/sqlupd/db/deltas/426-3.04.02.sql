--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `invoice` ADD `usersgroupid` INT NOT NULL DEFAULT '0' AFTER `uid`,
	ADD `settlementid` INT NOT NULL DEFAULT '0' AFTER `usersgroupid`,
	ADD `laneid` INT NOT NULL DEFAULT '0' AFTER `settlementid`,
	ADD `houseid` INT NOT NULL DEFAULT '0' AFTER `laneid`,
	ADD `gid` INT NOT NULL DEFAULT '0' AFTER `houseid`;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;