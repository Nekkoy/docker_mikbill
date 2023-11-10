--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `addons_abank` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `uid` bigint(20) UNSIGNED NOT NULL,
  `amount` double(16,2) NOT NULL,
  `txn_id` bigint(20) UNSIGNED NOT NULL,
  `txn_date` datetime DEFAULT NULL,
  `server_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `addons_abank`
  ADD PRIMARY KEY (`order_id`);

ALTER TABLE `addons_abank`
  MODIFY `order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
