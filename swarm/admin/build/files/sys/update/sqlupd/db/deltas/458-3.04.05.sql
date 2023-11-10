--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `stuff_personal` ADD `do_credit_like_cabinet` TINYINT NOT NULL DEFAULT '0' AFTER `do_credit`;
ALTER TABLE `stuff_personal` ADD `do_credit_max_summa` INT NOT NULL DEFAULT '0' AFTER `do_credit`;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;