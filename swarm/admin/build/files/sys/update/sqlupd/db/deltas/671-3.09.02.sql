--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `mod_trueip_panels` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `login` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `ip_address` varchar(128) DEFAULT NULL,
  `rtsp_port` int(11) DEFAULT NULL,
  `dtmf_1` int(11) DEFAULT NULL,
  `dtmf_2` int(11) DEFAULT NULL,
  `callerid` int(11) DEFAULT NULL,
  `houseid` int(11) DEFAULT NULL,
  `porch` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `mod_trueip_panels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `houseid` (`houseid`);

ALTER TABLE `mod_trueip_panels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
