--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) VALUES
('reports_deleted_day_outflow', '90'),
('reports_deleted_on', '0'),
('reports_outflow_day_sleep', '30'),
('reports_outflow_on', '0'),
('reports_sleep_day_not_online', '15'),
('reports_sleep_on', '0');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
