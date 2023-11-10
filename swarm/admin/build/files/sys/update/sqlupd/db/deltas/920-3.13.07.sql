--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

DELETE FROM `cabinet_menu_items` WHERE `id`=35;
INSERT IGNORE INTO `cabinet_menu_items` (`id`, `name`, `link`, `usersgroupid`, `parent`, `sort`, `hide`, `icon`, `hook`) VALUES
	(35, 'Lifecell', '#', 0, 0, 9, 0, 'fas fa-mobile-alt', 'lifecell'),
	(38, 'Информация', '/index/main/lkview/lifecell', 0, 35, 2, 0, 'far fa-address-card', 'lifecell'),
	(39, 'Тарифная сетка', '/index/main/lkview/lifecellmainline', 0, 35, 3, 0, 'fas fa-clipboard-list', 'lifecell'),
	(40, 'Доп. пакеты', '/index/main/lkview/lifecelladditionalline', 0, 35, 4, 0, 'fas fa-plus', 'lifecellextra');
	
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;