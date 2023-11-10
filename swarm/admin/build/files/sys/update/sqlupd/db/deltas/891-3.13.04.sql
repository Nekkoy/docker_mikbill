--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `mod_omnicell_transactions` CHANGE COLUMN `transaction_id` `transaction_id` VARCHAR(64) NOT NULL COMMENT 'ID транзакции' COLLATE 'utf8mb3_general_ci' FIRST;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;