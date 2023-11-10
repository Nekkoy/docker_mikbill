--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `fiscalization_report` CHANGE COLUMN `type` `type` ENUM('1','2','3') NOT NULL DEFAULT '1' COMMENT '1 - komtet, 2 - atol, 3- webkassa' COLLATE 'utf8mb4_general_ci' AFTER `id`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;