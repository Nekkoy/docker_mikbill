--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `stuff_personal` ADD `tickets_notify_on` TINYINT NOT NULL DEFAULT '0' COMMENT 'recive notifications' AFTER `tickets_performed_without_visit`;
ALTER TABLE `stuff_personal` ADD `tickets_notify_period` SMALLINT NOT NULL DEFAULT '60' COMMENT 'notifications check period' AFTER `tickets_notify_on`;
ALTER TABLE `stuff_personal` ADD `tickets_notify_ticket_new` TINYINT NOT NULL DEFAULT '0' COMMENT 'new ticket notifications' AFTER `tickets_notify_period`;
ALTER TABLE `stuff_personal` ADD `tickets_notify_ticket_msg` TINYINT NOT NULL DEFAULT '0' COMMENT 'new ticket msg notifications' AFTER `tickets_notify_ticket_new`;
ALTER TABLE `stuff_personal` ADD `tickets_notify_interval` SMALLINT NOT NULL DEFAULT '15' COMMENT 'notifications show period' AFTER `tickets_notify_period`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;