--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `ipv6_pool_networks_address` CHANGE `network` `delegated_network` VARCHAR(35) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'delegated network address';
ALTER TABLE `ipv6_pool_networks_address` CHANGE `network_bin` `delegated_network_bin` VARBINARY(16) NULL DEFAULT NULL COMMENT 'binary network address';
ALTER TABLE `ipv6_pool_networks_address` ADD `router_network` VARCHAR(35) NOT NULL AFTER `delegated_network_bin`;

ALTER TABLE `ipv6_pool_networks_address` DROP INDEX `uniq_address`;

ALTER TABLE `ipv6_pool_networks_address` ADD UNIQUE `delegated_address` (`delegated_network_bin`);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;