--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO `logtype` (`logtypeid`, `logtype`) VALUES ('28', 'Тип устройств пользователей');
INSERT INTO `logtype` (`logtypeid`, `logtype`) VALUES ('29', 'PAY API');
INSERT INTO `logtype` (`logtypeid`, `logtype`) VALUES ('30', 'Новости ЛК');
INSERT INTO `logtype` (`logtypeid`, `logtype`) VALUES ('31', 'DOCSIS');
INSERT INTO `logtype` (`logtypeid`, `logtype`) VALUES ('32', 'PendingChanges');
INSERT INTO `logtype` (`logtypeid`, `logtype`) VALUES ('33', 'Конфиг ЛК');
INSERT INTO `logtype` (`logtypeid`, `logtype`) VALUES ('34', 'Населенный пункт');
INSERT INTO `logtype` (`logtypeid`, `logtype`) VALUES ('35', 'Район');
INSERT INTO `logtype` (`logtypeid`, `logtype`) VALUES ('36', 'Улица');
INSERT INTO `logtype` (`logtypeid`, `logtype`) VALUES ('37', 'Дом');
INSERT INTO `logtype` (`logtypeid`, `logtype`) VALUES ('38', 'Подписки');
INSERT INTO `logtype` (`logtypeid`, `logtype`) VALUES ('39', 'Временной кредит');
INSERT INTO `logtype` (`logtypeid`, `logtype`) VALUES ('40', 'Sticky notes');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;