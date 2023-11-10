--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';
SET sql_mode='';

-- изменяем дефолты в схеме
ALTER TABLE `usersdel` CHANGE `add_date` `add_date` DATE NULL DEFAULT NULL, CHANGE `expired` `expired` DATE NULL DEFAULT NULL, CHANGE `last_connection` `last_connection` DATETIME NULL DEFAULT NULL, CHANGE `date_birth` `date_birth` DATE NULL DEFAULT NULL;

-- апдейтим 0000-00-00 на null 
UPDATE `usersdel` SET `add_date` = NULL WHERE `add_date` LIKE '0000-00-00';
UPDATE `usersdel` SET `expired` = NULL WHERE `expired` LIKE '0000-00-00';
UPDATE `usersdel` SET `date_birth` = NULL WHERE `date_birth` LIKE '0000-00-00';
UPDATE `usersdel` SET `last_connection` = NULL WHERE `last_connection` LIKE '0000-00-00 00:00:00';

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
