--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

UPDATE system_options SET `key` = 'us_key' WHERE `key` = 'userside_key';
UPDATE system_options SET `key` = 'us_network' WHERE `key` = 'userside_network';
UPDATE system_options SET `key` = 'us_on' WHERE `key` = 'userside_on';

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;