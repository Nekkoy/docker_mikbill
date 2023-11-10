--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';


INSERT INTO system_options (`key`, `value`)
VALUES ('create_ticket_offline', '0');

INSERT INTO system_options (`key`, `value`)
VALUES ('create_ticket_offline_days', '21');

INSERT INTO system_options (`key`, `value`)
VALUES ('create_ticket_offline_category', '0');

INSERT INTO system_options (`key`, `value`)
VALUES ('create_ticket_offline_priority', '1');

INSERT INTO system_options (`key`, `value`)
VALUES ('create_ticket_offline_staffid', '0');


INSERT INTO system_options (`key`, `value`)
VALUES ('create_ticket_freezed', '0');

INSERT INTO system_options (`key`, `value`)
VALUES ('create_ticket_freezed_days', '180');

INSERT INTO system_options (`key`, `value`)
VALUES ('create_ticket_freezed_category', '0');

INSERT INTO system_options (`key`, `value`)
VALUES ('create_ticket_freezed_priority', '1');

INSERT INTO system_options (`key`, `value`)
VALUES ('create_ticket_freezed_staffid', '0');

INSERT INTO system_options (`key`, `value`)
VALUES ('payment_bonus_type1', '0');


--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
