--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `mbp_devices_onut_proper` (
  `id` int(11) NOT NULL,
  `onut_id` int(11) NOT NULL,
  `key` varchar(128) NOT NULL,
  `value` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `mbp_devices_onut_proper`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `onut_id_key` (`onut_id`,`key`),
  ADD KEY `onut_id` (`onut_id`);

ALTER TABLE `mbp_devices_onut_proper`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;