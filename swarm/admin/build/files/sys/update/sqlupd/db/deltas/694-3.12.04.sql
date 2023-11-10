--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `sticky_notes_stuff` (
  `id` int(14) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `date` datetime DEFAULT NULL,
  `stuffid` int(14) UNSIGNED NOT NULL,
  `ispublic` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `x` int(14) UNSIGNED NOT NULL DEFAULT 10,
  `y` int(14) UNSIGNED NOT NULL DEFAULT 10,
  `visible` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `pinned` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `note` varchar(500) NOT NULL DEFAULT '',
  `options` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `sticky_notes_stuff` ADD PRIMARY KEY (`id`) USING BTREE;
ALTER TABLE `sticky_notes_stuff` MODIFY `id` int(14) UNSIGNED NOT NULL AUTO_INCREMENT;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
