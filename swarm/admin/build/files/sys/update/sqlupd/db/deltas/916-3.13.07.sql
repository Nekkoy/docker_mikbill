--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `mod_omnicell_users` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`uid` INT(10) UNSIGNED NOT NULL COMMENT 'users UID',
	`phoneNumber` VARCHAR(13) NOT NULL DEFAULT '' COMMENT 'users phoneNumber' COLLATE 'utf8mb4_general_ci',
	`migrated_at` DATETIME NULL DEFAULT NULL,
	`leaved_at` DATETIME NULL DEFAULT NULL,
	`otp_send_attempts` TINYINT(4) NULL DEFAULT '0',
	`otp_send_blocked` DATETIME NULL DEFAULT NULL,
	`otp_enter_attempts` TINYINT(4) NULL DEFAULT '0',
	`otp_enter_blocked` DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `phoneNumber` (`phoneNumber`) USING BTREE,
	INDEX `uid_serviceid` (`uid`) USING BTREE
) ENGINE=InnoDB COLLATE='utf8mb4_general_ci' COMMENT='Users who transfer phone numbers to our service';

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;