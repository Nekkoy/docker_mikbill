--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `radnas` ADD `houseid` INT NULL DEFAULT NULL AFTER `mikver`,
    ADD `housingid` INT NULL DEFAULT NULL AFTER `houseid`,
    ADD `houseblockid` INT NULL DEFAULT NULL AFTER `housingid`,
    ADD `porch` INT NULL DEFAULT NULL AFTER `houseblockid`,
    ADD `floor` INT NULL DEFAULT NULL AFTER `porch`,
    ADD `app` VARCHAR(8) NULL DEFAULT NULL AFTER `floor`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
