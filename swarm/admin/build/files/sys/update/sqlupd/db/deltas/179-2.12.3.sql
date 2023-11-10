--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

--
-- Создать таблицу "switch_status_last"
--
CREATE TABLE switch_status_last (
  swlid BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  devid INT(10) UNSIGNED NOT NULL COMMENT 'swid or nasid',
  type TINYINT(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 - swid , 1 - nasid',
  time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  status INT(11) NOT NULL,
  uptime VARCHAR(30) NOT NULL,
  ping DOUBLE(20, 2) NOT NULL,
  PRIMARY KEY (swlid),
  INDEX devid (devid),
  INDEX time (time),
  INDEX type (type)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci
COMMENT = 'logs uptime devices';


--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
