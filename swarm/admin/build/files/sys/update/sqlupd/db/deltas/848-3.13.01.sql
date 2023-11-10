--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `sender_jobs` (
  `id` int(11) NOT NULL,
  `sender_condition_id` int(11) NOT NULL COMMENT 'ID условия',
  `uid` int(11) NOT NULL COMMENT 'UID абонента',
  `payload` longtext NOT NULL COMMENT 'Тело задания',
  `created_at` int(11) DEFAULT NULL COMMENT 'Время создания задания',
  `send_at` int(11) DEFAULT NULL COMMENT 'Время отправки',
  `completed_at` int(11) DEFAULT NULL COMMENT 'Время выполнения',
  `attempts` tinyint(5) NOT NULL DEFAULT 0 COMMENT 'Количество попыток'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `sender_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `send_at` (`send_at`),
  ADD KEY `completed_at` (`completed_at`);

ALTER TABLE `sender_jobs` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;