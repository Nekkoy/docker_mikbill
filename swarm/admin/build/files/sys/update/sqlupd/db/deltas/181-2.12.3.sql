--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

--
-- Создать таблицу "macdb"
--
CREATE TABLE macdb (
  macid BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  macint BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (macid),
  INDEX `mac INT` (macint)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci
COMMENT = 'mac database';


--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
