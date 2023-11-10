--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `fiscalization_report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `transaction` (`transaction`(255)),
  ADD KEY `queue` (`queue_id`(128)),
  ADD KEY `group` (`group_id`),
  ADD KEY `uid` (`uid`) USING BTREE,
  ADD KEY `uid + status` (`uid`,`status`),
  ADD KEY `status` (`id`),
  ADD KEY `status + retry` (`id`,`type`),
  ADD KEY `created` (`created`),
  ADD KEY `completed` (`completed`) USING BTREE;
  
ALTER TABLE `fiscalization_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
