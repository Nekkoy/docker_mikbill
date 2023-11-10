--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO `system_options` VALUES ('webkassa_on', 0);
INSERT INTO `system_options` VALUES ('webkassa_debug', 0);
INSERT INTO `system_options` VALUES ('webkassa_testing', 0);

INSERT INTO `system_options` VALUES ('webkassa_api_key', '');
INSERT INTO `system_options` VALUES ('webkassa_login', '');
INSERT INTO `system_options` VALUES ('webkassa_password', '');

INSERT INTO `system_options` VALUES ('webkassa_item_name', 'Интернет');
INSERT INTO `system_options` VALUES ('webkassa_kassa_id', 0);

INSERT INTO `system_options` VALUES ('webkassa_tax_type', 100);
INSERT INTO `system_options` VALUES ('webkassa_tax_percent', 12);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;