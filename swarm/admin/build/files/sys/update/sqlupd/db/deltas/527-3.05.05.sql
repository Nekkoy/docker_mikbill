--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `users` ADD `state` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '1-обычный,\r\n2-замороженный,\r\n3-отключенный,\r\n4-удаленный' AFTER `crypt_method`;
ALTER TABLE `usersfreeze` ADD `state` TINYINT(1) NOT NULL DEFAULT '2' COMMENT '1-обычный,\r\n2-замороженный,\r\n3-отключенный,\r\n4-удаленный' AFTER `crypt_method`;
ALTER TABLE `usersblok` ADD `state` TINYINT(1) NOT NULL DEFAULT '3' COMMENT '1-обычный,\r\n2-замороженный,\r\n3-отключенный,\r\n4-удаленный' AFTER `crypt_method`;
ALTER TABLE `usersdel` ADD `state` TINYINT(1) NOT NULL DEFAULT '4' COMMENT '1-обычный,\r\n2-замороженный,\r\n3-отключенный,\r\n4-удаленный' AFTER `crypt_method`;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
