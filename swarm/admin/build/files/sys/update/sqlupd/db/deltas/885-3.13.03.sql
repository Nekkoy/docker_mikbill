--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `stuff_personal` ADD `notify_volume` DECIMAL(1,1) NOT NULL DEFAULT '0.5' COMMENT 'notify sound volume' AFTER `tickets_notify_ticket_msg`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;