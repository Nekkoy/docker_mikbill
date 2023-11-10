--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `bonus` ADD `descriptions` VARCHAR(300) NULL DEFAULT NULL COMMENT 'Описание'  AFTER `points`;
ALTER TABLE `bonus` ADD `period` VARCHAR(32) NOT NULL DEFAULT 'all' COMMENT 'Период начисления бонуса:(all,day,month,year)'  AFTER `descriptions`;
ALTER TABLE `bonus` ADD `active` TINYINT(1) NOT NULL DEFAULT '0' AFTER `descriptions`;
ALTER TABLE `bonus` CHANGE `number_runs` `period_count` INT(11) NULL DEFAULT '1' COMMENT 'Кол-во выполнений за указанный период';

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
