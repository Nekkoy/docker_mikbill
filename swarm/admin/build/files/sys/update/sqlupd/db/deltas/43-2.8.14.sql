SET NAMES 'utf8';

INSERT INTO system_options (`key`, value) VALUES ('use_accl_block_pool' , '0');
INSERT INTO system_options (`key`, value) VALUES ('use_accl_speed_frez' , '0');
INSERT INTO system_options (`key`, value) VALUES ('use_accl_speed_unkn' , '0');
INSERT INTO system_options (`key`, value) VALUES ('use_accl_speed_dolg' , '0');
INSERT INTO system_options (`key`, value) VALUES ('use_accl_frez_on' , '0');
INSERT INTO system_options (`key`, value) VALUES ('use_accl_unk_pool' , '0');
INSERT INTO system_options (`key`, value) VALUES ('accel_ipoe_real_mask' , '24');

INSERT INTO system_options (`key`, value) VALUES ('send_accl_frez_ipset' , '0');
INSERT INTO system_options (`key`, value) VALUES ('send_accl_unkn_ipset' , '0');
INSERT INTO system_options (`key`, value) VALUES ('send_accl_dolg_ipset' , '0');

UPDATE bugh_plategi_type SET typename = 'Пополнение ЯПК' WHERE bughtypeid = 86;
UPDATE bugh_plategi_type SET typename = 'Пополнение СберБанк России (ООО Биллинговые Технологии)' WHERE bughtypeid = 76;

INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(89, 'Пополнение PayPal', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(90, 'Пополнение PayKeeper', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(91, 'Пополнение UkrPays', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(92, 'Пополнение СберБанк России (2)', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(93, 'Бонус', '+', 0, '+', '+');

INSERT INTO system_options (`key`, value) VALUES ('sberbankru_uid_prio', '1'); 
INSERT INTO system_options (`key`, value) VALUES ('sberbankru_login_prio', '2'); 
INSERT INTO system_options (`key`, value) VALUES ('sberbankru_numdogovor_prio', '3');

INSERT INTO system_options (`key`, value) VALUES ('ukrpays_theme' , 'default');
INSERT INTO system_options (`key`, value) VALUES ('ukrpays_lang' , 'uk');

INSERT INTO radpostauthreplymessage (`replymessageid`, `replymessage`) VALUES (30,'Пользователь в группе замороженных');
INSERT INTO radpostauthreplymessage (`replymessageid`, `replymessage`) VALUES (31,'Пользователь в группе неизвестные');



--
-- Создать таблицу "addons_paykeeper"
--
CREATE TABLE addons_paykeeper (
  order_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_sys INT(10) UNSIGNED NOT NULL,
  uid BIGINT(16) UNSIGNED DEFAULT NULL,
  amount DECIMAL(18, 2) UNSIGNED DEFAULT NULL,
  server_time DATETIME DEFAULT NULL,
  status TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (order_id)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Создать таблицу "addons_paypal"
--
CREATE TABLE addons_paypal (
  id MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  uid BIGINT(20) UNSIGNED DEFAULT NULL,
  date DATETIME NOT NULL COMMENT 'время биллинга',
  status TINYINT(4) NOT NULL DEFAULT 0 COMMENT 'статус платежа: 1 - ОК',
  amount DECIMAL(9, 2) UNSIGNED NOT NULL COMMENT 'сумма',
  currency CHAR(3) NOT NULL COMMENT 'тип валюты',
  payment_date CHAR(25) NOT NULL COMMENT 'Время платежа в их формате',
  txn_id CHAR(17) NOT NULL COMMENT 'ID платежа PayPal',
  PRIMARY KEY (id)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Изменить таблицу "addons_privat_payment_account"
--
ALTER TABLE addons_privat_payment_account
  ADD COLUMN purpose VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Описание платежа' AFTER uid;

--
-- Создать таблицу "addons_sberbankru"
--
CREATE TABLE addons_sberbankru (
  order_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  uid BIGINT(16) UNSIGNED DEFAULT NULL,
  amount DECIMAL(18, 2) UNSIGNED DEFAULT NULL,
  txn_id CHAR(36) NOT NULL,
  txn_date DATETIME DEFAULT NULL,
  server_time DATETIME DEFAULT NULL,
  status TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (order_id)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Изменить таблицу "addons_yapk"
--
ALTER TABLE addons_yapk
  ADD COLUMN account VARCHAR(64) NOT NULL DEFAULT '' AFTER uid;

--
-- Изменить таблицу "ip_pools"
--
ALTER TABLE ip_pools
  ADD COLUMN usegw TINYINT(2) UNSIGNED NOT NULL DEFAULT 0 AFTER poolname,
  ADD COLUMN poolmask TINYINT(2) UNSIGNED NOT NULL DEFAULT 24 AFTER usegw,
  ADD COLUMN poolgw CHAR(15) NOT NULL DEFAULT '' AFTER poolmask;

--
-- Создать таблицу "queue_messages"
--
CREATE TABLE queue_messages (
  m_id BIGINT(8) NOT NULL AUTO_INCREMENT COMMENT 'Simple rolling counter (no real use except to keep mySQL happy)',
  mq_id BIGINT(8) NOT NULL DEFAULT 0 COMMENT 'The queue that this message is targeted',
  m_msg TEXT NOT NULL COMMENT 'The message to the task processor in JSON format',
  m_created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'When message was received',
  m_log TEXT DEFAULT NULL COMMENT 'Log of task (reserved for later)',
  m_respond VARCHAR(128) DEFAULT NULL COMMENT 'url to poll on completion',
  m_status ENUM('new','open','done','closed','failed') NOT NULL DEFAULT 'new',
  m_started TIMESTAMP NULL DEFAULT NULL COMMENT 'When the task processor was last initiated',
  m_reply TEXT DEFAULT NULL COMMENT 'Task response in JSON format',
  m_rc INT(11) NOT NULL DEFAULT 0 COMMENT 'Consume return code',
  m_completed TIMESTAMP NULL DEFAULT NULL COMMENT 'When the task completed processing and returned',
  m_errors INT(11) NOT NULL DEFAULT 0 COMMENT 'The number of times this task entry has failed',
  m_uuid VARCHAR(36) NOT NULL DEFAULT '' COMMENT 'Message uuid generated by the server for api access',
  PRIMARY KEY (m_id),
  UNIQUE INDEX m_uuid (m_uuid)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Создать таблицу "queue_types"
--
CREATE TABLE queue_types (
  mq_id BIGINT(8) NOT NULL AUTO_INCREMENT COMMENT 'Internal message queue id',
  mq_name VARCHAR(64) NOT NULL COMMENT 'The name used to access this queue programtically',
  mq_type ENUM('message','api','fork','intval','dataval') NOT NULL DEFAULT 'message' COMMENT 'What type of queue is this',
  mq_created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Note of when this Queue was initially written to (or created ''manually'')',
  mq_timeout INT(8) NOT NULL DEFAULT 30 COMMENT 'Retry timeout',
  mq_maxerrors INT(11) NOT NULL DEFAULT 5 COMMENT 'Maximum number of times to try a task before giving up',
  mq_desc TEXT DEFAULT NULL COMMENT 'Additional (optional) comments about this queue',
  mq_respond VARCHAR(128) DEFAULT NULL COMMENT 'Optional url to send response information (overriden by m_respond)n/loop',
  mq_intval BIGINT(8) DEFAULT NULL COMMENT 'Value for queue type intval (otherwise null)',
  mq_data TEXT DEFAULT NULL COMMENT 'Value for queue type dataval and fork with list of messages queues to write to (otherwise null)',
  PRIMARY KEY (mq_id),
  UNIQUE INDEX mq_name (mq_name)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Изменить таблицу "radnas"
--
ALTER TABLE radnas
  ADD COLUMN mikver TINYINT(3) UNSIGNED NOT NULL DEFAULT 0 AFTER ipauth;

--
-- Изменить таблицу "services"
--
ALTER TABLE services
  ADD COLUMN service_like_packet TINYINT(4) NOT NULL DEFAULT 0 COMMENT 'указываем, чтоб исполнять логику, как в тарифе. При 1 игнорирует "период" услуги' AFTER priority;

DELIMITER $$

--
-- Изменить процедуру "connect_switch_to_KOI8"
--
DROP PROCEDURE connect_switch_to_KOI8$$
CREATE PROCEDURE connect_switch_to_KOI8()
  DETERMINISTIC
  COMMENT 'Переключаем соединение в koi8r'
BEGIN
SET `character_set_results` = 'koi8r';
END
$$

--
-- Изменить процедуру "connect_switch_to_UTF8"
--
DROP PROCEDURE connect_switch_to_UTF8$$
CREATE PROCEDURE connect_switch_to_UTF8()
  DETERMINISTIC
  COMMENT 'Переключаем соединение в utf8'
BEGIN
  SET `character_set_results` = 'utf8';
END
$$

--
-- Изменить процедуру "last_connection"
--
DROP PROCEDURE last_connection$$
CREATE PROCEDURE last_connection(IN uid BIGINT(16))
BEGIN
 UPDATE `users` SET `last_connection` = NOW() WHERE uid = uid; 
END
$$

--
-- Изменить функцию "check_blocked_mem_func"
--
DROP FUNCTION check_blocked_mem_func$$
CREATE FUNCTION check_blocked_mem_func(input_uid INT)
  RETURNS int(11)
  DETERMINISTIC
  READS SQL DATA
  COMMENT 'Проверка на блокировку абонента в radacctmem'
BEGIN
  DECLARE return_value INT DEFAULT 0;

  SELECT blocked
  INTO
    return_value
  FROM
    radacctmem
  WHERE
    uid = input_uid;

  RETURN return_value;

END
$$

--
-- Изменить функцию "check_money_mem_func"
--
DROP FUNCTION check_money_mem_func$$
CREATE FUNCTION check_money_mem_func(input_uid INT)
  RETURNS int(11)
  DETERMINISTIC
  READS SQL DATA
  COMMENT 'Получить сумму по абоненту из radacctmem'
BEGIN
  DECLARE return_value INT DEFAULT 0;

  SELECT sum(deposit + credit)
INTO
  return_value
FROM
  radacctmem
WHERE
  uid = input_uid;

  RETURN return_value;

END
$$


DELIMITER ;


