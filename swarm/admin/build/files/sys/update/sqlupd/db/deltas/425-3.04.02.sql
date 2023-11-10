--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `invoice` ADD `doc_type` SMALLINT NOT NULL DEFAULT '1' COMMENT '1 - invoice' AFTER `id`;
ALTER TABLE `invoice` ADD INDEX `doc_type` (`doc_type`);

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;