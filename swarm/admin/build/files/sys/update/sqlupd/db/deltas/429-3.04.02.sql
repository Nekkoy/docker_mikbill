--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `bugh_plategi_stat_deleted` (
  `plategid` int(20) UNSIGNED NOT NULL,
  `uid` bigint(16) UNSIGNED NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `who` tinyint(6) UNSIGNED DEFAULT NULL,
  `bughtypeid` smallint(10) UNSIGNED NOT NULL,
  `before_billing` double(20,6) NOT NULL,
  `summa` double(20,6) NOT NULL,
  `comment` varchar(128) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=koi8r;

ALTER TABLE `bugh_plategi_stat_deleted`
  ADD PRIMARY KEY (`plategid`) USING BTREE,
  ADD KEY `bughtypeid` (`bughtypeid`) USING BTREE,
  ADD KEY `date` (`date`) USING BTREE,
  ADD KEY `date_type` (`date`,`bughtypeid`) USING BTREE,
  ADD KEY `summa` (`date`,`bughtypeid`,`summa`) USING BTREE,
  ADD KEY `summa-2` (`summa`) USING BTREE,
  ADD KEY `uid` (`uid`) USING BTREE,
  ADD KEY `uid-date` (`uid`,`date`) USING BTREE;
 
--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;