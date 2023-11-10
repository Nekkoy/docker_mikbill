--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

START TRANSACTION;

ALTER TABLE radacctbras RENAME radacctbras_before31213;

CREATE TABLE `radacctbras` (
  `radacctid` bigint NOT NULL,
  `acctsessionid` varchar(64) NOT NULL,
  `acctuniqueid` varchar(32) NOT NULL,
  `username` varchar(32) CHARACTER SET koi8r COLLATE koi8r_bin NOT NULL,
  `uid` bigint UNSIGNED NOT NULL DEFAULT '0',
  `devid` bigint NOT NULL DEFAULT '0',
  `gid` smallint UNSIGNED NOT NULL DEFAULT '0',
  `nasipaddress` varchar(15) NOT NULL,
  `nasportid` varchar(15) DEFAULT NULL,
  `acctstarttime` datetime DEFAULT NULL,
  `acctstoptime` datetime DEFAULT NULL,
  `acctsessiontime` int DEFAULT NULL,
  `acctinputoctets` bigint DEFAULT NULL,
  `acctoutputoctets` bigint DEFAULT NULL,
  `calledstationid` varchar(50) NOT NULL,
  `callingstationid` varchar(50) NOT NULL,
  `acctterminatecause` varchar(32) NOT NULL,
  `framedipaddress` varchar(15) NOT NULL,
  `last_change` int UNSIGNED NOT NULL DEFAULT '0',
  `before_billing` double(20,6) NOT NULL,
  `billing_minus` double(20,6) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=koi8r;

ALTER TABLE `radacctbras`
  ADD PRIMARY KEY (`radacctid`),
  ADD UNIQUE KEY `unique_session` (`acctsessionid`,`uid`,`devid`,`nasipaddress`,`nasportid`) USING HASH,
  ADD UNIQUE KEY `find_session` (`acctsessionid`,`nasipaddress`,`framedipaddress`,`nasportid`) USING HASH,
  ADD KEY `soft_close_user_sessions` (`uid`,`devid`),
  ADD KEY `sort_radacctid` (`radacctid`),
  ADD KEY `check_ip_is_used` (`framedipaddress`),
  ADD KEY `sort_last_change` (`last_change`);

ALTER TABLE `radacctbras` MODIFY `radacctid` bigint NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;