--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE IF NOT EXISTS `addons_crpsouth` (
  `order_id` int(32) unsigned NOT NULL,
  `uid` bigint(16) unsigned NOT NULL,
  `account` varchar(64) NOT NULL DEFAULT '',
  `txn_id` bigint(20) unsigned NOT NULL,
  `sum` double(14,2) DEFAULT NULL,
  `txn_date` datetime NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;

ALTER TABLE `addons_crpsouth`
  ADD PRIMARY KEY (`order_id`);
  
ALTER TABLE `addons_crpsouth`
  MODIFY `order_id` int(32) unsigned NOT NULL AUTO_INCREMENT;


--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
