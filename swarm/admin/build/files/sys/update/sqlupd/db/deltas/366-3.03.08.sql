--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `users_pending_changes` CHANGE `pending_attribute_name` `pending_attribute_name` CHAR(64) CHARACTER SET koi8r COLLATE koi8r_general_ci NOT NULL DEFAULT '' COMMENT 'название атрибута, если \"тип измениния\" = 0';

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
