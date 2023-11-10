SET NAMES 'utf8';


--
-- Создать таблицу addons_blocked_for_payment
--
CREATE TABLE addons_blocked_for_payment (
  uid BIGINT(20) UNSIGNED NOT NULL,
  UNIQUE INDEX uid (uid)
)
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'блокируем пополнение';

--
-- Создать таблицу addons_privat_payment_account
--
CREATE TABLE addons_privat_payment_account (
  ref BIGINT(20) UNSIGNED NOT NULL,
  amount DOUBLE(16, 2) NOT NULL,
  account VARCHAR(32) NOT NULL,
  uid BIGINT(20) UNSIGNED NOT NULL,
  creation_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Изменить таблицу packets
--
ALTER TABLE packets
  ADD COLUMN real_ip_nolk TINYINT(2) UNSIGNED NOT NULL DEFAULT 0 AFTER use_cards_auto_date;

INSERT INTO bugh_plategi_type (bughtypeid, typename, sign, fictitious) VALUES (70 , 'Пополнение Приват Р/С', '+', 0);
UPDATE `bugh_plategi_type` SET `typename` = 'Блокировка интернета в связи с окончанием средств' WHERE `bughtypeid` = 20;

INSERT INTO system_options (`key`, value) VALUES ('privat_pay_acc_uid_prio', '1');
INSERT INTO system_options (`key`, value) VALUES ('privat_pay_acc_login_prio', '2');
INSERT INTO system_options (`key`, value) VALUES ('privat_pay_acc_numdogovor_prio', '3');



