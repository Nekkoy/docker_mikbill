--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `mod_reports` (
  `id` int(20) UNSIGNED NOT NULL,
  `uid` bigint(16) UNSIGNED NOT NULL,
  `type_id` smallint(10) UNSIGNED DEFAULT NULL COMMENT '1 - sleep',
  `data` longtext DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `mod_reports`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `uid` (`uid`) USING BTREE,
  ADD KEY `created_at` (`created_at`);

ALTER TABLE `mod_reports`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
