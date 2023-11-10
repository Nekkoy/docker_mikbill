--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `addons_globalmoney` (
  `paymentid` int(14) NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `uid` bigint(16) UNSIGNED NOT NULL,
  `OrderId` char(64) COLLATE koi8r_bin NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Amount` double(14,2) NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `cancel` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=koi8r COLLATE=koi8r_bin;

ALTER TABLE `addons_globalmoney`
  ADD PRIMARY KEY (`paymentid`) USING BTREE,
  ADD KEY `time` (`order_date`) USING BTREE,
  ADD KEY `uid-time` (`uid`,`order_date`) USING BTREE;

ALTER TABLE `addons_globalmoney`
  MODIFY `paymentid` int(14) NOT NULL AUTO_INCREMENT;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
