SET NAMES 'utf8';

CREATE TABLE addons_ibox (
  prv_txn INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
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
ENGINE = MYISAM
CHARACTER SET koi8r
COLLATE koi8r_general_ci;


INSERT INTO bugh_plategi_type (bughtypeid, typename)
  VALUES (68 , 'Пополнение Приват (v.2)');

INSERT INTO bugh_plategi_type (bughtypeid, typename, fiktivniy)
  VALUES (67, 'Пополнение iBox', 0);

ALTER TABLE lanes_settlements
  CHANGE COLUMN settlementname settlementname VARCHAR(36) NOT NULL DEFAULT '';

ALTER TABLE packets
  DROP COLUMN framed_ip,
  DROP COLUMN framed_mask;

ALTER TABLE packets
  CHANGE COLUMN prefix prefix CHAR(4) NOT NULL DEFAULT '',
  CHANGE COLUMN `fixed` `fixed` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0 - РЅРµ СЃРЅРёРјР°С‚СЊ; 1 - РљР”, РµСЃР»Рё Р±С‹Р»Рѕ РїРѕРґРєР»СЋС‡РµРЅРёРµ; 7 - РћРљР” (С„РёРєСЃ.); 10 - РћРљР” (С„РёРєСЃРёСЂ.); 8 - РѕР±СЏР·Р°С‚РµР»СЊРЅРѕ РєР°Р¶РґС‹Р№ РјРµСЃСЏС†; 9 - РѕР±СЏР·Р°С‚РµР»СЊРЅРѕ РєР°Р¶РґС‹Р№ РјРµСЃСЏС†, РїРѕС‚СЂР°С‚РёС‚СЊ СЃСѓРјРјСѓ; 11 - РѕР±СЏР·Р°С‚РµР»СЊРЅРѕ РєР°Р¶РґС‹Р№ РјРµСЃСЏС†, РїР»Р°РІР°СЋС‰Р°СЏ РґР°С‚Р°',
  CHANGE COLUMN mikrotik_addr_list mikrotik_addr_list VARCHAR(32) CHARACTER SET koi8r COLLATE koi8r_bin NOT NULL DEFAULT '' AFTER do_block_local,
  CHANGE COLUMN framed_ip_pool framed_ip_pool VARCHAR(32) CHARACTER SET koi8r COLLATE koi8r_bin NOT NULL DEFAULT '' AFTER use_mik_ip_pool;

ALTER TABLE sectors
  ADD COLUMN ip_unnumbered_mode TINYINT(4) NOT NULL DEFAULT 0 AFTER del_ip4;

ALTER TABLE services
  CHANGE COLUMN amount amount DOUBLE(20, 2) NOT NULL DEFAULT 0.00,
  ADD COLUMN service_activation TINYINT(3) UNSIGNED NOT NULL DEFAULT 0 AFTER service_type;

CREATE TABLE services_users_pairs (
  serviceid SMALLINT(5) UNSIGNED NOT NULL,
  uid BIGINT(20) UNSIGNED NOT NULL
)
ENGINE = MYISAM
CHARACTER SET utf8
COLLATE utf8_general_ci;

ALTER TABLE sticky_notes
  CHANGE COLUMN stickynotename stickynotename VARCHAR(36) NOT NULL DEFAULT '',
  CHANGE COLUMN ispublic ispublic TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
  CHANGE COLUMN note note VARCHAR(500) NOT NULL DEFAULT '';

ALTER TABLE tickets_tickets
  CHANGE COLUMN inwork_by_stuffid inwork_by_stuffid INT(14) UNSIGNED NOT NULL DEFAULT 0,
  CHANGE COLUMN performed_by_stuffid performed_by_stuffid INT(14) UNSIGNED NOT NULL DEFAULT 0,
  CHANGE COLUMN closed_by_stuffid closed_by_stuffid INT(14) UNSIGNED NOT NULL DEFAULT 0,
  CHANGE COLUMN useruid useruid BIGINT(16) UNSIGNED NOT NULL DEFAULT 0,
  CHANGE COLUMN fio fio CHAR(128) NOT NULL DEFAULT '',
  CHANGE COLUMN street street VARCHAR(45) NOT NULL DEFAULT '',
  CHANGE COLUMN settlementname settlementname VARCHAR(36) NOT NULL DEFAULT '',
  CHANGE COLUMN neighborhoodname neighborhoodname VARCHAR(36) NOT NULL DEFAULT '',
  CHANGE COLUMN house house VARCHAR(20) NOT NULL DEFAULT '',
  CHANGE COLUMN porch porch INT(2) UNSIGNED NOT NULL DEFAULT 0,
  CHANGE COLUMN floor floor INT(3) UNSIGNED NOT NULL DEFAULT 0,
  CHANGE COLUMN apartment apartment VARCHAR(10) NOT NULL DEFAULT '',
  CHANGE COLUMN housingname housingname VARCHAR(36) NOT NULL DEFAULT '',
  CHANGE COLUMN houseblockname houseblockname VARCHAR(36) NOT NULL DEFAULT '',
  CHANGE COLUMN phones phones VARCHAR(60) NOT NULL DEFAULT '',
  CHANGE COLUMN created_by_stuffid created_by_stuffid INT(14) UNSIGNED NOT NULL DEFAULT 0,
  CHANGE COLUMN created_by_useruid created_by_useruid INT(14) UNSIGNED NOT NULL DEFAULT 0;

ALTER TABLE users
  CHANGE COLUMN fio fio CHAR(128) NOT NULL DEFAULT '',
  CHANGE COLUMN phone phone CHAR(128) NOT NULL DEFAULT '',
  CHANGE COLUMN address address CHAR(128) NOT NULL DEFAULT '',
  CHANGE COLUMN prim prim CHAR(254) NOT NULL DEFAULT '',
  CHANGE COLUMN framed_ip framed_ip CHAR(16) NOT NULL DEFAULT '',
  CHANGE COLUMN callback_number callback_number CHAR(64) NOT NULL DEFAULT '',
  CHANGE COLUMN dogovor dogovor TINYINT(2) NOT NULL DEFAULT 0 COMMENT '0 - РЅРµС‚ РґР°РЅРЅС‹С…; 1 - Р°РєС‚РёРІРµРЅ; 2 - РїСЂРёРѕСЃС‚Р°РЅРѕРІР»РµРЅ; 3 - Р·Р°РєСЂС‹С‚',
  CHANGE COLUMN app app CHAR(4) NOT NULL DEFAULT '',
  CHANGE COLUMN housingid housingid INT(14) UNSIGNED NOT NULL DEFAULT 0,
  CHANGE COLUMN houseblockid houseblockid INT(14) UNSIGNED NOT NULL DEFAULT 0,
  CHANGE COLUMN porch porch INT(14) UNSIGNED NOT NULL DEFAULT 0,
  CHANGE COLUMN floor floor INT(14) UNSIGNED NOT NULL DEFAULT 0,
  CHANGE COLUMN swid swid INT(10) UNSIGNED DEFAULT 0,
  CHANGE COLUMN router_model router_model CHAR(16) NOT NULL DEFAULT '',
  CHANGE COLUMN router_login router_login CHAR(16) NOT NULL DEFAULT '',
  CHANGE COLUMN router_pass router_pass CHAR(16) NOT NULL DEFAULT '',
  CHANGE COLUMN router_ssid router_ssid CHAR(16) NOT NULL DEFAULT '',
  CHANGE COLUMN router_wep_pass router_wep_pass CHAR(16) NOT NULL DEFAULT '',
  CHANGE COLUMN router_serial router_serial CHAR(16) NOT NULL DEFAULT '';


CREATE TABLE IF NOT EXISTS `addons_privat2nd` (
  `record_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) unsigned NOT NULL,
  `amount` double(16,2) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createTime` varchar(30) CHARACTER SET koi8r NOT NULL,
  `privatbank_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `record_id` (`record_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;



