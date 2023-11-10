SET NAMES 'utf8';

INSERT INTO bugh_plategi_type (bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES (87, 'Пополнение Stripe', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type (bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES (88, 'Пополнение eKassir', '+', 0, '+', '+');

INSERT INTO system_options (`key`, value) VALUES ('ekassir_uid_prio', '1'); 
INSERT INTO system_options (`key`, value) VALUES ('ekassir_login_prio', '2'); 
INSERT INTO system_options (`key`, value) VALUES ('ekassir_numdogovor_prio', '3');

INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES
('locales_options', 'autoDetect', '0'),,
('gui', 'contact_menu_show', '0'),
('gui', 'debug', '0'),
('locales_options', 'default', 'ru_RU'),
('locales', 'enable_1', '1'),
('locales', 'enable_2', '1'),
('locales', 'enable_3', '1'),
('locales', 'file_1', 'original'),
('locales', 'file_2', 'original'),
('locales', 'file_3', 'original'),
('locales', 'name_1', 'ru_RU'),
('locales', 'name_2', 'uk_UA'),
('locales', 'name_3', 'en_GB'),
('company_info', 'name_mobile_1', ''),
('company_info', 'name_mobile_2', ''),
('company_info', 'name_mobile_3', ''),
('gui', 'path_template', './data/template/olson'),
('company_info', 'phone_mobile_1', ''),
('company_info', 'phone_mobile_2', ''),
('company_info', 'phone_mobile_3', ''),
('company_info', 'show_map', '0'),
('gui', 'speed_mbit', '1'),
('system', 'user_registration_gid', '1'),
('system', 'user_registration_houseid', '1'),
('gui', 'user_registration_on', '0'),
('system', 'user_registration_sectorid', '1'),
('system', 'user_registration_text', 'Ваш OTP: %s');


--
-- Создать таблицу "addons_ekassir"
--
CREATE TABLE addons_ekassir (
  order_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  uid BIGINT(16) UNSIGNED DEFAULT NULL,
  amount DECIMAL(18, 2) UNSIGNED DEFAULT NULL,
  txn_id CHAR(36) NOT NULL,
  txn_date DATETIME DEFAULT NULL,
  check_time DATETIME DEFAULT NULL,
  status TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (order_id)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Создать таблицу "addons_stripe"
--
CREATE TABLE addons_stripe (
  order_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  uid BIGINT(20) UNSIGNED NOT NULL,
  amount DECIMAL(16, 2) UNSIGNED NOT NULL,
  txn_date DATETIME NOT NULL,
  PRIMARY KEY (order_id)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci
COMMENT = 'Детальные платежи stripe';

--
-- Изменить таблицу "services"
--
ALTER TABLE services
  ADD COLUMN service_groupid TINYINT(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'ID группы для организации типа услуги "1 из множества"' AFTER service_activation,
  CHANGE COLUMN description description TEXT NOT NULL COMMENT 'описание услуги' AFTER activation_by_user;

--
-- Изменить таблицу "services_packets_pairs"
--
ALTER TABLE services_packets_pairs
  CHANGE COLUMN service_loyal_recalculation service_loyal_recalculation TINYINT(4) DEFAULT NULL COMMENT 'Лояльное отключение с возвратом средств. Относится ';

--
-- Изменить таблицу "sms_logs"
--
ALTER TABLE sms_logs
  ADD COLUMN staffid TINYINT(4) DEFAULT NULL COMMENT 'ID сотрудника' AFTER uid;

DELIMITER $$

--
-- Создать процедуру "connect_switch_to_KOI8"
--
CREATE PROCEDURE connect_switch_to_KOI8()
  DETERMINISTIC
  COMMENT 'Переключаем соединение в koi8r'
BEGIN
SET `character_set_results` = 'koi8r';
END
$$

--
-- Создать процедуру "connect_switch_to_UTF8"
--
CREATE PROCEDURE connect_switch_to_UTF8()
  DETERMINISTIC
  COMMENT 'Переключаем соединение в utf8'
BEGIN
  SET `character_set_results` = 'utf8';
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

--
-- Изменить функцию "user_generate_login_algorithm"
--
DROP FUNCTION user_generate_login_algorithm$$
CREATE FUNCTION user_generate_login_algorithm()
  RETURNS varchar(255) CHARSET koi8r
  DETERMINISTIC
  COMMENT 'Генерируем логин на основании заданного метода'
BEGIN
  DECLARE `vn` INT;
  DECLARE `login` varchar(255);
  SET @keyName = 'viitenumber';

  # выбираем keyName
  # ВНИМАНИЕ! В таблицу system_options добавить ты его НЕ забудь, добавлю я 1 иначе
  SELECT `value` + 1 # не забывайте об инкременте
  INTO
    `vn`
  FROM
    `system_options`
  WHERE
    `key` = @keyName;

  IF (ISNULL(`vn`)) THEN
    INSERT INTO `system_options` (`key`,value) VALUES (@keyName ,'1');
    SET `vn` = 1;
  ELSE
    UPDATE `system_options` SET `value` = `vn` WHERE `key` = @keyName;
  END IF;

  # изменяем его в БД для тех, кто будет его выбирать следующим
  

  # генерируем логин на основании "ссылки"
  SET @summ = CAST(
(SUBSTR(`vn`,1,1)*3)+
(SUBSTR(`vn`,2,1)*7)+
(SUBSTR(`vn`,3,1)*1)+
(SUBSTR(`vn`,4,1)*3)+
(SUBSTR(`vn`,5,1)*7)+
(SUBSTR(`vn`,6,1)*1)+
(SUBSTR(`vn`,7,1)*3 + (SUBSTR(`vn`,8,1)*7)) AS SIGNED);

  SET @lastnum = CEIL(@summ / 10) * 10 - @summ;

  SET `login` = CONCAT(`vn`, @lastnum);

  RETURN `login`;
END
$$

DELIMITER ;

--
-- Создать представление "usersadress"
--
CREATE
VIEW usersadress
AS
SELECT
  concat(`lanes`.`lane`, ' ', `lanes_houses`.`house`, '-', `users`.`app`) AS `address`,
  `lanes`.`lane` AS `lane`,
  `lanes_houses`.`house` AS `house`,
  `users`.`app` AS `app`,
  `lanes_houses`.`porches` AS `porches`,
  `lanes_houses`.`floors` AS `floors`,
  `users`.`uid` AS `uid`,
  `users`.`user` AS `user`,
  `users`.`fio` AS `fio`
FROM ((`lanes_houses`
  JOIN `lanes`
    ON ((`lanes`.`laneid` = `lanes_houses`.`laneid`)))
  JOIN `users`
    ON ((`lanes_houses`.`houseid` = `users`.`houseid`)));


