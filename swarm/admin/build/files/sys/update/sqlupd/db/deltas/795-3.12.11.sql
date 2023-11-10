--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

-- ALTER TABLE `logs` ADD `object_id` INT NULL DEFAULT NULL AFTER `uid`;
-- ALTER TABLE `logs` ADD `message` VARCHAR(128) CHARACTER SET koi8r COLLATE koi8r_general_ci NULL DEFAULT NULL AFTER `newvalue`;
-- ALTER TABLE `logs` ADD INDEX `object_id` (`object_id`);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;