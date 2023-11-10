--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE IF NOT EXISTS `snmp_commands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `templateid` int(11) NOT NULL,
  `commandtypeid` smallint(4) NOT NULL DEFAULT '0',
  `snmp_oid` blob,
  `snmpprogrammid` smallint(4) NOT NULL DEFAULT '0',
  `snmp_regexp` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;

DROP INDEX IF EXISTS `id` ON snmp_commands;

ALTER TABLE `snmp_commands` ADD INDEX `template` (`templateid`);
ALTER TABLE `snmp_commands` ADD INDEX `template_command` (`templateid`, `commandtypeid`);

INSERT IGNORE INTO `snmp_commands` (`id`, `templateid`, `commandtypeid`, `snmp_oid`, `snmpprogrammid`, `snmp_regexp`) VALUES
(1, 1, 0, 0x322e332e342e352e362e372e38382e3838382e38, 0, ''),
(2, 1, 2, 0x2e312e332e362e312e342e312e333332302e3130312e362e312e312e31, 1, 0x494e54454745523a20285b302d395d7b302c337d29),
(3, 1, 3, 0x2e312e332e362e312e342e312e333332302e3130312e31302e342e312e31, 1, 0x4865782d535452494e473a20285b302d39612d7a412d5a5d7b302c327d2e7b31357d29),
(4, 1, 4, 0x2e312e332e362e312e342e312e333332302e32302e31352e312e312e30, 3, ''),
(5, 1, 5, 0x49462d4d49423a3a6966416c696173, 3, '');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
