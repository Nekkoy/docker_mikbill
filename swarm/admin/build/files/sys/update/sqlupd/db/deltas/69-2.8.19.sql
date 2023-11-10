SET NAMES 'utf8';

DROP TABLE IF EXISTS `radpostauthreplymessage`;
CREATE TABLE IF NOT EXISTS `radpostauthreplymessage` (
`replymessageid` int(10) unsigned NOT NULL,
  `replymessage` varchar(64) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=koi8r;


INSERT INTO `radpostauthreplymessage` (`replymessageid`, `replymessage`) VALUES
(1, 'Успех'),
(2, 'Несовпадение'),
(3, 'PAP Успешный вход'),
(4, 'PAP Неправильный пароль'),
(5, 'CHAP Успешный вход'),
(6, 'CHAP Неправильный пароль'),
(7, 'Интернет у него отключен'),
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
(28, 'MSCHAP-v2 Неправильный пароль'),
(29, 'Выкинуть.Accel Пополнение счета.'),
(30, 'Выкинуть.Accel Пополнение счета.'),
(31, 'Пользователь в группе неизвестные');


--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `radpostauthreplymessage`
--
ALTER TABLE `radpostauthreplymessage`
 ADD PRIMARY KEY (`replymessageid`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `radpostauthreplymessage`
--
ALTER TABLE `radpostauthreplymessage`
MODIFY `replymessageid` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;



