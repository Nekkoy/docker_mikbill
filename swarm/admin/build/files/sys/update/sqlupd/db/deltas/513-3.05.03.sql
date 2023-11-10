--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `snmp_data` (
  `id` int(11) NOT NULL,
  `devid` int(11) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` blob
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;

ALTER TABLE `snmp_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devid_key` (`devid`,`key`),
  ADD KEY `key` (`key`),
  ADD KEY `devid` (`devid`),
  ADD KEY `key_value` (`key`,`value`(16));

ALTER TABLE `snmp_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
