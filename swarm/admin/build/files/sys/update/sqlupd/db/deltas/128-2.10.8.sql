--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

--
-- Создать таблицу "vendors_oui"
--
CREATE TABLE vendors_oui (
  vendorid INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  base16 CHAR(6) BINARY CHARACTER SET koi8r COLLATE koi8r_bin NOT NULL,
  company VARCHAR(64) NOT NULL DEFAULT '',
  address TEXT NOT NULL,
  PRIMARY KEY (vendorid)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
