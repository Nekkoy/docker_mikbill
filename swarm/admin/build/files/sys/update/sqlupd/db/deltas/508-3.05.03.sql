--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `geo_map_properties` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `key` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `value` blob
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;

ALTER TABLE `geo_map_properties` ADD PRIMARY KEY (`id`);
ALTER TABLE `geo_map_properties` ADD INDEX `object_id` (`object_id`);
ALTER TABLE `geo_map_properties` ADD INDEX `object_key` (`object_id`, `key`);
ALTER TABLE `geo_map_properties` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
