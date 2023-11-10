--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `mod_omnicell_data` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`userid` INT(11) NOT NULL,
	`serviceid` INT(11) NOT NULL,
	`main` TINYINT(4) NOT NULL DEFAULT '1',
	`uslid` INT(11) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `uslid` (`uslid`) USING BTREE,
	INDEX `userid` (`userid`, `serviceid`) USING BTREE
) ENGINE=InnoDB COLLATE='utf8mb4_general_ci';

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;