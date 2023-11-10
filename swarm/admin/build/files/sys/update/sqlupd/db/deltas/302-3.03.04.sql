--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE IF NOT EXISTS `onu_registration_data` (
  `uid` smallint(6) NOT NULL,
  `keyid` smallint(6) NOT NULL,
  `value` varchar(128) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;

ALTER TABLE `onu_registration_data`
  ADD KEY `index` (`uid`,`keyid`),
  ADD KEY `keyid_value` (`keyid`,`value`);

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
