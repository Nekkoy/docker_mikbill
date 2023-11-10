--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO bugh_plategi_type (bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES ('116', 'Пополнение Яндекс.Деньги', '+', '0', '+', '+');

INSERT INTO system_options (key, value)
VALUES ('yandexmoney_on', '1');

INSERT INTO system_options (key, value)
VALUES ('yandexmoney_receiver', '');

INSERT INTO system_options (key, value)
VALUES ('yandexmoney_success_url', '');

INSERT INTO system_options (key, value)
VALUES ('yandexmoney_secret', '');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
