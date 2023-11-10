--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `sorm_data` (
  `id` int(11) NOT NULL,
  `sorm_id` int(11) NOT NULL,
  `entity` varchar(128) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `entity_data` text DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `sorm_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `entity` (`entity`,`entity_id`);

ALTER TABLE `sorm_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;