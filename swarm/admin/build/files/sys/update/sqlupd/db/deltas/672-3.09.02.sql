--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `mod_trueip_panels` CHANGE `dtmf_1` `dtmf_1` VARCHAR(128) NULL DEFAULT NULL, CHANGE `dtmf_2` `dtmf_2` VARCHAR(128) NULL DEFAULT NULL;
ALTER TABLE `mod_trueip_panels` DROP `callerid`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
