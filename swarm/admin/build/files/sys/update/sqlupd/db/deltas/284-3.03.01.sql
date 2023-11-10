--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `snmp_templates` (`id`, `name`) VALUES
(0, 'None'),
(1, 'PON BDCOM 33xx'),
(2, 'PON ZTE'),
(3, 'WiFi UBNT v7.x'),
(4, 'WiFi UBNT v6.x'),
(5, 'WiFi RouterOS 5.x'),
(6, 'WiFi RouterOS 6.x');


--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
