SET NAMES 'utf8';

--
-- Изменить таблицу dev_types
--
ALTER TABLE dev_types
  ADD COLUMN deny_to_change_owner_settings TINYINT(3) UNSIGNED NOT NULL AFTER default_owner;

--
-- Создать таблицу sectorspool_lease
--
CREATE TABLE sectorspool_lease (
  ip2long BIGINT(64) NOT NULL,
  ip CHAR(15) NOT NULL,
  sectorid SMALLINT(5) UNSIGNED NOT NULL,
  used TINYINT(2) UNSIGNED NOT NULL DEFAULT 0,
  expired INT(10) UNSIGNED NOT NULL DEFAULT 86400,
  uid BIGINT(16) UNSIGNED NOT NULL DEFAULT 0,
  INDEX expired (expired),
  INDEX sectorid (sectorid),
  INDEX `sector-ip` (sectorid, ip),
  INDEX uid (uid),
  INDEX used (used)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_bin;