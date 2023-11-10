--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO `system_options` (`key`, `value`) VALUES ("psbank_on", 0);
INSERT INTO `system_options` (`key`, `value`) VALUES ("psbank_debug_on", 0);
INSERT INTO `system_options` (`key`, `value`) VALUES ("psbank_testing", 0);
INSERT INTO `system_options` (`key`, `value`) VALUES ("psbank_comp1", '');
INSERT INTO `system_options` (`key`, `value`) VALUES ("psbank_comp2", '');
INSERT INTO `system_options` (`key`, `value`) VALUES ("psbank_terminal", 0);
INSERT INTO `system_options` (`key`, `value`) VALUES ("psbank_merchant", 0);
INSERT INTO `system_options` (`key`, `value`) VALUES ("psbank_merch_name", "");
INSERT INTO `system_options` (`key`, `value`) VALUES ("psbank_desc", "Internet");
INSERT INTO `system_options` (`key`, `value`) VALUES ("psbank_backref", "");
INSERT INTO `system_options` (`key`, `value`) VALUES ("psbank_notify", "");
INSERT INTO `system_options` (`key`, `value`) VALUES ("psbank_email", "");
INSERT INTO `system_options` (`key`, `value`) VALUES ("psbank_network", "127.0.0.1");

INSERT INTO `system_options` (`key`, `value`) VALUES ("psbank_uid", 0);
INSERT INTO `system_options` (`key`, `value`) VALUES ("psbank_uid_prio", 1);
INSERT INTO `system_options` (`key`, `value`) VALUES ("psbank_login", 0);
INSERT INTO `system_options` (`key`, `value`) VALUES ("psbank_login_prio", 2);
INSERT INTO `system_options` (`key`, `value`) VALUES ("psbank_numdogovor", 0);
INSERT INTO `system_options` (`key`, `value`) VALUES ("psbank_numdogovor_prio", 3);

INSERT INTO `bugh_plategi_type` (`bughtypeid`, `typename`, `sign`, `deposit_action`, `deposit_action_by_user`) VALUES (161, 'Пополнение PSBank', '+', '+', '+');

CREATE TABLE `addons_psbank` (
	`txn_id` INT(11) NOT NULL AUTO_INCREMENT,
	`uid` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`amount` DOUBLE(20,6) NOT NULL DEFAULT '0.000000',
	`txn_date` DATETIME NULL DEFAULT NULL,
	`server_date` DATETIME NULL DEFAULT NULL,
	`status` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
	PRIMARY KEY (`txn_id`) USING BTREE,
	INDEX `txn_date` (`txn_date`) USING BTREE,
	INDEX `server_date` (`server_date`) USING BTREE,
	INDEX `uid` (`uid`) USING BTREE
) COLLATE='utf8mb4_general_ci' ENGINE=InnoDB AUTO_INCREMENT=100001;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;