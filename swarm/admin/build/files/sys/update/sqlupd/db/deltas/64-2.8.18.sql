SET NAMES 'utf8';

--
-- Структура таблицы `radpostauthpackettype`
--

DROP TABLE IF EXISTS `radpostauthpackettype`;
CREATE TABLE IF NOT EXISTS `radpostauthpackettype` (
  `packettypeid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `packettype` varchar(64) NOT NULL,
  PRIMARY KEY (`packettypeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=koi8r AVG_ROW_LENGTH=8192 AUTO_INCREMENT=12 ;

--
-- Дамп данных таблицы `radpostauthpackettype`
--

INSERT INTO `radpostauthpackettype` (`packettypeid`, `packettype`) VALUES
(1, 'Accept'),
(2, 'Reject'),
(5, 'Заморожен'),
(10, 'Отключен'),
(11, 'Удален');

