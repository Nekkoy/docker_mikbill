--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `ipv6_pool_networks` CHANGE `override_dns1` `dns1` VARCHAR(35) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'override pool dns1';
ALTER TABLE `ipv6_pool_networks` CHANGE `override_dns2` `dns2` VARCHAR(35) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'override pool dns2';

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;