SET NAMES 'utf8';

INSERT INTO cabinet_config (parent, `key`, value) VALUES ('gui', 'user_registration_type' , '1');
INSERT INTO cabinet_config (parent, `key`, value) VALUES ('gui', 'user_registration_hide' , '1');
INSERT INTO cabinet_config (parent, `key`, value) VALUES ('gui', 'user_vaucher_length' , '18');
INSERT INTO cabinet_config (parent, `key`, value) VALUES ('gui', 'user_vaucher_type' , '4');
INSERT INTO cabinet_config (parent, `key`, value) VALUES ('gui', 'user_hide_uid' , '0');
INSERT INTO cabinet_config (parent, `key`, value) VALUES ('gui', 'user_show_inn' , '0');

INSERT INTO cabinet_config (parent, `key`, value) VALUES ('system', 'user_registration_packet_group' , '-1');

UPDATE  `system_options` SET  `value` =  '0' WHERE  `system_options`.`key` =  'do_ipoe_hosts_clean';

--
-- Изменить таблицу "dev_types"
--
ALTER TABLE dev_types
  ADD COLUMN device_sn TINYINT(4) NOT NULL DEFAULT 0 AFTER dev_mac,
  CHANGE COLUMN deny_to_change_owner_settings deny_to_change_owner_settings TINYINT(3) UNSIGNED NOT NULL DEFAULT 0 AFTER default_owner;

--
-- Изменить таблицу "services"
--
ALTER TABLE services
  CHANGE COLUMN period period ENUM('m','w','d','daily_proportionally') NOT NULL DEFAULT 'm' COMMENT 'm - ежемесячно, w - еженедельно, d - ежедневно',
  ADD COLUMN sql_condition TEXT NOT NULL COMMENT 'дополнительное SQL условие' AFTER trigger_condition,
  ADD COLUMN deactivation_by_admin TINYINT(4) NOT NULL DEFAULT 0 COMMENT 'деактивация инд. услуги персоналом' AFTER activation_by_user,
  ADD COLUMN deactivation_by_user TINYINT(4) NOT NULL DEFAULT 0 COMMENT 'деактивация инд. услуги абонентом' AFTER deactivation_by_admin;

UPDATE services SET sql_condition = trigger_condition, trigger_condition = 4 WHERE CONCAT('',trigger_condition * 1) <> trigger_condition;

ALTER TABLE services
  CHANGE COLUMN trigger_condition trigger_condition TINYINT(4) NOT NULL DEFAULT 0 COMMENT 'Условие срабатывания услуги. 0 - безусловное (всегда).1 - положительный баланс и Инет включён.2 - отрицательный баланс и Инет выключен, иначе - своё условие';

--
-- Изменить таблицу "services_packets_pairs"
--
ALTER TABLE services_packets_pairs
  ADD COLUMN deactivation_by_admin TINYINT(4) DEFAULT NULL COMMENT 'деактивация инд. услуги персоналом' AFTER activation_by_user,
  ADD COLUMN deactivation_by_user TINYINT(4) DEFAULT NULL COMMENT 'деактивация инд. услуги абонентом' AFTER deactivation_by_admin;

--
-- Изменить таблицу "stuff_personal"
--
ALTER TABLE stuff_personal
  ADD COLUMN active_gosorgan TINYINT(4) NOT NULL DEFAULT 0 COMMENT 'доступ для гос. органов' AFTER active,
  ADD COLUMN edit_login TINYINT(2) UNSIGNED NOT NULL DEFAULT 1 AFTER staff_payments_only_own,
  ADD COLUMN edit_pass TINYINT(2) UNSIGNED NOT NULL DEFAULT 1 AFTER edit_login;

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
-- Создать процедуру "last_connection"
--
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



