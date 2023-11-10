--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO `bugh_plategi_type` (`bughtypeid`, `typename`, `sign`, `deposit_action`, `deposit_action_by_user`) VALUES (160, 'Пополнение Revolut', '+', '+', '+');

INSERT INTO `system_options` (`key`, `value`) VALUES ("revolut_on", "0");
INSERT INTO `system_options` (`key`, `value`) VALUES ("revolut_debug", "0");
INSERT INTO `system_options` (`key`, `value`) VALUES ("revolut_testing", "0");
INSERT INTO `system_options` (`key`, `value`) VALUES ("revolut_client", "");
INSERT INTO `system_options` (`key`, `value`) VALUES ("revolut_domain", "");
INSERT INTO `system_options` (`key`, `value`) VALUES ("revolut_private_key", "");
INSERT INTO `system_options` (`key`, `value`) VALUES ("revolut_oauth_code", "");
INSERT INTO `system_options` (`key`, `value`) VALUES ("revolut_access_token", "");
INSERT INTO `system_options` (`key`, `value`) VALUES ("revolut_refresh_token", "");

CREATE TABLE `addons_revolut` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`txn_id` VARCHAR(38) NOT NULL COLLATE 'utf8mb4_general_ci',
	`txn_date` DATETIME NULL DEFAULT NULL,
	`date` DATETIME NULL DEFAULT NULL,
	`amount` DOUBLE(20,6) NULL DEFAULT NULL,
	`uid` INT(10) UNSIGNED NULL DEFAULT NULL,
	`identificator` VARCHAR(128) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`description` VARCHAR(256) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`status` TINYINT(4) NULL DEFAULT '0',
	PRIMARY KEY (`id`) USING BTREE
) COLLATE='utf8mb4_general_ci' ENGINE=InnoDB;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;