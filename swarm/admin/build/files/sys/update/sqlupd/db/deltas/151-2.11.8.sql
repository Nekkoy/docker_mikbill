--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO system_options (key, value) VALUES
('sms_info_numdogovor', '3'),
('sms_info_pass', '2'),
('sms_info_text', 'Логин: %s Пароль: %s Номер договора: %s'),
('sms_info_user', '1');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
