--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE IF NOT EXISTS `addons_rentsoft` (
  `order_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint(16) unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `order_time` datetime DEFAULT NULL,
  `txn_id` char(25) DEFAULT NULL,
  `comment` varchar(128) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=koi8r ;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
