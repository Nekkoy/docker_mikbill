SET NAMES 'utf8';


DROP TABLE IF EXISTS `radacctterminatecause`;
CREATE TABLE IF NOT EXISTS `radacctterminatecause` (
  `acctterminatecauseid` int(10) unsigned NOT NULL,
  `acctterminatecause` varchar(32) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=koi8r AVG_ROW_LENGTH=1365;

--
-- Дамп данных таблицы `radacctterminatecause`
--

INSERT INTO `radacctterminatecause` (`acctterminatecauseid`, `acctterminatecause`) VALUES
(1, 'Online'),
(2, 'User-Request'),
(3, 'Admin-Reboot'),
(4, 'Admin-Reset'),
(5, 'BILL-Request'),
(6, 'User-Error'),
(7, 'Lost-Carrier'),
(8, 'Lost-Service'),
(9, 'NAS-Error'),
(10, 'NAS-Request'),
(11, 'Port-Error'),
(12, 'Service-Unavailable'),
(13, 'Double session stop');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `radacctterminatecause`
--
ALTER TABLE `radacctterminatecause`
  ADD PRIMARY KEY (`acctterminatecauseid`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `radacctterminatecause`
--
ALTER TABLE `radacctterminatecause`
  MODIFY `acctterminatecauseid` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;

