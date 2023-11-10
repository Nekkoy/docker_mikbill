--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `ipv6_pool_networks` ADD `router_network` VARCHAR(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `delegated_prefix`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;