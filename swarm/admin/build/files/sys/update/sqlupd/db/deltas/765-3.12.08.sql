--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `mbp_devices_onut_customers` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `deviceid` int(11) NOT NULL,
  `onut_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `mbp_devices_onut_customers`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `mbp_devices_onut_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;