--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';


--
-- Изменить таблицу "dev_types"
--
ALTER TABLE dev_types
  ADD COLUMN portal_login TINYINT(4) NOT NULL DEFAULT 0 COMMENT 'Логин на портале' AFTER portal;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
