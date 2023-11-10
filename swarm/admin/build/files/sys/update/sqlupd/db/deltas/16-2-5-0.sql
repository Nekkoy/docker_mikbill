SET NAMES 'utf8';

UPDATE `lanes` set `settlementid` = 0 WHERE `settlementid` NOT IN (SELECT `settlementid` FROM `lanes_settlements`);
UPDATE `lanes_houses` set `neighborhoodid` = 0 WHERE `neighborhoodid` NOT IN (SELECT `neighborhoodid` FROM `lanes_neighborhoods`);
UPDATE `lanes_neighborhoods` set `settlementid` = 0 WHERE `settlementid` NOT IN (SELECT `settlementid` FROM `lanes_settlements`);
UPDATE `lanes_houses_blocks` set `housingid` = 0 WHERE `housingid` NOT IN (SELECT `housingid` FROM `lanes_housings`);
UPDATE `users` SET swid = 0 WHERE swid IS NULL;
UPDATE `usersfreeze` SET swid = 0 WHERE swid IS NULL;
UPDATE `usersblok` SET swid = 0 WHERE swid IS NULL;
UPDATE `usersdel` SET swid = 0 WHERE swid IS NULL;
update users set  switchport=0  WHERE switchport is NULL ;
update usersfreeze set  switchport=0  WHERE switchport is NULL ;
update usersblok set  switchport=0  WHERE switchport is NULL ;
update usersdel set  switchport=0  WHERE switchport is NULL ;
update users set swid=0 where swid not in 
(select swid from switches) and swid !=0 ;
update usersfreeze set swid=0 where swid not in 
(select swid from switches) and swid !=0 ;
update usersblok set swid=0 where swid not in 
(select swid from switches) and swid !=0 ;
update usersdel set swid=0 where swid not in 
(select swid from switches) and swid !=0 ;
update users  set gid = (select gid from packets limit 1) where gid not in 
(select gid from packets);
update usersfreeze set gid = (select gid from packets limit 1) where gid not in 
(select gid from packets);
update usersblok set gid = (select gid from packets limit 1) where gid not in 
(select gid from packets);
update usersdel set gid = (select gid from packets limit 1) where gid not in 
(select gid from packets);
update users  set sectorid = (select sectorid from sectors limit 1) where sectorid not in 
(select sectorid from sectors );
update usersfreeze set sectorid = (select sectorid from sectors limit 1) where sectorid not in 
(select sectorid from sectors );
update usersblok set sectorid = (select sectorid from sectors limit 1) where sectorid not in 
(select sectorid from sectors );
update usersdel set sectorid = (select sectorid from sectors limit 1) where sectorid not in 
(select sectorid from sectors );
update `users` set houseid= (select houseid from lanes_houses order by houseid limit 1) WHERE houseid not in ( select houseid from lanes_houses) ;
update `usersfreeze` set houseid= (select houseid from lanes_houses order by houseid limit 1) WHERE houseid not in ( select houseid from lanes_houses) ;
update `usersblok` set houseid= (select houseid from lanes_houses order by houseid limit 1) WHERE houseid not in ( select houseid from lanes_houses) ;
update `usersdel` set houseid= (select houseid from lanes_houses order by houseid limit 1) WHERE houseid not in ( select houseid from lanes_houses) ;
update users set  switchport=0  WHERE swid = 0 AND switchport<>0;
update usersfreeze set  switchport=0 WHERE swid = 0 AND switchport<>0;
update usersblok set  switchport=0 WHERE swid = 0 AND switchport<>0;
update usersdel set  switchport=0 WHERE swid = 0 AND switchport<>0;

delete FROM `packetsnas` WHERE nasid not in (select id as nasid from radnas);
delete FROM `switch_ip_unnumbered` WHERE `swid` NOT IN (SELECT `swid` FROM `switches`);
delete FROM `radacct` WHERE `acctinputoctets` =0 and `acctoutputoctets` =0 ;
delete FROM `radacct` WHERE `acctsessiontime`=0;

ALTER TABLE `lanes_houses` CHANGE `neighborhoodid` `neighborhoodid` INT( 10 ) UNSIGNED NOT NULL DEFAULT '0';
ALTER TABLE `lanes_neighborhoods` CHANGE `settlementid` `settlementid` INT( 14 ) UNSIGNED NOT NULL DEFAULT '0';
ALTER TABLE `lanes` CHANGE `settlementid` `settlementid` INT( 14 ) UNSIGNED NOT NULL DEFAULT '0';
ALTER TABLE `users` CHANGE `swid` `swid` INT( 10 ) UNSIGNED NULL DEFAULT '0';
ALTER TABLE `usersfreeze` CHANGE `swid` `swid` INT( 10 ) UNSIGNED NULL DEFAULT '0';
ALTER TABLE `usersblok` CHANGE `swid` `swid` INT( 10 ) UNSIGNED NULL DEFAULT '0';
ALTER TABLE `usersdel` CHANGE `swid` `swid` INT( 10 ) UNSIGNED NULL DEFAULT '0';

INSERT INTO bugh_plategi_type (bughtypeid, typename, fiktivniy)
  VALUES (67, 'Пополнение iBox', 0);
--
-- Создать таблицу addons_ibox
--
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

--
-- Изменить таблицу addons_robokassa
--
ALTER TABLE addons_robokassa
  DROP INDEX order_id;

--
-- Изменить таблицу bugh_plategi_type
--
ALTER TABLE bugh_plategi_type
  DROP COLUMN fiktivniy,
  ADD COLUMN sign CHAR(1) NOT NULL DEFAULT '' COMMENT 'знак +/-' AFTER typename,
  ADD COLUMN fictitious TINYINT(4) NOT NULL DEFAULT 0 COMMENT 'не изменяет депозит' AFTER sign;

--
-- Изменить таблицу lanes_settlements
--
ALTER TABLE lanes_settlements
  CHANGE COLUMN settlementname settlementname VARCHAR(36) NOT NULL DEFAULT '';

--
-- Изменить таблицу packets
--
ALTER TABLE packets
  DROP COLUMN framed_ip,
  DROP COLUMN framed_mask,
  CHANGE COLUMN prefix prefix CHAR(4) NOT NULL DEFAULT '',
  CHANGE COLUMN `fixed` `fixed` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0 - не снимать; 1 - КД, если было подключение; 7 - ОКД (фикс.); 10 - ОКД (фиксир.); 8 - обязательно каждый месяц; 9 - обязательно каждый месяц, потратить сумму; 11 - обязательно каждый месяц, плавающая дата',
  CHANGE COLUMN mikrotik_addr_list mikrotik_addr_list VARCHAR(32) CHARACTER SET koi8r COLLATE koi8r_bin NOT NULL DEFAULT '' AFTER do_block_local,
  CHANGE COLUMN framed_ip_pool framed_ip_pool VARCHAR(32) CHARACTER SET koi8r COLLATE koi8r_bin NOT NULL DEFAULT '' AFTER use_mik_ip_pool;

--
-- Изменить таблицу sectors
--
ALTER TABLE sectors
  ADD COLUMN ip_unnumbered_mode TINYINT(4) NOT NULL DEFAULT 0 AFTER del_ip4;

--
-- Изменить таблицу services
--
ALTER TABLE services
  CHANGE COLUMN amount amount DOUBLE(20, 2) NOT NULL DEFAULT 0.00,
  ADD COLUMN service_activation TINYINT(3) UNSIGNED NOT NULL DEFAULT 0 AFTER service_type;

--
-- Создать таблицу services_users_pairs
--
CREATE TABLE services_users_pairs (
  serviceid SMALLINT(5) UNSIGNED NOT NULL,
  uid BIGINT(20) UNSIGNED NOT NULL
)
ENGINE = MYISAM
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Изменить таблицу sticky_notes
--
ALTER TABLE sticky_notes
  CHANGE COLUMN stickynotename stickynotename VARCHAR(36) NOT NULL DEFAULT '',
  CHANGE COLUMN ispublic ispublic TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
  CHANGE COLUMN note note VARCHAR(500) NOT NULL DEFAULT '';

--
-- Изменить таблицу tickets_tickets
--
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

--
-- Изменить таблицу users
--
ALTER TABLE users
  CHANGE COLUMN fio fio CHAR(128) NOT NULL DEFAULT '',
  CHANGE COLUMN phone phone CHAR(128) NOT NULL DEFAULT '',
  CHANGE COLUMN address address CHAR(128) NOT NULL DEFAULT '',
  CHANGE COLUMN prim prim CHAR(254) NOT NULL DEFAULT '',
  CHANGE COLUMN framed_ip framed_ip CHAR(16) NOT NULL DEFAULT '',
  CHANGE COLUMN callback_number callback_number CHAR(64) NOT NULL DEFAULT '',
  CHANGE COLUMN dogovor dogovor TINYINT(2) NOT NULL DEFAULT 0 COMMENT '0 - нет данных; 1 - активен; 2 - приостановлен; 3 - закрыт',
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

DELIMITER $$

--
-- Изменить процедуру do_switch_opt82_log
--
DROP PROCEDURE do_switch_opt82_log$$
CREATE PROCEDURE do_switch_opt82_log(IN `uid` INT, IN `user_mac` VARCHAR(17), IN `vlan` INT(5), IN `user_port` int(4), IN `swid` int, IN `logtypeid` smallint(10), IN `swid_mac` VARCHAR(17), IN `switch_circuit_id` varchar(64), IN `switch_remote_id` varchar(64))
  DETERMINISTIC
  COMMENT 'Выполнить логирование события в ядре по DHCP Option 82'
BEGIN
  INSERT INTO `switch_opt82_logs` VALUES (NULL, CURRENT_TIMESTAMP, `uid`, `user_mac`, `vlan`, `user_port`, `swid`, `logtypeid`, `swid_mac`, `switch_circuit_id`, `switch_remote_id`);
END
$$

DELIMITER ;
