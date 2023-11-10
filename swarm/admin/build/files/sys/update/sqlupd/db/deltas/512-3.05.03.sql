--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `snmp_devices` (
  `devid` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `type` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `update_date` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;

ALTER TABLE `snmp_devices`
  ADD PRIMARY KEY (`devid`),
  ADD UNIQUE KEY `owner_type` (`owner_id`,`type`),
  ADD KEY `type` (`type`),
  ADD KEY `onwer_id` (`owner_id`) USING BTREE;

ALTER TABLE `snmp_devices`
  MODIFY `devid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
