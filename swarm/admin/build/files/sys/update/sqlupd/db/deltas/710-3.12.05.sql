--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `ipv6_pool_networks` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'network id', 
  `pool_id` INT NOT NULL COMMENT 'pool id', 
  `network` VARCHAR(35) NOT NULL COMMENT 'network address', 
  `prefix` SMALLINT(4) NOT NULL COMMENT 'network prefix', 
  `use_gw` TINYINT NOT NULL DEFAULT '0' COMMENT 'use gateway', 
  `gateway` VARCHAR(35) NOT NULL COMMENT 'gateway address', 
  `override_dns1` VARCHAR(35) NOT NULL COMMENT 'override pool dns1', 
  `override_dns2` VARCHAR(35) NOT NULL COMMENT 'override pool dns2', 
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET = utf8 COLLATE utf8_general_ci;

ALTER TABLE `ipv6_pool_networks` ADD `delegated_prefix` SMALLINT(4) NOT NULL DEFAULT '0' AFTER `prefix`;
ALTER TABLE `ipv6_pool_networks` ADD `router_prefix` SMALLINT(4) NOT NULL DEFAULT '0' AFTER `delegated_prefix`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
