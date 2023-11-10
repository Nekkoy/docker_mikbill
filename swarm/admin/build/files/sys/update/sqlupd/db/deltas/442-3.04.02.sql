--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `cabinet_menu_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_general_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_general_ci NOT NULL,
  `usersgroupid` int(11) NOT NULL DEFAULT 0,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Родительское меню',
  `sort` int(11) NOT NULL DEFAULT 0,
  `hide` tinyint(4) NOT NULL DEFAULT 0,
  `icon` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  `hook` varchar(128) COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Обработать согласно логике в бекенде'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `cabinet_menu_items`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `cabinet_menu_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;