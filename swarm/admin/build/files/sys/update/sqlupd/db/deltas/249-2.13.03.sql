--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `switch_opt82_logtype` (`logtypeid`, `logtype`, `access`) VALUES
('21', 'Привязка к порту отключена, поиск по MAC', '0'),
('22', 'Устройство не найдено, поиск по MAC', '0'),
('23', 'Не удалось разобрать Option82, поиск по МАС', '0'),
('24', 'Найден по swid + port', '1'),
('25', 'Найден по vlan + port + mac', '1'),
('26', 'dhcp strict: не совпадение', '0');


--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
