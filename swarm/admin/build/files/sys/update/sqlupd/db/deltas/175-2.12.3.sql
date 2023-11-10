--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

--
-- Создать таблицу "extended_fields_devtype"
--
CREATE TABLE extended_fields_devtype (
  id TINYINT(3) UNSIGNED NOT NULL,
  `key` VARCHAR(48) NOT NULL,
  value VARCHAR(128) NOT NULL,
  PRIMARY KEY (id, `key`),
  UNIQUE INDEX full (id, `key`, value),
  INDEX search (`key`, value)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Custom dev type fields';

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
