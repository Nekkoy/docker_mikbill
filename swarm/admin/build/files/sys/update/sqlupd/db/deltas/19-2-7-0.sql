SET NAMES 'utf8';

DROP TABLE IF EXISTS `radpostauthreplymessage`;
CREATE TABLE IF NOT EXISTS `radpostauthreplymessage` (
  `replymessageid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `replymessage` varchar(64) NOT NULL,
  PRIMARY KEY (`replymessageid`)
) ENGINE=InnoDB  DEFAULT CHARSET=koi8r AUTO_INCREMENT=29 ;

--
-- Дамп данных таблицы `radpostauthreplymessage`
--

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

UPDATE `bugh_plategi_stat` SET `who` = NULL WHERE `who` = 255;
INSERT INTO system_options (`key`, value)
  VALUES ('baltica_bank_uid' , '1') , ('baltica_bank_uid_prio' , '1') , ('baltica_bank_login' , '1') , ('baltica_bank_login_prio' , '2');
INSERT INTO system_options (`key`, value)
  VALUES ('osmp_bank_uid' , '1') , ('osmp_bank_uid_prio' , '1') , ('osmp_bank_login' , '1') , ('osmp_bank_login_prio' , '2');
INSERT INTO system_options (`key`, value)
  VALUES ('ibox_bank_uid' , '1') , ('ibox_bank_uid_prio' , '1') , ('ibox_bank_login' , '1') , ('ibox_bank_login_prio' , '2');

--
-- Изменить таблицу lanes
--
ALTER TABLE lanes
  CHANGE COLUMN lane lane CHAR(64) NOT NULL DEFAULT '';

--
-- Изменить таблицу lanes_houses
--
ALTER TABLE lanes_houses
  CHANGE COLUMN house house CHAR(32) NOT NULL DEFAULT '';

--
-- Изменить таблицу switches
--
ALTER TABLE switches
  ADD COLUMN qnq INT(4) UNSIGNED NOT NULL DEFAULT 0 AFTER parent_swid;




