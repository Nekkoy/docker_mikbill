--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `connect_template` DROP `laneid`;
ALTER TABLE `connect_template` DROP `neighborhoodid`;
ALTER TABLE `connect_template` DROP `settlementid`;
ALTER TABLE `connect_template` DROP `bras`;

INSERT INTO `connect_template` (`id`, `templatename`, `templatetypeid`, `usersgroupid`, `userdevid`, `userlegaldevid`, `segments`, `switchid`) VALUES (NULL, 'Default FTTH', 1, 0, 0, 0, 0x5b5d, 0),(NULL, 'Default ADSL', 2, 0, 0, 0, 0x5b5d, 0),(NULL, 'Default Wifi', 3, 0, 0, 0, 0x5b5d, 0),(NULL, 'Default Docsis', 4, 0, 0, 0, 0x5b5d, 0),(NULL, 'Default EPon', 5, 0, 0, 0, 0x5b5d, 0),(NULL, 'Default GPon', 6, 0, 0, 0, 0x5b5d, 0);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
