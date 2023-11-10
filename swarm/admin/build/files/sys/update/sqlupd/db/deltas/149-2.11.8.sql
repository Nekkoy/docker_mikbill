--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO cabinet_config(parent, `key`, value) VALUES
('locales', 'enable_4', '0');
INSERT INTO cabinet_config(parent, `key`, value) VALUES
('locales', 'file_4', 'original');
INSERT INTO cabinet_config(parent, `key`, value) VALUES
('locales', 'name_4', 'bg_BG');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
