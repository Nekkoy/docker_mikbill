--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `fiscalization_report` (
  `id` int(11) NOT NULL,
  `type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1 - komtet, 2 - atol',
  `transaction` text,
  `uid` int(11) DEFAULT NULL,
  `queue_id` text,
  `group_id` smallint(6) NOT NULL DEFAULT '0',
  `amount` mediumint(9) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `completed` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `retry` tinyint(4) NOT NULL DEFAULT '0',
  `info` text
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
