--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

START TRANSACTION;

ALTER TABLE radacctmem RENAME radacctmem_before31213;

CREATE TABLE `radacctmem` (
  `acctsessionid` varchar(64) CHARACTER SET koi8r COLLATE koi8r_bin NOT NULL,
  `acctuniqueid` varchar(32) CHARACTER SET koi8r COLLATE koi8r_bin NOT NULL,
  `uid` bigint UNSIGNED NOT NULL COMMENT 'UID абонента',
  `devid` bigint NOT NULL DEFAULT '0',
  `gid` int UNSIGNED NOT NULL COMMENT 'тарифа в момент авторизации',
  `blocked` tinyint UNSIGNED NOT NULL COMMENT 'Блокировка в момент авторизации',
  `deposit` double(20,6) NOT NULL COMMENT 'Баланс при авторизации',
  `credit` double(20,6) NOT NULL,
  `last_change` int UNSIGNED NOT NULL COMMENT 'Последнее изменение'
) ENGINE=MEMORY DEFAULT CHARSET=koi8r COMMENT='Вспомогательная таблица для raddact типа Memory';

ALTER TABLE `radacctmem`
  ADD UNIQUE KEY `unique_session` (`acctsessionid`,`uid`,`devid`),
  ADD KEY `delete_all_user_sessions` (`uid`,`devid`);
COMMIT;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;