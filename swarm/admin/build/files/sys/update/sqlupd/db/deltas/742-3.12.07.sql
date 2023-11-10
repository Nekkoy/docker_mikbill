--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `packets` ADD `shaper_def_policy_on` TINYINT NOT NULL DEFAULT '0' AFTER `do_mik_rad_shapers`;
ALTER TABLE `packets` ADD `shaper_def_policy_name` VARCHAR(128) NOT NULL DEFAULT '' AFTER `shaper_def_policy_on`;
ALTER TABLE `packets` ADD `limit_shaper_policy_on` TINYINT NOT NULL DEFAULT '0' AFTER `limit_shaper_do`;
ALTER TABLE `packets` ADD `limit_shaper_policy_name` VARCHAR(128) NOT NULL DEFAULT '' AFTER `limit_shaper_policy_on`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;