--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `userscontacts` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`contact` VARCHAR(128) NOT NULL ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

ALTER TABLE `userscontacts` ADD `uid` INT NOT NULL AFTER `id`;
ALTER TABLE `userscontacts` ADD `contact_type_id` SMALLINT NOT NULL AFTER `uid`;
ALTER TABLE `userscontacts` ADD INDEX `uid_contact_type` (`uid`, `contact_type_id`);
ALTER TABLE `userscontacts` ADD INDEX `contact` (`contact`);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
