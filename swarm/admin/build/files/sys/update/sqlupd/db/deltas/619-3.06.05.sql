--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `ip_pools_packets_real` (
  `id` int(11) NOT NULL,
  `gid` int(11) NOT NULL COMMENT 'id тарифа',
  `poolid` int(11) NOT NULL COMMENT 'id pool'
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;

ALTER TABLE `ip_pools_packets_real`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poolid_index` (`poolid`) USING BTREE,
  ADD KEY `gid_index` (`gid`) USING BTREE;

ALTER TABLE `ip_pools_packets_real`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
