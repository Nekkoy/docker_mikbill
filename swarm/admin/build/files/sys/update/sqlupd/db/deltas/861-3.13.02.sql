--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `connect_template` ADD `user_gid` INT NOT NULL DEFAULT '0' AFTER `userlegaldevid`;

ALTER TABLE `connect_template` ADD `users_type` SMALLINT NOT NULL DEFAULT '0' AFTER `switchid`;

ALTER TABLE `connect_template` ADD `as_default` TINYINT NOT NULL DEFAULT '0' AFTER `users_type`;

UPDATE connect_template SET `users_type`=1 WHERE default_normal=1;

UPDATE connect_template SET `users_type`=2 WHERE default_legal=1;

UPDATE connect_template SET `as_default`=1 WHERE default_normal=1;

UPDATE connect_template SET `as_default`=1 WHERE default_legal=1;

ALTER TABLE `connect_template`
	ADD `show_custom_price` TINYINT NOT NULL DEFAULT '0' AFTER `default_legal`,
	ADD `show_custom_speed` TINYINT NOT NULL DEFAULT '0' AFTER `show_custom_price`,
	ADD `show_phone` TINYINT NOT NULL DEFAULT '1' AFTER `show_custom_speed`,
	ADD `show_email` TINYINT NOT NULL DEFAULT '1' AFTER `show_phone`,
	ADD `show_note` TINYINT NOT NULL DEFAULT '1' AFTER `show_email`;

ALTER TABLE `connect_template` DROP `default_normal`, DROP `default_legal`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;