--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `ipv6_pool_networks_exclude` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'exclude id', 
  `network_id` INT NOT NULL COMMENT 'exclude network id', 
  `network` VARCHAR(35) NOT NULL COMMENT 'network address', 
  `prefix` SMALLINT(4) NOT NULL COMMENT 'network prefix', 
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET = utf8 COLLATE utf8_general_ci;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
