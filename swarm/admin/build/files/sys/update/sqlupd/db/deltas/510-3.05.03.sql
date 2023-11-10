--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE IF NOT EXISTS `bugh_plategi_stat_deleted` (
  `plategid` int(20) unsigned NOT NULL,
  `uid` bigint(16) unsigned NOT NULL,
  `date` datetime DEFAULT NULL,
  `who` tinyint(6) unsigned DEFAULT NULL,
  `bughtypeid` smallint(10) unsigned NOT NULL,
  `before_billing` double(20,6) NOT NULL,
  `summa` double(20,6) NOT NULL,
  `comment` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`plategid`) USING BTREE,
  KEY `bughtypeid` (`bughtypeid`) USING BTREE,
  KEY `date` (`date`) USING BTREE,
  KEY `date_type` (`date`,`bughtypeid`) USING BTREE,
  KEY `summa` (`date`,`bughtypeid`,`summa`) USING BTREE,
  KEY `summa-2` (`summa`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `uid-date` (`uid`,`date`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=koi8r;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
