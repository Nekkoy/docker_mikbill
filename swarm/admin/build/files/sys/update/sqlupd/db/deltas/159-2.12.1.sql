--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO system_options (`key`, value)
  VALUES ('junv2useshaper', '1');

INSERT INTO system_options (`key`, value)
  VALUES ('junv2Poolname', 'IPoE-Pool');

INSERT INTO system_options (`key`, value)
  VALUES ('junv2servicebasic', 'svc-inet-profile');

INSERT INTO system_options (`key`, value)
  VALUES ('junv2servicedebtors', 'svc-nomaney-profile');

INSERT INTO system_options (`key`, value)
  VALUES ('junv2servicefreezeds', 'svc-nomaney-profile');

INSERT INTO system_options (`key`, value)
  VALUES ('junv2servicedisableds', 'svc-nomaney-profile');

INSERT INTO system_options (`key`, value)
  VALUES ('junv2servicedeleteds', 'svc-nomaney-profile');

INSERT INTO system_options (`key`, value)
  VALUES ('junv2serviceunknowns', 'svc-nomaney-profile');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
