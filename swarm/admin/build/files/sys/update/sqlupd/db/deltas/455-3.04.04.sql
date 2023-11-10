--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

UPDATE `cabinet_menu_items` SET `sort` = '1' WHERE `id` = 1;
UPDATE `cabinet_menu_items` SET `sort` = '2' WHERE `id` = 2;
UPDATE `cabinet_menu_items` SET `sort` = '3' WHERE `id` = 3;
UPDATE `cabinet_menu_items` SET `sort` = '4' WHERE `id` = 4;
UPDATE `cabinet_menu_items` SET `sort` = '5' WHERE `id` = 5;
UPDATE `cabinet_menu_items` SET `sort` = '6' WHERE `id` = 6;
UPDATE `cabinet_menu_items` SET `sort` = '7' WHERE `id` = 7;
UPDATE `cabinet_menu_items` SET `sort` = '8' WHERE `id` = 8;
UPDATE `cabinet_menu_items` SET `sort` = '9' WHERE `id` = 9;
UPDATE `cabinet_menu_items` SET `sort` = '10' WHERE `id` = 10;
UPDATE `cabinet_menu_items` SET `sort` = '11' WHERE `id` = 11;
UPDATE `cabinet_menu_items` SET `sort` = '12' WHERE `id` = 12;
UPDATE `cabinet_menu_items` SET `sort` = '14' WHERE `id` = 13;
UPDATE `cabinet_menu_items` SET `sort` = '15' WHERE `id` = 14;
UPDATE `cabinet_menu_items` SET `sort` = '16' WHERE `id` = 15;
UPDATE `cabinet_menu_items` SET `sort` = '1' WHERE `id` = 16;
UPDATE `cabinet_menu_items` SET `sort` = '2' WHERE `id` = 17;
UPDATE `cabinet_menu_items` SET `sort` = '3' WHERE `id` = 18;
UPDATE `cabinet_menu_items` SET `sort` = '4' WHERE `id` = 19;
UPDATE `cabinet_menu_items` SET `sort` = '5' WHERE `id` = 20;
UPDATE `cabinet_menu_items` SET `sort` = '6' WHERE `id` = 21;
UPDATE `cabinet_menu_items` SET `sort` = '7' WHERE `id` = 22;
UPDATE `cabinet_menu_items` SET `sort` = '8' WHERE `id` = 23;
UPDATE `cabinet_menu_items` SET `sort` = '9' WHERE `id` = 24;
UPDATE `cabinet_menu_items` SET `sort` = '13' WHERE `id` = 25;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;