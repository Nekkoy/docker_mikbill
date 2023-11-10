--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `bonus_history` (
  `id` bigint(16) UNSIGNED NOT NULL,
  `uid` bigint(16) UNSIGNED NOT NULL,
  `bonus_id` int(11) UNSIGNED DEFAULT NULL,
  `before_billing` int(11) NOT NULL DEFAULT 0,
  `points` int(11) NOT NULL DEFAULT 0,
  `comment` varchar(128) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `bonus_history` ADD PRIMARY KEY (`id`);
ALTER TABLE `bonus_history` MODIFY `id` bigint(16) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;