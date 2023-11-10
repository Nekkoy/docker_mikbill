--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';
CREATE TABLE `services_exclusions` (
  `serviceid` smallint(10) UNSIGNED NOT NULL,
  `serviceid_exclusion` smallint(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `services_exclusions`
  ADD KEY `serviceid` (`serviceid`) USING BTREE,
  ADD KEY `serviceid_exclusion` (`serviceid_exclusion`);


CREATE TABLE `services_inclusions` (
  `serviceid` smallint(10) UNSIGNED NOT NULL,
  `serviceid_inclusion` smallint(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `services_inclusions`
  ADD KEY `serviceid` (`serviceid`) USING BTREE,
  ADD KEY `serviceid_inclusion` (`serviceid_inclusion`);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
