--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE IF NOT EXISTS `snmp_commands_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

INSERT IGNORE INTO `snmp_commands_type` (`id`, `type`) VALUES (1, 'up_time');
INSERT IGNORE INTO `snmp_commands_type` (`id`, `type`) VALUES (2, 'sfp_iface');
INSERT IGNORE INTO `snmp_commands_type` (`id`, `type`) VALUES (3, 'onu_mac');
INSERT IGNORE INTO `snmp_commands_type` (`id`, `type`) VALUES (4, 'save');
INSERT IGNORE INTO `snmp_commands_type` (`id`, `type`) VALUES (5, 'ifAlias');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
