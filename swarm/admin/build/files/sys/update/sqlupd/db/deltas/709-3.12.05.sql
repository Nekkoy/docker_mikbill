--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `ipv6_pool` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Pool ID', 
  `name` VARCHAR(128) NOT NULL COMMENT 'Pool name', 
  `delegated_prefix` SMALLINT(4) NOT NULL COMMENT 'Prefix delegation', 
  `router_prefix` SMALLINT(4) NOT NULL COMMENT 'Prefix delegation', 
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET = utf8 COLLATE utf8_general_ci;

ALTER TABLE `ipv6_pool` ADD `default_dns1` VARCHAR(35) NOT NULL AFTER `name`;
ALTER TABLE `ipv6_pool` ADD `default_dns2` VARCHAR(35) NOT NULL AFTER `default_dns1`;
ALTER TABLE `ipv6_pool` ADD `usersgroupid` INT NOT NULL DEFAULT '0' AFTER `router_prefix`;
ALTER TABLE `ipv6_pool` CHANGE `delegated_prefix` `delegated_prefix` SMALLINT(4) NOT NULL DEFAULT '64' COMMENT 'Prefix delegation';
ALTER TABLE `ipv6_pool` CHANGE `router_prefix` `router_prefix` SMALLINT(4) NOT NULL DEFAULT '128' COMMENT 'Prefix delegation';

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
