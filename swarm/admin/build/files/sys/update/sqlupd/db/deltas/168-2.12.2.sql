--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';


INSERT INTO system_options (key, value)
VALUES ('yandexmoney_debug_on', '0');

INSERT INTO bugh_plategi_type (bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES ('117', 'Пополнение CloudPayments', '+', '0', '+', '+');

INSERT INTO system_options (key, value)
VALUES ('cloudpayments_on', '1');

INSERT INTO system_options (key, value)
VALUES ('cloudpayments_publicId', '');

INSERT INTO system_options (key, value)
VALUES ('cloudpayments_network', '');

INSERT INTO system_options (key, value)
VALUES ('cloudpayments_percent', '0');


--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
