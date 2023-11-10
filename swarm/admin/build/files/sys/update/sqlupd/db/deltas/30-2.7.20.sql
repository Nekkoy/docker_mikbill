SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) VALUES('use_pscb', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES('en_search_cat_of_persons', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES('en_search_of_contr_concl', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES('en_search_dat_connection', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES('en_search_states', '1');

INSERT INTO `system_options` (`key`, `value`) VALUES('en_tarif_razresh_minus', '0');

INSERT INTO `system_options` (`key`, `value`) VALUES('mac_autoreg_always', '0');

INSERT INTO `system_options` (`key`, `value`) VALUES('en_search_multi', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES('auto_log_sql_clear', '0');

UPDATE `bugh_plategi_type` SET `deposit_action` = '0' AND `fictitious` = '1' WHERE `bugh_plategi_type`.`bughtypeid` =18;
UPDATE `bugh_plategi_type` SET `deposit_action` = '-' AND `sign` = '-' WHERE `bugh_plategi_type`.`bughtypeid` =23;

INSERT INTO system_options (`key`, value) VALUES ('users_card_show_deposit_bonus', '0');

--
-- Изменить таблицу bugh_final_report
--
ALTER TABLE bugh_final_report
  ADD COLUMN not_sum TINYINT(4) NOT NULL DEFAULT 0 AFTER bughtypename;

--
-- Изменить таблицу usersblok
--
ALTER TABLE usersblok
  CHANGE COLUMN fio fio VARCHAR(128) NOT NULL DEFAULT '',
  CHANGE COLUMN phone phone VARCHAR(128) NOT NULL DEFAULT '',
  CHANGE COLUMN address address VARCHAR(128) NOT NULL DEFAULT '',
  CHANGE COLUMN prim prim VARCHAR(254) NOT NULL DEFAULT '',
  CHANGE COLUMN framed_ip framed_ip VARCHAR(16) NOT NULL DEFAULT '',
  CHANGE COLUMN callback_number callback_number VARCHAR(64) NOT NULL DEFAULT '',
  CHANGE COLUMN app app VARCHAR(4) NOT NULL DEFAULT '',
  CHANGE COLUMN houseid houseid INT(14) UNSIGNED NOT NULL DEFAULT 0,
  CHANGE COLUMN housingid housingid INT(14) UNSIGNED NOT NULL DEFAULT 0,
  CHANGE COLUMN houseblockid houseblockid INT(14) UNSIGNED NOT NULL DEFAULT 0,
  CHANGE COLUMN floor floor INT(14) UNSIGNED NOT NULL DEFAULT 0,
  CHANGE COLUMN router_model router_model VARCHAR(16) NOT NULL DEFAULT '',
  CHANGE COLUMN router_login router_login VARCHAR(16) NOT NULL DEFAULT '',
  CHANGE COLUMN router_pass router_pass VARCHAR(16) NOT NULL DEFAULT '',
  CHANGE COLUMN router_ssid router_ssid VARCHAR(16) NOT NULL DEFAULT '',
  CHANGE COLUMN router_wep_pass router_wep_pass VARCHAR(16) NOT NULL DEFAULT '',
  CHANGE COLUMN router_serial router_serial VARCHAR(16) NOT NULL DEFAULT '';

--
-- Изменить таблицу usersdel
--
ALTER TABLE usersdel
  CHANGE COLUMN fio fio VARCHAR(128) NOT NULL DEFAULT '',
  CHANGE COLUMN phone phone VARCHAR(128) NOT NULL DEFAULT '',
  CHANGE COLUMN address address VARCHAR(128) NOT NULL DEFAULT '',
  CHANGE COLUMN prim prim VARCHAR(254) NOT NULL DEFAULT '',
  CHANGE COLUMN framed_ip framed_ip VARCHAR(16) NOT NULL DEFAULT '',
  CHANGE COLUMN callback_number callback_number VARCHAR(64) NOT NULL DEFAULT '',
  CHANGE COLUMN app app VARCHAR(4) NOT NULL DEFAULT '',
  CHANGE COLUMN houseid houseid INT(14) UNSIGNED NOT NULL DEFAULT 0,
  CHANGE COLUMN housingid housingid INT(14) UNSIGNED NOT NULL DEFAULT 0,
  CHANGE COLUMN houseblockid houseblockid INT(14) UNSIGNED NOT NULL DEFAULT 0,
  CHANGE COLUMN porch porch INT(14) UNSIGNED DEFAULT NULL,
  CHANGE COLUMN floor floor INT(14) UNSIGNED NOT NULL DEFAULT 0,
  CHANGE COLUMN router_model router_model VARCHAR(16) NOT NULL DEFAULT '',
  CHANGE COLUMN router_login router_login VARCHAR(16) NOT NULL DEFAULT '',
  CHANGE COLUMN router_pass router_pass VARCHAR(16) NOT NULL DEFAULT '',
  CHANGE COLUMN router_ssid router_ssid VARCHAR(16) NOT NULL DEFAULT '',
  CHANGE COLUMN router_wep_pass router_wep_pass VARCHAR(16) NOT NULL DEFAULT '',
  CHANGE COLUMN router_serial router_serial VARCHAR(16) NOT NULL DEFAULT '';
