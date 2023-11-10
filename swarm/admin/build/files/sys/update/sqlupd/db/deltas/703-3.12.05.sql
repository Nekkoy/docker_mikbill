--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `userscontacts_labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT ,
  `label` varchar(64) NOT NULL,
  `name` varchar(128) NOT NULL,
  `usersgroupid` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

ALTER TABLE `userscontacts_labels` ADD KEY `label_group` (`label`,`usersgroupid`);

INSERT INTO `userscontacts_labels` (`id`, `label`, `name`, `usersgroupid`) VALUES
(1, "calls", "Звонки", 0),
(2, "messages", "Сообщения", 0),
(3, "notify", "Уведомление", 0),
(4, "letters", "Рассылка", 0),
(5, "news", "Новости", 0);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
