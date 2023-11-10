--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) VALUES 
('gorod_login', '1'), 
('gorod_login_prio', '2'), 
('gorod_numdogovor', '1'), 
('gorod_numdogovor_prio', '3'), 
('gorod_uid', '1'), 
('gorod_uid_prio', '1');

INSERT INTO `bugh_plategi_type` (`bughtypeid`, `typename`, `sign`, `fictitious`, `deposit_action`, `deposit_action_by_user`) VALUES (109, 'Система Город', '+', 0, '+', '+');


--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;