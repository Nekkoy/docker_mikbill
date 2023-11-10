--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `addons_luminorbank` ADD `fio` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_latvian_ci NULL DEFAULT NULL AFTER `account`;
ALTER TABLE `addons_luminorbank` CHANGE `txn_id` `txn_id` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_latvian_ci NULL DEFAULT NULL;
ALTER TABLE `addons_luminorbank` CHANGE `account` `account` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_latvian_ci NULL DEFAULT NULL;
ALTER TABLE `addons_luminorbank` CHANGE `comment` `comment` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_latvian_ci NULL DEFAULT NULL;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
