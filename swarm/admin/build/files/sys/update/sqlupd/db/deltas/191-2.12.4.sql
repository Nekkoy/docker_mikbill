--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';


DROP table IF EXISTS `switch_status_last` ;

CREATE TABLE IF NOT EXISTS `switch_status_last` (
  `devid` int(10) unsigned NOT NULL COMMENT 'switch_id or bras_id',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '0 - switch , 1 - bras',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL,
  `uptime` varchar(30) NOT NULL,
  `ping` double(20,2) NOT NULL,
  UNIQUE KEY `devid=>type` (`devid`,`type`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=koi8r COMMENT='logs uptime devices';


--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
