--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE IF NOT EXISTS `failover_group` (
	`rfgid` SMALLINT NOT NULL AUTO_INCREMENT COMMENT 'id failover группы' ,
	`name` VARCHAR(128) NULL DEFAULT NULL COMMENT 'имя failover группы' ,
	PRIMARY KEY (`rfgid`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `failover_group_radnas` (
	`rfgid` SMALLINT NOT NULL COMMENT 'id failover группы' ,
	`radnasid` SMALLINT NOT NULL COMMENT 'id nas' ,
	PRIMARY KEY (`rfgid`,`radnasid`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `failover_group_switches` (
	`rfgid` SMALLINT NOT NULL COMMENT 'id failover группы' ,
	`swid` SMALLINT NOT NULL COMMENT 'id switches' ,
	PRIMARY KEY (`rfgid`,`swid`)
) ENGINE = InnoDB;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
