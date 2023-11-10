SET NAMES 'utf8';

--
-- Создать таблицу "addons_portmone"
--
CREATE TABLE addons_portmone (
  order_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  uid BIGINT(16) UNSIGNED DEFAULT NULL,
  amount DECIMAL(18, 2) UNSIGNED DEFAULT NULL,
  server_time DATETIME DEFAULT NULL,
  order_time VARCHAR(30) NOT NULL,
  status TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (order_id)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Создать таблицу "addons_tyme"
--
CREATE TABLE addons_tyme (
  order_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  uid BIGINT(16) UNSIGNED DEFAULT NULL,
  amount DECIMAL(18, 2) UNSIGNED DEFAULT NULL,
  txn_id CHAR(36) NOT NULL,
  txn_date VARCHAR(15) DEFAULT NULL,
  check_time DATETIME DEFAULT NULL,
  status TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (order_id)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Создать таблицу "addons_ukrpays"
--
CREATE TABLE addons_ukrpays (
  order_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_ups INT(11) NOT NULL,
  uid BIGINT(16) UNSIGNED DEFAULT NULL,
  amount DECIMAL(18, 2) UNSIGNED DEFAULT NULL,
  server_time DATETIME DEFAULT NULL,
  txn_date INT(11) UNSIGNED NOT NULL,
  status TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (order_id),
  UNIQUE INDEX id_ups (id_ups)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Создать таблицу "addons_uniteller"
--
CREATE TABLE addons_uniteller (
  order_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  uid BIGINT(16) UNSIGNED DEFAULT NULL,
  amount DECIMAL(18, 2) UNSIGNED DEFAULT NULL,
  server_time DATETIME DEFAULT NULL,
  order_time VARCHAR(30) NOT NULL,
  status TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (order_id)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Создать таблицу "addons_yandex"
--
CREATE TABLE addons_yandex (
  order_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  uid BIGINT(16) UNSIGNED DEFAULT NULL,
  amount DECIMAL(18, 2) UNSIGNED DEFAULT NULL,
  server_time DATETIME DEFAULT NULL,
  order_time VARCHAR(30) NOT NULL,
  status TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (order_id)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

