--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

TRUNCATE `ipv6_users`;
TRUNCATE `ipv6_pool_networks`;
TRUNCATE `ipv6_pool_networks_address`;
TRUNCATE `ipv6_pool_networks_exclude`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;