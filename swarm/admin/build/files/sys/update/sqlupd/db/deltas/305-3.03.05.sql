--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO system_options (`key`, `value`)
VALUES ('atol_on', '0');

INSERT INTO system_options (`key`, `value`)
VALUES ('atol_inn', '');

INSERT INTO system_options (`key`, `value`)
VALUES ('atol_login', '');

INSERT INTO system_options (`key`, `value`)
VALUES ('atol_pass', '');

INSERT INTO system_options (`key`, `value`)
VALUES ('atol_debug', '0');

INSERT INTO system_options (`key`, `value`)
VALUES ('atol_email', '');

INSERT INTO system_options (`key`, `value`)
VALUES ('atol_item_name', '');

INSERT INTO system_options (`key`, `value`)
VALUES ('atol_payments_type', '1');

INSERT INTO system_options (`key`, `value`)
VALUES ('atol_payment_address', '');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
