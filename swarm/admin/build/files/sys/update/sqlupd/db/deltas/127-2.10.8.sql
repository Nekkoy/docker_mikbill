--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

--
-- Создать таблицу "addons_alltime24"
--
CREATE TABLE addons_alltime24 (
  pay_id CHAR(64) NOT NULL DEFAULT '',
  service_id CHAR(20) NOT NULL,
  uid INT(16) DEFAULT NULL,
  trade_point CHAR(20) NOT NULL,
  pay_account CHAR(20) NOT NULL,
  pay_amount DOUBLE(14, 2) DEFAULT NULL,
  receipt_num CHAR(32) DEFAULT NULL,
  time_stamp CHAR(32) NOT NULL,
  status_code CHAR(5) NOT NULL,
  date DATETIME NOT NULL,
  PRIMARY KEY (pay_id)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
