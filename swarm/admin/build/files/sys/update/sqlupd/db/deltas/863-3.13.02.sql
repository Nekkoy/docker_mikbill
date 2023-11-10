--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `connect_template_type`
	ADD `packet_current` TINYINT NOT NULL DEFAULT '1' AFTER `dev_sn`,
	ADD `packet_next` TINYINT NOT NULL DEFAULT '1' AFTER `packet_current`,
	ADD `packet_custom` TINYINT NOT NULL DEFAULT '0' AFTER `packet_next`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;