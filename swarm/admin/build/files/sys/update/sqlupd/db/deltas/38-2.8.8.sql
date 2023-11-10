SET NAMES 'utf8';

--
-- Создать таблицу addons_creditpilot
--
CREATE TABLE addons_creditpilot (
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
-- Создать таблицу addons_cyberplat
--
CREATE TABLE addons_cyberplat (
  order_id INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
  uid BIGINT(16) UNSIGNED NOT NULL,
  receipt_id INT(15) UNSIGNED NOT NULL,
  amount DOUBLE(14, 2) DEFAULT NULL,
  time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  order_date DATETIME NOT NULL,
  status TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (order_id)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Создать таблицу addons_mkb
--
CREATE TABLE addons_mkb (
  order_id INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
  uid BIGINT(16) UNSIGNED NOT NULL,
  txn_id INT(15) UNSIGNED NOT NULL,
  sum DOUBLE(14, 2) DEFAULT NULL,
  txn_date DATETIME NOT NULL,
  time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  status TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (order_id)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Создать таблицу addons_platika
--
CREATE TABLE addons_platika (
  prv_txn INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
  txn_id CHAR(64) NOT NULL DEFAULT '',
  check_time DATETIME NOT NULL,
  time_from_osmp CHAR(20) DEFAULT NULL,
  uid BIGINT(20) UNSIGNED NOT NULL,
  account CHAR(20) NOT NULL,
  sum DOUBLE(14, 2) DEFAULT NULL,
  time_stamp DATETIME NOT NULL,
  PRIMARY KEY (prv_txn),
  INDEX `time` (check_time),
  INDEX timstamp (time_stamp),
  INDEX uid (account)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Создать таблицу addons_sotas
--
CREATE TABLE addons_sotas (
  prv_txn INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
  txn_id CHAR(64) NOT NULL DEFAULT '',
  check_time DATETIME NOT NULL,
  time_from_osmp CHAR(20) DEFAULT NULL,
  accaunt CHAR(20) NOT NULL,
  uid BIGINT(20) UNSIGNED NOT NULL DEFAULT 0,
  sum DOUBLE(14, 2) DEFAULT NULL,
  time_stamp DATETIME NOT NULL,
  type VARCHAR(5) CHARACTER SET koi8u COLLATE koi8u_general_ci NOT NULL,
  PRIMARY KEY (prv_txn),
  INDEX `time` (check_time),
  INDEX timstamp (time_stamp),
  INDEX uid (accaunt)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci;


INSERT INTO system_options (`key`, value) VALUES ('SE100HTTPRedirProfNegBal' , 'URL-NEGBAL');
INSERT INTO system_options (`key`, value) VALUES ('SE100RedirForPolNegBal' , 'in:FWPOL-NEGBAL-REDIRECT');
INSERT INTO system_options (`key`, value) VALUES ('SE100HTTPRedirProfBlocked' , 'URL-BLOCKED');
INSERT INTO system_options (`key`, value) VALUES ('SE100RedirForPolBlocked' , 'in:FWPOL-BLOCKED-REDIRECT');
INSERT INTO system_options (`key`, value) VALUES ('SE100ServiceName' , 'service_inet');
INSERT INTO system_options (`key`, value) VALUES ('SE100ServiceAction' , 'DE-ACTIVATE');
INSERT INTO system_options (`key`, value) VALUES ('SE100useshaper' , '1');
INSERT INTO system_options (`key`, value) VALUES ('DHCPD_PXE_FILE' , 'pxelinux.0');
INSERT INTO system_options (`key`, value) VALUES ('DHCP_USE_PXE' , '0');
INSERT INTO system_options (`key`, value) VALUES ('online_timeout' , '330');
INSERT INTO system_options (`key`, value) VALUES ('mikrotik_only_pass' , '0');
INSERT INTO system_options (`key`, value) VALUES ('DHCPonuoneport' , '0');
INSERT INTO system_options (`key`, value) VALUES ('accel_send_l4_ip' , '0');
INSERT INTO system_options (`key`, value) VALUES ('generate_pwd_unique' , '0');

INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES (81, 'Пополнение КиберПлат', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES (82, 'Пополнение МКБ', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES (83, 'Пополнение Сотас', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES (84, 'Пополнение Платика', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES (85, 'Пополнение КредитПилот', '+', 0, '+', '+');

INSERT INTO system_options(`key`, value) VALUES ('cyberplat_uid_prio', '1');
INSERT INTO system_options(`key`, value) VALUES ('cyberplat_login_prio', '2');
INSERT INTO system_options(`key`, value) VALUES ('cyberplat_numdogovor_prio', '3');

INSERT INTO system_options(`key`, value) VALUES ('mkb_uid_prio', '1');
INSERT INTO system_options(`key`, value) VALUES ('mkb_login_prio', '2');
INSERT INTO system_options(`key`, value) VALUES ('mkb_numdogovor_prio', '3');

INSERT INTO system_options(`key`, value) VALUES ('sotas_uid_prio', '1');
INSERT INTO system_options(`key`, value) VALUES ('sotas_login_prio', '2');
INSERT INTO system_options(`key`, value) VALUES ('sotas_numdogovor_prio', '3');

INSERT INTO system_options(`key`, value) VALUES ('platika_uid_prio', '1');
INSERT INTO system_options(`key`, value) VALUES ('platika_login_prio', '2');
INSERT INTO system_options(`key`, value) VALUES ('platika_numdogovor_prio', '3');

INSERT INTO system_options(`key`, value) VALUES ('creditpilot_uid_prio', '1');
INSERT INTO system_options(`key`, value) VALUES ('creditpilot_login_prio', '2');
INSERT INTO system_options(`key`, value) VALUES ('creditpilot_numdogovor_prio', '3');

INSERT INTO system_options (`key`, value) VALUES ('required_pasport_inn' , '0');

INSERT INTO system_options (`key`, value) VALUES ('card_hide_passport' , '0');
INSERT INTO system_options (`key`, value) VALUES ('card_hide_pass_serie' , '0');
INSERT INTO system_options (`key`, value) VALUES ('card_hide_pass_vidan' , '0');
INSERT INTO system_options (`key`, value) VALUES ('card_hide_pass_date' , '0');
INSERT INTO system_options (`key`, value) VALUES ('card_hide_pass_propiska' , '0');
INSERT INTO system_options (`key`, value) VALUES ('card_hide_pass_inn' , '0');
INSERT INTO system_options (`key`, value) VALUES ('card_hide_date_birth' , '0');
INSERT INTO system_options (`key`, value) VALUES ('card_hide_home_phone' , '0');
INSERT INTO system_options (`key`, value) VALUES ('card_hide_cellphone' , '0');
INSERT INTO system_options (`key`, value) VALUES ('card_hide_sms' , '0');
INSERT INTO system_options (`key`, value) VALUES ('card_hide_e_mail' , '0');

INSERT INTO system_options (`key`, value) VALUES ('gui_hide_terminal' , '0');

  
