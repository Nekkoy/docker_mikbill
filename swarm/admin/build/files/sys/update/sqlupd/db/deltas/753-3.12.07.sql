--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `ipv6_pool_networks` CHANGE `prefix` `prefix` SMALLINT(4) NOT NULL COMMENT 'network prefix';
ALTER TABLE `ipv6_pool_networks` CHANGE `delegated_prefix` `delegated_prefix` SMALLINT(4) NOT NULL DEFAULT '0';
ALTER TABLE `ipv6_pool_networks` CHANGE `router_prefix` `router_prefix` SMALLINT(4) NOT NULL DEFAULT '0';

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;