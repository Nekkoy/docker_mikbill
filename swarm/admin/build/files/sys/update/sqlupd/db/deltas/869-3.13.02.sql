--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

DROP TABLE IF EXISTS `sender_gateway_types`;

CREATE TABLE `sender_gateway_types` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL COMMENT 'Название',
  `fields` text DEFAULT NULL COMMENT 'JSON параметры'
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

INSERT INTO `sender_gateways` (`sender_gateway_type`, `name`, `params`)
VALUES(
	(SELECT `value` FROM `system_options` WHERE `key` LIKE 'sms_gateway_type'),
    (SELECT `name` FROM `sender_gateway_types` WHERE `id` = (SELECT `value` FROM `system_options` WHERE `key` LIKE 'sms_gateway_type')),
    CONCAT('{',
           '"sender": ', '"',(SELECT `value` FROM `system_options` WHERE `key` LIKE 'sms_gateway_sender'), '", '
           '"login": ', '"',(SELECT `value` FROM `system_options` WHERE `key` LIKE 'sms_gateway_login'), '", '
           '"password": ', '"',(SELECT `value` FROM `system_options` WHERE `key` LIKE 'sms_gateway_password'), '", '
           '"api_key": ', '"',(SELECT `value` FROM `system_options` WHERE `key` LIKE 'sms_gateway_apikey'), '", '
           '"api_host": ', '"',(SELECT `value` FROM `system_options` WHERE `key` LIKE 'sms_gateway_apihost'), '"'
           '}')
);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;