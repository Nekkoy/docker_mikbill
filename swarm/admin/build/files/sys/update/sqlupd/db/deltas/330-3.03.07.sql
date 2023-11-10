--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `packets` ADD `usersgroupid` SMALLINT NOT NULL DEFAULT '0' AFTER `razresh_minus`;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
