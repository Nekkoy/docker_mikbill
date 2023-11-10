--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `stuff_personal` ADD `komtet_on` TINYINT(1) NOT NULL DEFAULT '0' AFTER `edit_pass`, ADD `komtet_queue_id_kassa` VARCHAR(128) NULL DEFAULT NULL AFTER `komtet_on`, ADD `komtet_queue_id_online` VARCHAR(128) NULL DEFAULT NULL AFTER `komtet_queue_id_kassa`, ADD `komtet_optionally` TINYINT(1) NOT NULL DEFAULT '0' AFTER `komtet_queue_id_online`;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
