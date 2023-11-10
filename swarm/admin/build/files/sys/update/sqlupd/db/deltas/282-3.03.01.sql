--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE IF NOT EXISTS `onu_registration_data` (
  `uid` smallint(6) NOT NULL,
  `keyid` smallint(6) NOT NULL,
  `value` varchar(128) CHARACTER SET utf8 NOT NULL,
  KEY `index` (`uid`,`keyid`)
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;


--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
