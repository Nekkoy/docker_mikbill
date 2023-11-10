SET NAMES 'utf8';

--
-- Создать таблицу dev_fields
--
CREATE TABLE dev_fields (
  devid INT(10) UNSIGNED NOT NULL,
  `key` VARCHAR(32) NOT NULL,
  value VARCHAR(64) NOT NULL
)
ENGINE = MYISAM
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Создать таблицу dev_types
--
CREATE TABLE dev_types (
  devtypeid SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  devtypename VARCHAR(64) NOT NULL,
  dev_ip TINYINT(4) NOT NULL,
  dev_mac TINYINT(4) NOT NULL,
  dev_sectorid TINYINT(4) NOT NULL,
  owner TINYINT(4) NOT NULL,
  default_cost DECIMAL(8, 2) UNSIGNED NOT NULL,
  default_rent DECIMAL(6, 2) UNSIGNED NOT NULL,
  default_owner TINYINT(4) NOT NULL,
  PRIMARY KEY (devtypeid)
)
ENGINE = MYISAM
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Создать таблицу dev_user
--
CREATE TABLE dev_user (
  devid INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  uid BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (devid)
)
ENGINE = MYISAM
CHARACTER SET koi8r
COLLATE koi8r_general_ci;
