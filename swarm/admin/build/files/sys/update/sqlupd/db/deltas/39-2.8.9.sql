SET NAMES 'utf8';

UPDATE `services` set servicename = 'Услуга Кредит' WHERE serviceid = 1;
UPDATE `services` set servicename = 'Услуга Кредит с %' WHERE serviceid = 2;
UPDATE `services` set servicename = 'Услуга "Турбо"' WHERE serviceid = 3;
UPDATE `services` set servicename = 'Услуга "Заморозка"' WHERE serviceid = 5;

INSERT INTO system_options (`key`, value) VALUES ('mik_pcq_turbo' , '0');
INSERT INTO system_options (`key`, value) VALUES ('cyberplat_public_path' , '');
INSERT INTO system_options (`key`, value) VALUES ('cyberplat_private_path' , '');
INSERT INTO system_options (`key`, value) VALUES ('cyberplat_private_passphrase' , '');
INSERT INTO system_options (`key`, value) VALUES ('do_online_unlim' , '0');
INSERT INTO system_options (`key`, value) VALUES ('accel_parse_opt_82' , '0');

  
INSERT INTO  `mikbill`.`radpostauthreplymessage` (
`replymessageid` ,
`replymessage`
)
VALUES (
30 ,  'Пользователь в группе замороженные'
);

INSERT INTO bugh_plategi_type (bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES (86, 'ЯПК', '+', 0, '+', '+');

INSERT INTO system_options (`key`, value) VALUES ('yapk_uid_prio', '1');
INSERT INTO system_options (`key`, value) VALUES ('yapk_login_prio', '2');
INSERT INTO system_options (`key`, value) VALUES ('yapk_numdogovor_prio', '3');


--
-- Table structure for table `switch_opt82_logtype`
--

DROP TABLE IF EXISTS `switch_opt82_logtype`;
CREATE TABLE IF NOT EXISTS `switch_opt82_logtype` (
  `logtypeid` tinyint(10) unsigned NOT NULL AUTO_INCREMENT,
  `logtype` char(64) NOT NULL,
  `access` int(1) unsigned NOT NULL,
  PRIMARY KEY (`logtypeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=koi8r AUTO_INCREMENT=19 ;

--
-- Dumping data for table `switch_opt82_logtype`
--

INSERT INTO `switch_opt82_logtype` (`logtypeid`, `logtype`, `access`) VALUES
(1, 'В запросе отсутствует MAC абонента', 0),
(2, 'Нет DHCP-Relay-Circuit-Id или DHCP-Relay-Remote-Id, поиск по MAC', 1),
(3, 'Не обнаружено устройство по MAC', 0),
(4, 'Не обнаружена пара vlan, parent_swid', 0),
(5, 'unnumbered - пользователь найден', 1),
(6, 'autoreg port by MAC - пользователь найден', 1),
(7, 'port, swid, MAC - пользователь найден', 1),
(8, 'регистрация по MAC - пользователь найден', 1),
(9, 'unnumbered - пользователь не найден', 0),
(10, 'autoreg port by MAC - пользователь не найден', 0),
(11, 'port, swid, MAC - пользователь не найден', 0),
(12, 'регистрация по MAC - пользователь не найден', 0),
(13, 'Нет Remote-Id/-Circuit-Id: пользователь по MAC не найден', 0),
(14, 'Регистрация по Vlan+Port', 1),
(15, 'Выдаем IP из пула range в сегменте', 1),
(16, 'свич не найден', 0),
(17, 'Регистрация по mac отключена', 0),
(18, 'найден по mac, порт/устройство не совпадают (opt82)', 1);


--
-- Удалить таблицу system_options_lk
--
DROP TABLE system_options_lk;

--
-- Изменить таблицу addons_cyberplat
--
ALTER TABLE addons_cyberplat
  CHANGE COLUMN receipt_id receipt_id BIGINT(20) UNSIGNED NOT NULL;

--
-- Изменить таблицу addons_mkb
--
ALTER TABLE addons_mkb
  CHANGE COLUMN txn_id txn_id BIGINT(20) UNSIGNED NOT NULL;

--
-- Создать таблицу addons_yapk
--
CREATE TABLE addons_yapk (
  order_id INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
  uid BIGINT(16) UNSIGNED NOT NULL,
  txn_id BIGINT(20) UNSIGNED NOT NULL,
  sum DOUBLE(14, 2) DEFAULT NULL,
  txn_date DATETIME NOT NULL,
  time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  status TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (order_id)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Создать таблицу cabinet_config
--
CREATE TABLE cabinet_config (
  parent SET('gui','company_info','locales','locales_options','system') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `key` CHAR(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  value CHAR(128) NOT NULL,
  UNIQUE INDEX `key` (`key`)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Создать таблицу cabinet_registration
--
CREATE TABLE cabinet_registration (
  id MEDIUMINT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  sms_id INT(11) UNSIGNED DEFAULT NULL COMMENT 'ID из таблицы sms_logs',
  otp INT(8) UNSIGNED ZEROFILL NOT NULL COMMENT 'Временный код',
  otp_activated TINYINT(4) NOT NULL DEFAULT 0 COMMENT 'использован ли OTP: bool',
  creation_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'дата и время создания кода',
  PRIMARY KEY (id)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Создать таблицу logs_auth_admin
--
CREATE TABLE logs_auth_admin (
  auth_id MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'AI',
  login VARCHAR(32) NOT NULL COMMENT 'логин',
  `password` VARCHAR(32) NOT NULL COMMENT 'пароль',
  stuffid TINYINT(3) UNSIGNED DEFAULT NULL COMMENT 'ID сотрудника',
  auth_ip INT(10) UNSIGNED NOT NULL COMMENT 'IP авторизации',
  auth_type ENUM('denied','allowed','session','') NOT NULL COMMENT 'Результат авторизации: вход запрещён/разрешён/сессионный',
  auth_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (auth_id)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Создать таблицу radacctmem
--
CREATE TABLE radacctmem (
  acctsessionid VARCHAR(64) CHARACTER SET koi8r COLLATE koi8r_bin NOT NULL,
  acctuniqueid VARCHAR(32) CHARACTER SET koi8r COLLATE koi8r_bin NOT NULL,
  uid BIGINT(16) UNSIGNED NOT NULL COMMENT 'UID абонента',
  gid SMALLINT(5) UNSIGNED NOT NULL COMMENT 'тарифа в момент авторизации',
  blocked TINYINT(2) UNSIGNED NOT NULL COMMENT 'Блокировка в момент авторизации',
  deposit DOUBLE(20, 6) NOT NULL COMMENT 'Баланс при авторизации',
  credit DOUBLE(20, 6) NOT NULL,
  last_change INT(10) UNSIGNED NOT NULL COMMENT 'Последнее изменение'
)
ENGINE = MEMORY
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Вспомогательная таблица для raddact типа Memory';

--
-- Изменить таблицу services
--
ALTER TABLE services
  CHANGE COLUMN serviceid serviceid SMALLINT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID услуги',
  CHANGE COLUMN servicename servicename VARCHAR(64) NOT NULL COMMENT 'Название Услуги',
  CHANGE COLUMN amount amount DOUBLE(20, 2) NOT NULL DEFAULT 0.00 COMMENT 'Цена услуги',
  CHANGE COLUMN users_states users_states SET('n','f','d','r') NOT NULL DEFAULT 'n' COMMENT 'Статус пользователя n-normal.f-freeze,d-disabled,r-removed',
  CHANGE COLUMN service_type service_type ENUM('fee','gift') NOT NULL DEFAULT 'fee' COMMENT 'fee-списание,gift-подарок',
  CHANGE COLUMN service_activation service_activation TINYINT(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 - базовая (всем в тарифе), 1-индивидуально (по назначению)',
  ADD COLUMN service_loyal_recalculation TINYINT(4) NOT NULL DEFAULT 1 COMMENT 'Лояльное отключение с возвратом средств. Относится ' AFTER service_activation,
  CHANGE COLUMN trigger_condition trigger_condition TEXT NOT NULL COMMENT 'Условие срабатывания услуги. 0 - безусловное (всегда).1 - положительный баланс и Инет включён.2 - отрицательный баланс и Инет выключен, иначе - своё условие' AFTER service_loyal_recalculation,
  CHANGE COLUMN suspended suspended TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'Услуга приостановлена' AFTER trigger_condition,
  CHANGE COLUMN priority priority TINYINT(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Приоритет применения услуги. 0 - самый важный. Чем меньше - тем раньше она будет запущена (списана оплата)' AFTER suspended,
  CHANGE COLUMN description description BLOB NOT NULL COMMENT 'описание услуги',
  CHANGE COLUMN creation_date creation_date TIMESTAMP DEFAULT '0000-00-00 00:00:00' COMMENT 'Дата создания' AFTER description,
  ADD COLUMN last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Последнее обновление' AFTER creation_date;

--
-- Изменить таблицу services_packets_pairs
--
ALTER TABLE services_packets_pairs
  ADD COLUMN service_loyal_recalculation TINYINT(4) NOT NULL DEFAULT 1 COMMENT 'Лояльное отключение с возвратом средств. Относится ' AFTER service_price,
  ADD COLUMN activation_by_admin TINYINT(4) DEFAULT NULL COMMENT 'подключается администратором' AFTER service_activation,
  ADD COLUMN activation_by_user TINYINT(4) DEFAULT NULL COMMENT 'подключается абонентом' AFTER activation_by_admin;

--
-- Создать таблицу sms_logs
--
CREATE TABLE sms_logs (
  sms_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'AI',
  sms_type_id TINYINT(3) UNSIGNED NOT NULL COMMENT 'Тип СМС - OTP регистрация и прочие категории',
  gateway_id TINYINT(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Шлюз СМС. По умолчанию - 0 (сис. опции)',
  uid BIGINT(20) UNSIGNED DEFAULT NULL COMMENT 'ID абонента, NULL - для OTP регистрации',
  sms_phone VARCHAR(20) NOT NULL,
  sms_text VARCHAR(254) NOT NULL,
  sms_code TINYINT(4) DEFAULT NULL COMMENT 'Код СМС. 0 - всё ОК, иначе - ошибка. NULL - не известен',
  sms_error_text VARCHAR(254) NOT NULL DEFAULT '' COMMENT 'Описание ошибки, если есть',
  sms_send_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Время отправки СМС',
  PRIMARY KEY (sms_id)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Логи отправленных СМС';

DELIMITER $$

--
-- Создать функцию check_blocked_mem_func
--
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
-- Изменить функцию check_money_func
--
ALTER FUNCTION check_money_func READS SQL DATA
 COMMENT 'Получить сумму по абоненту'$$

--
-- Создать функцию check_money_mem_func
--
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
-- Создать функцию user_generate_login_algorithm
--
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


