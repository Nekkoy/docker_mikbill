SET NAMES 'utf8';


--
-- Изменить таблицу bugh_cards_log
--
ALTER TABLE bugh_cards_log
  DROP INDEX card;

--
-- Изменить таблицу cabinet_news
--
ALTER TABLE cabinet_news
  ADD COLUMN settlementid INT(10) UNSIGNED NOT NULL DEFAULT 0 AFTER expiration_date;

ALTER TABLE cabinet_news
  ADD INDEX dse (display, start_date, expiration_date);

--
-- Изменить таблицу dev_user
--
ALTER TABLE dev_user
  ADD INDEX uid (uid);

--
-- Изменить таблицу hotspot_free_radacct
--
ALTER TABLE hotspot_free_radacct
  DROP INDEX Acctterminatecause;

--
-- Изменить таблицу ip_lease
--
ALTER TABLE ip_lease
  DROP INDEX ip;

--
-- Изменить таблицу ip_real
--
ALTER TABLE ip_real
  DROP INDEX ip;

--
-- Изменить таблицу lanes_neighborhoods
--
ALTER TABLE lanes_neighborhoods
  CHANGE COLUMN neighborhoodname neighborhoodname VARCHAR(36) NOT NULL DEFAULT '';

--
-- Изменить таблицу mod_cards_act_cards
--
ALTER TABLE mod_cards_act_cards
  DROP INDEX `cars-secret`;

--
-- Изменить таблицу mod_cards_act_logs
--
ALTER TABLE mod_cards_act_logs
  DROP INDEX secr;

ALTER TABLE mod_cards_act_logs
  ADD INDEX secret (secret);

--
-- Изменить таблицу mod_cards_cards
--
ALTER TABLE mod_cards_cards
  DROP INDEX `serial`;

ALTER TABLE mod_cards_cards
  ADD INDEX sn (sn);

--
-- Изменить таблицу mod_cards_errors
--
ALTER TABLE mod_cards_errors
  DROP INDEX who2;

--
-- Изменить таблицу packets
--
ALTER TABLE packets
  DROP INDEX packetname;

--
-- Изменить таблицу preferences
--
ALTER TABLE preferences
  ADD INDEX spid (stuffid, preferenceid);

--
-- Изменить таблицу radacct
--
ALTER TABLE radacct
  DROP INDEX Acctterminatecause;

--
-- Изменить таблицу radnas
--
ALTER TABLE radnas
  DROP INDEX nasip;

--
-- Изменить таблицу sectorspool
--
ALTER TABLE sectorspool
  DROP INDEX `ip-text`;

ALTER TABLE sectorspool
  ADD INDEX `ip-text` (ip);

--
-- Изменить таблицу secureauth
--
ALTER TABLE secureauth
  DROP INDEX caller;
ALTER TABLE secureauth
  ADD INDEX caller (CallingStationId);

--
-- Изменить таблицу services_packets_pairs
--
ALTER TABLE services_packets_pairs
  ADD INDEX gid (gid);

ALTER TABLE services_packets_pairs
  ADD INDEX serviceid (serviceid);

--
-- Изменить таблицу services_users_pairs
--
ALTER TABLE services_users_pairs
  ADD INDEX serviceid (serviceid);

ALTER TABLE services_users_pairs
  ADD INDEX uid (uid);

--
-- Изменить таблицу stuff_personal
--
ALTER TABLE stuff_personal
  ADD INDEX auth (login, pass, active);

--
-- Изменить таблицу switch_logs
--
ALTER TABLE switch_logs
  DROP INDEX mac;
ALTER TABLE switch_logs
  ADD INDEX mac (mac);

--
-- Изменить таблицу switches
--
ALTER TABLE switches
  ADD INDEX parsw (swid, parent_swid);

--
-- Изменить таблицу syslogs
--
ALTER TABLE syslogs
  CHANGE COLUMN msg msg VARCHAR(255) DEFAULT '';

ALTER TABLE syslogs
  ADD INDEX mdate (msg, `datetime`);

ALTER TABLE syslogs
  DROP INDEX msg;
ALTER TABLE syslogs
  ADD INDEX msg (msg);

--
-- Изменить таблицу system_options
--
ALTER TABLE system_options
  DROP INDEX `key-fulltext`;

--
-- Изменить таблицу tickets_logs
--
ALTER TABLE tickets_logs
  ADD INDEX tid (ticketid);

--
-- Изменить таблицу tickets_messages
--
ALTER TABLE tickets_messages
  ADD INDEX ticketid (ticketid);

ALTER TABLE tickets_messages
  ADD INDEX tid_sid (ticketid, stuffid);

--
-- Изменить таблицу tickets_notes
--
ALTER TABLE tickets_notes
  ADD INDEX tid (ticketid);

ALTER TABLE tickets_notes
  ADD INDEX tnid (ticketid, noteid);

--
-- Изменить таблицу tickets_performers
--
ALTER TABLE tickets_performers
  ADD INDEX sid (stuffid);

ALTER TABLE tickets_performers
  ADD INDEX tid (ticketid);

ALTER TABLE tickets_performers
  ADD INDEX tsid (stuffid, ticketid);

--
-- Изменить таблицу tickets_tickets
--
ALTER TABLE tickets_tickets
  ADD INDEX cat (categoryid);

ALTER TABLE tickets_tickets
  ADD INDEX creat (creationdate);

ALTER TABLE tickets_tickets
  ADD INDEX prio (prioritytypeid);

ALTER TABLE tickets_tickets
  ADD INDEX sd (statustypeid, creationdate);

ALTER TABLE tickets_tickets
  ADD INDEX sector (sectorid);

ALTER TABLE tickets_tickets
  ADD INDEX si (statustypeid, inworkdate);

ALTER TABLE tickets_tickets
  ADD INDEX uid (useruid);

ALTER TABLE tickets_tickets
  ADD INDEX uspristacre (useruid, prioritytypeid, statustypeid, creationdate);

--
-- Изменить таблицу users
--
ALTER TABLE users
  ADD INDEX uiduser (uid, user);


INSERT INTO logtype (logtypeid, logtype)
  VALUES (19 /* logtypeid - SMALLINT(10) UNSIGNED NOT NULL */, 'Устройства'/* logtype - CHAR(32) NOT NULL */);
INSERT INTO logtype (logtypeid, logtype)
  VALUES (20 /* logtypeid - SMALLINT(10) UNSIGNED NOT NULL */, 'Типы устройств'/* logtype - CHAR(32) NOT NULL */);

INSERT INTO system_options (`key`, value) VALUES ('auto_log_clear', '0');
INSERT INTO system_options (`key`, value) VALUES ('auto_log_auth_days', '0');
INSERT INTO system_options (`key`, value) VALUES ('auto_log_dhcp_days', '0');
INSERT INTO system_options (`key`, value) VALUES ('auto_log_dhcp_mikbill_days', '0');
INSERT INTO system_options (`key`, value) VALUES ('auto_log_switch_log_days', '0');
INSERT INTO system_options (`key`, value) VALUES ('auto_log_sessions_months', '0');

ALTER TABLE `cabinet_news` ADD `settlementid` INT UNSIGNED NOT NULL DEFAULT '0' AFTER `expiration_date`; (синхронизирую с дев)

INSERT INTO `system_options` (`key`, value) VALUES ('create_ticket_blocked' , '0');
INSERT INTO `system_options` (`key`, value) VALUES ('create_ticket_blocked_days' , '0');
INSERT INTO `system_options` (`key`, value) VALUES ('create_ticket_blocked_staffid' , '0');
INSERT INTO `system_options` (`key`, value) VALUES ('create_ticket_blocked' , '0');
INSERT INTO `system_options` (`key`, value) VALUES ('create_ticket_blocked_days' , '0');
INSERT INTO `system_options` (`key`, value) VALUES ('create_ticket_blocked_staffid' , '0');
INSERT INTO `system_options` (`key`, value) VALUES ('create_ticket_blocked_category' , '1');
INSERT INTO `system_options` (`key`, value) VALUES ('create_ticket_blocked_priority' , '2');


INSERT INTO system_options (`key`, value) VALUES ('privat_v2_uid' , '1') ;
INSERT INTO system_options (`key`, value) VALUES ('privat_v2_login' , '1') ;
INSERT INTO system_options (`key`, value) VALUES ('privat_v2_numdogovor' , '1');
INSERT INTO system_options (`key`, value) VALUES ('osmp_numdogovor_prio' , '3');
INSERT INTO system_options (`key`, value) VALUES ('ibox_numdogovor_prio' , '3');
INSERT INTO system_options (`key`, value) VALUES ('osmp_numdogovor' , '0') ;
INSERT INTO system_options (`key`, value) VALUES ('ibox_numdogovor' , '0')  ;
INSERT INTO system_options (`key`, value)  VALUES ('osmp_uid' , '1') , ('osmp_uid_prio' , '1') , ('osmp_login' , '1') , ('osmp_login_prio' , '2');
INSERT INTO system_options (`key`, value)  VALUES ('ibox_uid' , '1') , ('ibox_uid_prio' , '1') , ('ibox_login' , '1') , ('ibox_login_prio' , '2');



