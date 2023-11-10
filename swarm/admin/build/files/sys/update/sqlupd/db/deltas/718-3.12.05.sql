--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO `switch_opt82_logtype` (`logtypeid`, `logtype`, `access`) VALUES ('27', 'Найден по устройству абонента(MAC)', ''), ('28', 'Найден по устройству абонента(Serial)', '');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
