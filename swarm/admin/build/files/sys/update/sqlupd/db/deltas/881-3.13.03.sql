--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO `cabinet_menu_items` (`id`, `name`, `link`, `usersgroupid`, `parent`, `sort`, `hide`, `icon`, `hook`) VALUES (35, 'Lifecell', '/index/main/lkview/lifecell', '0', '0', '7', '0', 'fas fa-mobile-alt', 'lifecell');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;