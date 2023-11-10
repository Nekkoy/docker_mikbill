--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `services` ADD `discount_on` TINYINT NOT NULL DEFAULT '0' COMMENT 'Разрешена ли скидка' AFTER `trial`;
ALTER TABLE `services_packets_pairs` ADD `discount_on` TINYINT NOT NULL DEFAULT '0' COMMENT 'Разрешена ли скидка' AFTER `deactivation_by_user`;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;