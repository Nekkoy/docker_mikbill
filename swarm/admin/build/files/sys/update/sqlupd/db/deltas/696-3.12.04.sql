--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `sticky_notes_stuff` DROP `date`;
ALTER TABLE `sticky_notes_stuff` ADD `created_at` DATETIME NULL DEFAULT NULL AFTER `options`;
ALTER TABLE `sticky_notes_stuff` ADD `updated_at` DATETIME NULL DEFAULT NULL AFTER `created_at`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
