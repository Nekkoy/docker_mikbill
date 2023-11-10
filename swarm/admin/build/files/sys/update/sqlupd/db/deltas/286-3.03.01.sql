--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `addons_lifecell_easypay` (
  `paymentid` int(14) NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `uid` bigint(16) UNSIGNED NOT NULL,
  `OrderId` char(64) COLLATE koi8r_bin NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Amount` double(14,2) NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `cancel` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB AVG_ROW_LENGTH=95 DEFAULT CHARSET=koi8r COLLATE=koi8r_bin;

ALTER TABLE `addons_lifecell_easypay`
  ADD PRIMARY KEY (`paymentid`),
  ADD KEY `time` (`order_date`),
  ADD KEY `uid-time` (`uid`,`order_date`);


ALTER TABLE `addons_lifecell_easypay`
  MODIFY `paymentid` int(14) NOT NULL AUTO_INCREMENT;


--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
