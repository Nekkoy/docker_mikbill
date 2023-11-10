SET NAMES 'utf8';

ALTER TABLE addons_tyme
  CHANGE COLUMN txn_date txn_date DATETIME DEFAULT NULL;
ALTER TABLE addons_tyme
  CHANGE COLUMN check_time server_time DATETIME DEFAULT NULL;