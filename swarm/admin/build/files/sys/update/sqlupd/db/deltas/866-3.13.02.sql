--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `sender_gateway_types` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL COMMENT 'Название',
  `fields` text NOT NULL DEFAULT '{}' COMMENT 'JSON параметры'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sender_gateway_types` (`id`, `name`, `fields`) VALUES
(1, 'SMS Ukraine', '{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\"}'),
(2, 'SMS Pilot', '{\"sender\":\"text\",\"api_key\":\"text\"}'),
(3, 'SMS Fly', '{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\"}'),
(4, 'TextLocal', '{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\",\"api_key\":\"text\"}'),
(5, 'Beeline (beeline.amega-inform.ru)', '{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\"}'),
(6, 'TurboSMS', '{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\"}'),
(7, 'IQSMS', '{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\"}'),
(8, 'smsc.ru', '{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\"}'),
(9, 'SMS Fenix', '{\"sender\":\"text\",\"api_key\":\"text\",\"api_host\":\"text\"}'),
(10, 'SMS Eskiz (eskiz.uz)', '{\"sender\":\"text\",\"login\":\"text\",\"api_key\":\"text\"}'),
(11, 'МТС ru', '{\"sender\":\"text\",\"api_key\":\"text\"}'),
(12, 'LIBONET', '{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\"}'),
(13, 'SMS API', '{\"sender\":\"text\",\"api_key\":\"text\",\"api_host\":\"text\"}'),
(14, 'SMS e-Vostok', '{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\"}'),
(15, 'SMS Lugacom', '{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\",\"api_host\":\"text\"}'),
(16, 'SMS OmniCell', '{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\"}'),
(17, 'SMS TurboSMS with Viber', '{\"sender\":\"text\",\"transactional\":\"checkbox\",\"api_key\":\"text\"}'),
(18, 'Mobizon.kz', '{\"sender\":\"text\",\"api_key\":\"text\"}'),
(19, 'Mobizon.ua', '{\"sender\":\"text\",\"api_key\":\"text\"}');


ALTER TABLE `sender_gateway_types`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sender_gateway_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;