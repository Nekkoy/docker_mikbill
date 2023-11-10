--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `mbp_devices` (
  `deviceid` int(11) NOT NULL,
  `swid` int(11) DEFAULT NULL,
  `update_date` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;

ALTER TABLE `mbp_devices`
  ADD PRIMARY KEY (`deviceid`),
  ADD KEY `swid` (`swid`) USING BTREE;

ALTER TABLE `mbp_devices`
  MODIFY `deviceid` int(11) NOT NULL AUTO_INCREMENT;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;