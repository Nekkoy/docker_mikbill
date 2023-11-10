--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `queue_conax` (
	`id` BIGINT NOT NULL AUTO_INCREMENT ,
	`uid` INT NOT NULL DEFAULT '0' ,
	`card_id` VARCHAR(32) NOT NULL ,
	`order_id` VARCHAR(128) NOT NULL ,
	`order_name` VARCHAR(128) NOT NULL ,
	`order_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,
	`status_code` VARCHAR(128) NOT NULL ,
	`status_message` VARCHAR(255) NOT NULL ,
	`json_data` VARCHAR(255) NOT NULL ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB;

ALTER TABLE `queue_conax` ADD INDEX `uid` (`uid`);
ALTER TABLE `queue_conax` ADD INDEX `card_ud` (`card_id`);
ALTER TABLE `queue_conax` ADD INDEX `uid_cardid` (`uid`, `card_id`);
ALTER TABLE `queue_conax` ADD INDEX `status_code` (`status_code`);
ALTER TABLE `queue_conax` ADD INDEX `order_id` (`order_id`);
ALTER TABLE `queue_conax` ADD INDEX `order_date` (`order_time`);

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
