--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO `switch_opt82_logtype` (`logtypeid`, `logtype`, `access`) VALUES (NULL, 'Найден по SVLAN + CVLAN (QinQ)', '1');
UPDATE `switch_opt82_logtype` SET `access`=1 WHERE `logtypeid` IN (27, 28);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;