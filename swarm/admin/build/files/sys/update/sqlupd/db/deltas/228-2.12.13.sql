--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO system_options (`key`, `value`)
VALUES ('komtet_on', '0');

INSERT INTO system_options (`key`, `value`)
VALUES ('komtet_shop_id', '');

INSERT INTO system_options (`key`, `value`)
VALUES ('komtet_shop_secret', '');

INSERT INTO system_options (`key`, `value`)
VALUES ('komtet_queue_id_kassa', '');

INSERT INTO system_options (`key`, `value`)
VALUES ('komtet_queue_id_online', '');

INSERT INTO system_options (`key`, `value`)
VALUES ('komtet_order_name', '');

INSERT INTO system_options (`key`, `value`)
VALUES ('komtet_sno', '0');

INSERT INTO system_options (`key`, `value`)
VALUES ('komtet_print_check', '1');

INSERT INTO system_options (`key`, `value`)
VALUES ('komtet_email', '');


--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
