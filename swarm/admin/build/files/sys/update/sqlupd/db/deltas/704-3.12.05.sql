--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `userscontacts_types` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `type` varchar(64) NOT NULL,
  `name` varchar(128) NOT NULL,
  `usersgroupid` tinyint(4) NOT NULL DEFAULT '0' ,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

ALTER TABLE `userscontacts_types` ADD KEY `type_group` (`type`,`usersgroupid`);

INSERT INTO `userscontacts_types` (`id`, `type`, `name`, `usersgroupid`) VALUES
(1, 'mobile', 'Мобильный', 0),
(2, 'home', 'Домашний', 0),
(3, 'email', 'EMail', 0),
(4, 'telegram', 'Telegram', 0),
(5, 'viber', 'Viber', 0),
(6, 'skype', 'Skype', 0),
(7, 'whatsapp', 'Whatsapp', 0);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
