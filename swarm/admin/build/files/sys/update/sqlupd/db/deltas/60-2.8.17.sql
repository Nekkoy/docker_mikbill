SET NAMES 'utf8';

ALTER TABLE `users` CHANGE `last_connection` `last_connection` DATETIME NOT NULL DEFAULT '0000-00-00';
ALTER TABLE `usersblok` CHANGE `last_connection` `last_connection` DATETIME NOT NULL DEFAULT '0000-00-00';
ALTER TABLE `usersdel` CHANGE `last_connection` `last_connection` DATETIME NOT NULL DEFAULT '0000-00-00';
ALTER TABLE `usersfreeze` CHANGE `last_connection` `last_connection` DATETIME NOT NULL DEFAULT '0000-00-00';
