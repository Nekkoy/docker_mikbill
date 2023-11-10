--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';
SET sql_mode='';
ALTER TABLE `usersdel` ADD `state` TINYINT(1) NOT NULL DEFAULT '4' COMMENT '1-обычный,\r\n2-замороженный,\r\n3-отключенный,\r\n4-удаленный' AFTER `crypt_method`;
 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
