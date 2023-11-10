--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO system_options (`key`, value)
  VALUES ('simplepay_on', '0');

INSERT INTO system_options (`key`, value)
  VALUES ('simplepay_shopID', '');

INSERT INTO system_options (`key`, value)
  VALUES ('simplepay_percent', '0');


INSERT INTO system_options (`key`, value)
  VALUES ('simplepay_hashAlgo', 'SHA256');

INSERT INTO system_options (`key`, value)
  VALUES ('simplepay_secretKey', '');

INSERT INTO system_options (`key`, value)
  VALUES ('simplepay_secretKeyRes', ''); 


INSERT INTO bugh_plategi_type (bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(114, 'Пополнение SimplePay', '+', 0, '+', '+');
--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
