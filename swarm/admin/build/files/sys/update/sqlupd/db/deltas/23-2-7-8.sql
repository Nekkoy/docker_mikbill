SET NAMES 'utf8';


--
-- Изменить таблицу addons_privat_payment_account
--
ALTER TABLE addons_privat_payment_account
  CHANGE COLUMN ref ref VARCHAR(128) NOT NULL,
  ADD COLUMN postdate DATETIME NOT NULL AFTER ref,
  ADD COLUMN customerdate DATETIME NOT NULL AFTER postdate,
  CHANGE COLUMN account account VARCHAR(32) NOT NULL AFTER amount,
  CHARACTER SET koi8r,
  COLLATE koi8r_general_ci;

--
-- Изменить таблицу switche_type
--
ALTER TABLE switche_type
  ADD COLUMN use_circut_template TINYINT(2) UNSIGNED NOT NULL DEFAULT 0 AFTER do_ip_unnumbered,
  ADD COLUMN circut_template VARCHAR(64) NOT NULL DEFAULT '' AFTER use_circut_template,
  ADD COLUMN use_unit_find TINYINT(2) UNSIGNED NOT NULL DEFAULT 0 AFTER circut_template,
  ADD COLUMN use_module_find TINYINT(2) UNSIGNED NOT NULL DEFAULT 0 AFTER use_unit_find;

--
-- Изменить таблицу switches
--
ALTER TABLE switches
  ADD COLUMN swunit INT(10) UNSIGNED NOT NULL DEFAULT 0 AFTER qnq,
  ADD COLUMN swmodule INT(10) UNSIGNED NOT NULL DEFAULT 0 AFTER swunit;

--
-- Изменить таблицу usersfreeze
--
ALTER TABLE usersfreeze
  CHANGE COLUMN fio fio VARCHAR(128) NOT NULL DEFAULT '',
  CHANGE COLUMN phone phone VARCHAR(128) NOT NULL DEFAULT '',
  CHANGE COLUMN address address VARCHAR(128) NOT NULL DEFAULT '',
  CHANGE COLUMN prim prim VARCHAR(254) NOT NULL DEFAULT '',
  CHANGE COLUMN framed_ip framed_ip VARCHAR(16) NOT NULL DEFAULT '',
  CHANGE COLUMN callback_number callback_number VARCHAR(64) NOT NULL DEFAULT '',
  CHANGE COLUMN email email VARCHAR(64) DEFAULT '',
  CHANGE COLUMN passportserie passportserie VARCHAR(16) DEFAULT '',
  CHANGE COLUMN passportpropiska passportpropiska VARCHAR(128) DEFAULT '',
  CHANGE COLUMN passportvoenkomat passportvoenkomat VARCHAR(128) DEFAULT '',
  CHANGE COLUMN passportgdevidan passportgdevidan VARCHAR(128) DEFAULT '',
  CHANGE COLUMN inn inn VARCHAR(64) DEFAULT '',
  CHANGE COLUMN mob_tel mob_tel VARCHAR(32) DEFAULT '',
  CHANGE COLUMN sms_tel sms_tel VARCHAR(32) DEFAULT '',
  CHANGE COLUMN app app VARCHAR(4) NOT NULL DEFAULT '',
  CHANGE COLUMN houseid houseid INT(14) UNSIGNED NOT NULL DEFAULT 1,
  CHANGE COLUMN housingid housingid INT(14) UNSIGNED NOT NULL DEFAULT 0,
  CHANGE COLUMN houseblockid houseblockid INT(14) UNSIGNED NOT NULL DEFAULT 0,
  CHANGE COLUMN porch porch INT(14) UNSIGNED NOT NULL DEFAULT 0,
  CHANGE COLUMN floor floor INT(14) UNSIGNED NOT NULL DEFAULT 0,
  CHANGE COLUMN router_model router_model VARCHAR(16) NOT NULL DEFAULT '',
  CHANGE COLUMN router_login router_login VARCHAR(16) NOT NULL DEFAULT '',
  CHANGE COLUMN router_pass router_pass VARCHAR(16) NOT NULL DEFAULT '',
  CHANGE COLUMN router_ssid router_ssid VARCHAR(16) NOT NULL DEFAULT '',
  CHANGE COLUMN router_wep_pass router_wep_pass VARCHAR(16) NOT NULL DEFAULT '',
  CHANGE COLUMN router_serial router_serial VARCHAR(16) NOT NULL DEFAULT '';

--
-- Изменить таблицу usersgroups
--
ALTER TABLE usersgroups
  ADD COLUMN share DECIMAL(5, 2) NOT NULL DEFAULT 0.00 COMMENT 'доля дилера' AFTER description;

DELIMITER $$

--
-- Создать функцию check_privat_pay_account_payment
--
CREATE FUNCTION check_privat_pay_account_payment(input_ref VARCHAR(255))
  RETURNS varchar(255) CHARSET koi8r
  DETERMINISTIC
  COMMENT 'Ищет, был ли уже проведён данный платёж'
BEGIN
  DECLARE `exist` varchar(255) DEFAULT '0';

  SELECT `ref`
  INTO
    exist
  FROM
    `addons_privat_payment_account`
  WHERE
    `ref` = `input_ref`;

  RETURN `exist`;
END
$$

DELIMITER ;



INSERT INTO system_options (`key`, value) VALUES ('freeze_custom_days_on', '0');
INSERT INTO system_options (`key`, value) VALUES ('freeze_custom_days_count', '365');
INSERT INTO system_options (`key`, value) VALUES ('freeze_custom_period', 'start');
INSERT INTO system_options (`key`, value) VALUES ('unfreeze_earlier_minimum_period', 'standard');





TRUNCATE `logtype`;


--
-- Дамп данных таблицы `logtype`
--

INSERT INTO `logtype` (`logtypeid`, `logtype`) VALUES
(1, 'Абонент'),
(2, 'Тариф'),
(3, 'Карточки'),
(4, 'Товары'),
(5, 'Опции'),
(6, 'WhiteList'),
(7, 'NAS'),
(8, 'Действия'),
(9, 'Справочники'),
(10, 'Email рассылка'),
(11, 'Персонал'),
(12, 'Отчёты'),
(13, 'Консольные команды'),
(14, 'Обход защиты - дилер'),
(15, 'Злонамеренные действия'),
(16, 'Устройства пользователя'),
(17, 'Настройки ЛК'),
(18, 'Финансы'),
(19, 'Устройства'),
(20, 'Типы устройств');

индексы которые надо удалить и создать при переходе на innodb
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
  DROP INDEX mac,
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

