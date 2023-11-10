--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `doc_templates` ADD `user_type` TINYINT(1) NOT NULL DEFAULT '0' COMMENT '0 - Физ. лицо\r\n1- Юр. лицо' AFTER `doc_type`, ADD `by_default` TINYINT(1) NOT NULL DEFAULT '0' COMMENT 'Использовать по умолчанию' AFTER `user_type`;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;