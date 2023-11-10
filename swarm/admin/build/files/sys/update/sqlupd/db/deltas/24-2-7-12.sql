SET NAMES 'utf8';


--
-- Изменить таблицу addons_ibox
--
ALTER TABLE addons_ibox
  CHANGE COLUMN prv_txn prv_txn BIGINT(32) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Изменить таблицу addons_osmp
--
ALTER TABLE addons_osmp
  CHANGE COLUMN prv_txn prv_txn BIGINT(32) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Создать таблицу addons_sberbank_russia
--
CREATE TABLE addons_sberbank_russia (
  reg_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  uid BIGINT(20) UNSIGNED NOT NULL DEFAULT 0,
  account VARCHAR(128) NOT NULL,
  amount DOUBLE(16, 2) NOT NULL DEFAULT 0.00,
  pay_id VARCHAR(50) NOT NULL DEFAULT '',
  agent_date TIMESTAMP DEFAULT '0000-00-00 00:00:00',
  pay_date TIMESTAMP DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (reg_id)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Создать таблицу addons_ural_bank
--
CREATE TABLE addons_ural_bank (
  prv_txn BIGINT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
  txn_id CHAR(64) NOT NULL DEFAULT '',
  check_time DATETIME NOT NULL,
  time_from_osmp CHAR(20) DEFAULT NULL,
  accaunt CHAR(20) NOT NULL,
  sum DOUBLE(14, 2) DEFAULT NULL,
  time_stamp DATETIME NOT NULL,
  PRIMARY KEY (prv_txn),
  INDEX `time` (check_time),
  INDEX timstamp (time_stamp),
  INDEX uid (accaunt)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Изменить таблицу services
--
ALTER TABLE services
  CHANGE COLUMN trigger_condition trigger_condition VARCHAR(254) NOT NULL DEFAULT '0';

INSERT INTO system_options (`key`, value) VALUES ('easysoft_uid', '1');
INSERT INTO system_options (`key`, value) VALUES ('easysoft_uid_prio', '1');
INSERT INTO system_options (`key`, value) VALUES ('easysoft_login', '1');
INSERT INTO system_options (`key`, value) VALUES ('easysoft_login_prio', '2');

INSERT INTO system_options (`key`, value) VALUES ('sberbank_russia_uid_prio', '1');
INSERT INTO system_options (`key`, value) VALUES ('sberbank_russia_login_prio', '2');
INSERT INTO system_options (`key`, value) VALUES ('sberbank_russia_numdogovor_prio', '3');

INSERT INTO bugh_plategi_type (bughtypeid, typename) VALUES (76, 'Пополнение СберБанк России');



