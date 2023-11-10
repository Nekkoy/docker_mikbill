--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

DROP TABLE IF EXISTS `logtype`;

CREATE TABLE IF NOT EXISTS `logtype` (
`logtypeid` smallint(10) unsigned NOT NULL,
  `logtype` char(32) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=koi8r AVG_ROW_LENGTH=35;

--
-- Дамп данных таблицы `logtype`
--

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
(15, 'Злонамеренные действия'),
(16, 'Устройства пользователя'),
(17, 'Настройки ЛК'),
(18, 'Финансы'),
(19, 'Устройства'),
(20, 'Типы устройств'),
(21, 'MBP Конструктор');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `logtype`
--
ALTER TABLE `logtype`
 ADD PRIMARY KEY (`logtypeid`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `logtype`
--
ALTER TABLE `logtype`
MODIFY `logtypeid` smallint(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;



--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
