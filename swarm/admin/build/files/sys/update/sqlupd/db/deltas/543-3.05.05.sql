--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `users` ADD INDEX `session_by_2ip` (`local_ip`, `framed_ip`);
ALTER TABLE `users` ADD INDEX `session_by_local_ip` (`local_ip`);
ALTER TABLE `users` ADD INDEX `session_by_framed_ip` (`framed_ip`);
ALTER TABLE `users` DROP INDEX IF EXISTS `uiduser`;

ALTER TABLE `usersfreeze` ADD INDEX `session_by_2ip` (`local_ip`, `framed_ip`);
ALTER TABLE `usersfreeze` ADD INDEX `session_by_local_ip` (`local_ip`);
ALTER TABLE `usersfreeze` ADD INDEX `session_by_framed_ip` (`framed_ip`);

ALTER TABLE `usersblok` ADD INDEX `session_by_2ip` (`local_ip`, `framed_ip`);
ALTER TABLE `usersblok` ADD INDEX `session_by_framed_ip` (`framed_ip`);

ALTER TABLE `usersdel` ADD INDEX `session_by_2ip` (`local_ip`, `framed_ip`);
ALTER TABLE `usersdel` ADD INDEX `session_by_framed_ip` (`framed_ip`);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
