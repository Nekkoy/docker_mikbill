--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

DROP TABLE IF EXISTS `sender_gateways`;

CREATE TABLE `sender_gateways` (
  `id` int(11) NOT NULL,
  `sender_gateway_type` int(11) NOT NULL COMMENT 'Тип используемого шлюза',
  `name` varchar(128) NOT NULL COMMENT 'Название',
  `params` text DEFAULT NULL COMMENT 'JSON параметры'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `sender_gateways`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sender_gateways`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;