--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

--
-- Изменить таблицу "packets"
--
ALTER TABLE packets
  CHANGE COLUMN num num INT(11) NOT NULL DEFAULT 0;

--
-- Изменить таблицу "users"
--
ALTER TABLE users
  CHANGE COLUMN app app CHAR(8) NOT NULL DEFAULT '';

ALTER TABLE usersdel
  CHANGE COLUMN app app CHAR(8) NOT NULL DEFAULT '';

ALTER TABLE usersblok
  CHANGE COLUMN app app CHAR(8) NOT NULL DEFAULT '';

ALTER TABLE usersfreeze
  CHANGE COLUMN app app CHAR(8) NOT NULL DEFAULT '';

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

