--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `stuff_personal`
	ADD COLUMN `webkassa_on` TINYINT(1) NOT NULL DEFAULT '0' AFTER `atol_optionally`,
	ADD COLUMN `webkassa_optionally` TINYINT(1) NOT NULL DEFAULT '0' AFTER `webkassa_on`,
	ADD COLUMN `webkassa_kassa_code` VARCHAR(128) NULL DEFAULT NULL AFTER `webkassa_optionally`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;