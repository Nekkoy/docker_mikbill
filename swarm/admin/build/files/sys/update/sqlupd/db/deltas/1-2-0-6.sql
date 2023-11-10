
DROP TABLE stuff_usersgroups_permissions;

--
-- Удалить таблицу stuff_usersgroups
--
DROP TABLE stuff_usersgroups;

--
-- Создать таблицу addons_kassira_net
--
CREATE TABLE addons_kassira_net (
  order_id INT(16) UNSIGNED NOT NULL AUTO_INCREMENT,
  order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  uid INT(16) UNSIGNED NOT NULL,
  terminal_id INT(8) NOT NULL,
  transaction_id INT(8) NOT NULL,
  sum DOUBLE(14, 2) NOT NULL,
  service_code VARCHAR(64) NOT NULL,
  PRIMARY KEY (order_id)
)
ENGINE = MYISAM
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Создать таблицу addons_pay_api
--
CREATE TABLE addons_pay_api (
  record_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  transaction_id BIGINT(20) UNSIGNED NOT NULL,
  terminal_id BIGINT(20) UNSIGNED NOT NULL,
  category INT(11) NOT NULL,
  user_ref BIGINT(20) UNSIGNED NOT NULL,
  amount DECIMAL(19, 4) NOT NULL,
  creation_time TIMESTAMP DEFAULT '0000-00-00 00:00:00',
  update_time TIMESTAMP DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  status SMALLINT(6) NOT NULL DEFAULT 0,
  result_code SMALLINT(6) NOT NULL DEFAULT 0,
  `comment` VARCHAR(1024) NOT NULL,
  UNIQUE INDEX id (record_id),
  INDEX status (status)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Создать таблицу addons_pay_api_errortype
--
CREATE TABLE addons_pay_api_errortype (
  result_code SMALLINT(6) NOT NULL,
  error_meaning VARCHAR(128) NOT NULL,
  PRIMARY KEY (result_code)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Создать таблицу addons_privat
--
CREATE TABLE addons_privat (
  order_id INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
  order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  uid INT(16) UNSIGNED NOT NULL,
  terminal_date DATETIME NOT NULL,
  transaction_id VARCHAR(20) NOT NULL,
  sum DOUBLE(14, 2) NOT NULL,
  service_code VARCHAR(16) NOT NULL,
  PRIMARY KEY (order_id),
  INDEX uid (uid)
)
ENGINE = MYISAM
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Изменить таблицу addons_robokassa
--
--
-- Создать таблицу archived_packets
--
CREATE TABLE archived_packets (
  gid SMALLINT(5) UNSIGNED NOT NULL,
  UNIQUE INDEX gid (gid)
)
ENGINE = MYISAM
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Создать таблицу archived_staff
--
CREATE TABLE archived_staff (
  stuffid TINYINT(6) UNSIGNED NOT NULL,
  UNIQUE INDEX stuffid (stuffid)
)
ENGINE = MYISAM
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Изменить таблицу errorcodes
--
ALTER TABLE errorcodes
  DROP INDEX kode;

--
-- Изменить таблицу ip_pools_pool
--
ALTER TABLE ip_pools_pool
  ADD INDEX idpoolid (id, poolid);

--
-- Изменить таблицу lanes
--

ALTER TABLE lanes
  DROP INDEX lane;

ALTER TABLE lanes
        ENGINE = INNODB;

ALTER TABLE lanes
  ADD INDEX lane (lane);

ALTER TABLE lanes
  ADD INDEX stateid (settlementid);

--
-- Изменить таблицу lanes_houses
--
ALTER TABLE lanes_houses
  DROP INDEX house;

ALTER TABLE lanes_houses
        ENGINE = INNODB;

ALTER TABLE lanes_houses
  ADD INDEX house (house);

--
-- Изменить таблицу lanes_houses_blocks
--
ALTER TABLE lanes_houses_blocks
ENGINE = INNODB;

ALTER TABLE lanes_houses_blocks
  ADD INDEX hgid (housingid);

--
-- Изменить таблицу lanes_housings
--
ALTER TABLE lanes_housings
ENGINE = INNODB;

ALTER TABLE lanes_housings
  ADD INDEX hid (houseid);

--
-- Изменить таблицу lanes_neighborhoods
--
ALTER TABLE lanes_neighborhoods
ENGINE = INNODB;

ALTER TABLE lanes_neighborhoods
  ADD INDEX sat (settlementid);

--
-- Изменить таблицу lanes_settlements
--
ALTER TABLE lanes_settlements
ENGINE = INNODB;

ALTER TABLE lanes_settlements
  ADD INDEX name (settlementname);

--
-- Изменить таблицу logs
--
ALTER TABLE logs
  ADD INDEX `date` (`date`);

ALTER TABLE logs
  ADD INDEX gid (gid);

ALTER TABLE logs
  ADD INDEX uid (uid);

--
-- Изменить таблицу map_criterions
--
ALTER TABLE map_criterions
  ADD INDEX id (mapid);

--
-- Изменить таблицу map_maps
--
ALTER TABLE map_maps
  ADD INDEX stuff (stuffid);

--
-- Изменить таблицу map_maps_criterions
--
ALTER TABLE map_maps_criterions
  ADD INDEX cr (criterionid);

ALTER TABLE map_maps_criterions
  ADD INDEX id (mapid);

--
-- Изменить таблицу map_maps_permissions
--
ALTER TABLE map_maps_permissions
  ADD INDEX id (mapid);

ALTER TABLE map_maps_permissions
  ADD INDEX stuff (stuffid);

--
-- Изменить таблицу map_objects
--
ALTER TABLE map_objects
  ADD INDEX map (mapid);

--
-- Изменить таблицу map_objects_criterions
--
ALTER TABLE map_objects_criterions
  ADD INDEX obj (objectid);

--
-- Изменить таблицу map_objects_devices
--
ALTER TABLE map_objects_devices
  ADD INDEX obj (objectid);

--
-- Изменить таблицу map_objects_houses
--
ALTER TABLE map_objects_houses
  ADD INDEX obj (objectid);

--
-- Изменить таблицу map_objects_lines
--
ALTER TABLE map_objects_lines
  ADD INDEX obj (objectid);

--
-- Изменить таблицу map_objects_wifis
--
ALTER TABLE map_objects_wifis
  ADD INDEX obj (objectid);

--
-- Изменить таблицу map_points
--
ALTER TABLE map_points
  ADD INDEX obj (objectid);

ALTER TABLE map_points
  ADD INDEX parent (parentid);

--
-- Изменить таблицу mod_cards_act_cards
--
ALTER TABLE mod_cards_act_cards
  ADD INDEX res (resellerid);

--
-- Изменить таблицу mod_cards_act_logs
--
ALTER TABLE mod_cards_act_logs
  ADD INDEX uid (uid);

--
-- Изменить таблицу mod_cards_errors
--
ALTER TABLE mod_cards_errors
  ADD INDEX res (resellerid);

--
-- Изменить таблицу notifications
--
ALTER TABLE notifications
  ADD INDEX act (active);

--
-- Изменить таблицу preferences
--
ALTER TABLE preferences
  ADD INDEX idname (stuffid, preferencename);

ALTER TABLE preferences
  ADD INDEX stuff (stuffid);

--
-- Изменить таблицу radnas
--
ALTER TABLE radnas
  ADD INDEX type (nastype);

--
-- Изменить таблицу radpostauthnew
--
ALTER TABLE radpostauthnew
  ADD INDEX name (username);

ALTER TABLE radpostauthnew
  ADD INDEX namedate (username, authdate);

ALTER TABLE radpostauthnew
  ADD INDEX uid (uid);

--
-- Изменить таблицу sectors
--
ALTER TABLE sectors
  ADD INDEX sector (sector);

--
-- Изменить таблицу stuff_aclid
--
ALTER TABLE stuff_aclid
ENGINE = INNODB;

--
-- Изменить таблицу stuff_aclresource
--
ALTER TABLE stuff_aclresource
ENGINE = INNODB;

--
-- Изменить таблицу stuff_aclrole
--
ALTER TABLE stuff_aclrole
ENGINE = INNODB;

--
-- Создать таблицу stuff_groups
--
CREATE TABLE stuff_groups (
  stuffid INT(10) UNSIGNED NOT NULL,
  groupid SMALLINT(5) UNSIGNED NOT NULL,
  INDEX stuffid (stuffid)
)
ENGINE = MYISAM
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Изменить таблицу switch_ip_unnumbered
--
ALTER TABLE switch_ip_unnumbered
  ADD INDEX vlanswid (vlan, swid);

--
-- Изменить таблицу switche_type
--

ALTER TABLE switche_type
 DROP INDEX swtypename;

ALTER TABLE switche_type
        ENGINE = INNODB;

ALTER TABLE switche_type
  ADD INDEX swtypename (swtypename);

--
-- Изменить таблицу switches
--
ALTER TABLE switches
ENGINE = INNODB;

ALTER TABLE switches
  ADD INDEX mac (mac);

ALTER TABLE switches
  ADD INDEX parent (parent_swid);

ALTER TABLE switches
  ADD INDEX type (swtypeid);

--
-- Изменить таблицу tickets_categories_list
--
ALTER TABLE tickets_categories_list
  ADD INDEX name (categoryname);

--
-- Изменить таблицу tickets_logs
--
ALTER TABLE tickets_logs
  DROP INDEX ticketlogid;

--
-- Изменить таблицу users
--
ALTER TABLE users
  ADD INDEX blockedinstalled (blocked, user_installed);

ALTER TABLE users
  ADD INDEX credit (credit);

ALTER TABLE users
  ADD INDEX deposit (deposit);

ALTER TABLE users
  ADD INDEX installed (user_installed);

ALTER TABLE users
  ADD INDEX localipmac (local_ip, local_mac);

ALTER TABLE users
  ADD INDEX mac (local_mac);

--
-- Создать таблицу users_groups
--
CREATE TABLE users_groups (
  uid INT(10) UNSIGNED NOT NULL,
  groupid SMALLINT(5) UNSIGNED NOT NULL,
  PRIMARY KEY (groupid)
)
ENGINE = MYISAM
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Создать таблицу usersgroups
--
CREATE TABLE usersgroups (
  usersgroupid INT(16) UNSIGNED NOT NULL AUTO_INCREMENT,
  usersgroupname VARCHAR(64) NOT NULL,
  PRIMARY KEY (usersgroupid)
)
ENGINE = MYISAM
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Создать таблицу usersgroups_staff
--
CREATE TABLE usersgroups_staff (
  stuffid INT(16) UNSIGNED NOT NULL,
  usersgroupid INT(16) UNSIGNED NOT NULL,
  INDEX stuffid (stuffid)
)
ENGINE = MYISAM
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Создать таблицу usersgroups_users
--
CREATE TABLE usersgroups_users (
  uid INT(16) UNSIGNED NOT NULL,
  usersgroupid INT(16) UNSIGNED NOT NULL,
  UNIQUE INDEX uid (uid),
  INDEX usergroupid (usersgroupid)
)
ENGINE = MYISAM
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

TRUNCATE `bugh_plategi_type` ;
TRUNCATE  `radpostauthreplymessage` ;
TRUNCATE `tickets_priorities_types` ;
TRUNCATE `tickets_status_types` ;
TRUNCATE `addons_pay_api_errortype`  ;
TRUNCATE  `logtype` ;

INSERT INTO `tickets_priorities_types` (`prioritytypeid`, `prioritytypename`) VALUES
(1, 'high'),
(2, 'normal'),
(3, 'low');

INSERT INTO `tickets_status_types` (`statustypeid`, `statustypename`) VALUES
(1, 'opened'),
(2, 'closed'),
(3, 'in_work'),
(4, 'performed');

INSERT INTO `addons_pay_api_errortype` (`result_code`, `error_meaning`) VALUES
(0, 'Платёж ожидает проверки'),
(1, 'Пользователь не найден'),
(2, 'Платёж совершён');


INSERT INTO `bugh_plategi_type` (`bughtypeid`, `typename`, `fiktivniy`) VALUES
(1, 'Абонентская плата за текущий месяц', 0),
(2, 'Абонентская плата за текущий день', 0),
(5, 'Пополнение счета', 0),
(6, 'Ошибка ввода', 0),
(7, 'Снятие со счета', 0),
(9, 'Оплата аренды внешнего IP адреса', 0),
(10, 'Перерасчет', 1),
(15, 'Премия За Общественнополезные работы', 1),
(16, 'ПОДАРОК!', 1),
(17, 'Акция', 1),
(18, 'Кредит', 1),
(20, 'Блокировка интернета в связи с окончанием сердств', 1),
(21, 'Остаточная абонплата за месяц', 0),
(22, 'Остаточная Абонентская плата за текущий месяц', 0),
(23, 'Изменение пакета с нового месяца', 1),
(24, 'Возврат из за перебоев сети', 1),
(25, 'Устранение неисправности по вине клиента', 0),
(26, 'Изменение тарифного пакета', 0),
(27, 'Подключение к компьютерной сети', 0),
(28, 'Пополнение карточкой', 0),
(29, '% за пользование кредитом', 0),
(30, 'Создание второй учетной записи', 0),
(31, 'Пополнение MobyAZS(24NonStop)', 0),
(32, 'Услуга Real IP', 1),
(33, 'Активация Акционного тарифа', 0),
(34, 'Услуга "Турбо"', 0),
(35, 'Активация услуги Кредит', 0),
(36, 'Активация услуги Кредит с %', 0),
(37, 'Пополнение OSMP', 0),
(38, 'Пополнение Liqpay', 0),
(39, 'Оплата заморозки', 0),
(40, 'Пополнение Yandex деньги', 0),
(41, 'Пополнение WebMoney', 0),
(42, 'Отключение по задолжености', 0),
(43, 'Удаление по неактивности', 0),
(44, 'Пополнение CoPayCo', 0),
(45, 'Безналичный платеж', 0),
(46, 'Активация учетки абонента', 0),
(47, 'Пополнение МТС-терминал', 0),
(48, 'Оплата Разморозки', 0),
(49, 'Возврат Абонплаты по заморозке', 0),
(50, 'Оплата Dr.Web', 0),
(51, 'Абонентская плата заморозки', 0),
(52, 'Пополнение EasySoft', 0),
(53, 'Пополнение OnePay', 0),
(54, 'Пополнение Privat24', 0),
(55, 'Пополнение CitiPay', 0),
(56, 'Пополнение Elecsnet', 0),
(57, 'Пополнение w.QiWi.ru', 0),
(58, 'Пополнение ComPay', 0),
(59, 'Пополнение RoboKassa', 0),
(60, 'Пополнение терминал Приват', 0),
(61, 'Пополнение терминал Кассира.НЕТ', 0),
(62, 'Terminal API', 0);


INSERT INTO `radpostauthreplymessage` (`replymessageid`, `replymessage`) VALUES
(1, 'Успех'),
(2, 'Несовпадение'),
(3, 'PAP Успешный вход'),
(4, 'PAP Неправильный пароль'),
(5, 'CHAP Успешный вход'),
(6, 'CHAP Неправильный пароль'),
(7, 'Инетрент у него отключен'),
(8, 'В пул без денег'),
(9, 'У абонента отключена локальная сеть'),
(10, 'Не найден в базе данных вызывающий IP/MAC'),
(11, 'Пользователь в группе отключенных'),
(12, 'Пользователь в группе удаленных'),
(13, 'IP/MAC не совпадает с привязкой'),
(14, 'Нет средств и закончилися пул без денег'),
(15, 'У абонента недостаточно средств'),
(16, 'IP уже выдан другому пользователю'),
(17, 'IP не выдан'),
(18, 'результат неопределен'),
(19, 'Учетка уже в Online'),
(20, 'Дубликат IP в Pool'),
(21, 'IP не найден в пуле'),
(22, 'Учетная запись заблокирована'),
(23, 'Закончились деньги'),
(24, '2й раз не пустим'),
(25, 'MSCHAP-v1 Успешный вход'),
(26, 'MSCHAP-v1 Неправильный пароль'),
(27, 'MSCHAP-v2 Успешный вход'),
(28, 'MSCHAP-v2 Неправильный пароль');

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
(15, 'Злонамеренные действия');

DELETE FROM `preferences` WHERE `preferencename` LIKE '%invert_edit_view_trigger_button%';