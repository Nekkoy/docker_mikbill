--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `sticky_notes_user` (
  `id` int(14) UNSIGNED NOT NULL,
  `uid` int(14) UNSIGNED DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `sticky_notes_user` ADD PRIMARY KEY (`id`) USING BTREE;
ALTER TABLE `sticky_notes_user` ADD KEY `uid` (`uid`);
ALTER TABLE `sticky_notes_user` MODIFY `id` int(14) UNSIGNED NOT NULL AUTO_INCREMENT;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
