--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

DROP TABLE IF EXISTS `base_stations`;
CREATE TABLE `base_stations` (
  id int(11) NOT NULL,
  name varchar(128) NOT NULL,
  mac_address varchar(64) DEFAULT NULL,
  azimuth int(11) DEFAULT NULL,
  raster_width int(11) DEFAULT NULL,
  tilt_angle int(11) DEFAULT NULL,
  power int(11) DEFAULT NULL,
  frequency int(11) DEFAULT NULL,
  latitude varchar(128) DEFAULT NULL,
  longitude varchar(128) DEFAULT NULL,
  projection_type int(11) DEFAULT NULL,
  houseid int(11) DEFAULT NULL,
  housingid int(11) DEFAULT NULL,
  houseblockid int(11) DEFAULT NULL,
  porch int(11) DEFAULT NULL,
  floor int(11) DEFAULT NULL,
  app varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE base_stations ADD PRIMARY KEY (id);
ALTER TABLE base_stations MODIFY id int(11) NOT NULL AUTO_INCREMENT;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
