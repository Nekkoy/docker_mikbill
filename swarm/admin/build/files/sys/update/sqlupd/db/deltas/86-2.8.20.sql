SET NAMES 'utf8';

--
-- Структура таблицы `sysopts`
--

DROP TABLE IF EXISTS `sysopts`;
CREATE TABLE IF NOT EXISTS `sysopts` (
  `options_id` tinyint(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;

--
-- Дамп данных таблицы `sysopts`
--

INSERT INTO `sysopts` (`options_id`) VALUES
(1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `sysopts`
--
ALTER TABLE `sysopts`
  ADD PRIMARY KEY (`options_id`);

