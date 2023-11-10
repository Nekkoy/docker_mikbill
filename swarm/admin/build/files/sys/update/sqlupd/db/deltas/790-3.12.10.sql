--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO `system_options` VALUES ("ipay_debug_on", 0) ON DUPLICATE KEY UPDATE `value`=`value`;
INSERT INTO `system_options` VALUES ("ipay_key_nonmasterpass", "");

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;