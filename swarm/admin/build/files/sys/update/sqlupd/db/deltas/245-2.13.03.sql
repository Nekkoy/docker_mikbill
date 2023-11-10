--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `addons_monobank` (
  `order_id` int(1) UNSIGNED NOT NULL,
  `uid` bigint(16) UNSIGNED DEFAULT NULL,
  `amount` decimal(18,2) UNSIGNED DEFAULT NULL,
  `txn_id` char(36) NOT NULL,
  `txn_date` datetime DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` varchar(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=koi8r;

ALTER TABLE `addons_monobank`
  ADD PRIMARY KEY (`order_id`);

ALTER TABLE `addons_monobank`
  MODIFY `order_id` int(1) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
