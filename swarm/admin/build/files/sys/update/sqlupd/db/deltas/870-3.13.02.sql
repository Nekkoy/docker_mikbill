--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `admin_gui_templates` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`name` VARCHAR(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
	`usersgroupid` INT NOT NULL ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB;

CREATE TABLE `admin_gui_templates_data` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`template_id` INT NOT NULL ,
	`key` VARCHAR(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
	`value` BLOB NOT NULL ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB;

ALTER TABLE `admin_gui_templates_data` ADD UNIQUE `template_key` (`template_id`, `key`);

ALTER TABLE `admin_gui_templates` CHANGE `usersgroupid` `usersgroupid` INT NOT NULL DEFAULT '0';

ALTER TABLE `stuff_aclid` ADD `admin_gui_templateid` SMALLINT NOT NULL DEFAULT '0' AFTER `usersgroupid`;

ALTER TABLE `stuff_personal` ADD `admin_gui_templateid` SMALLINT NOT NULL DEFAULT '0' AFTER `do_installments_tarif`;

INSERT INTO `system_options` (`key`, `value`) VALUES ('admin_gui_templateid', '0');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;