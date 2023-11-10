--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `cabinet_menu_items` (`id`, `name`, `link`, `usersgroupid`, `parent`, `sort`, `hide`, `icon`, `hook`) VALUES (25, 'MOOVI TV', '/index/main/lkview/moovitv', 0, 0, 0, 0, 'icon-star', 'moovitv');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
