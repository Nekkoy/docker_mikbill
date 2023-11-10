--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

--
-- Создать таблицу "addons_vpru"
--
CREATE TABLE addons_vpru (
  prv_txn BIGINT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
  txn_id CHAR(64) NOT NULL DEFAULT '',
  check_time DATETIME NOT NULL,
  time_from_vpru CHAR(20) DEFAULT NULL,
  accaunt CHAR(20) NOT NULL,
  sum DOUBLE(14, 2) DEFAULT NULL,
  time_stamp DATETIME NOT NULL,
  PRIMARY KEY (prv_txn),
  INDEX time (check_time),
  INDEX timstamp (time_stamp),
  INDEX uid (accaunt)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
