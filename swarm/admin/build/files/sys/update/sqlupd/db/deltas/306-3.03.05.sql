--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `stuff_personal` 
 ADD `atol_on` TINYINT(1) NOT NULL DEFAULT '0' AFTER `komtet_optionally`, 
 ADD `atol_group_id` VARCHAR(128) NULL DEFAULT NULL AFTER `atol_on`, 
 ADD `atol_optionally` TINYINT(1) NOT NULL DEFAULT '0' AFTER `atol_group_id`;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
