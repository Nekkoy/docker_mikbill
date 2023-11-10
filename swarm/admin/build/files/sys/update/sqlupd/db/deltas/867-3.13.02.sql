--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `sender_gateways` (
  `id` int(11) NOT NULL,
  `sender_gateway_type` int(11) NOT NULL COMMENT 'Тип используемого шлюза',
  `name` varchar(128) NOT NULL COMMENT 'Название',
  `params` text NOT NULL DEFAULT '{}' COMMENT 'JSON параметры'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `sender_gateways`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sender_gateways`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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