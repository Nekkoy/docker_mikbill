--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `geo_map_objects` (
  `id` int(11) NOT NULL,
  `map_id` int(11) NOT NULL,
  `type` varchar(128) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;

ALTER TABLE `geo_map_objects` ADD PRIMARY KEY (`id`);
ALTER TABLE `geo_map_objects` ADD INDEX `map_id` (`map_id`);
ALTER TABLE `geo_map_objects` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
