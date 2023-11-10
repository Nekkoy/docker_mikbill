--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) VALUES ('real_ip_clear_otkl_on', '1');
INSERT INTO `system_options` (`key`, `value`) VALUES ('real_ip_clear_del_on', '1');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
