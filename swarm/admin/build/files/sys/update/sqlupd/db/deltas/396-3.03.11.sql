--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES ('gui', 'index_show_fee', 1) ON DUPLICATE KEY UPDATE `value`=`value`;

INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES ('gui', 'payment_show_tile', 1) ON DUPLICATE KEY UPDATE `value`=`value`;


--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;