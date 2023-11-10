--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `DRECrypt_tqueue` (
	`ID` INT NOT NULL AUTO_INCREMENT COMMENT 'Порядковый номер запроса' ,
	`CLASS_ID` INT NOT NULL COMMENT 'пакет каналов который активируется' ,
	`HARDWARE_ID` VARCHAR(14) NOT NULL COMMENT 'номер устройства' ,
	`STATUS` SMALLINT NOT NULL DEFAULT '0' COMMENT 'Статус обработки' ,
	`DATEADDED` DATE NOT NULL COMMENT 'Дата добавления запроса' ,
	`DATEPROCESSING` DATE NULL COMMENT 'Дата обработки запроса' ,
	`TRANSACTIONNUM` INT NULL COMMENT 'Номер транзакции оплаты услуг' ,
	`ACTION` INT NOT NULL COMMENT 'Тип команды запроса (подключить класс/пакет, отключить класс/пакет и т.д.)' ,
	`DATETIME` DATE NOT NULL COMMENT 'Дата используется в зависимости от типа команды ' ,
	`DAYCOUNT` INT NOT NULL COMMENT 'Количество дней активации пакета каналов' ,
	`USER_ID` INT NOT NULL COMMENT 'Уникальный номер пользователя в системе' ,
	`EMAIL` VARCHAR(128) NULL COMMENT 'Email пользователя' ,
	`FNAME` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Имя пользователя' ,
	`PNAME` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Отчество пользователя' ,
	`SNAME` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Фамилия пользователя' ,
	`PHONE` VARCHAR(11) NULL COMMENT 'Номер телефона пользователя' ,
	`CARD_NUM_FIRST` VARCHAR(20) NULL COMMENT 'Номер первой карты оплаты' ,
	`CARD_NUM_LAST` VARCHAR(20) NULL COMMENT 'Номер последней карты оплаты' ,
	`CARD_ID` VARCHAR(20) NULL COMMENT 'Секретный код карты оплаты' ,
	`CAS_VERSION` TINYINT NULL COMMENT 'CAS2 - 2; CAS3,CAS4 - 3' ,
	`HARDWARE_ID_CH` VARCHAR(14) NULL COMMENT 'ID устройства ' ,
	`DEVICE_MODEL_ID` INT NULL COMMENT 'Номер модели устройства' ,
	`INFOCAS_PERIOD` INT NULL COMMENT 'Период, в течение которого, соблюдая интервал, отправляется сообщение Инфокас' ,
	`INFOCAS_INTERVAL` INT NULL COMMENT 'Интервал отправки сообщения Инфокас' ,
	`INFOCAS_MESSAGE_ID` INT NULL COMMENT 'Номер сообщения Инфокас в системе SMS' ,
	`INFOCAS_MESSAGE_TEXT` VARCHAR(170) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Текст сообщения Инфокас' ,
	`COUNTER` INT NULL COMMENT 'Значение счетчика для подписки' ,
	`COUNTERUNIT` TINYINT NULL COMMENT 'Единица измерения для счетчика подписки (0 – часы, 1 - минуты, 3 – дни)' ,
	`GEOCODE` SMALLINT NULL COMMENT 'Геокод 1 – 1, Геокод 2 – 2, Геокод 3 – 4, Геокод 4 – 8, Геокод 5 – 16, Геокод 6 – 32, Геокод 7 – 64, Геокод 8 – 128, Геокод 9 – 256, удалён – 0.' ,
	`ENDDATE` DATE NOT NULL COMMENT 'Дата окончания подписки' ,
	`FINGERPRINTING_ID` INT NULL COMMENT 'Уникальный номер сообщения Fingerprinting ' ,
	`FP_DURATION` SMALLINT NULL COMMENT '1- 10080 минут' ,
	`FP_IOC` SMALLINT NULL COMMENT '1- 1440 минут' ,
	`WINDOW_TYPE` TINYINT NULL COMMENT '0 – по нажатию, 1 – по времени' ,
	`X_COORDINATE` SMALLINT NULL COMMENT '0- 65535 пикселей' ,
	`Y_COORDINATE` SMALLINT NULL COMMENT '0- 65535 пикселей' ,
	`WINDOW_TRANSPARENCY` TINYINT NULL COMMENT 'Прозрачность окна (0- 100)%' ,
	`BACKGROUND_COLOR` TINYINT NULL COMMENT '0 - white, 1 - red, 2 - orange, 3 - yellow, 4 - green, 5 - blue, 6 - dark blue, 7 - purple, 8 - black' ,
	`FONT_TRANSPARENCY` TINYINT NULL COMMENT 'Прозрачность шрифта (0- 100)%' ,
	`FONT_COLOR` TINYINT NULL COMMENT '0–белый, 1– красный, 2–оранжевый, 3– жёлтый, 4–зелёный, 5– голубой, 6–синий, 7– фиолетовый, 8-чёрный' ,
	`SHOW_TIME` SMALLINT NULL COMMENT 'Время отображения (1- 65535 секунд)' ,
	`GEOCODE_HEX` VARCHAR(16) NULL ,
	PRIMARY KEY (`ID`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

ALTER TABLE `DRECrypt_tqueue` CHANGE `ENDDATE` `ENDDATE` DATE NULL DEFAULT NULL COMMENT 'Дата окончания подписки';

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;