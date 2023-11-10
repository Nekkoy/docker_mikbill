--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `ipv6_pool_networks` CHANGE `network` `delegated_network` VARCHAR(35) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'delegated network';
ALTER TABLE `ipv6_pool_networks` CHANGE `prefix` `delegated_prefix1` SMALLINT(4) NOT NULL DEFAULT '32' COMMENT 'delegated prefix1';
ALTER TABLE `ipv6_pool_networks` CHANGE `delegated_prefix` `delegated_prefix2` SMALLINT(4) NOT NULL DEFAULT '0';
ALTER TABLE `ipv6_pool_networks` CHANGE `router_prefix` `router_prefix1` SMALLINT(4) NOT NULL DEFAULT '32';

ALTER TABLE `ipv6_pool_networks` ADD `router_prefix2` SMALLINT(4) NOT NULL DEFAULT '0' AFTER `router_prefix1`;

ALTER TABLE `ipv6_pool_networks` DROP `use_gw`;
ALTER TABLE `ipv6_pool_networks` DROP `gateway`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;