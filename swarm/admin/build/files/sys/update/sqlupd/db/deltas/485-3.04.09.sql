--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `bonus_shop` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `descriptions` varchar(256) DEFAULT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `image` mediumblob DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `bonus_shop` ADD PRIMARY KEY (`id`);
ALTER TABLE `bonus_shop` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
