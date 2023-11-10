--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO `bugh_plategi_type` (`bughtypeid`, `typename`, `sign`, `fictitious`, `deposit_action`, `deposit_action_by_user`) VALUES ('159', 'Пополнение Uzumbank.uz', '+', '0', '+', '+');

INSERT INTO `system_options` (`key`, `value`) VALUES ('uzumbank_on', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('uzumbank_debug_on', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES ('uzumbank_network', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('uzumbank_uid', '1');
INSERT INTO `system_options` (`key`, `value`) VALUES ('uzumbank_uid_prio', '1');
INSERT INTO `system_options` (`key`, `value`) VALUES ('uzumbank_login', '1');
INSERT INTO `system_options` (`key`, `value`) VALUES ('uzumbank_login_prio', '2');
INSERT INTO `system_options` (`key`, `value`) VALUES ('uzumbank_numdogovor', '1');
INSERT INTO `system_options` (`key`, `value`) VALUES ('uzumbank_numdogovor_prio', '3');
INSERT INTO `system_options` (`key`, `value`) VALUES ('uzumbank_username', '');
INSERT INTO `system_options` (`key`, `value`) VALUES ('uzumbank_password', '');

CREATE TABLE `addons_uzumbank` (
 `order_id` int(11) UNSIGNED NOT NULL,
  `uid` bigint(16) UNSIGNED DEFAULT NULL,
  `amount` decimal(18,2) UNSIGNED DEFAULT NULL,
  `txn_id` varchar(128) DEFAULT NULL,
  `txn_date` datetime  DEFAULT NULL,
  `account` varchar(128) DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `addons_uzumbank` ADD PRIMARY KEY (`order_id`);

ALTER TABLE `addons_uzumbank` MODIFY `order_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;