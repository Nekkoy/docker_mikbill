--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE IF NOT EXISTS `addons_perlas` (
  `order_id` int(11) UNSIGNED NOT NULL,
  `uid` bigint(16) UNSIGNED DEFAULT NULL,
  `amount` decimal(18,2) UNSIGNED DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `txn_date` datetime DEFAULT NULL,
  `txn_id` char(25) DEFAULT NULL,
  `account` varchar(128) DEFAULT NULL,
  `comment` varchar(128) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `addons_perlas`
  ADD PRIMARY KEY (`order_id`);

ALTER TABLE `addons_perlas`
  MODIFY `order_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
