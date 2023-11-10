--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT IGNORE INTO `snmp_commands_type` (`id`, `type`) VALUES (NULL, 'if_name');
INSERT IGNORE INTO `snmp_commands_type` (`id`, `type`) VALUES (NULL, 'sfp_rx_signal');
INSERT IGNORE INTO `snmp_commands_type` (`id`, `type`) VALUES (NULL, 'sfp_tx_signal');
INSERT IGNORE INTO `snmp_commands_type` (`id`, `type`) VALUES (NULL, 'sfp_temperature');
INSERT IGNORE INTO `snmp_commands_type` (`id`, `type`) VALUES (NULL, 'onu_iface');
INSERT IGNORE INTO `snmp_commands_type` (`id`, `type`) VALUES (NULL, 'onu_status');
INSERT IGNORE INTO `snmp_commands_type` (`id`, `type`) VALUES (NULL, 'onu_distance');
INSERT IGNORE INTO `snmp_commands_type` (`id`, `type`) VALUES (NULL, 'onu_rx_signal');
INSERT IGNORE INTO `snmp_commands_type` (`id`, `type`) VALUES (NULL, 'onu_tx_signal');
INSERT IGNORE INTO `snmp_commands_type` (`id`, `type`) VALUES (NULL, 'onu_temperature');
INSERT IGNORE INTO `snmp_commands_type` (`id`, `type`) VALUES (NULL, 'onu_vendor');
INSERT IGNORE INTO `snmp_commands_type` (`id`, `type`) VALUES (NULL, 'onu_model');
INSERT IGNORE INTO `snmp_commands_type` (`id`, `type`) VALUES (NULL, 'onu_version');
INSERT IGNORE INTO `snmp_commands_type` (`id`, `type`) VALUES (NULL, 'onu_mac_table');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
