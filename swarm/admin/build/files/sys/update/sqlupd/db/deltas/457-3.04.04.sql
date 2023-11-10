--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

UPDATE `cabinet_menu_items` SET `icon` = 'fas fa-home' WHERE `id` = 1;
UPDATE `cabinet_menu_items` SET `icon` = 'fas fa-list' WHERE `id` = 3;
UPDATE `cabinet_menu_items` SET `name` = 'Подписки' WHERE `id` = 3;
UPDATE `cabinet_menu_items` SET `icon` = 'fas fa-tv' WHERE `id` IN (5,6,7,8,9,10,11,12,22,12,25);

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;