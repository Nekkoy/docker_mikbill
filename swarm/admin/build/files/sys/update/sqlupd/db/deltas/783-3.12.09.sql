--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO `logtype` (`logtypeid`, `logtype`) VALUES (23, 'IPv6 Pool');
INSERT INTO `logtype` (`logtypeid`, `logtype`) VALUES (24, 'IPv6 Network');
INSERT INTO `logtype` (`logtypeid`, `logtype`) VALUES (25, 'IPv6 Address');
INSERT INTO `logtype` (`logtypeid`, `logtype`) VALUES (26, 'IPv6 Exclude');
INSERT INTO `logtype` (`logtypeid`, `logtype`) VALUES (27, 'IPv6 Users');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;