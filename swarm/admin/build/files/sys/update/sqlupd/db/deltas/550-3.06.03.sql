--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `mod_flussonic_cameras` CHANGE `entrance` `entrance` INT(11) NULL DEFAULT '0';
ALTER TABLE `mod_flussonic_cameras` CHANGE `house_id` `house_id` INT(11) NULL DEFAULT '0';

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
