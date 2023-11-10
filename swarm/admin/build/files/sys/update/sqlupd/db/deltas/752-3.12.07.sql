--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `ip_pools_packets_ipv6_static` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`gid` INT NOT NULL ,
	`poolid` INT NOT NULL ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

ALTER TABLE `ip_pools_packets_ipv6_static` ADD INDEX `gid` (`gid`);
ALTER TABLE `ip_pools_packets_ipv6_static` ADD INDEX `poolid` (`poolid`);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;