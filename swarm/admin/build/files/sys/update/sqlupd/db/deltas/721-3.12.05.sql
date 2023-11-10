--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO `bugh_plategi_type` (`bughtypeid`, `typename`, `sign`, `fictitious`, `deposit_action`, `deposit_action_by_user`) VALUES ('153', 'Пополнение Reeves', '+', '0', '+', '+');

CREATE TABLE `addons_reeves` (
  `order_id` int(1) UNSIGNED NOT NULL,
  `uid` bigint(16) UNSIGNED DEFAULT NULL,
  `amount` decimal(18,2) UNSIGNED DEFAULT NULL,
  `txn_id` char(36) NOT NULL,
  `txn_date` datetime DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_general_ci;

ALTER TABLE `addons_reeves` ADD PRIMARY KEY (`order_id`);
ALTER TABLE `addons_reeves` MODIFY `order_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
