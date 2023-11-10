--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

UPDATE `services` SET `servicename` = 'Лимит трафика (месяц)' WHERE `services`.`serviceid` = 4;
UPDATE `services` SET `servicename` = 'Лимит трафика (день)' WHERE `services`.`serviceid` = 10;
UPDATE `services` SET `servicename` = 'Лимит трафика (неделя)' WHERE `services`.`serviceid` = 11;
UPDATE `services` SET `servicename` = 'Лимит трафика (плав. дата)' WHERE `services`.`serviceid` = 12;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;