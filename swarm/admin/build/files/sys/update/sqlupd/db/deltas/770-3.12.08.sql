--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

UPDATE `switch_opt82_logtype` SET `logtype` = 'Найден по устройству абонента(MAC)' WHERE `logtypeid` = 27;
UPDATE `switch_opt82_logtype` SET `logtype` = 'Найден по устройству абонента(Serial)' WHERE `logtypeid` = 28;
INSERT INTO `switch_opt82_logtype` (`logtypeid`, `logtype`, `access`) VALUES ('30', 'Найден по MAC', '1');
INSERT INTO `switch_opt82_logtype` (`logtypeid`, `logtype`, `access`) VALUES ('31', 'Найден по VLAN + Port', '1');
INSERT INTO `switch_opt82_logtype` (`logtypeid`, `logtype`, `access`) VALUES ('32', 'Абонент не найден', '0');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;