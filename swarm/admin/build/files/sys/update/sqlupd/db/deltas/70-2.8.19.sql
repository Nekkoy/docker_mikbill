SET NAMES 'utf8';

--
-- Структура таблицы `radpostauthpackettype`
--

DROP TABLE IF EXISTS `radpostauthpackettype`;
CREATE TABLE IF NOT EXISTS `radpostauthpackettype` (
`packettypeid` int(10) unsigned NOT NULL,
  `packettype` varchar(64) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=koi8r AVG_ROW_LENGTH=8192;

--
-- Дамп данных таблицы `radpostauthpackettype`
--

INSERT INTO `radpostauthpackettype` (`packettypeid`, `packettype`) VALUES
(1, 'Accept'),
(2, 'Reject'),
(5, 'Заморожен'),
(10, 'Отключен'),
(11, 'Удален');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `radpostauthpackettype`
--
ALTER TABLE `radpostauthpackettype`
 ADD PRIMARY KEY (`packettypeid`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `radpostauthpackettype`
--
ALTER TABLE `radpostauthpackettype`
MODIFY `packettypeid` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;


