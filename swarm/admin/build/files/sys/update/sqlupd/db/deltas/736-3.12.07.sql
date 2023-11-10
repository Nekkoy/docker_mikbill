--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `queue_messages_history` (
	`m_id` BIGINT NOT NULL AUTO_INCREMENT ,
	`mq_id` BIGINT NOT NULL ,
	`mq_name` VARCHAR(36) NOT NULL ,
	`m_msg` TEXT NOT NULL ,
	`m_created` TIMESTAMP NOT NULL ,
	`m_completed` TIMESTAMP NOT NULL ,
	`m_uuid` VARCHAR(36) NOT NULL ,
	PRIMARY KEY (`m_id`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;