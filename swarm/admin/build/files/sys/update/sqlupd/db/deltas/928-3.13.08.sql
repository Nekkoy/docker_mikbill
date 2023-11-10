--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO `system_options` (`key`, `value`) VALUES ("sormuz_on", "0");
INSERT INTO `system_options` (`key`, `value`) VALUES ("sormuz_key", "0123456789");
INSERT INTO `system_options` (`key`, `value`) VALUES ("sormuz_region_id", "1");
INSERT INTO `system_options` (`key`, `value`) VALUES ("sormuz_date_format", "Y-m-d H:i:s");
INSERT INTO `system_options` (`key`, `value`) VALUES ("sormuz_filter_on", "0");
INSERT INTO `system_options` (`key`, `value`) VALUES ("sormuz_filter_person_on", "0");
INSERT INTO `system_options` (`key`, `value`) VALUES ("sormuz_filter_fiz_person", "0");
INSERT INTO `system_options` (`key`, `value`) VALUES ("sormuz_filter_legal_person", "0");

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;