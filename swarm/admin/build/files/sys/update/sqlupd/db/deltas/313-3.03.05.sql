--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `user_external_values` (
  `uid` int(11) NOT NULL,
  `key_id` int(11) NOT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

ALTER TABLE `user_external_values`
  ADD KEY `user_key` (`uid`,`key_id`),
  ADD KEY `user` (`uid`),
  ADD KEY `key` (`key_id`),
  ADD KEY `value` (`value`),
  ADD KEY `user_value` (`uid`,`value`) USING BTREE;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
