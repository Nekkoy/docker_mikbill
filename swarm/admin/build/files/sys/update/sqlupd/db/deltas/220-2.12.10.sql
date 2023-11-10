--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO system_options (`key`, `value`)
VALUES ('novakom_on', '0');

INSERT INTO system_options (`key`, `value`)
VALUES ('novakom_code_firme', '');

INSERT INTO system_options (`key`, `value`)
VALUES ('novakom_code_plat', '0');

INSERT INTO system_options (`key`, `value`)
VALUES ('novakom_code_c', '1');

INSERT INTO system_options (`key`, `value`)
VALUES ('novakom_procent', '0');


--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
