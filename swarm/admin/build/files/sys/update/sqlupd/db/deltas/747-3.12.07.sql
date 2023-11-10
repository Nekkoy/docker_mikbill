--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

UPDATE `system_options` SET `key` = 'userside_key' WHERE `key` = 'api_key';
UPDATE `system_options` SET `key` = 'userside_network' WHERE `key` = 'api_network';
UPDATE `system_options` SET `key` = 'userside_on' WHERE `key` = 'api_on';

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;