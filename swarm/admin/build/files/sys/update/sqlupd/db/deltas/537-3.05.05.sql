--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `iptv_requests_log` (
  `id` bigint(20) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `middleware` smallint(6) NOT NULL DEFAULT '0',
  `package_id` varchar(128) NOT NULL DEFAULT '',
  `subscription_id` smallint(6) NOT NULL DEFAULT '0',
  `order_id` varchar(128) NOT NULL,
  `order_name` varchar(128) NOT NULL,
  `order_time` datetime DEFAULT NULL,
  `status_message` varchar(255) NOT NULL,
  `json_data` varchar(2048) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;

ALTER TABLE `iptv_requests_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `update_status` (`order_id`),
  ADD KEY `last10logs` (`uid`,`middleware`),
  ADD KEY `full_logs` (`middleware`,`order_time`),
  ADD KEY `subscription_id` (`subscription_id`);

ALTER TABLE `iptv_requests_log`  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
