--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

UPDATE `sender_gateway_types` SET `fields` = '{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}' WHERE `id` = 1;
UPDATE `sender_gateway_types` SET `fields` = '{\"sender\":\"text\",\"api_key\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}' WHERE `id` = 2;
UPDATE `sender_gateway_types` SET `fields` = '{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}' WHERE `id` = 3;
UPDATE `sender_gateway_types` SET `fields` = '{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\",\"api_key\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}' WHERE `id` = 4;
UPDATE `sender_gateway_types` SET `fields` = '{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}' WHERE `id` = 5;
UPDATE `sender_gateway_types` SET `fields` = '{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}' WHERE `id` = 6;
UPDATE `sender_gateway_types` SET `fields` = '{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}' WHERE `id` = 7;
UPDATE `sender_gateway_types` SET `fields` = '{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}' WHERE `id` = 8;
UPDATE `sender_gateway_types` SET `fields` = '{\"sender\":\"text\",\"api_key\":\"text\",\"api_host\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}' WHERE `id` = 9;
UPDATE `sender_gateway_types` SET `fields` = '{\"sender\":\"text\",\"login\":\"text\",\"api_key\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}' WHERE `id` = 10;
UPDATE `sender_gateway_types` SET `fields` = '{\"sender\":\"text\",\"api_key\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}' WHERE `id` = 11;
UPDATE `sender_gateway_types` SET `fields` = '{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}' WHERE `id` = 12;
UPDATE `sender_gateway_types` SET `fields` = '{\"sender\":\"text\",\"api_key\":\"text\",\"api_host\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}' WHERE `id` = 13;
UPDATE `sender_gateway_types` SET `fields` = '{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}' WHERE `id` = 14;
UPDATE `sender_gateway_types` SET `fields` = '{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\",\"api_host\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}' WHERE `id` = 15;
UPDATE `sender_gateway_types` SET `fields` = '{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}' WHERE `id` = 16;
UPDATE `sender_gateway_types` SET `fields` = '{\"sender\":\"text\",\"transactional\":\"checkbox\",\"api_key\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}' WHERE `id` = 17;
UPDATE `sender_gateway_types` SET `fields` = '{\"sender\":\"text\",\"api_key\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}' WHERE `id` = 18;
UPDATE `sender_gateway_types` SET `fields` = '{\"sender\":\"text\",\"api_key\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}' WHERE  `id` = 19;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;