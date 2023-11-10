--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';


INSERT INTO system_options (key, value)
VALUES ('yandexmoney_withdraw', '1');

INSERT INTO system_options (key, value)
VALUES ('olltv_post_index', '');

INSERT INTO system_options (key, value)
VALUES ('yandexmoney_login', '1');

INSERT INTO system_options (key, value)
VALUES ('yandexmoney_login_prio', '2');

INSERT INTO system_options (key, value)
VALUES ('yandexmoney_uid', '1');

INSERT INTO system_options (key, value)
VALUES ('yandexmoney_uid_prio', '1');

INSERT INTO system_options (key, value)
VALUES ('yandexmoney_numdogovor', '1');

INSERT INTO system_options (key, value)
VALUES ('yandexmoney_numdogovor_prio', '3');



--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
