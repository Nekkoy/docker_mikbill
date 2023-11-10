SET NAMES 'utf8';


UPDATE `radpostauthreplymessage` SET `replymessage` = 'Интернет у него отключен'
 WHERE `radpostauthreplymessage`.`replymessageid` =7;

INSERT INTO `system_options` (`key`, `value`) VALUES
('pscb_on', '0'),
('pscb_MrchKey', ''),
('pscb_marketPlace', ''),
('pscb_test', '0');

--
-- Изменить таблицу addons_elecsnet
--
ALTER TABLE addons_elecsnet
  ADD COLUMN uid BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 AFTER accaunt;


--
-- Структура таблицы `bugh_plategi_type`
--

DROP TABLE IF EXISTS `bugh_plategi_type`;
CREATE TABLE IF NOT EXISTS `bugh_plategi_type` (
  `bughtypeid` smallint(10) unsigned NOT NULL AUTO_INCREMENT,
  `typename` char(128) NOT NULL,
  `sign` char(1) NOT NULL DEFAULT '' COMMENT 'знак +/-',
  `fictitious` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'не изменяет депозит',
  `deposit_action` char(1) NOT NULL DEFAULT '?' COMMENT 'действие над балансом',
  `deposit_action_by_user` char(1) NOT NULL DEFAULT '' COMMENT 'действие с депозитом абонентом',
  PRIMARY KEY (`bughtypeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=koi8r AUTO_INCREMENT=77 ;


TRUNCATE TABLE bugh_plategi_type;
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(1, 'Абонентская плата за текущий месяц', '+', 0, '-', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(2, 'Абонентская плата за текущий день', '+', 0, '-', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(5, 'Пополнение счета', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(6, 'Ошибка ввода', '-', 0, '-', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(7, 'Снятие со счета', '-', 0, '-', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(9, 'Оплата аренды внешнего IP адреса', '+', 0, '-', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(10, 'Перерасчет', '/', 0, '/', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(15, 'Премия За Общественнополезные работы', '+', 0, '+', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(16, 'ПОДАРОК!', '+', 0, '+', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(17, 'Акция', '+', 0, '+', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(18, 'Кредит', '', 0, '?', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(20, 'Блокировка интернета в связи с окончанием средств', '', 1, '0', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(21, 'Остаточная абонплата за месяц', '', 0, '-', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(22, 'Остаточная Абонентская плата за текущий месяц', '', 0, '-', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(23, 'Изменение пакета с нового месяца', '', 0, '?', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(24, 'Возврат из за перебоев сети', '+', 0, '+', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(25, 'Устранение неисправности по вине клиента', '-', 0, '-', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(26, 'Изменение тарифного пакета', '', 0, '?', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(27, 'Подключение к компьютерной сети', '-', 0, '-', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(28, 'Пополнение карточкой', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(29, '% за пользование кредитом', '', 0, '-', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(30, 'Создание второй учетной записи', '-', 0, '-', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(31, 'Пополнение MobyAZS(24NonStop)', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(32, 'Услуга Real IP', '', 0, '-', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(33, 'Активация Акционного тарифа', '', 0, '?', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(34, 'Услуга "Турбо"', '', 0, '?', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(35, 'Активация услуги Кредит', '', 0, '?', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(36, 'Активация услуги Кредит с %', '', 0, '?', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(37, 'Пополнение OSMP', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(38, 'Пополнение Liqpay', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(39, 'Оплата заморозки', '', 0, '-', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(40, 'Пополнение Yandex деньги', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(41, 'Пополнение WebMoney', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(42, 'Отключение по задолженности', '', 1, '0', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(43, 'Удаление по неактивности', '', 1, '0', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(44, 'Пополнение CoPayCo', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(45, 'Безналичный платеж', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(46, 'Активация учетки абонента', '', 0, '-', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(47, 'Пополнение МТС-терминал', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(48, 'Оплата Разморозки', '', 0, '-', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(49, 'Возврат Абонплаты по заморозке', '+', 0, '+', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(50, 'Оплата Dr.Web', '', 0, '-', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(51, 'Абонентская плата заморозки', '+', 0, '-', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(52, 'Пополнение EasySoft', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(53, 'Пополнение OnePay', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(54, 'Пополнение Privat24', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(55, 'Пополнение CitiPay', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(56, 'Пополнение Elecsnet', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(57, 'Пополнение w.QiWi.ru', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(58, 'Пополнение ComPay', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(59, 'Пополнение RoboKassa', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(60, 'Пополнение терминал Приват', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(61, 'Пополнение терминал Кассира.НЕТ', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(62, 'API', '/', 0, '/', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(63, 'Пополнение терминал Платёжка (Банк нац. кредит)', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(64, 'Плата за покупку устройства', '', 0, '-', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(65, 'Плата за аренду устройства', '+', 0, '-', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(66, 'Пополнение терминал Pegas', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(67, 'Пополнение iBox', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(68, 'Пополнение Приват (v.2)', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(69, 'Пополнение Балтика Банк', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(70, 'Пополнение Приват Р/С', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(71, 'Пополнение E-Pay.com.ua', '+', 0, '+', '+');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(72, 'Перевод средств абоненту', '-', 0, '-', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(73, 'Перевод средств от абонента', '+', 0, '+', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(74, 'Комиссия за перевод средств абоненту', '-', 0, '-', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(75, 'Возврат абонплаты при смене тарифа', '+', 0, '+', '');
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES
(76, 'Пополнение СберБанк России', '+', 0, '+', '+');


