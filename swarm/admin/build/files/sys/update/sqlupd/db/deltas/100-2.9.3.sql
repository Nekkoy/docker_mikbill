
--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

--
-- Создать представление "event_logs"
--
CREATE
VIEW event_logs
AS
SELECT
  `event_system`.`evid` AS `evid`,
  FROM_UNIXTIME(`event_system`.`time`) AS `time`,
  `event_system`.`queue` AS `use_queue`,
  `event_system`.`uid` AS `uid`,
  `event_type`.`evname` AS `evname`
FROM (`event_system`
  LEFT JOIN `event_type`
    ON ((`event_system`.`evtpid` = `event_type`.`evtpid`)));

--
-- Создать представление "queue_active"
--
CREATE
VIEW queue_active
AS
SELECT
  `queue_messages`.`m_id` AS `m_id`,
  `queue_types`.`mq_name` AS `mq_name`,
  `queue_messages`.`m_msg` AS `uid`,
  `queue_messages`.`m_created` AS `m_created`,
  `queue_messages`.`m_status` AS `m_status`
FROM (`queue_messages`
  LEFT JOIN `queue_types`
    ON ((`queue_messages`.`mq_id` = `queue_types`.`mq_id`)))
WHERE (`queue_messages`.`m_status` = 'new');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

