--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';


--
-- Создать таблицу "com_component_types"
--
CREATE TABLE com_component_types (
  com_typeid TINYINT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  com_type VARCHAR(32) NOT NULL,
  PRIMARY KEY (com_typeid),
  INDEX com_type (com_type)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci
COMMENT = 'Типы компонентов';

--
-- Создать таблицу "com_component_validators"
--
CREATE TABLE com_component_validators (
  com_validator_id TINYINT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  validator VARCHAR(32) CHARACTER SET koi8r COLLATE koi8r_general_ci NOT NULL,
  validator_description VARCHAR(128) NOT NULL,
  PRIMARY KEY (com_validator_id)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Валидаторы компонент';

--
-- Создать таблицу "com_components"
--
CREATE TABLE com_components (
  com_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  com_typeid TINYINT(3) UNSIGNED NOT NULL,
  com_name VARCHAR(32) CHARACTER SET koi8r COLLATE koi8r_general_ci NOT NULL,
  com_locale VARCHAR(64) BINARY CHARACTER SET koi8r COLLATE koi8r_bin NOT NULL DEFAULT '',
  component LONGBLOB NOT NULL,
  com_description VARCHAR(256) NOT NULL DEFAULT '',
  PRIMARY KEY (com_id),
  INDEX com_name (com_name)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Компоненты';

--
-- Создать таблицу "com_element_types"
--
CREATE TABLE com_element_types (
  com_elementid TINYINT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  com_el_type VARCHAR(32) NOT NULL,
  PRIMARY KEY (com_elementid),
  INDEX com_type (com_el_type)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci
COMMENT = 'Типы Элементов';

--
-- Создать таблицу "com_locale_lang"
--
CREATE TABLE com_locale_lang (
  langid TINYINT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  langcode VARCHAR(4) NOT NULL DEFAULT '',
  name VARCHAR(64) NOT NULL,
  comment VARCHAR(128) NOT NULL DEFAULT '',
  PRIMARY KEY (langid)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Языки системы';

--
-- Создать таблицу "com_locale_words"
--
CREATE TABLE com_locale_words (
  wordid BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  langid TINYINT(3) UNSIGNED NOT NULL,
  locale VARCHAR(128) BINARY CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  translate BLOB NOT NULL,
  PRIMARY KEY (wordid),
  INDEX lang_words (langid, locale),
  INDEX langid (langid),
  INDEX locale (locale)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Словарь переводов';

--
-- Создать таблицу "com_window_types"
--
CREATE TABLE com_window_types (
  com_win_typeid TINYINT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  com_win_type VARCHAR(32) NOT NULL,
  PRIMARY KEY (com_win_typeid),
  INDEX com_type (com_win_type)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci
COMMENT = 'Типы окон';

--
-- Создать таблицу "com_windows"
--
CREATE TABLE com_windows (
  com_winid INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  com_win_typeid TINYINT(3) UNSIGNED NOT NULL,
  win_name VARCHAR(32) CHARACTER SET koi8r COLLATE koi8r_general_ci NOT NULL,
  win_locale VARCHAR(64) BINARY CHARACTER SET koi8r COLLATE koi8r_bin NOT NULL,
  window LONGBLOB NOT NULL,
  win_description VARCHAR(256) NOT NULL DEFAULT '',
  PRIMARY KEY (com_winid),
  INDEX com_name (win_name)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Окна';

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
