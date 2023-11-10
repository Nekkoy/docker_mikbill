--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

--
-- Изменить таблицу "addons_sberbankru_mrch"
--
ALTER TABLE addons_sberbankru_mrch
  CHANGE COLUMN txn_id txn_id VARCHAR(40) BINARY CHARACTER SET koi8r COLLATE koi8r_bin DEFAULT NULL;
  
--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
