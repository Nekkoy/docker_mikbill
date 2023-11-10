--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO system_options (`key`, `value`)
VALUES ('rentsoft_on', '0');

INSERT INTO system_options (`key`, `value`)
VALUES ('rentsoft_ag_name', '');

INSERT INTO system_options (`key`, `value`)
VALUES ('rentsoft_secret', '');

INSERT INTO system_options (`key`, `value`)
VALUES ('rentsoft_percent', '0');


--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
