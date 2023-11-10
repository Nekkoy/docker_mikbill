--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

--
-- Изменить таблицу "switch_logs"
--
ALTER TABLE switch_logs
  CHANGE COLUMN uid uid BIGINT(16) UNSIGNED NOT NULL DEFAULT 0,
  CHANGE COLUMN port port VARCHAR(20) NOT NULL;


--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
