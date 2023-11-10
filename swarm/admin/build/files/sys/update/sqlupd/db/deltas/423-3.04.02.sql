--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `invoice` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`date_create` INT NOT NULL ,
	`date_period` INT NOT NULL ,
	`uid` INT NOT NULL ,
	`json` BLOB NULL ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB;


ALTER TABLE `invoice` ADD UNIQUE `date_uid` (`date_period`, `uid`) USING BTREE;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;