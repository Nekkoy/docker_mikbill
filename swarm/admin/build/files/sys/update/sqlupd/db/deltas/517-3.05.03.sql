--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

DELETE FROM `system_options` WHERE `key` = 'privat24_ccy';
DELETE FROM `system_options` WHERE `key` = 'privat24_server_url';
DELETE FROM `system_options` WHERE `key` = 'privat24_sign';
DELETE FROM `system_options` WHERE `key` = 'privat24_return_url';
DELETE FROM `system_options` WHERE `key` = 'privat24_merchantid';
DELETE FROM `system_options` WHERE `key` = 'privat24_coefficient_on';
DELETE FROM `system_options` WHERE `key` = 'privat24_coefficient_size';

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
