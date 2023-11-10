--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `cabinet_menu_items` (`id`, `name`, `link`, `usersgroupid`, `parent`, `sort`, `hide`, `icon`, `hook`) VALUES (30, 'Видеонаблюдение', '/index/main/lkview/cctv', 0, 0, 14, 1, 'fas fa-video', 'cctv');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
