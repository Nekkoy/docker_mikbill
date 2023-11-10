SET NAMES 'utf8';

ALTER TABLE addons_paykeeper
  CHANGE COLUMN id_sys id_sys INT(10) UNSIGNED NOT NULL;

ALTER TABLE addons_ukrpays
  DROP INDEX id_ups,
  CHANGE COLUMN id_ups id_ups INT(11) NOT NULL,
  CHANGE COLUMN txn_date txn_date DATETIME DEFAULT NULL;

ALTER TABLE addons_yandex
  CHANGE COLUMN order_time order_time DATETIME DEFAULT NULL;