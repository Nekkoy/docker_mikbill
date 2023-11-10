--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) VALUES
('kirovskpochta_on', '0'),
('kirovskpochta_debug_on', '0'),
('kirovskpochta_secret', ''),
('kirovskpochta_procent', '0'),
('kirovskpochta_uid', '1'),
('kirovskpochta_uid_prio', '1'),
('kirovskpochta_login', '1'),
('kirovskpochta_login_prio', '2'),
('kirovskpochta_numdogovor', '1'),
('kirovskpochta_numdogovor_prio', '3');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
