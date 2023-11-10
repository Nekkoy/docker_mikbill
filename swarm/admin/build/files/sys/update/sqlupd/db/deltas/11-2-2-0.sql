SET NAMES 'utf8';

--
-- Изменить таблицу dev_fields
--
ALTER TABLE dev_fields
  ADD INDEX devid (devid);

--
-- Изменить таблицу dev_types
--
ALTER TABLE dev_types
  DROP COLUMN owner,
  CHANGE COLUMN dev_ip dev_ip TINYINT(4) NOT NULL DEFAULT 0,
  CHANGE COLUMN dev_mac dev_mac TINYINT(4) NOT NULL DEFAULT 0,
  CHANGE COLUMN dev_sectorid dev_sectorid TINYINT(4) NOT NULL DEFAULT 0,
  CHANGE COLUMN default_cost default_cost DECIMAL(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 AFTER dev_sectorid,
  CHANGE COLUMN default_rent default_rent DECIMAL(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 AFTER default_cost,
  CHANGE COLUMN default_owner default_owner TINYINT(4) NOT NULL DEFAULT 0 AFTER default_rent;

INSERT INTO `bugh_plategi_type` (`bughtypeid` ,`typename` ,`fiktivniy`)
VALUES (64, 'Плата за покупку устройства', '0'), (65, 'Плата за аренду устройства', '0');
INSERT INTO logtype (logtypeid, logtype) VALUES (16, 'Устройства пользователя');
UPDATE `bugh_plategi_type` SET `typename` = 'Отключение по задолженности' WHERE `bughtypeid` = 42;


--
-- Изменить таблицу dev_types
--
ALTER TABLE dev_types
  ADD COLUMN card_id TINYINT(3) UNSIGNED NOT NULL DEFAULT 0 AFTER dev_sectorid,
  ADD COLUMN description VARCHAR(128) NOT NULL DEFAULT '' AFTER default_owner;