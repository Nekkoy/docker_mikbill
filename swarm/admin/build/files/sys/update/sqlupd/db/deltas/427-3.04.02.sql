--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `invoice` ADD INDEX `usersgroupid` (`usersgroupid`);
ALTER TABLE `invoice` ADD INDEX `settlementid` (`settlementid`);
ALTER TABLE `invoice` ADD INDEX `laneid` (`laneid`);
ALTER TABLE `invoice` ADD INDEX `houseid` (`houseid`);
ALTER TABLE `invoice` ADD INDEX `gid` (`gid`);

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;