--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `stuff_password_history` (
	`stuffid` SMALLINT NOT NULL ,
	`hash` CHAR(35) NOT NULL ,
	`time` INT NOT NULL
) ENGINE = InnoDB COMMENT = 'история паролей сотрудников';

ALTER TABLE `stuff_password_history` CHANGE `hash` `hash` CHAR(35) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE `stuff_password_history` ADD UNIQUE `stuffid_hash` (`stuffid`, `hash`);
ALTER TABLE `stuff_password_history` ADD INDEX `stuffid_time` (`stuffid`, `time`);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
