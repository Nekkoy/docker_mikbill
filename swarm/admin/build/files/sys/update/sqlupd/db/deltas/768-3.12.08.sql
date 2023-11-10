--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `mbp_devices_interface` (
  `id` int(11) NOT NULL,
  `deviceid` int(11) NOT NULL,
  `interface_index` int(11) NOT NULL,
  `update_date` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `mbp_devices_interface`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `mbp_devices_interface`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;