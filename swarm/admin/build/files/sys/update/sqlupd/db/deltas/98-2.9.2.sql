--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

--
-- Создать таблицу "event_system"
--
CREATE TABLE event_system (
  evid INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  time INT(10) UNSIGNED NOT NULL COMMENT 'unixtime',
  evtpid INT(10) UNSIGNED NOT NULL COMMENT 'event type id',
  queue TINYINT(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'use queue 0/1',
  uid BIGINT(16) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'user id',
  PRIMARY KEY (evid)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'MB event system log';

--
-- Создать таблицу "event_type"
--
CREATE TABLE event_type (
  evtpid INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'event type id',
  evname VARCHAR(64) NOT NULL COMMENT 'event name',
  PRIMARY KEY (evtpid)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'MB event type';



--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;


