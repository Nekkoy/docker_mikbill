SET NAMES 'utf8';

--
-- Создать таблицу addons_pegas
--
CREATE TABLE addons_pegas (
  record_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  txn_id BIGINT(20) UNSIGNED DEFAULT NULL,
  uid BIGINT(20) UNSIGNED DEFAULT NULL,
  amount DOUBLE(16, 2) DEFAULT NULL,
  order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  txn_date DATETIME DEFAULT NULL,
  service_id TINYINT(4) NOT NULL DEFAULT 1 COMMENT 'prv_id',
  account VARCHAR(100) NOT NULL,
  command ENUM('check','pay') NOT NULL,
  PRIMARY KEY (record_id)
)
ENGINE = MYISAM
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Создать таблицу cabinet_news
--
CREATE TABLE cabinet_news (
  newsid SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  subject VARCHAR(254) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `text` TEXT CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  creation_date TIMESTAMP NULL DEFAULT NULL,
  update_date TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  start_date TIMESTAMP DEFAULT '0000-00-00 00:00:00',
  expiration_date TIMESTAMP NULL DEFAULT NULL,
  stuffid TINYINT(3) UNSIGNED NOT NULL,
  edited_by_stuffid TINYINT(3) UNSIGNED DEFAULT NULL,
  display TINYINT(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (newsid)
)
ENGINE = MYISAM
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Изменить таблицу lanes
--
ALTER TABLE lanes
  CHANGE COLUMN settlementid settlementid INT(14) UNSIGNED NOT NULL DEFAULT 0;

--
-- Изменить таблицу lanes_houses
--
ALTER TABLE lanes_houses
  CHANGE COLUMN neighborhoodid neighborhoodid INT(10) UNSIGNED NOT NULL DEFAULT 0;

--
-- Изменить таблицу lanes_neighborhoods
--
ALTER TABLE lanes_neighborhoods
  CHANGE COLUMN settlementid settlementid INT(14) UNSIGNED NOT NULL DEFAULT 0;

--
-- Изменить таблицу mod_cards_resellers
--
ALTER TABLE mod_cards_resellers
  ADD COLUMN description VARCHAR(254) NOT NULL DEFAULT '' AFTER resellername;

--
-- Изменить таблицу sectorspool_lease
--
ALTER TABLE sectorspool_lease
  DROP COLUMN uid,
  CHANGE COLUMN expired expired INT(10) NOT NULL DEFAULT 86400,
  ADD COLUMN mac CHAR(22) CHARACTER SET koi8r COLLATE koi8r_general_ci NOT NULL DEFAULT '' AFTER expired;

ALTER TABLE sectorspool_lease
  ADD INDEX uid (mac);

--
-- Изменить таблицу services
--
ALTER TABLE services
  CHANGE COLUMN amount amount DOUBLE(20, 2) NOT NULL,
  ADD COLUMN service_type ENUM('fee','gift') NOT NULL DEFAULT 'fee' AFTER period,
  ADD COLUMN trigger_condition TINYINT(3) UNSIGNED NOT NULL DEFAULT 0 AFTER service_type;

--
-- Изменить таблицу stuff_personal
--
ALTER TABLE stuff_personal
  ADD COLUMN hide_status_bar TINYINT(4) NOT NULL DEFAULT 0 AFTER do_simple_online,
  ADD COLUMN allow_to_edit_old_address TINYINT(4) NOT NULL DEFAULT 0 AFTER hide_status_bar;

--
-- Изменить таблицу users_custom_fields
--
ALTER TABLE users_custom_fields
  CHANGE COLUMN `key` `key` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  CHANGE COLUMN value value VARCHAR(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;

--
-- Изменить таблицу usersgroups
--
ALTER TABLE usersgroups
  ADD COLUMN description VARCHAR(254) NOT NULL DEFAULT '' AFTER usersgroupname,
  ADD COLUMN archived TINYINT(3) UNSIGNED NOT NULL DEFAULT 0 AFTER description;

ALTER TABLE services
  CHANGE COLUMN amount amount DOUBLE(20, 6) NOT NULL;

INSERT INTO logtype (logtypeid, logtype)
  VALUES (17 , 'Настройки ЛК');
INSERT INTO `switch_opt82_logtype` (`logtypeid`, `logtype`, `access`) VALUES (15, 'Выдаем IP из пула range в сегменте', '1');

INSERT INTO `bugh_plategi_type` (bughtypeid, typename, fiktivniy) VALUES (66 , 'Пополнение терминал Pegas' , 0 );

ALTER TABLE `services` CHANGE `amount` `amount` DECIMAL( 16, 2 ) NOT NULL ;

INSERT INTO `system_options` (`key`, `value`) VALUES ('personal_area_address_type', 0);
INSERT INTO `logtype` (`logtypeid`, `logtype`) VALUES (18, 'Финансы');



