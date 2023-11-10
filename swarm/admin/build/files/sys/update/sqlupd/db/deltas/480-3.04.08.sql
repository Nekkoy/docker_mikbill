--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT IGNORE INTO `snmp_templates` (`id`, `name`) VALUES (1, 'PON BDCOM 33xx');
INSERT IGNORE INTO `snmp_templates` (`id`, `name`) VALUES (2, 'PON ZTE');
INSERT IGNORE INTO `snmp_templates` (`id`, `name`) VALUES (3, 'WiFi UBNT v7.x');
INSERT IGNORE INTO `snmp_templates` (`id`, `name`) VALUES (4, 'WiFi UBNT v6.x');
INSERT IGNORE INTO `snmp_templates` (`id`, `name`) VALUES (5, 'WiFi RouterOS 5.x');
INSERT IGNORE INTO `snmp_templates` (`id`, `name`) VALUES (6, 'WiFi RouterOS 6.x');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;