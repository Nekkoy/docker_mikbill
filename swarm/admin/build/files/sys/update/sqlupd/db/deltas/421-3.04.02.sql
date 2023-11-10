--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `ap_client_logs` (
  `id` int(11) NOT NULL,
  `uid` bigint(16) DEFAULT NULL,
  `mac_address` varchar(32) DEFAULT NULL,
  `ap_ip` varchar(32) DEFAULT NULL,
  `at_stoped` datetime DEFAULT NULL,
  `at_updated` datetime DEFAULT NULL,
  `at_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;

ALTER TABLE `ap_client_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `at_updated` (`at_updated`),
  ADD KEY `uid` (`uid`),
  ADD KEY `at_stoped` (`at_stoped`);

ALTER TABLE `ap_client_logs`
  MODIFY `id` int(14) NOT NULL AUTO_INCREMENT;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;