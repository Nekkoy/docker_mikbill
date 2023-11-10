--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `users` ADD INDEX `user_state` (`state`);
ALTER TABLE `usersfreeze` ADD INDEX `user_state` (`state`);
ALTER TABLE `usersblok` ADD INDEX `user_state` (`state`);
ALTER TABLE `usersdel` ADD INDEX `user_state` (`state`);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
