--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';
CREATE TABLE `mod_cards_resellers_strategy` (
	`id` INT NOT NULL AUTO_INCREMENT ,
	`cards_seria` CHAR(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
	`cards_nominal` INT NOT NULL DEFAULT '0' ,
	`cards_recived` INT NULL ,
	`reseller_id` INT NOT NULL DEFAULT '0' ,
	`strategytype` TINYINT NULL ,
	`strategyvalue` DECIMAL(20,6)  NULL ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB;

ALTER TABLE `mod_cards_resellers_strategy` ADD INDEX `cards_seria` (`cards_seria`);
ALTER TABLE `mod_cards_resellers_strategy` ADD INDEX `reseller_id` (`reseller_id`);

ALTER TABLE `mod_cards_resellers` ADD `strategytype` TINYINT NOT NULL DEFAULT '0' AFTER `resellername`;
ALTER TABLE `mod_cards_resellers` ADD `strategyvalue` DOUBLE(20,6) NOT NULL DEFAULT '0' AFTER `strategytype`;
ALTER TABLE `mod_cards_resellers` ADD `usersgroupid` SMALLINT NOT NULL DEFAULT '0' AFTER `archived`;
ALTER TABLE `mod_cards_resellers` ADD INDEX `usersgroupid` (`usersgroupid`);
ALTER TABLE `mod_cards_resellers` ADD INDEX `archived` (`archived`);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
