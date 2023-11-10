--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `snmp_commands` CHANGE `commandtypeid` `commandtypeid` SMALLINT(4) NOT NULL DEFAULT '0';
ALTER TABLE `snmp_commands` CHANGE `snmpprogrammid` `snmpprogrammid` SMALLINT(4) NOT NULL DEFAULT '0';
ALTER TABLE `snmp_commands` CHANGE `oid` `snmp_oid` BLOB NULL DEFAULT NULL;
ALTER TABLE `snmp_commands` CHANGE `regexp` `snmp_regexp` BLOB NULL DEFAULT NULL;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
