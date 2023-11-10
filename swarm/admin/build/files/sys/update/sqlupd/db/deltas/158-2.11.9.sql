--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO system_options (`key`, value)
  VALUES ('iptvportal_on', '0');

INSERT INTO system_options (`key`, value)
  VALUES ('olltv_on', '0');

INSERT INTO system_options (`key`, value)
  VALUES ('megogo_on', '0');

INSERT INTO system_options (`key`, value)
  VALUES ('smotreshka_on', '0');

INSERT INTO system_options (`key`, value)
  VALUES ('stalkerportal_on', '1');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
