SET NAMES 'utf8';


--
-- Создать таблицу addons_e_pay_com_ua
--
CREATE TABLE addons_e_pay_com_ua (
  prv_txn INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  txn_id BIGINT(20) UNSIGNED NOT NULL,
  check_time DATETIME NOT NULL,
  txn_date DATETIME DEFAULT NULL,
  uid BIGINT(20) UNSIGNED NOT NULL DEFAULT 0,
  account VARCHAR(64) NOT NULL,
  sum DOUBLE(14, 2) DEFAULT NULL,
  time_stamp TIMESTAMP DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (prv_txn),
  INDEX `time` (check_time),
  INDEX timstamp (time_stamp),
  INDEX uid (account)
)
ENGINE = MYISAM
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Изменить таблицу bugh_cards_log
--
ALTER TABLE bugh_cards_log
  CHANGE COLUMN cardslogid cardslogid MEDIUMINT(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Изменить таблицу packets
--
ALTER TABLE packets
  CHANGE COLUMN `fixed` `fixed` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0 - не снимать; 1 - КД, если было подключение; 7 - ОКД (фикс.); 10 - ОКД (пропорц.); 8 - обязательно каждый месяц; 9 - обязательно каждый месяц, потратить сумму; 11 - обязательно каждый месяц, плавающая дата';

--
-- Создать таблицу system_options_lk
--
CREATE TABLE system_options_lk (
  `key` CHAR(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  value CHAR(128) NOT NULL,
  UNIQUE INDEX `key` (`key`)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci;


INSERT INTO system_options (`key`, value) VALUES ('e_pay_com_ua_uid_prio', '1');
INSERT INTO system_options (`key`, value) VALUES ('e_pay_com_ua_login_prio', '2');
INSERT INTO system_options (`key`, value) VALUES ('e_pay_com_ua_numdogovor_prio', '3');
INSERT INTO system_options (`key`, value) VALUES ('tarif_chesniy_perehod', '0');

INSERT INTO bugh_plategi_type (bughtypeid, typename, sign, fictitious) VALUES (71, 'Пополнение E-Pay.com.ua', '+', 0);
INSERT INTO bugh_plategi_type (bughtypeid, typename, sign, fictitious) VALUES (72, 'Перевод средств абоненту', '+', 0);
INSERT INTO bugh_plategi_type (bughtypeid, typename, sign, fictitious) VALUES (73, 'Перевод средств от абонента', '-', 0);
INSERT INTO bugh_plategi_type (bughtypeid, typename, sign, fictitious) VALUES (74, 'Комиссия за перевод средств абоненту', '-', 0);
INSERT INTO bugh_plategi_type (bughtypeid, typename, sign, fictitious) VALUES (75, 'Возврат абонплаты при смене тарифа', '+', 0);



