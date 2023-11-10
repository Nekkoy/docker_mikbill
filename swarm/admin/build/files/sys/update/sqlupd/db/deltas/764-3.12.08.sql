--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `mbp_devices_onut` (
  `id` int(11) NOT NULL,
  `deviceid` int(11) NOT NULL,
  `onut_index` varchar(255) NOT NULL,
  `onut_mac` varchar(18) CHARACTER SET utf8 DEFAULT NULL,
  `update_date` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `mbp_devices_onut`
  ADD PRIMARY KEY (`id`),
  ADD KEY `onut_mac` (`onut_mac`),
  ADD KEY `deviceid` (`deviceid`),
  ADD KEY `deviceid_index` (`deviceid`,`onut_index`),
  ADD KEY `deviceid_mac` (`deviceid`,`onut_mac`);

ALTER TABLE `mbp_devices_onut`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;