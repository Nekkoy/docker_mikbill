--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

--
-- Изменить таблицу "services"
--
ALTER TABLE services
  ADD COLUMN service_portal TINYINT(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'признак портала: 0 - нет, 1 - IPTVPORTAL, 2 - Stalker, 3 - olltv' AFTER service_loyal_recalculation;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
