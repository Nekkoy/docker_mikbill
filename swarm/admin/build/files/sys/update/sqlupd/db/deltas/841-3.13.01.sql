--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO `logtype` (`logtypeid`, `logtype`) VALUES ('63', 'LOGTYPE_DEV_PACKETS');
INSERT INTO `logtype` (`logtypeid`, `logtype`) VALUES ('64', 'LOGTYPE_SENDER_TEMPLATE');
INSERT INTO `logtype` (`logtypeid`, `logtype`) VALUES ('65', 'LOGTYPE_SENDER_CONDITION');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;