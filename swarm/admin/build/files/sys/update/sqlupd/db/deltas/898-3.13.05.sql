--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `switch_opt82_logs` CHANGE COLUMN `switch_remote_id` `switch_remote_id` VARCHAR(128) NOT NULL COLLATE 'koi8r_general_ci' AFTER `switch_circuit_id`;
	
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;