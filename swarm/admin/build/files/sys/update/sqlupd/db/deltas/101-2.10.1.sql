--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) VALUES
('platezhka_search_login', '1'),
('platezhka_search_login_prio', '1'),
('platezhka_search_uid', '1'),
('platezhka_search_uid_prio', '2'),
('platezhka_search_numdogovor', '0'),
('platezhka_search_numdogovor_prio', '3');


--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;