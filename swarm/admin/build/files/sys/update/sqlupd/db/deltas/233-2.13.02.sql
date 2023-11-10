--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';


INSERT INTO system_options (`key`, `value`)
VALUES ('robokassa_order_name', '');

INSERT INTO system_options (`key`, `value`)
VALUES ('robokassa_sno', 'osn');

INSERT INTO system_options (`key`, `value`)
VALUES ('robokassa_tax', 'none');


--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
