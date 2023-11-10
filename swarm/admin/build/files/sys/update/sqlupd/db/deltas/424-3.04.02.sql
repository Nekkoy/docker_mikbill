--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `mod_trueip_objects` (
  `id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `houseid` int(17) DEFAULT NULL,
  `unique_id` varchar(128) DEFAULT NULL,
  `token` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;

ALTER TABLE `mod_trueip_objects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`unique_id`),
  ADD KEY `houseid` (`houseid`),
  ADD KEY `unique_id_2` (`unique_id`);

ALTER TABLE `mod_trueip_objects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;