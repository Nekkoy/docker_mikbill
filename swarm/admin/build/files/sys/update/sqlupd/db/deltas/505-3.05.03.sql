--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `geo_map_maps` (
  `id` int(11) NOT NULL,
  `type` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `name` blob NOT NULL,
  `description` blob,
  `lat` double(8,6) NOT NULL,
  `lon` double(9,6) NOT NULL,
  `zoom` smallint(6) NOT NULL DEFAULT '4'
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;

ALTER TABLE `geo_map_maps` ADD PRIMARY KEY (`id`);
ALTER TABLE `geo_map_maps` ADD KEY `map_type` (`type`);
ALTER TABLE `geo_map_maps` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
