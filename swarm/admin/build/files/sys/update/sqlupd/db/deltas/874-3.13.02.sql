--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `sender_conditions` CHANGE `sender_gateway_id` `sender_gateway_id` INT(11) NULL DEFAULT '0' COMMENT 'ID шлюза';
UPDATE `sender_conditions` SET `sender_gateway_id` = CAST((SELECT id FROM `sender_gateways` LIMIT 1) AS SIGNED);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;