SET NAMES 'utf8';


--
-- Структура таблицы `switch_opt82_logtype`
--

DROP TABLE IF EXISTS `switch_opt82_logtype`;
CREATE TABLE IF NOT EXISTS `switch_opt82_logtype` (
  `logtypeid` tinyint(10) unsigned NOT NULL,
  `logtype` char(64) NOT NULL,
  `access` int(1) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=koi8r AVG_ROW_LENGTH=910;

--
-- Дамп данных таблицы `switch_opt82_logtype`
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
(18, 'найден по mac, порт/устройство не совпадают (opt82)', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `switch_opt82_logtype`
--
ALTER TABLE `switch_opt82_logtype`
  ADD PRIMARY KEY (`logtypeid`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `switch_opt82_logtype`
--
ALTER TABLE `switch_opt82_logtype`
  MODIFY `logtypeid` tinyint(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;


