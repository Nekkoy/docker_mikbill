--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

--
-- Структура таблиці `snmp_devices`
--

CREATE TABLE `mbp_devices_proper` (
  `id` int(11) NOT NULL,
  `deviceid` int(11) NOT NULL,
  `key` varchar(128) NOT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `mbp_devices_proper`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `deviceid_key` (`deviceid`,`key`);

ALTER TABLE `mbp_devices_proper`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;