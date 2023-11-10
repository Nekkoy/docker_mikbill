--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) VALUES
('casr_timeout_direction', 'inbound');
INSERT INTO `system_options` (`key`, `value`) VALUES
('casr_idle_timeout', '3600');

INSERT INTO `system_options` (`key`, `value`) VALUES
('only_one_online', '0');


--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;