--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

TRUNCATE TABLE `mod_omnicell_packets`;
ALTER TABLE `mod_omnicell_packets` ADD COLUMN `level` TINYINT NOT NULL AFTER `name`;
INSERT INTO `mod_omnicell_packets` (`id`, `name`, `level`) VALUES (1, "O_MVNO_LEGO_2020_MF", 1);

TRUNCATE TABLE `mod_omnicell_bundles`;
ALTER TABLE `mod_omnicell_bundles` DROP COLUMN `packets`;
ALTER TABLE `mod_omnicell_bundles`
	ADD COLUMN `level2` TINYBLOB NOT NULL AFTER `serviceid`,
	ADD COLUMN `level3` TINYBLOB NULL AFTER `level2`,
	ADD COLUMN `level4` TINYBLOB NULL AFTER `level3`,
	ADD COLUMN `level5` TINYBLOB NULL AFTER `level4`,
	CHANGE COLUMN `usersgroupid` `usersgroupid` SMALLINT(6) NOT NULL DEFAULT '0' AFTER `level5`;
ALTER TABLE `mod_omnicell_bundles` ADD COLUMN `level1` TINYINT NOT NULL DEFAULT '1' AFTER `serviceid`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;