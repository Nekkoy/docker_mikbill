--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

--
-- Изменить таблицу "switch_logs"
--
ALTER TABLE switch_logs
  DROP INDEX `mac-time`,
  DROP INDEX `swid-mac-time`,
  DROP INDEX `swid-time`;


--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
