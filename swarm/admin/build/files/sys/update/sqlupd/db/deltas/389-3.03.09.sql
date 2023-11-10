--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `addons_payme` (
  `order_id` int(11) UNSIGNED NOT NULL,
  `uid` bigint(16) UNSIGNED DEFAULT NULL,
  `amount` decimal(18,2) UNSIGNED DEFAULT NULL,
  `txn_id` varchar(128) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `perform_time` datetime DEFAULT NULL,
  `cancel_time` datetime DEFAULT NULL,
  `cancel_reason` varchar(128) DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AVG_ROW_LENGTH=151 DEFAULT CHARSET=koi8r;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;