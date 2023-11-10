--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `ipv6_pool_networks_address` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT 'network address id', 
  `network_id` INT NOT NULL COMMENT 'network id', 
  `network` VARCHAR(35) NOT NULL COMMENT 'network address', 
  `network_bin` VARBINARY(16) NULL COMMENT 'binary network address', 
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET = utf8 COLLATE utf8_general_ci;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
