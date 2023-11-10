--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) VALUES
('use_accl_user_devices', '0');

INSERT INTO `system_options` (`key`, `value`) VALUES
('accel_usdev_ipset', 'userdev');




--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
