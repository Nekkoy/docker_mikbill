--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

--
-- Изменить таблицу "queue_messages"
--
ALTER TABLE queue_messages
  ADD COLUMN m_action VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'дополнительный параметр сообщения' AFTER m_msg;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
