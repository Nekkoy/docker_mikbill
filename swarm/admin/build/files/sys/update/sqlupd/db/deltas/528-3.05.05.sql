--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `flussonic_cameras` (
  `id` int(11) NOT NULL,
  `camera_id` varchar(128) DEFAULT NULL,
  `house_id` int(11) DEFAULT NULL,
  `entrance` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;

ALTER TABLE `flussonic_cameras`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `flussonic_cameras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
