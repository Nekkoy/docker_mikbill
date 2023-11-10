--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `switche_type_types` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`name` VARCHAR(128) NOT NULL ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO `switche_type_types` (`id`, `name`) VALUES (1, 'Switch'), (2, 'OLT');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;