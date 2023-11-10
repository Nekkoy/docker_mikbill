--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `ip_access` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`ipaddress` VARCHAR(255) NOT NULL ,
	`stuffid` SMALLINT NOT NULL DEFAULT '0' ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB;

ALTER TABLE `ip_access` ADD INDEX `ip_address` (`ipaddress`);

INSERT INTO `ip_access` (`id`, `ipaddress`, `stuffid`) VALUES (NULL, '0.0.0.0/0', '0');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
