--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `logs_extra` (
	`logid` INT NOT NULL ,
	`object_id` INT NOT NULL ,
	`message` VARCHAR(128) CHARACTER SET koi8r COLLATE koi8r_general_ci NULL DEFAULT NULL ,
	`extra` BLOB NULL DEFAULT NULL ,
	PRIMARY KEY (`logid`)
) ENGINE = InnoDB  DEFAULT CHARSET=koi8r COLLATE koi8r_general_ci;

ALTER TABLE `logs_extra` ADD INDEX `object_id` (`object_id`);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;