--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';


--
-- Изменить таблицу "dev_types"
--
ALTER TABLE dev_types
  ADD COLUMN portal TINYINT(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'признак портала: 0 - нет, 1 - IPTVPORTAL, 2 - Stalker, 3 - olltv' AFTER card_id;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
