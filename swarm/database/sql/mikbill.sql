-- MySQL dump 10.13  Distrib 8.0.34-26, for Linux (x86_64)
--
-- Host: mysql_balancer    Database: mikbill
-- ------------------------------------------------------
-- Server version	8.0.33-25.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!50717 SELECT COUNT(*) INTO @rocksdb_has_p_s_session_variables FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'session_variables' */;
/*!50717 SET @rocksdb_get_is_supported = IF (@rocksdb_has_p_s_session_variables, 'SELECT COUNT(*) INTO @rocksdb_is_supported FROM performance_schema.session_variables WHERE VARIABLE_NAME=\'rocksdb_bulk_load\'', 'SELECT 0') */;
/*!50717 PREPARE s FROM @rocksdb_get_is_supported */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;
/*!50717 SET @rocksdb_enable_bulk_load = IF (@rocksdb_is_supported, 'SET SESSION rocksdb_bulk_load = 1', 'SET @rocksdb_dummy_bulk_load = 0') */;
/*!50717 PREPARE s FROM @rocksdb_enable_bulk_load */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;

--
-- Table structure for table `DRECrypt_tqueue`
--

DROP TABLE IF EXISTS `DRECrypt_tqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DRECrypt_tqueue` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT 'Порядковый номер запроса',
  `CLASS_ID` int NOT NULL COMMENT 'пакет каналов который активируется',
  `HARDWARE_ID` varchar(14) NOT NULL COMMENT 'номер устройства',
  `STATUS` smallint NOT NULL DEFAULT '0' COMMENT 'Статус обработки',
  `DATEADDED` date NOT NULL COMMENT 'Дата добавления запроса',
  `DATEPROCESSING` date DEFAULT NULL COMMENT 'Дата обработки запроса',
  `TRANSACTIONNUM` int DEFAULT NULL COMMENT 'Номер транзакции оплаты услуг',
  `ACTION` int NOT NULL COMMENT 'Тип команды запроса (подключить класс/пакет, отключить класс/пакет и т.д.)',
  `DATETIME` date NOT NULL COMMENT 'Дата используется в зависимости от типа команды ',
  `DAYCOUNT` int NOT NULL COMMENT 'Количество дней активации пакета каналов',
  `USER_ID` int NOT NULL COMMENT 'Уникальный номер пользователя в системе',
  `EMAIL` varchar(128) DEFAULT NULL COMMENT 'Email пользователя',
  `FNAME` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Имя пользователя',
  `PNAME` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Отчество пользователя',
  `SNAME` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Фамилия пользователя',
  `PHONE` varchar(11) DEFAULT NULL COMMENT 'Номер телефона пользователя',
  `CARD_NUM_FIRST` varchar(20) DEFAULT NULL COMMENT 'Номер первой карты оплаты',
  `CARD_NUM_LAST` varchar(20) DEFAULT NULL COMMENT 'Номер последней карты оплаты',
  `CARD_ID` varchar(20) DEFAULT NULL COMMENT 'Секретный код карты оплаты',
  `CAS_VERSION` tinyint DEFAULT NULL COMMENT 'CAS2 - 2; CAS3,CAS4 - 3',
  `HARDWARE_ID_CH` varchar(14) DEFAULT NULL COMMENT 'ID устройства ',
  `DEVICE_MODEL_ID` int DEFAULT NULL COMMENT 'Номер модели устройства',
  `INFOCAS_PERIOD` int DEFAULT NULL COMMENT 'Период, в течение которого, соблюдая интервал, отправляется сообщение Инфокас',
  `INFOCAS_INTERVAL` int DEFAULT NULL COMMENT 'Интервал отправки сообщения Инфокас',
  `INFOCAS_MESSAGE_ID` int DEFAULT NULL COMMENT 'Номер сообщения Инфокас в системе SMS',
  `INFOCAS_MESSAGE_TEXT` varchar(170) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Текст сообщения Инфокас',
  `COUNTER` int DEFAULT NULL COMMENT 'Значение счетчика для подписки',
  `COUNTERUNIT` tinyint DEFAULT NULL COMMENT 'Единица измерения для счетчика подписки (0 – часы, 1 - минуты, 3 – дни)',
  `GEOCODE` smallint DEFAULT NULL COMMENT 'Геокод 1 – 1, Геокод 2 – 2, Геокод 3 – 4, Геокод 4 – 8, Геокод 5 – 16, Геокод 6 – 32, Геокод 7 – 64, Геокод 8 – 128, Геокод 9 – 256, удалён – 0.',
  `ENDDATE` date DEFAULT NULL COMMENT 'Дата окончания подписки',
  `FINGERPRINTING_ID` int DEFAULT NULL COMMENT 'Уникальный номер сообщения Fingerprinting ',
  `FP_DURATION` smallint DEFAULT NULL COMMENT '1- 10080 минут',
  `FP_IOC` smallint DEFAULT NULL COMMENT '1- 1440 минут',
  `WINDOW_TYPE` tinyint DEFAULT NULL COMMENT '0 – по нажатию, 1 – по времени',
  `X_COORDINATE` smallint DEFAULT NULL COMMENT '0- 65535 пикселей',
  `Y_COORDINATE` smallint DEFAULT NULL COMMENT '0- 65535 пикселей',
  `WINDOW_TRANSPARENCY` tinyint DEFAULT NULL COMMENT 'Прозрачность окна (0- 100)%',
  `BACKGROUND_COLOR` tinyint DEFAULT NULL COMMENT '0 - white, 1 - red, 2 - orange, 3 - yellow, 4 - green, 5 - blue, 6 - dark blue, 7 - purple, 8 - black',
  `FONT_TRANSPARENCY` tinyint DEFAULT NULL COMMENT 'Прозрачность шрифта (0- 100)%',
  `FONT_COLOR` tinyint DEFAULT NULL COMMENT '0–белый, 1– красный, 2–оранжевый, 3– жёлтый, 4–зелёный, 5– голубой, 6–синий, 7– фиолетовый, 8-чёрный',
  `SHOW_TIME` smallint DEFAULT NULL COMMENT 'Время отображения (1- 65535 секунд)',
  `GEOCODE_HEX` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DRECrypt_tqueue`
--

LOCK TABLES `DRECrypt_tqueue` WRITE;
/*!40000 ALTER TABLE `DRECrypt_tqueue` DISABLE KEYS */;
/*!40000 ALTER TABLE `DRECrypt_tqueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!50001 DROP VIEW IF EXISTS `actions`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `actions` AS SELECT 
 1 AS `user`,
 1 AS `gid`,
 1 AS `id`,
 1 AS `unique_id`,
 1 AS `time_on`,
 1 AS `start_time`,
 1 AS `stop_time`,
 1 AS `in_bytes`,
 1 AS `out_bytes`,
 1 AS `ip`,
 1 AS `server`,
 1 AS `client_ip`,
 1 AS `call_to`,
 1 AS `call_from`,
 1 AS `connect_info`,
 1 AS `terminate_cause`,
 1 AS `last_change`,
 1 AS `before_billing`,
 1 AS `billing_minus`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `addons_2click`
--

DROP TABLE IF EXISTS `addons_2click`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_2click` (
  `pay_id` char(64) NOT NULL DEFAULT '',
  `service_id` char(20) NOT NULL,
  `uid` int DEFAULT NULL,
  `trade_point` char(20) NOT NULL,
  `pay_account` char(20) NOT NULL,
  `pay_amount` double(14,2) DEFAULT NULL,
  `receipt_num` char(32) DEFAULT NULL,
  `time_stamp` char(32) NOT NULL,
  `status_code` char(5) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_2click`
--

LOCK TABLES `addons_2click` WRITE;
/*!40000 ALTER TABLE `addons_2click` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_2click` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_abank`
--

DROP TABLE IF EXISTS `addons_abank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_abank` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned NOT NULL,
  `amount` double(16,2) NOT NULL,
  `txn_id` bigint unsigned NOT NULL,
  `txn_date` datetime DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_abank`
--

LOCK TABLES `addons_abank` WRITE;
/*!40000 ALTER TABLE `addons_abank` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_abank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_absebbankas`
--

DROP TABLE IF EXISTS `addons_absebbankas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_absebbankas` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `txn_date` datetime DEFAULT NULL,
  `txn_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_latvian_ci DEFAULT NULL,
  `account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_latvian_ci DEFAULT NULL,
  `fio` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_latvian_ci DEFAULT NULL,
  `comment` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_latvian_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_absebbankas`
--

LOCK TABLES `addons_absebbankas` WRITE;
/*!40000 ALTER TABLE `addons_absebbankas` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_absebbankas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_alfabankru`
--

DROP TABLE IF EXISTS `addons_alfabankru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_alfabankru` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` varchar(128) DEFAULT NULL,
  `txn_date` datetime DEFAULT NULL,
  `account` varchar(128) DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_alfabankru`
--

LOCK TABLES `addons_alfabankru` WRITE;
/*!40000 ALTER TABLE `addons_alfabankru` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_alfabankru` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_alltime24`
--

DROP TABLE IF EXISTS `addons_alltime24`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_alltime24` (
  `pay_id` char(64) NOT NULL DEFAULT '',
  `service_id` char(20) NOT NULL,
  `uid` int DEFAULT NULL,
  `trade_point` char(20) NOT NULL,
  `pay_account` char(20) NOT NULL,
  `pay_amount` double(14,2) DEFAULT NULL,
  `receipt_num` char(32) DEFAULT NULL,
  `time_stamp` char(32) NOT NULL,
  `status_code` char(5) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_alltime24`
--

LOCK TABLES `addons_alltime24` WRITE;
/*!40000 ALTER TABLE `addons_alltime24` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_alltime24` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_autopayments`
--

DROP TABLE IF EXISTS `addons_autopayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_autopayments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` int unsigned DEFAULT NULL,
  `bughtypeid` int unsigned DEFAULT NULL,
  `tnx_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `card` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `date_add` datetime DEFAULT NULL,
  `status` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uid` (`uid`) USING BTREE,
  FULLTEXT KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_autopayments`
--

LOCK TABLES `addons_autopayments` WRITE;
/*!40000 ALTER TABLE `addons_autopayments` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_autopayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_baltica_bank`
--

DROP TABLE IF EXISTS `addons_baltica_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_baltica_bank` (
  `prv_txn` int unsigned NOT NULL AUTO_INCREMENT,
  `txn_id` char(64) NOT NULL DEFAULT '',
  `check_time` datetime NOT NULL,
  `time_from_osmp` char(20) DEFAULT NULL,
  `uid` bigint unsigned NOT NULL,
  `account` char(20) NOT NULL,
  `sum` double(14,2) DEFAULT NULL,
  `time_stamp` datetime NOT NULL,
  PRIMARY KEY (`prv_txn`),
  KEY `time` (`check_time`),
  KEY `timstamp` (`time_stamp`),
  KEY `uid` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_baltica_bank`
--

LOCK TABLES `addons_baltica_bank` WRITE;
/*!40000 ALTER TABLE `addons_baltica_bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_baltica_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_blocked_for_payment`
--

DROP TABLE IF EXISTS `addons_blocked_for_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_blocked_for_payment` (
  `uid` bigint unsigned NOT NULL,
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='блокируем пополнение';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_blocked_for_payment`
--

LOCK TABLES `addons_blocked_for_payment` WRITE;
/*!40000 ALTER TABLE `addons_blocked_for_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_blocked_for_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_citypay`
--

DROP TABLE IF EXISTS `addons_citypay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_citypay` (
  `TransactionExt` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned NOT NULL,
  `TransactionId` bigint unsigned NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Amount` double(14,2) NOT NULL,
  `TerminalId` int unsigned NOT NULL,
  `status` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`TransactionExt`),
  KEY `time` (`order_date`),
  KEY `uid-time` (`uid`,`order_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_citypay`
--

LOCK TABLES `addons_citypay` WRITE;
/*!40000 ALTER TABLE `addons_citypay` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_citypay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_citypaypr`
--

DROP TABLE IF EXISTS `addons_citypaypr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_citypaypr` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` char(36) NOT NULL,
  `txn_date` datetime DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_citypaypr`
--

LOCK TABLES `addons_citypaypr` WRITE;
/*!40000 ALTER TABLE `addons_citypaypr` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_citypaypr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_ckassa`
--

DROP TABLE IF EXISTS `addons_ckassa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_ckassa` (
  `reg_id` int unsigned NOT NULL AUTO_INCREMENT,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` bigint unsigned NOT NULL DEFAULT '0',
  `account` varchar(128) NOT NULL,
  `amount` double(16,2) NOT NULL DEFAULT '0.00',
  `pay_id` varchar(50) NOT NULL DEFAULT '',
  `agent_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pay_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`reg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=16384;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_ckassa`
--

LOCK TABLES `addons_ckassa` WRITE;
/*!40000 ALTER TABLE `addons_ckassa` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_ckassa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_click`
--

DROP TABLE IF EXISTS `addons_click`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_click` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` varchar(128) DEFAULT NULL,
  `service_id` bigint DEFAULT NULL,
  `click_paydoc_id` bigint DEFAULT NULL,
  `merchant_trans_id` bigint DEFAULT NULL,
  `error` bigint DEFAULT NULL,
  `error_note` varchar(128) DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=151;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_click`
--

LOCK TABLES `addons_click` WRITE;
/*!40000 ALTER TABLE `addons_click` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_click` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_cloudpayments`
--

DROP TABLE IF EXISTS `addons_cloudpayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_cloudpayments` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` int DEFAULT NULL,
  `txn_date` datetime DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_cloudpayments`
--

LOCK TABLES `addons_cloudpayments` WRITE;
/*!40000 ALTER TABLE `addons_cloudpayments` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_cloudpayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_compay`
--

DROP TABLE IF EXISTS `addons_compay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_compay` (
  `paymentid` int NOT NULL AUTO_INCREMENT,
  `service_id` int unsigned NOT NULL,
  `accaunt` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_payment` bigint unsigned NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sum` double(14,2) NOT NULL,
  `status` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `date` char(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`paymentid`),
  KEY `status` (`status`),
  KEY `time` (`order_date`),
  KEY `uid-time` (`accaunt`,`order_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_compay`
--

LOCK TABLES `addons_compay` WRITE;
/*!40000 ALTER TABLE `addons_compay` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_compay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_creditpilot`
--

DROP TABLE IF EXISTS `addons_creditpilot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_creditpilot` (
  `prv_txn` bigint unsigned NOT NULL AUTO_INCREMENT,
  `txn_id` char(64) NOT NULL DEFAULT '',
  `check_time` datetime NOT NULL,
  `time_from_osmp` char(20) DEFAULT NULL,
  `accaunt` char(20) NOT NULL,
  `sum` double(14,2) DEFAULT NULL,
  `time_stamp` datetime NOT NULL,
  PRIMARY KEY (`prv_txn`),
  KEY `time` (`check_time`),
  KEY `timstamp` (`time_stamp`),
  KEY `uid` (`accaunt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_creditpilot`
--

LOCK TABLES `addons_creditpilot` WRITE;
/*!40000 ALTER TABLE `addons_creditpilot` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_creditpilot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_crpsouth`
--

DROP TABLE IF EXISTS `addons_crpsouth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_crpsouth` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned NOT NULL,
  `account` varchar(64) NOT NULL DEFAULT '',
  `txn_id` bigint unsigned NOT NULL,
  `sum` double(14,2) DEFAULT NULL,
  `txn_date` datetime NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_crpsouth`
--

LOCK TABLES `addons_crpsouth` WRITE;
/*!40000 ALTER TABLE `addons_crpsouth` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_crpsouth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_cyberplat`
--

DROP TABLE IF EXISTS `addons_cyberplat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_cyberplat` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned NOT NULL,
  `receipt_id` bigint unsigned NOT NULL,
  `amount` double(14,2) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_cyberplat`
--

LOCK TABLES `addons_cyberplat` WRITE;
/*!40000 ALTER TABLE `addons_cyberplat` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_cyberplat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_e_pay_com_ua`
--

DROP TABLE IF EXISTS `addons_e_pay_com_ua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_e_pay_com_ua` (
  `prv_txn` int unsigned NOT NULL AUTO_INCREMENT,
  `txn_id` bigint unsigned NOT NULL,
  `check_time` datetime NOT NULL,
  `txn_date` datetime DEFAULT NULL,
  `uid` bigint unsigned NOT NULL DEFAULT '0',
  `account` varchar(64) NOT NULL,
  `sum` double(14,2) DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`prv_txn`),
  KEY `time` (`check_time`),
  KEY `timstamp` (`time_stamp`),
  KEY `uid` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_e_pay_com_ua`
--

LOCK TABLES `addons_e_pay_com_ua` WRITE;
/*!40000 ALTER TABLE `addons_e_pay_com_ua` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_e_pay_com_ua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_easypay`
--

DROP TABLE IF EXISTS `addons_easypay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_easypay` (
  `paymentid` int NOT NULL AUTO_INCREMENT,
  `service_id` int unsigned NOT NULL,
  `uid` bigint unsigned NOT NULL,
  `OrderId` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Amount` double(14,2) NOT NULL,
  `status` tinyint unsigned NOT NULL DEFAULT '0',
  `cancel` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paymentid`),
  KEY `time` (`order_date`),
  KEY `uid-time` (`uid`,`order_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AVG_ROW_LENGTH=95;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_easypay`
--

LOCK TABLES `addons_easypay` WRITE;
/*!40000 ALTER TABLE `addons_easypay` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_easypay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_easypayarmenia`
--

DROP TABLE IF EXISTS `addons_easypayarmenia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_easypayarmenia` (
  `txn_id` int NOT NULL AUTO_INCREMENT,
  `uid` int unsigned NOT NULL DEFAULT '0',
  `amount` double(20,6) NOT NULL DEFAULT '0.000000',
  `txn_date` datetime DEFAULT NULL,
  `server_date` datetime DEFAULT NULL,
  `status` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`txn_id`) USING BTREE,
  KEY `txn_date` (`txn_date`) USING BTREE,
  KEY `server_date` (`server_date`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_easypayarmenia`
--

LOCK TABLES `addons_easypayarmenia` WRITE;
/*!40000 ALTER TABLE `addons_easypayarmenia` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_easypayarmenia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_easysoft`
--

DROP TABLE IF EXISTS `addons_easysoft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_easysoft` (
  `paymentid` int NOT NULL AUTO_INCREMENT,
  `service_id` int unsigned NOT NULL,
  `uid` bigint unsigned NOT NULL,
  `OrderId` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Amount` double(14,2) NOT NULL,
  `status` tinyint unsigned NOT NULL DEFAULT '0',
  `cancel` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paymentid`),
  KEY `time` (`order_date`),
  KEY `uid-time` (`uid`,`order_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_easysoft`
--

LOCK TABLES `addons_easysoft` WRITE;
/*!40000 ALTER TABLE `addons_easysoft` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_easysoft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_ekassir`
--

DROP TABLE IF EXISTS `addons_ekassir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_ekassir` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` char(36) NOT NULL,
  `txn_date` datetime DEFAULT NULL,
  `check_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_ekassir`
--

LOCK TABLES `addons_ekassir` WRITE;
/*!40000 ALTER TABLE `addons_ekassir` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_ekassir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_elecsnet`
--

DROP TABLE IF EXISTS `addons_elecsnet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_elecsnet` (
  `prv_txn` int unsigned NOT NULL AUTO_INCREMENT,
  `txn_id` char(64) NOT NULL DEFAULT '',
  `check_time` datetime NOT NULL,
  `time_from_osmp` char(20) DEFAULT NULL,
  `accaunt` char(20) NOT NULL,
  `uid` bigint unsigned NOT NULL DEFAULT '0',
  `sum` double(14,2) DEFAULT NULL,
  `time_stamp` datetime NOT NULL,
  `type` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`prv_txn`),
  KEY `time` (`check_time`),
  KEY `timstamp` (`time_stamp`),
  KEY `uid` (`accaunt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_elecsnet`
--

LOCK TABLES `addons_elecsnet` WRITE;
/*!40000 ALTER TABLE `addons_elecsnet` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_elecsnet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_familny`
--

DROP TABLE IF EXISTS `addons_familny`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_familny` (
  `pay_id` char(64) NOT NULL DEFAULT '',
  `service_id` char(20) NOT NULL,
  `uid` int DEFAULT NULL,
  `trade_point` char(20) NOT NULL,
  `pay_account` char(20) NOT NULL,
  `pay_amount` double(14,2) DEFAULT NULL,
  `receipt_num` char(32) DEFAULT NULL,
  `time_stamp` char(32) NOT NULL,
  `status_code` char(5) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_familny`
--

LOCK TABLES `addons_familny` WRITE;
/*!40000 ALTER TABLE `addons_familny` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_familny` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_fcsistema`
--

DROP TABLE IF EXISTS `addons_fcsistema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_fcsistema` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` char(36) NOT NULL,
  `txn_date` datetime DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=16384;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_fcsistema`
--

LOCK TABLES `addons_fcsistema` WRITE;
/*!40000 ALTER TABLE `addons_fcsistema` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_fcsistema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_fondy`
--

DROP TABLE IF EXISTS `addons_fondy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_fondy` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `order_time` varchar(30) NOT NULL,
  `txn_id` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_fondy`
--

LOCK TABLES `addons_fondy` WRITE;
/*!40000 ALTER TABLE `addons_fondy` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_fondy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_freedompay`
--

DROP TABLE IF EXISTS `addons_freedompay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_freedompay` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` varchar(128) NOT NULL,
  `txn_date` datetime DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_freedompay`
--

LOCK TABLES `addons_freedompay` WRITE;
/*!40000 ALTER TABLE `addons_freedompay` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_freedompay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_globalmoney`
--

DROP TABLE IF EXISTS `addons_globalmoney`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_globalmoney` (
  `paymentid` int NOT NULL AUTO_INCREMENT,
  `service_id` int unsigned NOT NULL,
  `uid` bigint unsigned NOT NULL,
  `OrderId` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Amount` double(14,2) NOT NULL,
  `status` tinyint unsigned NOT NULL DEFAULT '0',
  `cancel` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`paymentid`) USING BTREE,
  KEY `time` (`order_date`) USING BTREE,
  KEY `uid-time` (`uid`,`order_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_globalmoney`
--

LOCK TABLES `addons_globalmoney` WRITE;
/*!40000 ALTER TABLE `addons_globalmoney` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_globalmoney` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_gorod`
--

DROP TABLE IF EXISTS `addons_gorod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_gorod` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `account` char(50) NOT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `payid` char(50) DEFAULT NULL,
  `service` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_gorod`
--

LOCK TABLES `addons_gorod` WRITE;
/*!40000 ALTER TABLE `addons_gorod` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_gorod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_ibox`
--

DROP TABLE IF EXISTS `addons_ibox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_ibox` (
  `order_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint DEFAULT NULL,
  `txn_id` varchar(128) CHARACTER SET koi8r COLLATE koi8r_general_ci DEFAULT NULL,
  `txn_date` datetime DEFAULT NULL,
  `account` varchar(128) CHARACTER SET koi8r COLLATE koi8r_general_ci DEFAULT NULL,
  `amount` double(14,2) DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`),
  KEY `timstamp` (`server_time`),
  KEY `uid` (`account`),
  KEY `uid_2` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_ibox`
--

LOCK TABLES `addons_ibox` WRITE;
/*!40000 ALTER TABLE `addons_ibox` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_ibox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_integra`
--

DROP TABLE IF EXISTS `addons_integra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_integra` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` char(36) NOT NULL,
  `txn_date` datetime DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_integra`
--

LOCK TABLES `addons_integra` WRITE;
/*!40000 ALTER TABLE `addons_integra` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_integra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_ipay`
--

DROP TABLE IF EXISTS `addons_ipay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_ipay` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `order_time` datetime DEFAULT NULL,
  `ident` char(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_ipay`
--

LOCK TABLES `addons_ipay` WRITE;
/*!40000 ALTER TABLE `addons_ipay` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_ipay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_isbank`
--

DROP TABLE IF EXISTS `addons_isbank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_isbank` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` char(36) NOT NULL,
  `txn_date` datetime DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_isbank`
--

LOCK TABLES `addons_isbank` WRITE;
/*!40000 ALTER TABLE `addons_isbank` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_isbank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_kaspi`
--

DROP TABLE IF EXISTS `addons_kaspi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_kaspi` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` varchar(128) DEFAULT NULL,
  `txn_date` datetime DEFAULT NULL,
  `account` varchar(128) DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_kaspi`
--

LOCK TABLES `addons_kaspi` WRITE;
/*!40000 ALTER TABLE `addons_kaspi` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_kaspi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_kassira_net`
--

DROP TABLE IF EXISTS `addons_kassira_net`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_kassira_net` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` int unsigned NOT NULL,
  `terminal_id` int NOT NULL,
  `transaction_id` int NOT NULL,
  `sum` double(14,2) NOT NULL,
  `service_code` varchar(64) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_kassira_net`
--

LOCK TABLES `addons_kassira_net` WRITE;
/*!40000 ALTER TABLE `addons_kassira_net` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_kassira_net` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_kirovskpochta`
--

DROP TABLE IF EXISTS `addons_kirovskpochta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_kirovskpochta` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` char(36) NOT NULL,
  `txn_date` datetime DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=16384;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_kirovskpochta`
--

LOCK TABLES `addons_kirovskpochta` WRITE;
/*!40000 ALTER TABLE `addons_kirovskpochta` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_kirovskpochta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_liqpay`
--

DROP TABLE IF EXISTS `addons_liqpay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_liqpay` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `merchant_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `currency` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `uid` bigint NOT NULL,
  `amount` double(14,2) DEFAULT NULL,
  `description` char(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `code` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `transaction_id` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `pay_way` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `sender_phone` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `date` (`order_date`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_liqpay`
--

LOCK TABLES `addons_liqpay` WRITE;
/*!40000 ALTER TABLE `addons_liqpay` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_liqpay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_luminorbank`
--

DROP TABLE IF EXISTS `addons_luminorbank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_luminorbank` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `txn_date` datetime DEFAULT NULL,
  `txn_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_latvian_ci DEFAULT NULL,
  `account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_latvian_ci DEFAULT NULL,
  `fio` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_latvian_ci DEFAULT NULL,
  `comment` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_latvian_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_luminorbank`
--

LOCK TABLES `addons_luminorbank` WRITE;
/*!40000 ALTER TABLE `addons_luminorbank` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_luminorbank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_maxima`
--

DROP TABLE IF EXISTS `addons_maxima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_maxima` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `txn_date` datetime DEFAULT NULL,
  `txn_id` char(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `account` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `comment` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_maxima`
--

LOCK TABLES `addons_maxima` WRITE;
/*!40000 ALTER TABLE `addons_maxima` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_maxima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_mkb`
--

DROP TABLE IF EXISTS `addons_mkb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_mkb` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned NOT NULL,
  `txn_id` bigint unsigned NOT NULL,
  `sum` double(14,2) DEFAULT NULL,
  `txn_date` datetime NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_mkb`
--

LOCK TABLES `addons_mkb` WRITE;
/*!40000 ALTER TABLE `addons_mkb` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_mkb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_monobank`
--

DROP TABLE IF EXISTS `addons_monobank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_monobank` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` char(36) NOT NULL,
  `txn_date` datetime DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=16384;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_monobank`
--

LOCK TABLES `addons_monobank` WRITE;
/*!40000 ALTER TABLE `addons_monobank` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_monobank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_nkorr`
--

DROP TABLE IF EXISTS `addons_nkorr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_nkorr` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` char(36) NOT NULL,
  `txn_date` datetime DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=16384;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_nkorr`
--

LOCK TABLES `addons_nkorr` WRITE;
/*!40000 ALTER TABLE `addons_nkorr` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_nkorr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_nonstop`
--

DROP TABLE IF EXISTS `addons_nonstop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_nonstop` (
  `pay_id` char(64) NOT NULL DEFAULT '',
  `service_id` char(20) NOT NULL,
  `trade_point` char(20) NOT NULL,
  `pay_accaunt` char(20) NOT NULL,
  `pay_amount` double(14,2) DEFAULT NULL,
  `receipt_num` char(32) DEFAULT NULL,
  `time_stamp` char(32) NOT NULL,
  `status_code` char(5) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `date` (`date`),
  KEY `time` (`time_stamp`),
  KEY `uid` (`pay_accaunt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_nonstop`
--

LOCK TABLES `addons_nonstop` WRITE;
/*!40000 ALTER TABLE `addons_nonstop` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_nonstop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_novakom`
--

DROP TABLE IF EXISTS `addons_novakom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_novakom` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `txn_date` datetime DEFAULT NULL,
  `txn_id` char(25) DEFAULT NULL,
  `account` varchar(128) DEFAULT NULL,
  `comment` varchar(128) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_novakom`
--

LOCK TABLES `addons_novakom` WRITE;
/*!40000 ALTER TABLE `addons_novakom` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_novakom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_novakom_street`
--

DROP TABLE IF EXISTS `addons_novakom_street`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_novakom_street` (
  `code_s` int unsigned DEFAULT NULL,
  `name_street` varchar(128) DEFAULT NULL,
  `name_sr` varchar(128) DEFAULT NULL,
  `name_su` varchar(128) DEFAULT NULL,
  `name_town` varchar(128) DEFAULT NULL,
  `code_t` int DEFAULT '1',
  UNIQUE KEY `code_s` (`code_s`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_novakom_street`
--

LOCK TABLES `addons_novakom_street` WRITE;
/*!40000 ALTER TABLE `addons_novakom_street` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_novakom_street` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_onpay`
--

DROP TABLE IF EXISTS `addons_onpay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_onpay` (
  `payid` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned NOT NULL,
  `order_amount` float(14,2) NOT NULL,
  `order_currency` char(3) NOT NULL,
  `type` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `comment` varchar(255) NOT NULL,
  `paymentDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `onpay_id` int unsigned NOT NULL,
  `user_phone` varchar(16) NOT NULL,
  PRIMARY KEY (`payid`),
  KEY `paymentDateTime` (`paymentDateTime`,`onpay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_onpay`
--

LOCK TABLES `addons_onpay` WRITE;
/*!40000 ALTER TABLE `addons_onpay` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_onpay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_osmp`
--

DROP TABLE IF EXISTS `addons_osmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_osmp` (
  `prv_txn` bigint unsigned NOT NULL AUTO_INCREMENT,
  `txn_id` char(64) NOT NULL DEFAULT '',
  `check_time` datetime NOT NULL,
  `time_from_osmp` char(20) DEFAULT NULL,
  `accaunt` char(20) NOT NULL,
  `sum` double(14,2) DEFAULT NULL,
  `time_stamp` datetime NOT NULL,
  PRIMARY KEY (`prv_txn`),
  KEY `time` (`check_time`),
  KEY `timstamp` (`time_stamp`),
  KEY `uid` (`accaunt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_osmp`
--

LOCK TABLES `addons_osmp` WRITE;
/*!40000 ALTER TABLE `addons_osmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_osmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_pay_api`
--

DROP TABLE IF EXISTS `addons_pay_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_pay_api` (
  `record_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` bigint unsigned NOT NULL DEFAULT '0',
  `misc_id` varchar(128) NOT NULL DEFAULT '',
  `category` smallint NOT NULL DEFAULT '0',
  `user_ref` bigint unsigned NOT NULL,
  `amount` decimal(19,4) NOT NULL,
  `creation_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `status` smallint NOT NULL DEFAULT '0',
  `comment` varchar(128) NOT NULL,
  UNIQUE KEY `id` (`record_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_pay_api`
--

LOCK TABLES `addons_pay_api` WRITE;
/*!40000 ALTER TABLE `addons_pay_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_pay_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_pay_api_category`
--

DROP TABLE IF EXISTS `addons_pay_api_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_pay_api_category` (
  `category` smallint NOT NULL,
  `categoryname` varchar(64) NOT NULL,
  `description` varchar(256) NOT NULL DEFAULT '',
  `show_in_final_report` tinyint NOT NULL DEFAULT '0' COMMENT 'отображать в "итоговом отчёте"',
  `order_in_final_report` int unsigned NOT NULL DEFAULT '0' COMMENT 'Порядок показа в итоговом отчете',
  `send_pay_sms` tinyint NOT NULL DEFAULT '0',
  UNIQUE KEY `category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_pay_api_category`
--

LOCK TABLES `addons_pay_api_category` WRITE;
/*!40000 ALTER TABLE `addons_pay_api_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_pay_api_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_pay_api_status`
--

DROP TABLE IF EXISTS `addons_pay_api_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_pay_api_status` (
  `status` smallint NOT NULL,
  `statusname` varchar(128) NOT NULL,
  PRIMARY KEY (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_pay_api_status`
--

LOCK TABLES `addons_pay_api_status` WRITE;
/*!40000 ALTER TABLE `addons_pay_api_status` DISABLE KEYS */;
INSERT INTO `addons_pay_api_status` VALUES (0,'Ожидает обработки'),(1,'Зачислен активному пользователю'),(2,'Зачислен замороженному пользователю'),(3,'Зачислен отключенному пользователю'),(4,'Зачислен удаленному пользователю'),(5,'Не обработан (пользователь не найден)');
/*!40000 ALTER TABLE `addons_pay_api_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_payberry`
--

DROP TABLE IF EXISTS `addons_payberry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_payberry` (
  `TransactionExt` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned NOT NULL,
  `TransactionId` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Amount` double(14,2) NOT NULL,
  `TerminalId` int unsigned NOT NULL,
  `status` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`TransactionExt`),
  KEY `time` (`order_date`),
  KEY `uid-time` (`uid`,`order_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_payberry`
--

LOCK TABLES `addons_payberry` WRITE;
/*!40000 ALTER TABLE `addons_payberry` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_payberry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_paykeeper`
--

DROP TABLE IF EXISTS `addons_paykeeper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_paykeeper` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_sys` int unsigned NOT NULL,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_paykeeper`
--

LOCK TABLES `addons_paykeeper` WRITE;
/*!40000 ALTER TABLE `addons_paykeeper` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_paykeeper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_paymaster`
--

DROP TABLE IF EXISTS `addons_paymaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_paymaster` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned NOT NULL,
  `amount` double(14,2) DEFAULT NULL,
  `txn_id` varchar(128) DEFAULT NULL,
  `txn_date` datetime DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_paymaster`
--

LOCK TABLES `addons_paymaster` WRITE;
/*!40000 ALTER TABLE `addons_paymaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_paymaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_payme`
--

DROP TABLE IF EXISTS `addons_payme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_payme` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` varchar(128) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `perform_time` datetime DEFAULT NULL,
  `cancel_time` datetime DEFAULT NULL,
  `cancel_reason` varchar(128) DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=151;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_payme`
--

LOCK TABLES `addons_payme` WRITE;
/*!40000 ALTER TABLE `addons_payme` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_payme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_paymo`
--

DROP TABLE IF EXISTS `addons_paymo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_paymo` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` varchar(128) DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `txn_date` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=151;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_paymo`
--

LOCK TABLES `addons_paymo` WRITE;
/*!40000 ALTER TABLE `addons_paymo` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_paymo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_paynet`
--

DROP TABLE IF EXISTS `addons_paynet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_paynet` (
  `providerTrnId` int unsigned NOT NULL AUTO_INCREMENT,
  `serviceId` tinyint DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `amount` double DEFAULT '0',
  `timestamp` datetime DEFAULT NULL,
  `transactionId` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `transactionTime` datetime DEFAULT NULL,
  `transactionState` tinyint DEFAULT '1',
  PRIMARY KEY (`providerTrnId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100000000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_paynet`
--

LOCK TABLES `addons_paynet` WRITE;
/*!40000 ALTER TABLE `addons_paynet` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_paynet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_paypal`
--

DROP TABLE IF EXISTS `addons_paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_paypal` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `date` datetime NOT NULL COMMENT 'время биллинга',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT 'статус платежа: 1 - ОК',
  `amount` decimal(9,2) unsigned NOT NULL COMMENT 'сумма',
  `currency` char(3) NOT NULL COMMENT 'тип валюты',
  `payment_date` char(25) NOT NULL COMMENT 'Время платежа в их формате',
  `txn_id` char(17) NOT NULL COMMENT 'ID платежа PayPal',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_paypal`
--

LOCK TABLES `addons_paypal` WRITE;
/*!40000 ALTER TABLE `addons_paypal` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_paysera`
--

DROP TABLE IF EXISTS `addons_paysera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_paysera` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` varchar(128) DEFAULT NULL,
  `txn_date` datetime DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_paysera`
--

LOCK TABLES `addons_paysera` WRITE;
/*!40000 ALTER TABLE `addons_paysera` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_paysera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_paysoft`
--

DROP TABLE IF EXISTS `addons_paysoft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_paysoft` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` bigint unsigned NOT NULL,
  `payment_system` tinyint(1) NOT NULL,
  `amount` double(14,2) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=819;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_paysoft`
--

LOCK TABLES `addons_paysoft` WRITE;
/*!40000 ALTER TABLE `addons_paysoft` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_paysoft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_pegas`
--

DROP TABLE IF EXISTS `addons_pegas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_pegas` (
  `record_id` int unsigned NOT NULL AUTO_INCREMENT,
  `txn_id` bigint unsigned DEFAULT NULL,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` double(16,2) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `txn_date` datetime DEFAULT NULL,
  `service_id` tinyint NOT NULL DEFAULT '1' COMMENT 'prv_id',
  `account` varchar(100) NOT NULL,
  `command` enum('check','pay') NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_pegas`
--

LOCK TABLES `addons_pegas` WRITE;
/*!40000 ALTER TABLE `addons_pegas` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_pegas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_perlas`
--

DROP TABLE IF EXISTS `addons_perlas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_perlas` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `txn_date` datetime DEFAULT NULL,
  `txn_id` char(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `account` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `comment` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_perlas`
--

LOCK TABLES `addons_perlas` WRITE;
/*!40000 ALTER TABLE `addons_perlas` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_perlas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_platezhka`
--

DROP TABLE IF EXISTS `addons_platezhka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_platezhka` (
  `record_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `terminal_date` datetime DEFAULT NULL,
  `uid` bigint unsigned DEFAULT NULL,
  `account` varchar(50) NOT NULL,
  `amount` double(14,2) DEFAULT NULL,
  `payID` varchar(64) DEFAULT NULL,
  `transactionID` bigint unsigned NOT NULL,
  `terminalID` varchar(128) DEFAULT NULL,
  `payElementID` varchar(128) DEFAULT NULL,
  `action` enum('check','pay','cancel') NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_platezhka`
--

LOCK TABLES `addons_platezhka` WRITE;
/*!40000 ALTER TABLE `addons_platezhka` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_platezhka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_platika`
--

DROP TABLE IF EXISTS `addons_platika`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_platika` (
  `prv_txn` int unsigned NOT NULL AUTO_INCREMENT,
  `txn_id` char(64) NOT NULL DEFAULT '',
  `check_time` datetime NOT NULL,
  `time_from_osmp` char(20) DEFAULT NULL,
  `uid` bigint unsigned NOT NULL,
  `account` char(20) NOT NULL,
  `sum` double(14,2) DEFAULT NULL,
  `time_stamp` datetime NOT NULL,
  PRIMARY KEY (`prv_txn`),
  KEY `time` (`check_time`),
  KEY `timstamp` (`time_stamp`),
  KEY `uid` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_platika`
--

LOCK TABLES `addons_platika` WRITE;
/*!40000 ALTER TABLE `addons_platika` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_platika` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_platon`
--

DROP TABLE IF EXISTS `addons_platon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_platon` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` varchar(128) NOT NULL,
  `txn_date` datetime DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=koi8r AVG_ROW_LENGTH=16384;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_platon`
--

LOCK TABLES `addons_platon` WRITE;
/*!40000 ALTER TABLE `addons_platon` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_platon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_pluspay`
--

DROP TABLE IF EXISTS `addons_pluspay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_pluspay` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` char(36) NOT NULL,
  `txn_date` datetime DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_pluspay`
--

LOCK TABLES `addons_pluspay` WRITE;
/*!40000 ALTER TABLE `addons_pluspay` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_pluspay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_portmone`
--

DROP TABLE IF EXISTS `addons_portmone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_portmone` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `order_time` varchar(30) NOT NULL,
  `txn_id` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_portmone`
--

LOCK TABLES `addons_portmone` WRITE;
/*!40000 ALTER TABLE `addons_portmone` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_portmone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_privat`
--

DROP TABLE IF EXISTS `addons_privat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_privat` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` int unsigned NOT NULL,
  `terminal_date` datetime NOT NULL,
  `transaction_id` varchar(20) NOT NULL,
  `sum` double(14,2) NOT NULL,
  `service_code` varchar(16) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_privat`
--

LOCK TABLES `addons_privat` WRITE;
/*!40000 ALTER TABLE `addons_privat` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_privat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_privat24`
--

DROP TABLE IF EXISTS `addons_privat24`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_privat24` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `merchant_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `currency` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `uid` bigint NOT NULL,
  `amount` double(14,2) DEFAULT NULL,
  `details` char(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `transaction_id` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `pay_way` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `sender_phone` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `date` (`order_date`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_privat24`
--

LOCK TABLES `addons_privat24` WRITE;
/*!40000 ALTER TABLE `addons_privat24` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_privat24` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_privat2nd`
--

DROP TABLE IF EXISTS `addons_privat2nd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_privat2nd` (
  `record_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned NOT NULL,
  `amount` double(16,2) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createTime` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `privatbank_id` bigint unsigned NOT NULL,
  UNIQUE KEY `record_id` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_privat2nd`
--

LOCK TABLES `addons_privat2nd` WRITE;
/*!40000 ALTER TABLE `addons_privat2nd` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_privat2nd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_privat_payment_account`
--

DROP TABLE IF EXISTS `addons_privat_payment_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_privat_payment_account` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pay_acc_account` varchar(128) DEFAULT NULL,
  `ref` varchar(128) NOT NULL,
  `postdate` datetime NOT NULL,
  `customerdate` datetime NOT NULL,
  `amount` double(16,2) NOT NULL,
  `account` varchar(32) NOT NULL,
  `uid` bigint unsigned NOT NULL,
  `purpose` varchar(255) NOT NULL DEFAULT '' COMMENT 'Описание платежа',
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_privat_payment_account`
--

LOCK TABLES `addons_privat_payment_account` WRITE;
/*!40000 ALTER TABLE `addons_privat_payment_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_privat_payment_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_psbank`
--

DROP TABLE IF EXISTS `addons_psbank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_psbank` (
  `txn_id` int NOT NULL AUTO_INCREMENT,
  `uid` int unsigned NOT NULL DEFAULT '0',
  `amount` double(20,6) NOT NULL DEFAULT '0.000000',
  `txn_date` datetime DEFAULT NULL,
  `server_date` datetime DEFAULT NULL,
  `status` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`txn_id`) USING BTREE,
  KEY `txn_date` (`txn_date`) USING BTREE,
  KEY `server_date` (`server_date`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_psbank`
--

LOCK TABLES `addons_psbank` WRITE;
/*!40000 ALTER TABLE `addons_psbank` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_psbank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_pscb`
--

DROP TABLE IF EXISTS `addons_pscb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_pscb` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` bigint unsigned NOT NULL,
  `amount` double(14,2) DEFAULT NULL,
  `state` char(20) NOT NULL DEFAULT 'new',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_pscb`
--

LOCK TABLES `addons_pscb` WRITE;
/*!40000 ALTER TABLE `addons_pscb` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_pscb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_qiwi`
--

DROP TABLE IF EXISTS `addons_qiwi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_qiwi` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` char(36) NOT NULL,
  `txn_date` datetime DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=koi8r AVG_ROW_LENGTH=16384;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_qiwi`
--

LOCK TABLES `addons_qiwi` WRITE;
/*!40000 ALTER TABLE `addons_qiwi` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_qiwi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_reeves`
--

DROP TABLE IF EXISTS `addons_reeves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_reeves` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `txn_date` datetime DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_reeves`
--

LOCK TABLES `addons_reeves` WRITE;
/*!40000 ALTER TABLE `addons_reeves` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_reeves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_rentsoft`
--

DROP TABLE IF EXISTS `addons_rentsoft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_rentsoft` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `order_time` datetime DEFAULT NULL,
  `txn_id` char(25) DEFAULT NULL,
  `comment` varchar(128) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_rentsoft`
--

LOCK TABLES `addons_rentsoft` WRITE;
/*!40000 ALTER TABLE `addons_rentsoft` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_rentsoft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_revolut`
--

DROP TABLE IF EXISTS `addons_revolut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_revolut` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `txn_id` varchar(38) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `txn_date` datetime DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `amount` double(20,6) DEFAULT NULL,
  `uid` int unsigned DEFAULT NULL,
  `identificator` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_revolut`
--

LOCK TABLES `addons_revolut` WRITE;
/*!40000 ALTER TABLE `addons_revolut` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_revolut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_rncb_v1`
--

DROP TABLE IF EXISTS `addons_rncb_v1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_rncb_v1` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` varchar(128) DEFAULT NULL,
  `txn_date` datetime DEFAULT NULL,
  `account` varchar(128) DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_rncb_v1`
--

LOCK TABLES `addons_rncb_v1` WRITE;
/*!40000 ALTER TABLE `addons_rncb_v1` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_rncb_v1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_rnkb`
--

DROP TABLE IF EXISTS `addons_rnkb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_rnkb` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` char(36) NOT NULL,
  `txn_date` varchar(15) DEFAULT NULL,
  `check_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_rnkb`
--

LOCK TABLES `addons_rnkb` WRITE;
/*!40000 ALTER TABLE `addons_rnkb` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_rnkb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_rnkb_site`
--

DROP TABLE IF EXISTS `addons_rnkb_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_rnkb_site` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `account` char(50) NOT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `order_time` datetime NOT NULL,
  `txn_id` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_rnkb_site`
--

LOCK TABLES `addons_rnkb_site` WRITE;
/*!40000 ALTER TABLE `addons_rnkb_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_rnkb_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_rnkb_soap`
--

DROP TABLE IF EXISTS `addons_rnkb_soap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_rnkb_soap` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `txn_date` varchar(15) DEFAULT NULL,
  `payment_system` varchar(128) DEFAULT NULL,
  `payment_system_id` varchar(128) DEFAULT NULL,
  `contract_code` varchar(128) DEFAULT NULL,
  `service` varchar(128) DEFAULT NULL,
  `service_id` varchar(128) DEFAULT NULL,
  `firm_code` varchar(128) DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_rnkb_soap`
--

LOCK TABLES `addons_rnkb_soap` WRITE;
/*!40000 ALTER TABLE `addons_rnkb_soap` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_rnkb_soap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_robokassa`
--

DROP TABLE IF EXISTS `addons_robokassa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_robokassa` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` int NOT NULL,
  `amount` double(14,2) NOT NULL,
  `status` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_robokassa`
--

LOCK TABLES `addons_robokassa` WRITE;
/*!40000 ALTER TABLE `addons_robokassa` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_robokassa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_sberbank_russia`
--

DROP TABLE IF EXISTS `addons_sberbank_russia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_sberbank_russia` (
  `reg_id` int unsigned NOT NULL AUTO_INCREMENT,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` bigint unsigned NOT NULL DEFAULT '0',
  `account` varchar(128) NOT NULL,
  `amount` double(16,2) NOT NULL DEFAULT '0.00',
  `pay_id` varchar(50) NOT NULL DEFAULT '',
  `agent_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pay_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`reg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_sberbank_russia`
--

LOCK TABLES `addons_sberbank_russia` WRITE;
/*!40000 ALTER TABLE `addons_sberbank_russia` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_sberbank_russia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_sberbankru`
--

DROP TABLE IF EXISTS `addons_sberbankru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_sberbankru` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` char(36) NOT NULL,
  `txn_date` datetime DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_sberbankru`
--

LOCK TABLES `addons_sberbankru` WRITE;
/*!40000 ALTER TABLE `addons_sberbankru` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_sberbankru` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_sberbankru2826`
--

DROP TABLE IF EXISTS `addons_sberbankru2826`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_sberbankru2826` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(6,2) unsigned DEFAULT NULL,
  `txn_id` char(36) NOT NULL,
  `txn_date` datetime DEFAULT NULL,
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_sberbankru2826`
--

LOCK TABLES `addons_sberbankru2826` WRITE;
/*!40000 ALTER TABLE `addons_sberbankru2826` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_sberbankru2826` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_sberbankru_mrch`
--

DROP TABLE IF EXISTS `addons_sberbankru_mrch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_sberbankru_mrch` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `order_time` varchar(30) NOT NULL,
  `txn_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_sberbankru_mrch`
--

LOCK TABLES `addons_sberbankru_mrch` WRITE;
/*!40000 ALTER TABLE `addons_sberbankru_mrch` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_sberbankru_mrch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_sberbankruv1`
--

DROP TABLE IF EXISTS `addons_sberbankruv1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_sberbankruv1` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` varchar(128) DEFAULT NULL,
  `txn_date` datetime DEFAULT NULL,
  `account` varchar(128) DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_sberbankruv1`
--

LOCK TABLES `addons_sberbankruv1` WRITE;
/*!40000 ALTER TABLE `addons_sberbankruv1` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_sberbankruv1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_sberbankruv2`
--

DROP TABLE IF EXISTS `addons_sberbankruv2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_sberbankruv2` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` varchar(128) DEFAULT NULL,
  `txn_date` datetime DEFAULT NULL,
  `account` varchar(128) DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_sberbankruv2`
--

LOCK TABLES `addons_sberbankruv2` WRITE;
/*!40000 ALTER TABLE `addons_sberbankruv2` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_sberbankruv2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_simplepay`
--

DROP TABLE IF EXISTS `addons_simplepay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_simplepay` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `txn_id` int DEFAULT NULL,
  `uid` int NOT NULL,
  `amount` double(14,2) NOT NULL,
  `server_time` datetime DEFAULT NULL,
  `order_time` datetime DEFAULT NULL,
  `status` int unsigned NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_simplepay`
--

LOCK TABLES `addons_simplepay` WRITE;
/*!40000 ALTER TABLE `addons_simplepay` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_simplepay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_skysend`
--

DROP TABLE IF EXISTS `addons_skysend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_skysend` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` char(36) NOT NULL,
  `txn_date` datetime DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=16384;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_skysend`
--

LOCK TABLES `addons_skysend` WRITE;
/*!40000 ALTER TABLE `addons_skysend` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_skysend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_sotas`
--

DROP TABLE IF EXISTS `addons_sotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_sotas` (
  `prv_txn` int unsigned NOT NULL AUTO_INCREMENT,
  `txn_id` char(64) NOT NULL DEFAULT '',
  `check_time` datetime NOT NULL,
  `time_from_osmp` char(20) DEFAULT NULL,
  `accaunt` char(20) NOT NULL,
  `uid` bigint unsigned NOT NULL DEFAULT '0',
  `sum` double(14,2) DEFAULT NULL,
  `time_stamp` datetime NOT NULL,
  `type` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`prv_txn`),
  KEY `time` (`check_time`),
  KEY `timstamp` (`time_stamp`),
  KEY `uid` (`accaunt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_sotas`
--

LOCK TABLES `addons_sotas` WRITE;
/*!40000 ALTER TABLE `addons_sotas` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_sotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_stripe`
--

DROP TABLE IF EXISTS `addons_stripe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_stripe` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned NOT NULL,
  `amount` decimal(16,2) unsigned NOT NULL,
  `txn_date` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Детальные платежи stripe';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_stripe`
--

LOCK TABLES `addons_stripe` WRITE;
/*!40000 ALTER TABLE `addons_stripe` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_stripe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_swedbank`
--

DROP TABLE IF EXISTS `addons_swedbank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_swedbank` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `txn_date` datetime DEFAULT NULL,
  `txn_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_latvian_ci DEFAULT NULL,
  `account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_latvian_ci DEFAULT NULL,
  `fio` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_latvian_ci DEFAULT NULL,
  `comment` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_latvian_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_swedbank`
--

LOCK TABLES `addons_swedbank` WRITE;
/*!40000 ALTER TABLE `addons_swedbank` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_swedbank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_tinkoff`
--

DROP TABLE IF EXISTS `addons_tinkoff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_tinkoff` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` char(36) NOT NULL,
  `txn_date` datetime DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_tinkoff`
--

LOCK TABLES `addons_tinkoff` WRITE;
/*!40000 ALTER TABLE `addons_tinkoff` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_tinkoff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_tyme`
--

DROP TABLE IF EXISTS `addons_tyme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_tyme` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` char(36) NOT NULL,
  `txn_date` datetime DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_tyme`
--

LOCK TABLES `addons_tyme` WRITE;
/*!40000 ALTER TABLE `addons_tyme` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_tyme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_ukrpays`
--

DROP TABLE IF EXISTS `addons_ukrpays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_ukrpays` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_ups` int NOT NULL,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `txn_date` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_ukrpays`
--

LOCK TABLES `addons_ukrpays` WRITE;
/*!40000 ALTER TABLE `addons_ukrpays` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_ukrpays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_uniteller`
--

DROP TABLE IF EXISTS `addons_uniteller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_uniteller` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `order_time` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_uniteller`
--

LOCK TABLES `addons_uniteller` WRITE;
/*!40000 ALTER TABLE `addons_uniteller` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_uniteller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_upay`
--

DROP TABLE IF EXISTS `addons_upay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_upay` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` varchar(128) DEFAULT NULL,
  `txn_date` datetime DEFAULT NULL,
  `account` varchar(128) DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_upay`
--

LOCK TABLES `addons_upay` WRITE;
/*!40000 ALTER TABLE `addons_upay` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_upay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_ural_bank`
--

DROP TABLE IF EXISTS `addons_ural_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_ural_bank` (
  `prv_txn` bigint unsigned NOT NULL AUTO_INCREMENT,
  `txn_id` char(64) NOT NULL DEFAULT '',
  `check_time` datetime NOT NULL,
  `time_from_osmp` char(20) DEFAULT NULL,
  `accaunt` char(20) NOT NULL,
  `sum` double(14,2) DEFAULT NULL,
  `time_stamp` datetime NOT NULL,
  PRIMARY KEY (`prv_txn`),
  KEY `time` (`check_time`),
  KEY `timstamp` (`time_stamp`),
  KEY `uid` (`accaunt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_ural_bank`
--

LOCK TABLES `addons_ural_bank` WRITE;
/*!40000 ALTER TABLE `addons_ural_bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_ural_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_uzumbank`
--

DROP TABLE IF EXISTS `addons_uzumbank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_uzumbank` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` varchar(128) DEFAULT NULL,
  `txn_date` datetime DEFAULT NULL,
  `account` varchar(128) DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_uzumbank`
--

LOCK TABLES `addons_uzumbank` WRITE;
/*!40000 ALTER TABLE `addons_uzumbank` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_uzumbank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_vienasaskaita`
--

DROP TABLE IF EXISTS `addons_vienasaskaita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_vienasaskaita` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `txn_date` datetime DEFAULT NULL,
  `txn_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_latvian_ci DEFAULT NULL,
  `account` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_latvian_ci DEFAULT NULL,
  `fio` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_latvian_ci DEFAULT NULL,
  `comment` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_latvian_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_vienasaskaita`
--

LOCK TABLES `addons_vienasaskaita` WRITE;
/*!40000 ALTER TABLE `addons_vienasaskaita` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_vienasaskaita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_vpru`
--

DROP TABLE IF EXISTS `addons_vpru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_vpru` (
  `prv_txn` bigint unsigned NOT NULL AUTO_INCREMENT,
  `txn_id` char(64) NOT NULL DEFAULT '',
  `check_time` datetime NOT NULL,
  `time_from_vpru` char(20) DEFAULT NULL,
  `accaunt` char(20) NOT NULL,
  `sum` double(14,2) DEFAULT NULL,
  `time_stamp` datetime NOT NULL,
  PRIMARY KEY (`prv_txn`),
  KEY `time` (`check_time`),
  KEY `timstamp` (`time_stamp`),
  KEY `uid` (`accaunt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_vpru`
--

LOCK TABLES `addons_vpru` WRITE;
/*!40000 ALTER TABLE `addons_vpru` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_vpru` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_wqiwiru`
--

DROP TABLE IF EXISTS `addons_wqiwiru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_wqiwiru` (
  `prv_txn` int unsigned NOT NULL AUTO_INCREMENT,
  `status` int unsigned NOT NULL DEFAULT '0',
  `check_time` datetime NOT NULL,
  `uid` bigint unsigned NOT NULL,
  `sum` double(14,2) DEFAULT NULL,
  `time_stamp` datetime NOT NULL,
  PRIMARY KEY (`prv_txn`),
  KEY `time` (`check_time`),
  KEY `timstamp` (`time_stamp`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_wqiwiru`
--

LOCK TABLES `addons_wqiwiru` WRITE;
/*!40000 ALTER TABLE `addons_wqiwiru` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_wqiwiru` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_xplat`
--

DROP TABLE IF EXISTS `addons_xplat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_xplat` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `txn_id` char(36) NOT NULL,
  `txn_date` varchar(15) DEFAULT NULL,
  `check_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_xplat`
--

LOCK TABLES `addons_xplat` WRITE;
/*!40000 ALTER TABLE `addons_xplat` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_xplat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_yandex`
--

DROP TABLE IF EXISTS `addons_yandex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_yandex` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `order_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_yandex`
--

LOCK TABLES `addons_yandex` WRITE;
/*!40000 ALTER TABLE `addons_yandex` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_yandex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_yandex_money`
--

DROP TABLE IF EXISTS `addons_yandex_money`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_yandex_money` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `order_time` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=151;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_yandex_money`
--

LOCK TABLES `addons_yandex_money` WRITE;
/*!40000 ALTER TABLE `addons_yandex_money` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_yandex_money` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addons_yapk`
--

DROP TABLE IF EXISTS `addons_yapk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons_yapk` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned NOT NULL,
  `account` varchar(64) NOT NULL DEFAULT '',
  `txn_id` bigint unsigned NOT NULL,
  `sum` double(14,2) DEFAULT NULL,
  `txn_date` datetime NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons_yapk`
--

LOCK TABLES `addons_yapk` WRITE;
/*!40000 ALTER TABLE `addons_yapk` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons_yapk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_gui_templates`
--

DROP TABLE IF EXISTS `admin_gui_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_gui_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `usersgroupid` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_gui_templates`
--

LOCK TABLES `admin_gui_templates` WRITE;
/*!40000 ALTER TABLE `admin_gui_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_gui_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_gui_templates_data`
--

DROP TABLE IF EXISTS `admin_gui_templates_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_gui_templates_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `template_id` int NOT NULL,
  `key` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `value` blob NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `template_key` (`template_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_gui_templates_data`
--

LOCK TABLES `admin_gui_templates_data` WRITE;
/*!40000 ALTER TABLE `admin_gui_templates_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_gui_templates_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ap_client_logs`
--

DROP TABLE IF EXISTS `ap_client_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ap_client_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` bigint DEFAULT NULL,
  `mac_address` varchar(32) DEFAULT NULL,
  `ap_ip` varchar(32) DEFAULT NULL,
  `at_stoped` datetime DEFAULT NULL,
  `at_updated` datetime DEFAULT NULL,
  `at_created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `at_updated` (`at_updated`),
  KEY `uid` (`uid`),
  KEY `at_stoped` (`at_stoped`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ap_client_logs`
--

LOCK TABLES `ap_client_logs` WRITE;
/*!40000 ALTER TABLE `ap_client_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap_client_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archived_packets`
--

DROP TABLE IF EXISTS `archived_packets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `archived_packets` (
  `gid` smallint unsigned NOT NULL,
  UNIQUE KEY `gid` (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archived_packets`
--

LOCK TABLES `archived_packets` WRITE;
/*!40000 ALTER TABLE `archived_packets` DISABLE KEYS */;
/*!40000 ALTER TABLE `archived_packets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archived_staff`
--

DROP TABLE IF EXISTS `archived_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `archived_staff` (
  `stuffid` tinyint unsigned NOT NULL,
  UNIQUE KEY `stuffid` (`stuffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archived_staff`
--

LOCK TABLES `archived_staff` WRITE;
/*!40000 ALTER TABLE `archived_staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `archived_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_stations`
--

DROP TABLE IF EXISTS `base_stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_stations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `mac_address` varchar(64) DEFAULT NULL,
  `azimuth` int DEFAULT NULL,
  `raster_width` int DEFAULT NULL,
  `tilt_angle` int DEFAULT NULL,
  `power` int DEFAULT NULL,
  `frequency` int DEFAULT NULL,
  `latitude` varchar(128) DEFAULT NULL,
  `longitude` varchar(128) DEFAULT NULL,
  `projection_type` int DEFAULT NULL,
  `houseid` int DEFAULT NULL,
  `housingid` int DEFAULT NULL,
  `houseblockid` int DEFAULT NULL,
  `porch` int DEFAULT NULL,
  `floor` int DEFAULT NULL,
  `app` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_stations`
--

LOCK TABLES `base_stations` WRITE;
/*!40000 ALTER TABLE `base_stations` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bonus`
--

DROP TABLE IF EXISTS `bonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bonus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT 'Название',
  `points` int NOT NULL DEFAULT '0' COMMENT 'Бонусные баллы',
  `descriptions` varchar(300) DEFAULT NULL COMMENT 'Описание',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `period` varchar(32) NOT NULL DEFAULT 'all' COMMENT 'Период начисления бонуса:(all,day,month,year)',
  `period_count` int DEFAULT '1' COMMENT 'Кол-во выполнений за указанный период',
  `event_id` int NOT NULL DEFAULT '0' COMMENT 'Событие в биллинге',
  `entity_id` int DEFAULT NULL COMMENT 'Условие. Сущность',
  `operator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '=' COMMENT 'Условие. Оператор (>, >=, =, !=, <=, <)',
  `entity_value` varchar(128) DEFAULT NULL COMMENT 'Условие. Значение',
  `additional_condition_2` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Использовать дополнительное условие. 1-да, 0 -нет',
  `condition_equal_2` tinyint(1) DEFAULT '1' COMMENT 'Дополнительное условие \r\n\r\n1=and \r\n0=or',
  `entity_id_2` int DEFAULT NULL,
  `operator_2` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `entity_value_2` varchar(128) DEFAULT NULL,
  `additional_condition_3` tinyint(1) NOT NULL DEFAULT '0',
  `condition_equal_3` tinyint NOT NULL DEFAULT '1',
  `entity_id_3` int DEFAULT NULL,
  `operator_3` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `entity_value_3` varchar(128) DEFAULT NULL,
  `additional_condition_4` tinyint(1) NOT NULL DEFAULT '0',
  `condition_equal_4` tinyint NOT NULL DEFAULT '1',
  `entity_id_4` int DEFAULT NULL,
  `operator_4` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `entity_value_4` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonus`
--

LOCK TABLES `bonus` WRITE;
/*!40000 ALTER TABLE `bonus` DISABLE KEYS */;
/*!40000 ALTER TABLE `bonus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bonus_history`
--

DROP TABLE IF EXISTS `bonus_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bonus_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned NOT NULL,
  `bonus_id` int unsigned DEFAULT NULL,
  `who` tinyint DEFAULT NULL,
  `before_billing` int NOT NULL DEFAULT '0',
  `points` int NOT NULL DEFAULT '0',
  `comment` varchar(128) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonus_history`
--

LOCK TABLES `bonus_history` WRITE;
/*!40000 ALTER TABLE `bonus_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `bonus_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bonus_shop`
--

DROP TABLE IF EXISTS `bonus_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bonus_shop` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `descriptions` varchar(256) DEFAULT NULL,
  `points` int NOT NULL DEFAULT '0',
  `url` varchar(256) DEFAULT NULL,
  `image` mediumblob,
  `active` tinyint NOT NULL DEFAULT '1',
  `ticket_on` tinyint NOT NULL DEFAULT '0',
  `ticket_category` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonus_shop`
--

LOCK TABLES `bonus_shop` WRITE;
/*!40000 ALTER TABLE `bonus_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `bonus_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bonus_users`
--

DROP TABLE IF EXISTS `bonus_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bonus_users` (
  `uid` bigint unsigned NOT NULL,
  `points` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonus_users`
--

LOCK TABLES `bonus_users` WRITE;
/*!40000 ALTER TABLE `bonus_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `bonus_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugh_cards_log`
--

DROP TABLE IF EXISTS `bugh_cards_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bugh_cards_log` (
  `cardslogid` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned NOT NULL,
  `card` char(64) NOT NULL,
  `cards_id` int unsigned NOT NULL,
  `date` datetime NOT NULL,
  `before_billing` double(20,6) NOT NULL,
  `summa` double(20,6) NOT NULL,
  PRIMARY KEY (`cardslogid`),
  KEY `card-index` (`card`),
  KEY `date` (`date`),
  KEY `uid` (`uid`),
  KEY `uid-date` (`uid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugh_cards_log`
--

LOCK TABLES `bugh_cards_log` WRITE;
/*!40000 ALTER TABLE `bugh_cards_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugh_cards_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugh_cards_log_deleted`
--

DROP TABLE IF EXISTS `bugh_cards_log_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bugh_cards_log_deleted` (
  `cardslogid` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned NOT NULL,
  `card` char(64) NOT NULL,
  `cards_id` int unsigned NOT NULL,
  `date` datetime NOT NULL,
  `before_billing` double(20,6) NOT NULL,
  `summa` double(20,6) NOT NULL,
  PRIMARY KEY (`cardslogid`),
  KEY `card-index` (`card`),
  KEY `date` (`date`),
  KEY `uid` (`uid`),
  KEY `uid-date` (`uid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugh_cards_log_deleted`
--

LOCK TABLES `bugh_cards_log_deleted` WRITE;
/*!40000 ALTER TABLE `bugh_cards_log_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugh_cards_log_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugh_final_report`
--

DROP TABLE IF EXISTS `bugh_final_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bugh_final_report` (
  `bughtypeid` smallint unsigned NOT NULL,
  `bughtypename` char(255) NOT NULL,
  `not_sum` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugh_final_report`
--

LOCK TABLES `bugh_final_report` WRITE;
/*!40000 ALTER TABLE `bugh_final_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugh_final_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugh_perevod_stat`
--

DROP TABLE IF EXISTS `bugh_perevod_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bugh_perevod_stat` (
  `bugh_perevod_id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `perevod_from` bigint unsigned NOT NULL,
  `perevod_to` bigint unsigned NOT NULL,
  `perevod_comment` char(20) DEFAULT NULL,
  `before_perevod` double(20,6) NOT NULL,
  `summa_perevoda` double(20,6) NOT NULL,
  `comisiya` double(20,6) NOT NULL,
  PRIMARY KEY (`bugh_perevod_id`),
  KEY `date` (`date`),
  KEY `uid` (`perevod_from`),
  KEY `uid2` (`perevod_to`),
  KEY `uid2-date` (`perevod_to`,`date`),
  KEY `uid-date` (`perevod_from`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='bugh peredov stat';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugh_perevod_stat`
--

LOCK TABLES `bugh_perevod_stat` WRITE;
/*!40000 ALTER TABLE `bugh_perevod_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugh_perevod_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugh_plategi_info`
--

DROP TABLE IF EXISTS `bugh_plategi_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bugh_plategi_info` (
  `plategid` int unsigned NOT NULL AUTO_INCREMENT,
  `comment` varchar(128) DEFAULT NULL,
  `what` varchar(128) DEFAULT NULL,
  `what_id` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`plategid`) USING BTREE,
  KEY `item_id` (`what_id`),
  KEY `ietm` (`what`)
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugh_plategi_info`
--

LOCK TABLES `bugh_plategi_info` WRITE;
/*!40000 ALTER TABLE `bugh_plategi_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugh_plategi_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugh_plategi_stat`
--

DROP TABLE IF EXISTS `bugh_plategi_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bugh_plategi_stat` (
  `plategid` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `who` tinyint unsigned DEFAULT NULL,
  `bughtypeid` smallint unsigned NOT NULL,
  `before_billing` double(20,6) NOT NULL,
  `summa` double(20,6) NOT NULL,
  `comment` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`plategid`),
  KEY `bughtypeid` (`bughtypeid`),
  KEY `date` (`date`),
  KEY `date_type` (`date`,`bughtypeid`),
  KEY `summa` (`date`,`bughtypeid`,`summa`),
  KEY `summa-2` (`summa`),
  KEY `uid` (`uid`),
  KEY `uid-date` (`uid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugh_plategi_stat`
--

LOCK TABLES `bugh_plategi_stat` WRITE;
/*!40000 ALTER TABLE `bugh_plategi_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugh_plategi_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugh_plategi_stat_deleted`
--

DROP TABLE IF EXISTS `bugh_plategi_stat_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bugh_plategi_stat_deleted` (
  `plategid` int unsigned NOT NULL,
  `uid` bigint unsigned NOT NULL,
  `date` datetime DEFAULT NULL,
  `who` tinyint unsigned DEFAULT NULL,
  `bughtypeid` smallint unsigned NOT NULL,
  `before_billing` double(20,6) NOT NULL,
  `summa` double(20,6) NOT NULL,
  `comment` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`plategid`) USING BTREE,
  KEY `bughtypeid` (`bughtypeid`) USING BTREE,
  KEY `date` (`date`) USING BTREE,
  KEY `date_type` (`date`,`bughtypeid`) USING BTREE,
  KEY `summa` (`date`,`bughtypeid`,`summa`) USING BTREE,
  KEY `summa-2` (`summa`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `uid-date` (`uid`,`date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugh_plategi_stat_deleted`
--

LOCK TABLES `bugh_plategi_stat_deleted` WRITE;
/*!40000 ALTER TABLE `bugh_plategi_stat_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugh_plategi_stat_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugh_plategi_type`
--

DROP TABLE IF EXISTS `bugh_plategi_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bugh_plategi_type` (
  `bughtypeid` smallint unsigned NOT NULL AUTO_INCREMENT,
  `typename` char(128) NOT NULL,
  `sign` char(1) NOT NULL DEFAULT '' COMMENT 'знак +/-',
  `fictitious` tinyint NOT NULL DEFAULT '0' COMMENT 'не изменяет депозит',
  `deposit_action` char(1) NOT NULL DEFAULT '?' COMMENT 'действие над балансом',
  `deposit_action_by_user` char(1) NOT NULL DEFAULT '' COMMENT 'действие с депозитом абонентом',
  PRIMARY KEY (`bughtypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugh_plategi_type`
--

LOCK TABLES `bugh_plategi_type` WRITE;
/*!40000 ALTER TABLE `bugh_plategi_type` DISABLE KEYS */;
INSERT INTO `bugh_plategi_type` VALUES (1,'Абонентская плата за текущий месяц','+',0,'-',''),(2,'Абонентская плата за текущий день','+',0,'-',''),(5,'Пополнение счета','+',0,'+','+'),(6,'Ошибка ввода','-',0,'-',''),(7,'Снятие со счета','-',0,'-',''),(9,'Оплата аренды внешнего IP адреса','+',0,'-',''),(10,'Перерасчет','/',0,'/',''),(15,'Премия За Общественнополезные работы','+',0,'+',''),(16,'ПОДАРОК!','+',0,'+',''),(17,'Акция','+',0,'+',''),(18,'Кредит','',0,'?',''),(19,'Рассрочка','+',0,'-','-'),(20,'Блокировка интернета в связи с окончанием средств','',1,'0',''),(21,'Остаточная абонплата за месяц','',0,'-',''),(22,'Остаточная Абонентская плата за текущий месяц','',0,'-',''),(23,'Изменение пакета с нового месяца','',0,'?',''),(24,'Возврат из за перебоев сети','+',0,'+',''),(25,'Ремонт','-',0,'-',''),(26,'Изменение тарифного пакета','',0,'?',''),(27,'Подключение','-',0,'-',''),(28,'Пополнение карточкой','+',0,'+','+'),(29,'% за пользование кредитом','',0,'-',''),(30,'Создание второй учетной записи','-',0,'-',''),(31,'Пополнение MobyAZS(24NonStop)','+',0,'+','+'),(32,'Услуга Real IP','',0,'-',''),(33,'Активация Акционного тарифа','',0,'?',''),(34,'Услуга \"Турбо\"','',0,'?',''),(35,'Активация услуги Кредит','',0,'?',''),(36,'Активация услуги Кредит с %','',0,'?',''),(37,'Пополнение OSMP','+',0,'+','+'),(38,'Пополнение Liqpay','+',0,'+','+'),(39,'Оплата заморозки','',0,'-','+'),(40,'Пополнение Yandex деньги','+',0,'+','+'),(41,'Пополнение WebMoney','+',0,'+','+'),(42,'Отключение по задолженности','',1,'0',''),(43,'Удаление по неактивности','',1,'0',''),(44,'Пополнение CoPayCo','+',0,'+','+'),(45,'Безналичный платеж','+',0,'+','+'),(46,'Активация учетки абонента','',0,'-',''),(47,'Пополнение МТС-терминал','+',0,'+','+'),(48,'Оплата Разморозки','',0,'-',''),(49,'Возврат Абонплаты по заморозке','+',0,'+',''),(50,'Оплата Dr.Web','',0,'-',''),(51,'Абонентская плата заморозки','+',0,'-',''),(52,'Пополнение EasySoft','+',0,'+','+'),(53,'Пополнение OnPay','+',0,'+','+'),(54,'Пополнение Privat24','+',0,'+','+'),(55,'Пополнение City-Pay','+',0,'+','+'),(56,'Пополнение Elecsnet','+',0,'+','+'),(57,'Пополнение w.QiWi.ru','+',0,'+','+'),(58,'Пополнение ComPay','+',0,'+','+'),(59,'Пополнение RoboKassa','+',0,'+','+'),(60,'Пополнение терминал Приват','+',0,'+','+'),(61,'Пополнение терминал Кассира.НЕТ','+',0,'+','+'),(62,'API','/',0,'/','+'),(63,'Пополнение терминал Платёжка (Банк нац. кредит)','+',0,'+','+'),(64,'Плата за покупку устройства','',0,'-',''),(65,'Плата за аренду устройства','+',0,'-',''),(66,'Пополнение терминал Pegas','+',0,'+','+'),(67,'Пополнение iBox','+',0,'+','+'),(68,'Пополнение Приват (v.2)','+',0,'+','+'),(69,'Пополнение Балтика Банк','+',0,'+','+'),(70,'Пополнение Приват Р/С','+',0,'+','+'),(71,'Пополнение E-Pay.com.ua','+',0,'+','+'),(72,'Перевод средств абоненту','-',0,'-',''),(73,'Перевод средств от абонента','+',0,'+',''),(74,'Комиссия за перевод средств абоненту','-',0,'-',''),(75,'Возврат абонплаты при смене тарифа','+',0,'+',''),(76,'Пополнение СберБанк России (ООО Биллинговые Технологии)','+',0,'+','+'),(77,'Пополнение ПСКБ OOS','+',0,'+','+'),(78,'Дополнительные услуги - пополнение абонента','+',0,'+','-'),(79,'Дополнительные услуги - списание с абонента','-',0,'-','-'),(80,'Пополнение PayMaster','+',0,'+','+'),(81,'Пополнение КиберПлат','+',0,'+','+'),(82,'Пополнение МКБ','+',0,'+','+'),(83,'Пополнение Сотас','+',0,'+','+'),(84,'Пополнение Платика','+',0,'+','+'),(85,'Пополнение КредитПилот','+',0,'+','+'),(86,'Пополнение ЯПК','+',0,'+','+'),(87,'Пополнение Stripe','+',0,'+','+'),(88,'Пополнение eKassir','+',0,'+','+'),(89,'Пополнение PayPal','+',0,'+','+'),(90,'Пополнение PayKeeper','+',0,'+','+'),(91,'Пополнение UkrPays','+',0,'+','+'),(92,'Пополнение СберБанк России (2)','+',0,'+','+'),(93,'Бонус','+',0,'+','+'),(94,'Пополнение Xplat','+',0,'+','+'),(95,'Пополнение РНКБ','+',0,'+','+'),(96,'Пополнение PayBerry','+',0,'+','+'),(97,'Пополнение Fondy','+',0,'+','+'),(98,'Пополнение СберБанк2826','+',0,'+','+'),(99,'Корректировка','+',0,'+','+'),(100,'Перевод личных средств','/',0,'/','+'),(101,'Пополнение TYME','+',0,'+','+'),(102,'Пополнение Uniteller','+',0,'+','+'),(103,'Прокладка кабеля','-',0,'-',''),(104,'Пеня','-',0,'-',''),(105,'Отмена Безналичного платежа','-',0,'-',''),(106,'Пополнение Portmone','+',0,'+','+'),(107,'Пополнение Банк Фамильный','+',0,'+','+'),(108,'Пополнение iPay','+',0,'+','+'),(109,'Система Город','+',0,'+','+'),(110,'Пополнение Сайт РНКБ','+',0,'+','+'),(111,'Пополнение Все платежи (vp.ru)','+',0,'+','+'),(112,'Пополнение 24 AllTime','+',0,'+','+'),(113,'Пополнение SberBank.ru Мерчант','+',0,'+','+'),(114,'Пополнение SimplePay','+',0,'+','+'),(115,'Пополнение ЦПП-Юг','+',0,'+','+'),(116,'Пополнение Яндекс.Деньги','+',0,'+','+'),(117,'Пополнение CloudPayments','+',0,'+','+'),(118,'Пополнение ISBANK','+',0,'+','+'),(119,'Пополнение Tinkoff','+',0,'+','+'),(120,'Подписка Rentsoft','-',0,'-',''),(121,'Пополнение Integra','+',0,'+','+'),(122,'Пополнение Novakom','+',0,'+','+'),(123,'Пополнение PaySoft','+',0,'+','+'),(124,'Пополнение Центральная Касса','+',0,'+','+'),(125,'Пополнение Monobank','+',0,'+','+'),(126,'Пополнение SkySend','+',0,'+','+'),(127,'Пополнение НКО Расчетные Решения','+',0,'+','+'),(128,'Пополнение 2click','+',0,'+','+'),(129,'Пополнение EasyPay','+',0,'+','+'),(130,'Пополнение AB SEB Bankas','+',0,'+','+'),(131,'Пополнение Luminor Bank','+',0,'+','+'),(132,'Пополнение Swedbank','+',0,'+','+'),(133,'Пополнение Viena Saskaita','+',0,'+','+'),(134,'Пополнение Perlas','+',0,'+','+'),(135,'Пополнение Maxima','+',0,'+','+'),(136,'Пополнение КировскПочта','+',0,'+','+'),(137,'Пополнение PAYMO','+',0,'+','+'),(138,'Пополнение Payme','+',0,'+','+'),(139,'Пополнение Click.uz','+',0,'+','+'),(140,'Пополнение FcSistema','+',0,'+','+'),(142,'Пополнение РНКБ v.1.00','+',0,'+','+'),(143,'Пополнение Kaspi.kz','+',0,'+','+'),(144,'Пополнение Sberbank.ru V2','+',0,'+','+'),(145,'Пополнение Sberbank.ru V1','+',0,'+','+'),(146,'Пополнение AlfaBank.ru','+',0,'+','+'),(147,'Пополнение Paysera','+',0,'+','+'),(148,'Пополнение GlobalMoney','+',0,'+','+'),(149,'Пополнение А-Банк','+',0,'+','+'),(150,'Пополнение PlusPay','+',0,'+','+'),(151,'Пополнение CityPay PR','+',0,'+','+'),(152,'Пополнение Qiwi','+',0,'+','+'),(153,'Пополнение Reeves','+',0,'+','+'),(154,'Пополнение Platon','+',0,'+','+'),(155,'Пополнение FredomPay','+',0,'+','+'),(157,'Пополнение Paynet','+',0,'+','+'),(158,'Пополнение UPay.uz','+',0,'+','+'),(159,'Пополнение Uzumbank.uz','+',0,'+','+'),(160,'Пополнение Revolut','+',0,'+','+'),(161,'Пополнение PSBank','+',0,'+','+'),(162,'Пополнение EasyPay Армения','+',0,'+','+');
/*!40000 ALTER TABLE `bugh_plategi_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugh_report_data`
--

DROP TABLE IF EXISTS `bugh_report_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bugh_report_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bugh_report_id` int NOT NULL,
  `sequence_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `useruid` int NOT NULL,
  `user` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `fio` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `debit_at_the_beginning` double(20,6) NOT NULL,
  `credit_at_the_beginning` double(20,6) NOT NULL,
  `connections` double(20,6) NOT NULL,
  `fee` double(20,6) NOT NULL,
  `allowances` double(20,6) NOT NULL,
  `paid` double(20,6) NOT NULL,
  `discounts` double(20,6) NOT NULL,
  `debit_at_the_end` double(20,6) NOT NULL,
  `credit_at_the_end` double(20,6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_id` (`bugh_report_id`),
  KEY `full_index` (`bugh_report_id`,`sequence_number`,`useruid`,`user`(128),`fio`(128),`debit_at_the_beginning`,`credit_at_the_beginning`,`connections`,`fee`,`allowances`,`paid`,`discounts`,`debit_at_the_end`,`credit_at_the_end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugh_report_data`
--

LOCK TABLES `bugh_report_data` WRITE;
/*!40000 ALTER TABLE `bugh_report_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugh_report_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugh_report_date`
--

DROP TABLE IF EXISTS `bugh_report_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bugh_report_date` (
  `id` int NOT NULL AUTO_INCREMENT,
  `year` smallint NOT NULL,
  `month` smallint NOT NULL,
  `bugh_type` smallint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `para` (`year`,`month`,`bugh_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugh_report_date`
--

LOCK TABLES `bugh_report_date` WRITE;
/*!40000 ALTER TABLE `bugh_report_date` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugh_report_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugh_stat_balance`
--

DROP TABLE IF EXISTS `bugh_stat_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bugh_stat_balance` (
  `uid` bigint unsigned NOT NULL,
  `date` datetime NOT NULL,
  `deposit` double(20,6) NOT NULL,
  `credit` double(20,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='История балансов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugh_stat_balance`
--

LOCK TABLES `bugh_stat_balance` WRITE;
/*!40000 ALTER TABLE `bugh_stat_balance` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugh_stat_balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugh_uslugi_stat`
--

DROP TABLE IF EXISTS `bugh_uslugi_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bugh_uslugi_stat` (
  `uslid` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned NOT NULL,
  `gid` smallint unsigned NOT NULL,
  `usluga` int unsigned NOT NULL DEFAULT '0',
  `date_start` datetime NOT NULL,
  `date_stop` datetime DEFAULT NULL,
  `active` tinyint unsigned NOT NULL DEFAULT '0',
  `before_billing` double(20,6) DEFAULT NULL,
  `before_billing_credit` double(20,6) DEFAULT NULL,
  `credit` double(20,6) DEFAULT NULL,
  `deposit` double(20,6) DEFAULT NULL,
  `summa` double(20,6) DEFAULT NULL,
  PRIMARY KEY (`uslid`),
  KEY `date-start` (`date_start`),
  KEY `date-stop` (`date_stop`),
  KEY `uid` (`uid`),
  KEY `uid-date` (`uid`,`date_start`,`date_stop`),
  KEY `uid-date-start` (`uslid`,`date_start`),
  KEY `uid-date-stop` (`uid`,`date_stop`),
  KEY `uid-usluga` (`uid`,`usluga`,`date_start`,`date_stop`),
  KEY `usl-date-start` (`usluga`,`date_start`),
  KEY `usl-date-stop` (`usluga`,`date_stop`),
  KEY `usluga` (`usluga`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=76;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugh_uslugi_stat`
--

LOCK TABLES `bugh_uslugi_stat` WRITE;
/*!40000 ALTER TABLE `bugh_uslugi_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugh_uslugi_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugh_uslugi_type`
--

DROP TABLE IF EXISTS `bugh_uslugi_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bugh_uslugi_type` (
  `usluga` int unsigned NOT NULL AUTO_INCREMENT,
  `usluganame` varchar(64) NOT NULL,
  PRIMARY KEY (`usluga`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=26;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugh_uslugi_type`
--

LOCK TABLES `bugh_uslugi_type` WRITE;
/*!40000 ALTER TABLE `bugh_uslugi_type` DISABLE KEYS */;
INSERT INTO `bugh_uslugi_type` VALUES (1,'Услуга Кредит'),(2,'Услуга Кредит с %'),(3,'Услуга \"Турбо\"'),(5,'Услуга \"Заморозка\"');
/*!40000 ALTER TABLE `bugh_uslugi_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cabinet_config`
--

DROP TABLE IF EXISTS `cabinet_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cabinet_config` (
  `parent` set('gui','company_info','locales','locales_options','system') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `key` char(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `value` blob NOT NULL,
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cabinet_config`
--

LOCK TABLES `cabinet_config` WRITE;
/*!40000 ALTER TABLE `cabinet_config` DISABLE KEYS */;
INSERT INTO `cabinet_config` VALUES ('locales','enable_4',_binary '0'),('locales','enable_5',_binary '0'),('locales','file_4',_binary 'original'),('locales','file_5',_binary 'original'),('gui','index_show_discount',_binary '0'),('gui','index_show_fee',_binary '1'),('gui','index_show_speed_in',_binary '1'),('gui','index_show_speed_out',_binary '1'),('locales','name_4',_binary 'bg_BG'),('locales','name_5',_binary 'tr_TR'),('gui','payment_show_tile',_binary '1'),('gui','user_hide_numdogovor',_binary '0'),('gui','user_hide_uid',_binary '0'),('gui','user_registration_after_on',_binary '0'),('gui','user_registration_after_on3',_binary '0'),('system','user_registration_after_pass',_binary '2'),('system','user_registration_after_pass3',_binary '2'),('system','user_registration_after_text',_binary 'Ваш логин: %s\nВаш пароль: %s\nАдрес: http://isp.cabinet.net'),('system','user_registration_after_text3',_binary 'Ваш логин: %s\r\nВаш пароль: %s\r\nАдрес: http://isp.cabinet.net'),('system','user_registration_after_uid',_binary '0'),('system','user_registration_after_uid3',_binary '0'),('system','user_registration_after_user',_binary '1'),('system','user_registration_after_user3',_binary '1'),('gui','user_registration_block3',_binary '0'),('gui','user_registration_def_country3',_binary '\"ua\"'),('system','user_registration_expire_time3',_binary '5'),('system','user_registration_gid3',_binary '0'),('gui','user_registration_hide',_binary '1'),('system','user_registration_houseid3',_binary '0'),('system','user_registration_link_auth3',_binary '3'),('system','user_registration_lot_acc_phone3',_binary '0'),('gui','user_registration_only_country3',_binary '\"ua\", \"ru\", \"by\", \"md\", \"tr\", \"lt\", \"lv\"'),('gui','user_registration_otp_pattern',_binary '1'),('gui','user_registration_otp_pattern3',_binary '1'),('system','user_registration_packet_group',_binary '-1'),('gui','user_registration_phone_as_login',_binary '1'),('gui','user_registration_phone_as_login3',_binary '1'),('gui','user_registration_pref_country3',_binary '\"ua\"'),('system','user_registration_sectorid3',_binary '0'),('system','user_registration_text3',_binary 'Your OTP: %s'),('gui','user_registration_type',_binary '1'),('gui','user_registration_type3_external',_binary '0'),('gui','user_registration_type3_notify',_binary '0'),('gui','user_registration_type3_on',_binary '1'),('gui','user_registration_type3_secret',_binary 'secret'),('gui','user_registration_type3_timeout',_binary '300'),('gui','user_registration_type3_url',_binary 'http://localhost/asterisk.php?phone={{phone}}'),('gui','user_registration_type3_usesms1',_binary '0'),('gui','user_show_inn',_binary '0'),('gui','user_vaucher_length',_binary '18'),('gui','user_vaucher_type',_binary '4');
/*!40000 ALTER TABLE `cabinet_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cabinet_menu_items`
--

DROP TABLE IF EXISTS `cabinet_menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cabinet_menu_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `usersgroupid` int NOT NULL DEFAULT '0',
  `parent` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Родительское меню',
  `sort` int NOT NULL DEFAULT '0',
  `hide` tinyint NOT NULL DEFAULT '1',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hook` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Обработать согласно логике в бекенде',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cabinet_menu_items`
--

LOCK TABLES `cabinet_menu_items` WRITE;
/*!40000 ALTER TABLE `cabinet_menu_items` DISABLE KEYS */;
INSERT INTO `cabinet_menu_items` VALUES (1,'Главная','/',0,0,1,0,'fas fa-home',''),(2,'Услуги','#',0,0,2,0,'icon-check','services'),(3,'Подписки','/index/main/lkview/services',0,0,3,0,'fas fa-list','services_additional'),(4,'Пополнение','/index/main/lkview/payment',0,0,4,0,'icon-money','payment'),(5,'OmegaTV','/index/main/lkview/omegatv',0,0,5,0,'fas fa-tv','omegatv'),(6,'TRINITY-TV','/index/main/lkview/trinitytv',0,0,6,0,'fas fa-tv','trinitytv'),(7,'IVI.RU','/index/main/lkview/ivi',0,0,7,0,'fas fa-tv','ivi'),(8,'24h.tv','/index/main/lkview/24htv',0,0,8,0,'fas fa-tv','24htv'),(9,'Smotreshka','/index/main/lkview/smotreshka',0,0,9,0,'fas fa-tv','smotreshka'),(10,'Megogo','/index/main/lkview/megogo',0,0,10,0,'fas fa-tv','megogo'),(11,'Oll.TV','/index/main/lkview/olltv',0,0,11,0,'fas fa-tv','olltv'),(12,'IptvPortal','/index/main/lkview/iptvportal',0,0,12,0,'fas fa-tv','iptvportal'),(13,'Антивирусы и ПО','/index/main/lkview/rentsoft',0,0,14,0,'icon-shield','rentsoft'),(14,'История','#',0,0,15,0,'icon-time','history'),(15,'Контакты','/index/main/lkview/contact',0,0,16,0,'icon-envelope','contact'),(16,'Смена тарифа','/index/main/lkview/tariff',0,2,1,0,'','tariff'),(17,'Турбо','/index/main/lkview/turbo',0,2,2,0,'','turbo'),(18,'Реальный IP','/index/main/lkview/deactivaterealip',0,2,3,0,'','deactivaterealip'),(19,'Реальный IP','/index/main/lkview/activaterealip',0,2,4,0,'','activaterealip'),(20,'Перевод средств','/index/main/lkview/perevod',0,2,5,0,'','perevod'),(21,'Кредит','/index/main/lkview/credit',0,2,6,0,'','credit'),(22,'Заморозка','/index/main/lkview/freeze',0,2,7,0,'fas fa-snowflake','freeze'),(23,'История платежей','/index/main/lkview/historypayment',0,14,8,0,'','historypayment'),(24,'История сессий','/index/main/lkview/historysession',0,14,9,0,'','historysession'),(25,'ProstoTV','/index/main/lkview/prostotv',0,0,13,0,'fas fa-tv','prostotv'),(26,'Документы','#',0,0,15,1,'fas fa-folder-open',''),(27,'Счета','/index/main/lkview/invoices',0,26,1,0,NULL,''),(28,'Бонусы','/index/main/lkview/bonus',0,0,14,1,'fas fa-donate',''),(29,'MOOVI TV','/index/main/lkview/moovitv',0,0,13,1,'fas fa-tv','moovitv'),(30,'Видеонаблюдение','/index/main/lkview/cctv',0,0,14,1,'fas fa-video','cctv'),(31,'YouTv','/index/main/lkview/youtv',0,0,13,0,'fas fa-tv','youtv'),(32,'Wink','/index/main/lkview/wink',0,0,13,1,'fas fa-tv','wink'),(34,'Sweet.tv','/index/main/lkview/sweettv',0,0,7,0,'fas fa-tv','sweettv'),(35,'Lifecell','#',0,0,9,0,'fas fa-mobile-alt','lifecell'),(36,'Forpost','/index/main/lkview/forpost',0,0,8,0,'fas fa-video','forpost'),(37,'TVCom','/index/main/lkview/tvcom',0,0,7,0,'fas fa-tv','tvcom'),(38,'Информация','/index/main/lkview/lifecell',0,35,2,0,'far fa-address-card','lifecell'),(39,'Тарифная сетка','/index/main/lkview/lifecellmainline',0,35,3,0,'fas fa-clipboard-list','lifecell'),(40,'Доп. пакеты','/index/main/lkview/lifecelladditionalline',0,35,4,0,'fas fa-plus','lifecellextra'),(100,'Тестовое меню','#',0,0,0,1,'icon-shield','');
/*!40000 ALTER TABLE `cabinet_menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cabinet_news`
--

DROP TABLE IF EXISTS `cabinet_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cabinet_news` (
  `newsid` smallint unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `creation_date` timestamp NULL DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `start_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expiration_date` timestamp NULL DEFAULT NULL,
  `settlements` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '[]',
  `stuffid` tinyint unsigned NOT NULL,
  `edited_by_stuffid` tinyint unsigned DEFAULT NULL,
  `display` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`newsid`),
  KEY `dse` (`display`,`start_date`,`expiration_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cabinet_news`
--

LOCK TABLES `cabinet_news` WRITE;
/*!40000 ALTER TABLE `cabinet_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `cabinet_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cabinet_registration`
--

DROP TABLE IF EXISTS `cabinet_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cabinet_registration` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `sms_id` int unsigned DEFAULT NULL COMMENT 'ID из таблицы sms_logs',
  `otp` int(8) unsigned zerofill NOT NULL COMMENT 'Временный код',
  `otp_activated` tinyint NOT NULL DEFAULT '0' COMMENT 'использован ли OTP: bool',
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'дата и время создания кода',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cabinet_registration`
--

LOCK TABLES `cabinet_registration` WRITE;
/*!40000 ALTER TABLE `cabinet_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `cabinet_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changelog`
--

DROP TABLE IF EXISTS `changelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changelog` (
  `change_number` bigint NOT NULL,
  `delta_set` varchar(10) NOT NULL,
  `start_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `complete_dt` timestamp NULL DEFAULT NULL,
  `applied_by` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  PRIMARY KEY (`change_number`,`delta_set`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changelog`
--

LOCK TABLES `changelog` WRITE;
/*!40000 ALTER TABLE `changelog` DISABLE KEYS */;
INSERT INTO `changelog` VALUES (1,'Main','2016-09-11 15:02:45','2016-09-11 15:02:45','dbdeploy','1-2-0-6.sql'),(2,'Main','2016-09-11 15:02:45','2016-09-11 15:02:45','dbdeploy','2-2-0-6-2.sql'),(3,'Main','2016-09-11 15:02:45','2016-09-11 15:02:45','dbdeploy','3-2-0-6-3.sql'),(4,'Main','2016-09-11 15:02:46','2016-09-11 15:02:46','dbdeploy','4-2-1-0.sql'),(5,'Main','2016-09-11 15:02:46','2016-09-11 15:02:46','dbdeploy','5-2-1-0.sql'),(6,'Main','2016-09-11 15:02:47','2016-09-11 15:02:47','dbdeploy','6-2-1-0.sql'),(7,'Main','2016-09-11 15:02:47','2016-09-11 15:02:47','dbdeploy','7-2-1-0.sql'),(8,'Main','2016-09-11 15:02:47','2016-09-11 15:02:47','dbdeploy','8-2-1-1.sql'),(9,'Main','2016-09-11 15:02:47','2016-09-11 15:02:47','dbdeploy','9-2-1-2.sql'),(10,'Main','2016-09-11 15:02:47','2016-09-11 15:02:47','dbdeploy','10-2-1-3.sql'),(11,'Main','2016-09-11 15:02:47','2016-09-11 15:02:47','dbdeploy','11-2-2-0.sql'),(12,'Main','2016-09-11 15:02:47','2016-09-11 15:02:47','dbdeploy','12-2-2-1.sql'),(13,'Main','2016-09-11 15:02:47','2016-09-11 15:02:47','dbdeploy','13-2-2-2.sql'),(14,'Main','2016-09-11 15:02:48','2016-09-11 15:02:48','dbdeploy','14-2-4-0.sql'),(15,'Main','2016-09-11 15:02:48','2016-09-11 15:02:48','dbdeploy','15-2-4-1.sql'),(16,'Main','2016-09-11 15:02:49','2016-09-11 15:02:49','dbdeploy','16-2-5-0.sql'),(17,'Main','2016-09-11 15:02:49','2016-09-11 15:02:49','dbdeploy','17-2-5-1.sql'),(18,'Main','2016-09-11 15:02:49','2016-09-11 15:02:49','dbdeploy','18-2-6-0.sql'),(19,'Main','2016-09-11 15:02:49','2016-09-11 15:02:49','dbdeploy','19-2-7-0.sql'),(20,'Main','2016-09-11 15:02:51','2016-09-11 15:02:51','dbdeploy','20-2-7-4.sql'),(21,'Main','2016-09-11 15:02:52','2016-09-11 15:02:52','dbdeploy','21-2-7-5.sql'),(22,'Main','2016-09-11 15:02:52','2016-09-11 15:02:52','dbdeploy','22-2-7-6.sql'),(23,'Main','2016-09-11 15:02:52','2016-09-11 15:02:52','dbdeploy','23-2-7-8.sql'),(24,'Main','2016-09-11 15:02:53','2016-09-11 15:02:53','dbdeploy','24-2-7-12.sql'),(25,'Main','2016-09-11 15:02:53','2016-09-11 15:02:53','dbdeploy','25-2.7.12.sql'),(26,'Main','2016-09-11 15:02:53','2016-09-11 15:02:53','dbdeploy','26-2.7.13.sql'),(27,'Main','2016-09-11 15:02:53','2016-09-11 15:02:53','dbdeploy','27-2.7.14.sql'),(28,'Main','2016-09-11 15:02:55','2016-09-11 15:02:55','dbdeploy','28-2.7.15.sql'),(29,'Main','2016-09-11 15:02:55','2016-09-11 15:02:55','dbdeploy','29-2.7.19.sql'),(30,'Main','2016-09-11 15:02:55','2016-09-11 15:02:55','dbdeploy','30-2.7.20.sql'),(31,'Main','2016-09-11 15:02:55','2016-09-11 15:02:55','dbdeploy','31-2.7.22.sql'),(32,'Main','2016-09-11 15:02:56','2016-09-11 15:02:56','dbdeploy','32-2.7.23.sql'),(33,'Main','2016-09-11 15:02:56','2016-09-11 15:02:56','dbdeploy','33-2.7.24.sql'),(34,'Main','2016-09-11 15:02:56','2016-09-11 15:02:56','dbdeploy','34-2.7.25.sql'),(35,'Main','2016-09-11 15:02:56','2016-09-11 15:02:56','dbdeploy','35-2.8.3.sql'),(36,'Main','2016-09-11 15:02:56','2016-09-11 15:02:56','dbdeploy','36-2.8.4.sql'),(37,'Main','2016-09-11 15:02:56','2016-09-11 15:02:56','dbdeploy','37-2.8.7.sql'),(38,'Main','2016-09-11 15:02:57','2016-09-11 15:02:57','dbdeploy','38-2.8.8.sql'),(39,'Main','2016-09-11 15:02:57','2016-09-11 15:02:57','dbdeploy','39-2.8.9.sql'),(40,'Main','2016-09-11 15:02:58','2016-09-11 15:02:58','dbdeploy','40-2.8.11.sql'),(41,'Main','2016-09-11 15:02:58','2016-09-11 15:02:58','dbdeploy','41-2.8.12.sql'),(42,'Main','2016-09-11 15:02:58','2016-09-11 15:02:58','dbdeploy','42-2.8.13.sql'),(43,'Main','2016-09-11 15:02:58','2016-09-11 15:02:58','dbdeploy','43-2.8.14.sql'),(44,'Main','2016-09-11 15:02:58','2016-09-11 15:02:58','dbdeploy','44-2.8.15.1.sql'),(45,'Main','2016-09-11 15:02:59','2016-09-11 15:02:59','dbdeploy','45-2.8.15.2.sql'),(46,'Main','2016-09-11 15:02:59','2016-09-11 15:02:59','dbdeploy','46-2.8.15.3.sql'),(47,'Main','2016-09-11 15:02:59','2016-09-11 15:02:59','dbdeploy','47-2.8.15.4.sql'),(48,'Main','2016-09-11 15:03:00','2016-09-11 15:03:00','dbdeploy','48-2.8.16.sql'),(49,'Main','2016-09-11 15:03:00','2016-09-11 15:03:00','dbdeploy','49-2.8.16.sql'),(50,'Main','2016-09-11 15:03:00','2016-09-11 15:03:00','dbdeploy','50-2.8.16.sql'),(51,'Main','2016-09-11 15:03:00','2016-09-11 15:03:00','dbdeploy','51-2.8.16.sql'),(52,'Main','2016-09-11 15:03:00','2016-09-11 15:03:00','dbdeploy','52-2.8.16.sql'),(53,'Main','2016-09-11 15:03:00','2016-09-11 15:03:00','dbdeploy','53-2.8.16.sql'),(54,'Main','2016-09-11 15:03:00','2016-09-11 15:03:00','dbdeploy','54-2.8.17.sql'),(55,'Main','2016-09-11 15:03:00','2016-09-11 15:03:00','dbdeploy','55-2.8.17.sql'),(56,'Main','2016-09-11 15:03:00','2016-09-11 15:03:00','dbdeploy','56-2.8.17.sql'),(57,'Main','2016-09-11 15:03:01','2016-09-11 15:03:01','dbdeploy','57-2.8.17.sql'),(58,'Main','2016-09-11 15:03:01','2016-09-11 15:03:01','dbdeploy','58-2.8.17.sql'),(59,'Main','2016-09-11 15:03:01','2016-09-11 15:03:01','dbdeploy','59-2.8.17.sql'),(60,'Main','2016-09-11 15:03:01','2016-09-11 15:03:01','dbdeploy','60-2.8.17.sql'),(61,'Main','2016-09-11 15:03:01','2016-09-11 15:03:01','dbdeploy','61-2.8.18.sql'),(62,'Main','2016-09-11 15:03:01','2016-09-11 15:03:01','dbdeploy','62-2.8.18.sql'),(63,'Main','2016-09-11 15:03:01','2016-09-11 15:03:01','dbdeploy','63-2.8.18.sql'),(64,'Main','2016-09-11 15:03:01','2016-09-11 15:03:01','dbdeploy','64-2.8.18.sql'),(65,'Main','2016-09-11 15:03:01','2016-09-11 15:03:01','dbdeploy','65-2.8.18.sql'),(66,'Main','2016-09-11 15:03:01','2016-09-11 15:03:01','dbdeploy','66-2.8.18.sql'),(67,'Main','2016-09-11 15:03:02','2016-09-11 15:03:02','dbdeploy','67-2.8.18.sql'),(68,'Main','2016-09-11 15:03:02','2016-09-11 15:03:02','dbdeploy','68-2.8.18.sql'),(69,'Main','2016-09-11 15:03:02','2016-09-11 15:03:02','dbdeploy','69-2.8.19.sql'),(70,'Main','2016-09-11 15:03:03','2016-09-11 15:03:03','dbdeploy','70-2.8.19.sql'),(71,'Main','2016-09-11 15:03:03','2016-09-11 15:03:03','dbdeploy','71-2.8.19.sql'),(72,'Main','2016-09-11 15:03:03','2016-09-11 15:03:03','dbdeploy','72-2.8.19.sql'),(73,'Main','2016-09-11 15:03:03','2016-09-11 15:03:03','dbdeploy','73-2.8.20.sql'),(74,'Main','2016-09-11 15:03:03','2016-09-11 15:03:03','dbdeploy','74-2.8.20.sql'),(75,'Main','2016-09-11 15:03:04','2016-09-11 15:03:04','dbdeploy','75-2.8.20.sql'),(76,'Main','2016-09-11 15:03:04','2016-09-11 15:03:04','dbdeploy','76-2.8.20.sql'),(77,'Main','2016-09-11 15:03:04','2016-09-11 15:03:04','dbdeploy','77-2.8.20.sql'),(78,'Main','2016-09-11 15:03:04','2016-09-11 15:03:04','dbdeploy','78-2.8.20.sql'),(79,'Main','2016-09-11 15:03:04','2016-09-11 15:03:04','dbdeploy','79-2.8.20.sql'),(80,'Main','2016-09-11 15:03:04','2016-09-11 15:03:04','dbdeploy','80-2.8.20.sql'),(81,'Main','2016-09-11 15:03:04','2016-09-11 15:03:04','dbdeploy','81-2.8.20.sql'),(82,'Main','2016-09-11 15:03:04','2016-09-11 15:03:04','dbdeploy','82-2.8.20.sql'),(83,'Main','2016-09-11 15:03:05','2016-09-11 15:03:05','dbdeploy','83-2.8.20.sql'),(84,'Main','2016-09-11 15:03:05','2016-09-11 15:03:05','dbdeploy','84-2.8.20.sql'),(85,'Main','2016-09-11 15:03:05','2016-09-11 15:03:05','dbdeploy','85-2.8.20.sql'),(86,'Main','2016-09-11 15:03:05','2016-09-11 15:03:05','dbdeploy','86-2.8.20.sql'),(87,'Main','2016-09-11 15:03:05','2016-09-11 15:03:05','dbdeploy','87-2.8.20.sql'),(88,'Main','2016-09-11 15:03:05','2016-09-11 15:03:05','dbdeploy','88-2.8.20.sql'),(89,'Main','2016-09-11 15:03:05','2016-09-11 15:03:05','dbdeploy','89-2.8.20.sql'),(90,'Main','2016-09-11 15:03:05','2016-09-11 15:03:05','dbdeploy','90-2.8.20.sql'),(91,'Main','2016-09-11 15:03:06','2016-09-11 15:03:06','dbdeploy','91-2.8.20.sql'),(92,'Main','2016-09-11 15:03:06','2016-09-11 15:03:06','dbdeploy','92-2.8.20.sql'),(93,'Main','2016-09-11 15:03:06','2016-09-11 15:03:06','dbdeploy','93-2.9.1.sql'),(94,'Main','2016-09-11 15:03:06','2016-09-11 15:03:06','dbdeploy','94-2.9.1.sql'),(95,'Main','2016-09-11 15:03:06','2016-09-11 15:03:06','dbdeploy','95-2.9.1.sql'),(96,'Main','2016-09-11 15:03:06','2016-09-11 15:03:06','dbdeploy','96-2.9.1.sql'),(97,'Main','2016-09-11 15:03:06','2016-09-11 15:03:06','dbdeploy','97-2.9.1.sql'),(98,'Main','2016-09-11 15:03:06','2016-09-11 15:03:06','dbdeploy','98-2.9.2.sql'),(99,'Main','2016-09-11 15:03:07','2016-09-11 15:03:07','dbdeploy','99-2.9.2.sql'),(100,'Main','2016-09-11 15:03:07','2016-09-11 15:03:07','dbdeploy','100-2.9.3.sql'),(101,'Main','2016-09-11 15:03:07','2016-09-11 15:03:07','dbdeploy','101-2.10.1.sql'),(102,'Main','2016-09-11 15:03:07','2016-09-11 15:03:07','dbdeploy','102-2.10.1.sql'),(103,'Main','2016-09-11 15:03:07','2016-09-11 15:03:07','dbdeploy','103-2.10.1.sql'),(104,'Main','2016-09-11 15:03:07','2016-09-11 15:03:07','dbdeploy','104-2.10.1.sql'),(105,'Main','2016-09-11 15:03:07','2016-09-11 15:03:07','dbdeploy','105-2.10.2.sql'),(106,'Main','2016-09-11 15:03:07','2016-09-11 15:03:07','dbdeploy','106-2.10.2.sql'),(107,'Main','2016-09-11 15:03:07','2016-09-11 15:03:07','dbdeploy','107-2.10.2.sql'),(108,'Main','2016-09-11 15:03:07','2016-09-11 15:03:07','dbdeploy','108-2.10.2.sql'),(109,'Main','2016-09-11 15:03:07','2016-09-11 15:03:07','dbdeploy','109-2.10.2.sql'),(110,'Main','2016-09-11 15:03:07','2016-09-11 15:03:07','dbdeploy','110-2.10.3.sql'),(111,'Main','2016-09-11 15:03:07','2016-09-11 15:03:07','dbdeploy','111-2.10.4.sql'),(112,'Main','2016-09-11 15:03:07','2016-09-11 15:03:07','dbdeploy','112-2.10.4.sql'),(113,'Main','2016-09-11 15:03:07','2016-09-11 15:03:07','dbdeploy','113-2.10.4.sql'),(114,'Main','2016-09-11 15:03:07','2016-09-11 15:03:07','dbdeploy','114-2.10.4.sql'),(115,'Main','2016-09-11 15:03:08','2016-09-11 15:03:08','dbdeploy','115-2.10.4.sql'),(116,'Main','2016-09-11 15:03:08','2016-09-11 15:03:08','dbdeploy','116-2.10.5.sql'),(117,'Main','2016-09-11 15:03:08','2016-09-11 15:03:08','dbdeploy','117-2.10.5.sql'),(118,'Main','2016-09-11 15:03:08','2016-09-11 15:03:08','dbdeploy','118-2.10.5.sql'),(119,'Main','2016-09-11 15:03:08','2016-09-11 15:03:08','dbdeploy','119-2.10.6.sql'),(120,'Main','2016-09-11 15:03:08','2016-09-11 15:03:08','dbdeploy','120-2.10.7.sql'),(121,'Main','2016-09-11 15:03:08','2016-09-11 15:03:08','dbdeploy','121-2.10.7.sql'),(122,'Main','2017-01-16 18:07:48','2017-01-16 18:07:48','dbdeploy','122-2.10.8.sql'),(123,'Main','2017-01-16 18:07:48','2017-01-16 18:07:48','dbdeploy','123-2.10.8.sql'),(124,'Main','2017-01-16 18:07:48','2017-01-16 18:07:48','dbdeploy','124-2.10.8.sql'),(125,'Main','2017-01-16 18:07:48','2017-01-16 18:07:48','dbdeploy','125-2.10.8.sql'),(126,'Main','2017-01-16 18:07:48','2017-01-16 18:07:48','dbdeploy','126-2.10.8.sql'),(127,'Main','2017-01-16 18:07:48','2017-01-16 18:07:48','dbdeploy','127-2.10.8.sql'),(128,'Main','2017-01-16 18:07:48','2017-01-16 18:07:48','dbdeploy','128-2.10.8.sql'),(129,'Main','2017-01-16 18:07:48','2017-01-16 18:07:48','dbdeploy','129-2.10.8.sql'),(130,'Main','2017-01-16 18:07:48','2017-01-16 18:07:48','dbdeploy','130-2.10.8.sql'),(131,'Main','2017-01-16 18:07:48','2017-01-16 18:07:48','dbdeploy','131-2.10.8.sql'),(132,'Main','2017-01-16 18:07:48','2017-01-16 18:07:48','dbdeploy','132-2.10.8.sql'),(133,'Main','2017-01-16 18:07:48','2017-01-16 18:07:48','dbdeploy','133-2.10.8.sql'),(134,'Main','2017-01-16 18:07:48','2017-01-16 18:07:48','dbdeploy','134-2.10.8.sql'),(135,'Main','2017-01-16 18:07:48','2017-01-16 18:07:48','dbdeploy','135-2.10.8.sql'),(136,'Main','2017-01-16 18:07:48','2017-01-16 18:07:48','dbdeploy','136-2.10.8.sql'),(137,'Main','2017-01-16 18:07:49','2017-01-16 18:07:49','dbdeploy','137-2.10.8.sql'),(138,'Main','2017-01-16 18:07:49','2017-01-16 18:07:49','dbdeploy','138-2.10.8.sql'),(139,'Main','2017-01-16 18:07:49','2017-01-16 18:07:49','dbdeploy','139-2.10.9.sql'),(140,'Main','2017-01-16 18:07:49','2017-01-16 18:07:49','dbdeploy','140-2.11.1.sql'),(141,'Main','2017-01-16 18:07:49','2017-01-16 18:07:49','dbdeploy','141-2.11.2.sql'),(142,'Main','2017-01-16 18:07:49','2017-01-16 18:07:49','dbdeploy','142-2.11.3.sql'),(143,'Main','2017-01-16 18:07:49','2017-01-16 18:07:49','dbdeploy','143-2.11.4.sql'),(144,'Main','2017-01-16 18:07:49','2017-01-16 18:07:49','dbdeploy','144-2.11.5.sql'),(145,'Main','2020-12-25 14:53:42','2020-12-25 14:53:42','dbdeploy','145-2.11.6.sql'),(146,'Main','2020-12-25 14:53:42','2020-12-25 14:53:42','dbdeploy','146-2.11.6.sql'),(147,'Main','2020-12-25 14:53:42','2020-12-25 14:53:42','dbdeploy','147-2.11.6.sql'),(148,'Main','2020-12-25 14:53:42','2020-12-25 14:53:42','dbdeploy','148-2.11.7.sql'),(149,'Main','2020-12-25 14:53:42','2020-12-25 14:53:42','dbdeploy','149-2.11.8.sql'),(150,'Main','2020-12-25 14:53:42','2020-12-25 14:53:42','dbdeploy','150-2.11.8.sql'),(151,'Main','2020-12-25 14:53:42','2020-12-25 14:53:42','dbdeploy','151-2.11.8.sql'),(152,'Main','2020-12-25 14:53:42','2020-12-25 14:53:42','dbdeploy','152-2.11.8.sql'),(153,'Main','2020-12-25 14:53:42','2020-12-25 14:53:42','dbdeploy','153-2.11.9.sql'),(154,'Main','2020-12-25 14:53:42','2020-12-25 14:53:42','dbdeploy','154-2.11.9.sql'),(155,'Main','2020-12-25 14:53:42','2020-12-25 14:53:42','dbdeploy','155-2.11.9.sql'),(156,'Main','2020-12-25 14:53:43','2020-12-25 14:53:43','dbdeploy','156-2.11.9.sql'),(157,'Main','2020-12-25 14:53:43','2020-12-25 14:53:43','dbdeploy','157-2.11.9.sql'),(158,'Main','2020-12-25 14:53:43','2020-12-25 14:53:43','dbdeploy','158-2.11.9.sql'),(159,'Main','2020-12-25 14:53:43','2020-12-25 14:53:43','dbdeploy','159-2.12.1.sql'),(160,'Main','2020-12-25 14:53:43','2020-12-25 14:53:43','dbdeploy','160-2.12.1.sql'),(161,'Main','2020-12-25 14:53:43','2020-12-25 14:53:43','dbdeploy','161-2.12.1.sql'),(162,'Main','2020-12-25 14:53:44','2020-12-25 14:53:44','dbdeploy','162-2.12.1.sql'),(163,'Main','2020-12-25 14:53:44','2020-12-25 14:53:44','dbdeploy','163-2.12.1.sql'),(164,'Main','2020-12-25 14:53:44','2020-12-25 14:53:44','dbdeploy','164-2.12.1.sql'),(165,'Main','2020-12-25 14:53:44','2020-12-25 14:53:44','dbdeploy','165-2.12.1.sql'),(166,'Main','2020-12-25 14:53:44','2020-12-25 14:53:44','dbdeploy','166-2.12.1.sql'),(167,'Main','2020-12-25 14:53:44','2020-12-25 14:53:44','dbdeploy','167-2.12.2.sql'),(168,'Main','2020-12-25 14:53:44','2020-12-25 14:53:44','dbdeploy','168-2.12.2.sql'),(169,'Main','2020-12-25 14:53:44','2020-12-25 14:53:44','dbdeploy','169-2.12.2.sql'),(170,'Main','2020-12-25 14:53:44','2020-12-25 14:53:44','dbdeploy','170-2.12.2.sql'),(171,'Main','2020-12-25 14:53:44','2020-12-25 14:53:44','dbdeploy','171-2.12.3.sql'),(172,'Main','2020-12-25 14:53:44','2020-12-25 14:53:44','dbdeploy','172-2.12.3.sql'),(173,'Main','2020-12-25 14:53:44','2020-12-25 14:53:44','dbdeploy','173-2.12.3.sql'),(174,'Main','2020-12-25 14:53:44','2020-12-25 14:53:44','dbdeploy','174-2.12.3.sql'),(175,'Main','2020-12-25 14:53:44','2020-12-25 14:53:44','dbdeploy','175-2.12.3.sql'),(176,'Main','2020-12-25 14:53:44','2020-12-25 14:53:44','dbdeploy','176-2.12.3.sql'),(177,'Main','2020-12-25 14:53:44','2020-12-25 14:53:44','dbdeploy','177-2.12.3.sql'),(178,'Main','2020-12-25 14:53:44','2020-12-25 14:53:44','dbdeploy','178-2.12.3.sql'),(179,'Main','2020-12-25 14:53:44','2020-12-25 14:53:44','dbdeploy','179-2.12.3.sql'),(180,'Main','2020-12-25 14:53:44','2020-12-25 14:53:44','dbdeploy','180-2.12.3.sql'),(181,'Main','2020-12-25 14:53:44','2020-12-25 14:53:44','dbdeploy','181-2.12.3.sql'),(182,'Main','2020-12-25 14:53:44','2020-12-25 14:53:44','dbdeploy','182-2.12.3.sql'),(183,'Main','2020-12-25 14:53:45','2020-12-25 14:53:45','dbdeploy','183-2.12.3.sql'),(184,'Main','2020-12-25 14:53:45','2020-12-25 14:53:45','dbdeploy','184-2.12.3.sql'),(185,'Main','2020-12-25 14:53:45','2020-12-25 14:53:45','dbdeploy','185-2.12.3.sql'),(186,'Main','2020-12-25 14:53:45','2020-12-25 14:53:45','dbdeploy','186-2.12.3.sql'),(187,'Main','2020-12-25 14:53:45','2020-12-25 14:53:45','dbdeploy','187-2.12.3.sql'),(188,'Main','2020-12-25 14:53:45','2020-12-25 14:53:45','dbdeploy','188-2.12.3.sql'),(189,'Main','2020-12-25 14:53:45','2020-12-25 14:53:45','dbdeploy','189-2.12.3.sql'),(190,'Main','2020-12-25 14:53:45','2020-12-25 14:53:45','dbdeploy','190-2.12.3.sql'),(191,'Main','2020-12-25 14:53:45','2020-12-25 14:53:45','dbdeploy','191-2.12.4.sql'),(192,'Main','2020-12-25 14:53:45','2020-12-25 14:53:45','dbdeploy','192-2.12.5.sql'),(193,'Main','2020-12-25 14:53:45','2020-12-25 14:53:45','dbdeploy','193-2.12.5.sql'),(194,'Main','2020-12-25 14:53:45','2020-12-25 14:53:45','dbdeploy','194-2.12.5.sql'),(195,'Main','2020-12-25 14:53:45','2020-12-25 14:53:45','dbdeploy','195-2.12.5.sql'),(196,'Main','2020-12-25 14:53:45','2020-12-25 14:53:45','dbdeploy','196-2.12.6.sql'),(197,'Main','2020-12-25 14:53:45','2020-12-25 14:53:45','dbdeploy','197-2.12.6.sql'),(198,'Main','2020-12-25 14:53:45','2020-12-25 14:53:45','dbdeploy','198-2.12.7.sql'),(199,'Main','2020-12-25 14:53:45','2020-12-25 14:53:45','dbdeploy','199-2.12.7.sql'),(200,'Main','2020-12-25 14:53:45','2020-12-25 14:53:45','dbdeploy','200-2.12.7.sql'),(201,'Main','2020-12-25 14:53:45','2020-12-25 14:53:45','dbdeploy','201-2.12.7.sql'),(202,'Main','2020-12-25 14:53:45','2020-12-25 14:53:45','dbdeploy','202-2.12.7.sql'),(203,'Main','2020-12-25 14:53:45','2020-12-25 14:53:45','dbdeploy','203-2.12.7.sql'),(204,'Main','2020-12-25 14:53:45','2020-12-25 14:53:45','dbdeploy','204-2.12.9.sql'),(205,'Main','2020-12-25 14:53:45','2020-12-25 14:53:45','dbdeploy','205-2.12.9.sql'),(206,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','206-2.12.9.sql'),(207,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','207-2.12.9.sql'),(208,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','208-2.12.9.sql'),(209,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','209-2.12.9.sql'),(210,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','210-2.12.9.sql'),(211,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','211-2.12.9.sql'),(212,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','212-2.12.9.sql'),(213,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','213-2.12.10.sql'),(214,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','214-2.12.10.sql'),(215,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','215-2.12.10.sql'),(216,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','216-2.12.10.sql'),(217,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','217-2.12.10.sql'),(218,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','218-2.12.10.sql'),(219,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','219-2.12.10.sql'),(220,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','220-2.12.10.sql'),(221,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','221-2.12.10.sql'),(222,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','222-2.12.10.sql'),(223,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','223-2.12.10.sql'),(224,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','224-2.12.10.sql'),(225,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','225-2.12.10.sql'),(226,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','226.2.12.11.sql'),(227,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','227-2.12.12.sql'),(228,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','228-2.12.13.sql'),(229,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','229-2.13.01.sql'),(230,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','230-2.12.01.sql'),(231,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','231-2.13.01.sql'),(232,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','232-2.13.01.sql'),(233,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','233-2.13.02.sql'),(234,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','234-2.13.02.sql'),(235,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','235-2.13.02.sql'),(236,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','236-2.13.02.sql'),(237,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','237-2.13.02.sql'),(238,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','238-2.13.02.sql'),(239,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','239-2.13.02.sql'),(240,'Main','2020-12-25 14:53:46','2020-12-25 14:53:46','dbdeploy','240-2.13.03.sql'),(241,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','241-2.13.03.sql'),(242,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','242-2.13.03.sql'),(243,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','243-2.13.03.sql'),(244,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','244-2.13.03.sql'),(245,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','245-2.13.03.sql'),(246,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','246-2.13.03.sql'),(247,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','247-2.13.03.sql'),(248,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','248-2.13.03.sql'),(249,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','249-2.13.03.sql'),(250,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','250-2.13.03.sql'),(251,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','251-2.13.04.sql'),(252,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','252-2.13.04.sql'),(253,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','253-2.13.03.sql'),(254,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','254-2.14.01.sql'),(255,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','255-2.14.02.sql'),(256,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','256-2.14.03.sql'),(257,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','257-2.14.04.sql'),(258,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','258-2.14.04.sql'),(259,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','259-2.14.04.sql'),(260,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','260-2.14.04.sql'),(261,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','261-2.14.04.sql'),(262,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','262-2.14.04.sql'),(263,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','263-2.14.05.sql'),(264,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','264-2.14.06.sql'),(265,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','265-2.15.01.sql'),(266,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','266-3.01.01.sql'),(267,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','267-3.01.02.sql'),(268,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','268-3.01.02.sql'),(269,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','269-3.01.02.sql'),(270,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','270-3.01.02.sql'),(271,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','271-3.01.02.sql'),(272,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','272-3.02.01.sql'),(273,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','273-3.02.02.sql'),(274,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','274-3.02.02.sql'),(275,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','275-3.02.02.sql'),(276,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','276-3.02.02.sql'),(277,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','277-3.03.01.sql'),(278,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','278-3.03.01.sql'),(279,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','279-3.03.01.sql'),(280,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','280-3.03.01.sql'),(281,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','281-3.03.01.sql'),(282,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','282-3.03.01.sql'),(283,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','283-3.03.01.sql'),(284,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','284-3.03.01.sql'),(285,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','285-3.03.01.sql'),(286,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','286-3.03.01.sql'),(287,'Main','2020-12-25 14:53:47','2020-12-25 14:53:47','dbdeploy','287-3.03.01.sql'),(288,'Main','2020-12-25 14:53:48','2020-12-25 14:53:48','dbdeploy','288-3.03.01.sql'),(289,'Main','2020-12-25 14:53:48','2020-12-25 14:53:48','dbdeploy','289-3.03.01.sql'),(290,'Main','2020-12-25 14:53:48','2020-12-25 14:53:48','dbdeploy','290-3.03.02.sql'),(291,'Main','2020-12-25 14:53:48','2020-12-25 14:53:48','dbdeploy','291-3.03.03.sql'),(292,'Main','2020-12-25 14:53:48','2020-12-25 14:53:48','dbdeploy','292-3.03.04.sql'),(293,'Main','2020-12-25 14:53:48','2020-12-25 14:53:48','dbdeploy','293-3.03.04.sql'),(294,'Main','2020-12-25 14:53:48','2020-12-25 14:53:48','dbdeploy','294-3.03.04.sql'),(295,'Main','2020-12-25 14:53:48','2020-12-25 14:53:48','dbdeploy','295-3.03.04.sql'),(296,'Main','2020-12-25 14:53:48','2020-12-25 14:53:48','dbdeploy','296-3.03.04.sql'),(297,'Main','2020-12-25 14:53:48','2020-12-25 14:53:48','dbdeploy','297-3.03.04.sql'),(298,'Main','2020-12-25 14:53:48','2020-12-25 14:53:48','dbdeploy','298-3.03.04.sql'),(299,'Main','2020-12-25 14:53:48','2020-12-25 14:53:48','dbdeploy','299-3.03.04.sql'),(300,'Main','2020-12-25 14:53:48','2020-12-25 14:53:48','dbdeploy','300-3.03.04.sql'),(301,'Main','2020-12-25 14:53:48','2020-12-25 14:53:48','dbdeploy','301-3.03.04.sql'),(302,'Main','2020-12-25 14:53:48','2020-12-25 14:53:48','dbdeploy','302-3.03.04.sql'),(303,'Main','2020-12-25 14:53:48','2020-12-25 14:53:48','dbdeploy','303-3.03.05.sql'),(304,'Main','2020-12-25 14:53:48','2020-12-25 14:53:48','dbdeploy','304-3.03.05.sql'),(305,'Main','2020-12-25 14:53:48','2020-12-25 14:53:48','dbdeploy','305-3.03.05.sql'),(306,'Main','2020-12-25 14:53:48','2020-12-25 14:53:48','dbdeploy','306-3.03.05.sql'),(307,'Main','2020-12-25 14:53:48','2020-12-25 14:53:48','dbdeploy','307-3.03.05.sql'),(308,'Main','2020-12-25 14:53:48','2020-12-25 14:53:48','dbdeploy','308-3.03.05.sql'),(309,'Main','2020-12-25 14:53:48','2020-12-25 14:53:48','dbdeploy','309-3.03.05.sql'),(310,'Main','2020-12-25 14:53:48','2020-12-25 14:53:48','dbdeploy','310-3.03.05.sql'),(311,'Main','2020-12-25 14:53:48','2020-12-25 14:53:48','dbdeploy','311-3.03.05.sql'),(312,'Main','2020-12-25 14:53:49','2020-12-25 14:53:49','dbdeploy','312-3.03.05.sql'),(313,'Main','2020-12-25 14:53:49','2020-12-25 14:53:49','dbdeploy','313-3.03.05.sql'),(314,'Main','2020-12-25 14:53:49','2020-12-25 14:53:49','dbdeploy','314-3.03.05.sql'),(315,'Main','2020-12-25 14:53:49','2020-12-25 14:53:49','dbdeploy','315-3.03.05.sql'),(316,'Main','2020-12-25 14:53:49','2020-12-25 14:53:49','dbdeploy','316-3.03.05.sql'),(317,'Main','2020-12-25 14:53:49','2020-12-25 14:53:49','dbdeploy','317-3.03.05.sql'),(318,'Main','2020-12-25 14:53:49','2020-12-25 14:53:49','dbdeploy','318-3.03.05.sql'),(319,'Main','2020-12-25 14:53:49','2020-12-25 14:53:49','dbdeploy','319-3.03.05.sql'),(320,'Main','2020-12-25 14:53:49','2020-12-25 14:53:49','dbdeploy','320-3.03.05.sql'),(321,'Main','2020-12-25 14:53:49','2020-12-25 14:53:49','dbdeploy','321-3.03.05.sql'),(322,'Main','2020-12-25 14:53:49','2020-12-25 14:53:49','dbdeploy','322-3.03.06.sql'),(323,'Main','2020-12-25 14:53:49','2020-12-25 14:53:49','dbdeploy','323-3.03.06.sql'),(324,'Main','2020-12-25 14:53:49','2020-12-25 14:53:49','dbdeploy','324-3.03.06.sql'),(325,'Main','2020-12-25 14:53:49','2020-12-25 14:53:49','dbdeploy','325-3.03.06.sql'),(326,'Main','2020-12-25 14:53:49','2020-12-25 14:53:49','dbdeploy','326-3.03.06.sql'),(327,'Main','2020-12-25 14:53:49','2020-12-25 14:53:49','dbdeploy','327-3.03.06.sql'),(328,'Main','2020-12-25 14:53:49','2020-12-25 14:53:49','dbdeploy','328-3.03.06.sql'),(329,'Main','2020-12-25 14:53:49','2020-12-25 14:53:49','dbdeploy','329-3.03.07.sql'),(330,'Main','2020-12-25 14:53:49','2020-12-25 14:53:49','dbdeploy','330-3.03.07.sql'),(331,'Main','2020-12-25 14:53:50','2020-12-25 14:53:50','dbdeploy','331-3.03.07.sql'),(332,'Main','2020-12-25 14:53:50','2020-12-25 14:53:50','dbdeploy','332-3.03.07.sql'),(333,'Main','2020-12-25 14:53:50','2020-12-25 14:53:50','dbdeploy','333-3.03.07.sql'),(334,'Main','2020-12-25 14:53:50','2020-12-25 14:53:50','dbdeploy','334-3.03.07.sql'),(335,'Main','2020-12-25 14:53:50','2020-12-25 14:53:50','dbdeploy','335-3.03.07.sql'),(336,'Main','2020-12-25 14:53:50','2020-12-25 14:53:50','dbdeploy','336-3.03.07.sql'),(337,'Main','2020-12-25 14:53:50','2020-12-25 14:53:50','dbdeploy','337-3.03.07.sql'),(338,'Main','2020-12-25 14:53:50','2020-12-25 14:53:50','dbdeploy','338-3.03.07.sql'),(339,'Main','2020-12-25 14:53:50','2020-12-25 14:53:50','dbdeploy','339-3.03.07.sql'),(340,'Main','2020-12-25 14:53:50','2020-12-25 14:53:50','dbdeploy','340-3.03.07.sql'),(341,'Main','2020-12-25 14:53:50','2020-12-25 14:53:50','dbdeploy','341-3.03.07.sql'),(342,'Main','2020-12-25 14:53:50','2020-12-25 14:53:50','dbdeploy','342-3.03.07.sql'),(343,'Main','2020-12-25 14:53:50','2020-12-25 14:53:50','dbdeploy','343-3.03.07.sql'),(344,'Main','2020-12-25 14:53:50','2020-12-25 14:53:50','dbdeploy','344-3.03.07.sql'),(345,'Main','2020-12-25 14:53:50','2020-12-25 14:53:50','dbdeploy','345-3.03.07.sql'),(346,'Main','2020-12-25 14:53:50','2020-12-25 14:53:50','dbdeploy','346-3.03.07.sql'),(347,'Main','2020-12-25 14:53:50','2020-12-25 14:53:50','dbdeploy','347-3.03.07.sql'),(348,'Main','2020-12-25 14:53:50','2020-12-25 14:53:50','dbdeploy','348-3.03.07.sql'),(349,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','349-3.03.07.sql'),(350,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','350-3.03.07.sql'),(351,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','351-3.03.07.sql'),(352,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','352-3.03.07.sql'),(353,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','353-3.03.07.sql'),(354,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','354-3.03.08.sql'),(355,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','355-3.03.08.sql'),(356,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','356-3.03.08.sql'),(357,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','357-3.03.08.sql'),(358,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','358-3.03.08.sql'),(359,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','359-3.03.08.sql'),(360,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','360-3.03.08.sql'),(361,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','361-3.03.08.sql'),(362,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','362-3.03.08.sql'),(363,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','363-3.03.08.sql'),(364,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','364-3.03.08.sql'),(365,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','365-3.03.08.sql'),(366,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','366-3.03.08.sql'),(367,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','367-3.03.08.sql'),(368,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','368-3.03.08.sql'),(369,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','369-3.03.08.sql'),(370,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','370-3.03.08.sql'),(371,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','371-3.03.08.sql'),(372,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','372-3.03.09.sql'),(373,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','373-3.03.09.sql'),(374,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','374-3.03.09.sql'),(375,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','375-3.03.09.sql'),(376,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','376-3.03.09.sql'),(377,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','377-3.03.09.sql'),(378,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','378-3.03.09.sql'),(379,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','379-3.03.09.sql'),(380,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','380-3.03.09.sql'),(381,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','381-3.03.09.sql'),(382,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','382-3.03.09.sql'),(383,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','383-3.03.09.sql'),(384,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','384-3.03.09.sql'),(385,'Main','2020-12-25 14:53:51','2020-12-25 14:53:51','dbdeploy','385-3.03.09.sql'),(386,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','386-3.03.09.sql'),(387,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','387-3.03.09.sql'),(388,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','388-3.03.09.sql'),(389,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','389-3.03.09.sql'),(390,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','390-3.03.09.sql'),(391,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','391-3.03.10.sql'),(392,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','392-3.03.10 .sql'),(393,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','393-3.03.10.sql'),(394,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','394-3.03.11.sql'),(395,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','395-3.03.11.sql'),(396,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','396-3.03.11.sql'),(397,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','397-3.03.11.sql'),(398,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','398-3.03.11.sql'),(399,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','399-3.03.11.sql'),(400,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','400-3.03.12.sql'),(401,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','401-3.03.12.sql'),(402,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','402-3.03.12.sql'),(403,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','403-3.03.12.sql'),(404,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','404-3.03.12.sql'),(405,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','405-3.03.12.sql'),(406,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','406-3.03.12.sql'),(407,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','407-3.03.12.sql'),(408,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','408-3.03.12.sql'),(409,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','409-3.03.12.sql'),(410,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','410-3.03.12.sql'),(411,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','411-3.03.12.sql'),(412,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','412-3.03.12.sql'),(413,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','413-3.04.01.sql'),(414,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','414-3.04.01.sql'),(415,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','415-3.04.01.sql'),(416,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','416-3.04.01.sql'),(417,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','417-3.04.01.sql'),(418,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','418-3.04.02.sql'),(419,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','419-3.04.02.sql'),(420,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','420-3.04.02.sql'),(421,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','421-3.04.02.sql'),(422,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','422-3.04.02.sql'),(423,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','423-3.04.02.sql'),(424,'Main','2020-12-25 14:53:52','2020-12-25 14:53:52','dbdeploy','424-3.04.02.sql'),(425,'Main','2020-12-25 14:53:53','2020-12-25 14:53:53','dbdeploy','425-3.04.02.sql'),(426,'Main','2020-12-25 14:53:53','2020-12-25 14:53:53','dbdeploy','426-3.04.02.sql'),(427,'Main','2020-12-25 14:53:53','2020-12-25 14:53:53','dbdeploy','427-3.04.02.sql'),(428,'Main','2020-12-25 14:53:53','2020-12-25 14:53:53','dbdeploy','428-3.04.02.sql'),(429,'Main','2020-12-25 14:53:53','2020-12-25 14:53:53','dbdeploy','429-3.04.02.sql'),(430,'Main','2020-12-25 14:53:53','2020-12-25 14:53:53','dbdeploy','430-3.04.02.sql'),(431,'Main','2020-12-25 14:53:53','2020-12-25 14:53:53','dbdeploy','431-3.04.02.sql'),(432,'Main','2020-12-25 14:53:53','2020-12-25 14:53:53','dbdeploy','432-3.04.02.sql'),(433,'Main','2020-12-25 14:53:53','2020-12-25 14:53:53','dbdeploy','433-3.04.02.sql'),(434,'Main','2020-12-25 14:53:53','2020-12-25 14:53:53','dbdeploy','434-3.04.02.sql'),(435,'Main','2020-12-25 14:53:53','2020-12-25 14:53:53','dbdeploy','435-3.04.02.sql'),(436,'Main','2020-12-25 14:53:53','2020-12-25 14:53:53','dbdeploy','436-3.04.02.sql'),(437,'Main','2020-12-25 14:53:53','2020-12-25 14:53:53','dbdeploy','437-3.04.02.sql'),(438,'Main','2020-12-25 14:53:53','2020-12-25 14:53:53','dbdeploy','438-3.04.02.sql'),(439,'Main','2020-12-25 14:53:53','2020-12-25 14:53:53','dbdeploy','439-3.04.02.sql'),(440,'Main','2020-12-25 14:53:53','2020-12-25 14:53:53','dbdeploy','440-3.04.02.sql'),(441,'Main','2020-12-25 14:53:53','2020-12-25 14:53:53','dbdeploy','441-3.04.02.sql'),(442,'Main','2020-12-25 14:53:53','2020-12-25 14:53:53','dbdeploy','442-3.04.02.sql'),(443,'Main','2020-12-25 14:53:53','2020-12-25 14:53:53','dbdeploy','443-3.04.02.sql'),(444,'Main','2020-12-25 14:53:53','2020-12-25 14:53:53','dbdeploy','444-3.04.03.sql'),(445,'Main','2020-12-25 14:53:54','2020-12-25 14:53:54','dbdeploy','445-3.04.03.sql'),(446,'Main','2020-12-25 14:53:54','2020-12-25 14:53:54','dbdeploy','446-3.04.04.sql'),(447,'Main','2020-12-25 14:53:54','2020-12-25 14:53:54','dbdeploy','447-3.04.04.sql'),(448,'Main','2020-12-25 14:53:54','2020-12-25 14:53:54','dbdeploy','448-3.04.04.sql'),(449,'Main','2020-12-25 14:53:54','2020-12-25 14:53:54','dbdeploy','449-3.04.04.sql'),(450,'Main','2020-12-25 14:53:54','2020-12-25 14:53:54','dbdeploy','450-3.04.04.sql'),(451,'Main','2020-12-25 14:53:54','2020-12-25 14:53:54','dbdeploy','451-3.04.04.sql'),(452,'Main','2020-12-25 14:53:54','2020-12-25 14:53:54','dbdeploy','452-3.04.04.sql'),(453,'Main','2020-12-25 14:53:54','2020-12-25 14:53:54','dbdeploy','453-3.04.04.sql'),(454,'Main','2020-12-25 14:53:54','2020-12-25 14:53:54','dbdeploy','454-3.04.04.sql'),(455,'Main','2020-12-25 14:53:54','2020-12-25 14:53:54','dbdeploy','455-3.04.04.sql'),(456,'Main','2020-12-25 14:53:54','2020-12-25 14:53:54','dbdeploy','456-3.04.04.sql'),(457,'Main','2020-12-25 14:53:54','2020-12-25 14:53:54','dbdeploy','457-3.04.04.sql'),(458,'Main','2020-12-25 14:53:54','2020-12-25 14:53:54','dbdeploy','458-3.04.05.sql'),(459,'Main','2020-12-25 14:53:54','2020-12-25 14:53:54','dbdeploy','459-3.04.05.sql'),(460,'Main','2020-12-25 14:53:54','2020-12-25 14:53:54','dbdeploy','460-3.04.06.sql'),(461,'Main','2020-12-25 14:53:54','2020-12-25 14:53:54','dbdeploy','461-3.04.06.sql'),(462,'Main','2020-12-25 14:53:54','2020-12-25 14:53:54','dbdeploy','462-3.04.06.sql'),(463,'Main','2020-12-25 14:53:54','2020-12-25 14:53:54','dbdeploy','463-3.04.06.sql'),(464,'Main','2020-12-25 14:53:54','2020-12-25 14:53:54','dbdeploy','464-3.04.06.sql'),(465,'Main','2020-12-25 14:53:54','2020-12-25 14:53:54','dbdeploy','465-3.04.06.sql'),(466,'Main','2020-12-25 14:53:55','2020-12-25 14:53:55','dbdeploy','466-3.04.06.sql'),(467,'Main','2020-12-25 14:53:55','2020-12-25 14:53:55','dbdeploy','467-3.04.07.sql'),(468,'Main','2020-12-25 14:53:55','2020-12-25 14:53:55','dbdeploy','468-3.04.07.sql'),(469,'Main','2020-12-25 14:53:55','2020-12-25 14:53:55','dbdeploy','469-3.04.07.sql'),(470,'Main','2020-12-25 14:53:55','2020-12-25 14:53:55','dbdeploy','470-3.04.07.sql'),(471,'Main','2020-12-25 14:53:55','2020-12-25 14:53:55','dbdeploy','471-3.04.07.sql'),(472,'Main','2020-12-25 14:53:55','2020-12-25 14:53:55','dbdeploy','472-3.04.07.sql'),(473,'Main','2020-12-25 14:53:55','2020-12-25 14:53:55','dbdeploy','473-3.04.07.sql'),(474,'Main','2020-12-25 14:53:55','2020-12-25 14:53:55','dbdeploy','474-3.04.07.sql'),(475,'Main','2020-12-25 14:53:55','2020-12-25 14:53:55','dbdeploy','475-3.04.07.sql'),(476,'Main','2020-12-25 14:53:55','2020-12-25 14:53:55','dbdeploy','476-3.04.07.sql'),(477,'Main','2020-12-25 14:53:55','2020-12-25 14:53:55','dbdeploy','477-3.04.07.sql'),(478,'Main','2020-12-25 14:53:55','2020-12-25 14:53:55','dbdeploy','478-3.04.07.sql'),(479,'Main','2020-12-25 14:53:55','2020-12-25 14:53:55','dbdeploy','479-3.04.08.sql'),(480,'Main','2020-12-25 14:53:55','2020-12-25 14:53:55','dbdeploy','480-3.04.08.sql'),(481,'Main','2020-12-25 14:53:55','2020-12-25 14:53:55','dbdeploy','481-3.04.08.sql'),(482,'Main','2020-12-25 14:53:55','2020-12-25 14:53:55','dbdeploy','482-3.04.08.sql'),(483,'Main','2020-12-25 14:53:55','2020-12-25 14:53:55','dbdeploy','483-3.04.08.sql'),(484,'Main','2020-12-25 14:53:56','2020-12-25 14:53:56','dbdeploy','484-3.04.08.sql'),(485,'Main','2020-12-25 14:53:56','2020-12-25 14:53:56','dbdeploy','485-3.04.09.sql'),(486,'Main','2020-12-25 14:53:56','2020-12-25 14:53:56','dbdeploy','486-3.04.09.sql'),(487,'Main','2020-12-25 14:53:56','2020-12-25 14:53:56','dbdeploy','487-3.04.09.sql'),(488,'Main','2020-12-25 14:53:56','2020-12-25 14:53:56','dbdeploy','488-3.04.09.sql'),(489,'Main','2020-12-25 14:53:56','2020-12-25 14:53:56','dbdeploy','489-3.04.09.sql'),(490,'Main','2020-12-25 14:53:56','2020-12-25 14:53:56','dbdeploy','490-3.05.01.sql'),(491,'Main','2020-12-25 14:53:56','2020-12-25 14:53:56','dbdeploy','491-3.05.01.sql'),(492,'Main','2020-12-25 14:53:56','2020-12-25 14:53:56','dbdeploy','492-3.05.01.sql'),(493,'Main','2020-12-25 14:53:56','2020-12-25 14:53:56','dbdeploy','493-3.05.02.sql'),(494,'Main','2020-12-25 14:53:56','2020-12-25 14:53:56','dbdeploy','494-3.05.02.sql'),(495,'Main','2020-12-25 14:53:56','2020-12-25 14:53:56','dbdeploy','495-3.05.02.sql'),(496,'Main','2020-12-25 14:53:56','2020-12-25 14:53:56','dbdeploy','496-3.05.02.sql'),(497,'Main','2020-12-25 14:53:56','2020-12-25 14:53:56','dbdeploy','497-3.05.02.sql'),(498,'Main','2020-12-25 14:53:56','2020-12-25 14:53:56','dbdeploy','498-3.05.02.sql'),(499,'Main','2020-12-25 14:53:56','2020-12-25 14:53:56','dbdeploy','499-3.05.02.sql'),(500,'Main','2020-12-25 14:53:56','2020-12-25 14:53:56','dbdeploy','500-3.05.02.sql'),(501,'Main','2020-12-25 14:53:56','2020-12-25 14:53:56','dbdeploy','501-3.05.02.sql'),(502,'Main','2020-12-25 14:53:56','2020-12-25 14:53:56','dbdeploy','502-3.05.02.sql'),(503,'Main','2020-12-25 14:53:56','2020-12-25 14:53:56','dbdeploy','503-3.05.02.sql'),(504,'Main','2020-12-25 14:53:56','2020-12-25 14:53:56','dbdeploy','504-3.05.02.sql'),(505,'Main','2020-12-25 14:53:56','2020-12-25 14:53:56','dbdeploy','505-3.05.03.sql'),(506,'Main','2020-12-25 14:53:57','2020-12-25 14:53:57','dbdeploy','506-3.05.03.sql'),(507,'Main','2020-12-25 14:53:57','2020-12-25 14:53:57','dbdeploy','507-3.05.03.sql'),(508,'Main','2020-12-25 14:53:57','2020-12-25 14:53:57','dbdeploy','508-3.05.03.sql'),(509,'Main','2020-12-25 14:53:57','2020-12-25 14:53:57','dbdeploy','509-3.05.03.sql'),(510,'Main','2020-12-25 14:53:57','2020-12-25 14:53:57','dbdeploy','510-3.05.03.sql'),(511,'Main','2020-12-25 14:53:57','2020-12-25 14:53:57','dbdeploy','511-3.05.03.sql'),(512,'Main','2020-12-25 14:53:57','2020-12-25 14:53:57','dbdeploy','512-3.05.03.sql'),(513,'Main','2020-12-25 14:53:57','2020-12-25 14:53:57','dbdeploy','513-3.05.03.sql'),(514,'Main','2020-12-25 14:53:57','2020-12-25 14:53:57','dbdeploy','514-3.05.03.sql'),(515,'Main','2020-12-25 14:53:57','2020-12-25 14:53:57','dbdeploy','515-3.05.03.sql'),(516,'Main','2020-12-25 14:53:57','2020-12-25 14:53:57','dbdeploy','516-3.05.03.sql'),(517,'Main','2020-12-25 14:53:57','2020-12-25 14:53:57','dbdeploy','517-3.05.03.sql'),(518,'Main','2020-12-25 14:53:57','2020-12-25 14:53:57','dbdeploy','518-3.05.03.sql'),(519,'Main','2020-12-25 14:53:57','2020-12-25 14:53:57','dbdeploy','519-3.05.03.sql'),(520,'Main','2020-12-25 14:53:57','2020-12-25 14:53:57','dbdeploy','520-3.05.03.sql'),(521,'Main','2020-12-25 14:53:57','2020-12-25 14:53:57','dbdeploy','521-3.05.03.sql'),(522,'Main','2020-12-25 14:53:57','2020-12-25 14:53:57','dbdeploy','522-3.05.03.sql'),(523,'Main','2020-12-25 14:53:57','2020-12-25 14:53:57','dbdeploy','523-3.05.04.sql'),(524,'Main','2020-12-25 14:53:57','2020-12-25 14:53:57','dbdeploy','524-3.05.04.sql'),(525,'Main','2020-12-25 14:53:58','2020-12-25 14:53:58','dbdeploy','525-3.05.04.sql'),(526,'Main','2020-12-25 14:53:58','2020-12-25 14:53:58','dbdeploy','526-3.05.05.sql'),(527,'Main','2020-12-25 14:53:58','2020-12-25 14:53:58','dbdeploy','527-3.05.05.sql'),(528,'Main','2020-12-25 14:53:58','2020-12-25 14:53:58','dbdeploy','528-3.05.05.sql'),(529,'Main','2020-12-25 14:53:58','2020-12-25 14:53:58','dbdeploy','529-3.05.05.sql'),(530,'Main','2020-12-25 14:53:58','2020-12-25 14:53:58','dbdeploy','530-3.05.05.sql'),(531,'Main','2020-12-25 14:53:58','2020-12-25 14:53:58','dbdeploy','531-3.05.05.sql'),(532,'Main','2020-12-25 14:53:58','2020-12-25 14:53:58','dbdeploy','532-3.05.05.sql'),(533,'Main','2020-12-25 14:53:58','2020-12-25 14:53:58','dbdeploy','533-3.05.05.sql'),(534,'Main','2020-12-25 14:53:58','2020-12-25 14:53:58','dbdeploy','534-3.05.05.sql'),(535,'Main','2020-12-25 14:53:58','2020-12-25 14:53:58','dbdeploy','535-3.05.05.sql'),(536,'Main','2020-12-25 14:53:58','2020-12-25 14:53:58','dbdeploy','536-3.05.05.sql'),(537,'Main','2020-12-25 14:53:59','2020-12-25 14:53:59','dbdeploy','537-3.05.05.sql'),(538,'Main','2020-12-25 14:53:59','2020-12-25 14:53:59','dbdeploy','538-3.05.05.sql'),(539,'Main','2020-12-25 14:53:59','2020-12-25 14:53:59','dbdeploy','539-3.05.05.sql'),(540,'Main','2020-12-25 14:53:59','2020-12-25 14:53:59','dbdeploy','540-3.05.05.sql'),(541,'Main','2020-12-25 14:53:59','2020-12-25 14:53:59','dbdeploy','541-3.05.05.sql'),(542,'Main','2020-12-25 14:53:59','2020-12-25 14:53:59','dbdeploy','542-3.05.05.sql'),(543,'Main','2020-12-25 14:53:59','2020-12-25 14:53:59','dbdeploy','543-3.05.05.sql'),(544,'Main','2020-12-25 14:53:59','2020-12-25 14:53:59','dbdeploy','544-3.06.01.sql'),(545,'Main','2020-12-25 14:54:00','2020-12-25 14:54:00','dbdeploy','545-3.06.02.sql'),(546,'Main','2020-12-25 14:54:00','2020-12-25 14:54:00','dbdeploy','546-3.06.02.sql'),(547,'Main','2020-12-25 14:54:00','2020-12-25 14:54:00','dbdeploy','547-3.06.02.sql'),(548,'Main','2020-12-25 14:54:00','2020-12-25 14:54:00','dbdeploy','548-3.06.03.sql'),(549,'Main','2020-12-25 14:54:00','2020-12-25 14:54:00','dbdeploy','549-3.06.03.sql'),(550,'Main','2020-12-25 14:54:00','2020-12-25 14:54:00','dbdeploy','550-3.06.03.sql'),(551,'Main','2020-12-25 14:54:00','2020-12-25 14:54:00','dbdeploy','551-3.06.03.sql'),(552,'Main','2020-12-25 14:54:00','2020-12-25 14:54:00','dbdeploy','552-3.06.03.sql'),(553,'Main','2023-10-16 15:03:49','2023-10-16 15:03:49','dbdeploy','553-3.06.03.sql'),(554,'Main','2023-10-16 15:03:49','2023-10-16 15:03:49','dbdeploy','554-3.06.04.sql'),(555,'Main','2023-10-16 15:03:49','2023-10-16 15:03:49','dbdeploy','555-3.06.04.sql'),(556,'Main','2023-10-16 15:03:49','2023-10-16 15:03:49','dbdeploy','556-3.06.04.sql'),(557,'Main','2023-10-16 15:03:49','2023-10-16 15:03:49','dbdeploy','557-3.06.04.sql'),(558,'Main','2023-10-16 15:03:49','2023-10-16 15:03:49','dbdeploy','558-3.06.04.sql'),(559,'Main','2023-10-16 15:03:49','2023-10-16 15:03:49','dbdeploy','559-3.06.04.sql'),(600,'Main','2023-10-16 15:03:49','2023-10-16 15:03:49','dbdeploy','600-3.06.04.sql'),(601,'Main','2023-10-16 15:03:49','2023-10-16 15:03:49','dbdeploy','601-3.06.05.sql'),(602,'Main','2023-10-16 15:03:49','2023-10-16 15:03:49','dbdeploy','602-3.06.05.sql'),(603,'Main','2023-10-16 15:03:49','2023-10-16 15:03:50','dbdeploy','603-3.06.05.sql'),(604,'Main','2023-10-16 15:03:50','2023-10-16 15:03:50','dbdeploy','604-3.06.05.sql'),(605,'Main','2023-10-16 15:03:50','2023-10-16 15:03:50','dbdeploy','605-3.06.05.sql'),(606,'Main','2023-10-16 15:03:50','2023-10-16 15:03:50','dbdeploy','606-3.06.05.sql'),(607,'Main','2023-10-16 15:03:50','2023-10-16 15:03:50','dbdeploy','607-3.06.05.sql'),(608,'Main','2023-10-16 15:03:50','2023-10-16 15:03:50','dbdeploy','608-3.06.05.sql'),(609,'Main','2023-10-16 15:03:50','2023-10-16 15:03:50','dbdeploy','609-3.06.05.sql'),(610,'Main','2023-10-16 15:03:50','2023-10-16 15:03:50','dbdeploy','610-3.06.05.sql'),(611,'Main','2023-10-16 15:03:50','2023-10-16 15:03:50','dbdeploy','611-3.06.05.sql'),(612,'Main','2023-10-16 15:03:50','2023-10-16 15:03:51','dbdeploy','612-3.06.05.sql'),(613,'Main','2023-10-16 15:03:51','2023-10-16 15:03:51','dbdeploy','613-3.06.05.sql'),(614,'Main','2023-10-16 15:03:51','2023-10-16 15:03:51','dbdeploy','614-3.06.05.sql'),(615,'Main','2023-10-16 15:03:51','2023-10-16 15:03:51','dbdeploy','615-3.06.05.sql'),(616,'Main','2023-10-16 15:03:51','2023-10-16 15:03:51','dbdeploy','616-3.06.05.sql'),(617,'Main','2023-10-16 15:03:51','2023-10-16 15:03:51','dbdeploy','617-3.06.05.sql'),(618,'Main','2023-10-16 15:03:51','2023-10-16 15:03:51','dbdeploy','618-3.06.05.sql'),(619,'Main','2023-10-16 15:03:51','2023-10-16 15:03:52','dbdeploy','619-3.06.05.sql'),(620,'Main','2023-10-16 15:03:52','2023-10-16 15:03:52','dbdeploy','620-3.06.05.sql'),(621,'Main','2023-10-16 15:03:52','2023-10-16 15:03:52','dbdeploy','621-3.06.05.sql'),(622,'Main','2023-10-16 15:03:52','2023-10-16 15:03:52','dbdeploy','622-3.06.05.sql'),(623,'Main','2023-10-16 15:03:52','2023-10-16 15:03:52','dbdeploy','623-3.06.05.sql'),(624,'Main','2023-10-16 15:03:52','2023-10-16 15:03:52','dbdeploy','624-3.07.01.sql'),(625,'Main','2023-10-16 15:03:52','2023-10-16 15:03:52','dbdeploy','625-3.07.02.sql'),(626,'Main','2023-10-16 15:03:52','2023-10-16 15:03:52','dbdeploy','626-3.07.02.sql'),(627,'Main','2023-10-16 15:03:52','2023-10-16 15:03:52','dbdeploy','627-3.07.02.sql'),(628,'Main','2023-10-16 15:03:53','2023-10-16 15:03:53','dbdeploy','628-3.07.02.sql'),(629,'Main','2023-10-16 15:03:53','2023-10-16 15:03:53','dbdeploy','629-3.07.02.sql'),(630,'Main','2023-10-16 15:03:53','2023-10-16 15:03:53','dbdeploy','630-3.07.02.sql'),(631,'Main','2023-10-16 15:03:53','2023-10-16 15:03:53','dbdeploy','631-3.07.02.sql'),(632,'Main','2023-10-16 15:03:53','2023-10-16 15:03:53','dbdeploy','632-3.07.02.sql'),(633,'Main','2023-10-16 15:03:53','2023-10-16 15:03:53','dbdeploy','633-3.07.02.sql'),(634,'Main','2023-10-16 15:03:53','2023-10-16 15:03:53','dbdeploy','634-3.07.02.sql'),(635,'Main','2023-10-16 15:03:53','2023-10-16 15:03:53','dbdeploy','635-3.07.03.sql'),(636,'Main','2023-10-16 15:03:53','2023-10-16 15:03:53','dbdeploy','636-3.07.03.sql'),(637,'Main','2023-10-16 15:03:53','2023-10-16 15:03:53','dbdeploy','637-3.07.03.sql'),(638,'Main','2023-10-16 15:03:53','2023-10-16 15:03:53','dbdeploy','638-3.07.03.sql'),(639,'Main','2023-10-16 15:03:53','2023-10-16 15:03:53','dbdeploy','639-3.07.03.sql'),(640,'Main','2023-10-16 15:03:54','2023-10-16 15:03:54','dbdeploy','640-3.07.03.sql'),(641,'Main','2023-10-16 15:03:54','2023-10-16 15:03:54','dbdeploy','641-3.07.03.sql'),(642,'Main','2023-10-16 15:03:54','2023-10-16 15:03:54','dbdeploy','642-3.07.03.sql'),(643,'Main','2023-10-16 15:03:54','2023-10-16 15:03:54','dbdeploy','643-3.07.03.sql'),(644,'Main','2023-10-16 15:03:54','2023-10-16 15:03:54','dbdeploy','644-3.07.03.sql'),(645,'Main','2023-10-16 15:03:54','2023-10-16 15:03:54','dbdeploy','645-3.07.03.sql'),(646,'Main','2023-10-16 15:03:54','2023-10-16 15:03:54','dbdeploy','646-3.07.04.sql'),(647,'Main','2023-10-16 15:03:54','2023-10-16 15:03:54','dbdeploy','647-3.07.04.sql'),(648,'Main','2023-10-16 15:03:54','2023-10-16 15:03:54','dbdeploy','648-3.07.04.sql'),(649,'Main','2023-10-16 15:03:54','2023-10-16 15:03:54','dbdeploy','649-3.07.04.sql'),(650,'Main','2023-10-16 15:03:54','2023-10-16 15:03:54','dbdeploy','650-3.07.04.sql'),(651,'Main','2023-10-16 15:03:54','2023-10-16 15:03:54','dbdeploy','651-3.07.04.sql'),(652,'Main','2023-10-16 15:03:54','2023-10-16 15:03:54','dbdeploy','652-3.07.04.sql'),(653,'Main','2023-10-16 15:03:54','2023-10-16 15:03:54','dbdeploy','653-3.07.04.sql'),(654,'Main','2023-10-16 15:03:54','2023-10-16 15:03:54','dbdeploy','654-3.07.04.sql'),(655,'Main','2023-10-16 15:03:54','2023-10-16 15:03:54','dbdeploy','655-3.07.04.sql'),(656,'Main','2023-10-16 15:03:54','2023-10-16 15:03:55','dbdeploy','656-3.07.04.sql'),(657,'Main','2023-10-16 15:03:55','2023-10-16 15:03:55','dbdeploy','657-3.07.04.sql'),(658,'Main','2023-10-16 15:03:55','2023-10-16 15:03:55','dbdeploy','658-3.07.04.sql'),(659,'Main','2023-10-16 15:03:55','2023-10-16 15:03:55','dbdeploy','659-3.07.04.sql'),(660,'Main','2023-10-16 15:03:55','2023-10-16 15:03:55','dbdeploy','660-3.07.04.sql'),(661,'Main','2023-10-16 15:03:55','2023-10-16 15:03:55','dbdeploy','661-3.07.04.sql'),(662,'Main','2023-10-16 15:03:55','2023-10-16 15:03:55','dbdeploy','662-3.07.04.sql'),(663,'Main','2023-10-16 15:03:55','2023-10-16 15:03:55','dbdeploy','663-3.07.04.sql'),(664,'Main','2023-10-16 15:03:55','2023-10-16 15:03:55','dbdeploy','664-3.07.04.sql'),(665,'Main','2023-10-16 15:03:55','2023-10-16 15:03:56','dbdeploy','665-3.07.05.sql'),(666,'Main','2023-10-16 15:03:56','2023-10-16 15:03:56','dbdeploy','666-3.07.05.sql'),(667,'Main','2023-10-16 15:03:56','2023-10-16 15:03:56','dbdeploy','667-3.07.05.sql'),(668,'Main','2023-10-16 15:03:56','2023-10-16 15:03:56','dbdeploy','668-3.07.05.sql'),(669,'Main','2023-10-16 15:03:56','2023-10-16 15:03:56','dbdeploy','669-3.08.01.sql'),(670,'Main','2023-10-16 15:03:56','2023-10-16 15:03:56','dbdeploy','670-3.09.01.sql'),(671,'Main','2023-10-16 15:03:56','2023-10-16 15:03:56','dbdeploy','671-3.09.02.sql'),(672,'Main','2023-10-16 15:03:56','2023-10-16 15:03:56','dbdeploy','672-3.09.02.sql'),(673,'Main','2023-10-16 15:03:56','2023-10-16 15:03:56','dbdeploy','673-3.09.02.sql'),(674,'Main','2023-10-16 15:03:56','2023-10-16 15:03:56','dbdeploy','674-3.09.02.sql'),(675,'Main','2023-10-16 15:03:56','2023-10-16 15:03:57','dbdeploy','675-3.09.02.sql'),(676,'Main','2023-10-16 15:03:57','2023-10-16 15:03:57','dbdeploy','676-3.08.02.sql'),(677,'Main','2023-10-16 15:03:57','2023-10-16 15:03:57','dbdeploy','677-3.08.02.sql'),(678,'Main','2023-10-16 15:03:57','2023-10-16 15:03:57','dbdeploy','678-3.08.03.sql'),(679,'Main','2023-10-16 15:03:57','2023-10-16 15:03:58','dbdeploy','679-3.08.03.sql'),(680,'Main','2023-10-16 15:03:58','2023-10-16 15:03:58','dbdeploy','680-3.09.03.sql'),(681,'Main','2023-10-16 15:03:58','2023-10-16 15:03:58','dbdeploy','681-3.10.01.sql'),(682,'Main','2023-10-16 15:03:58','2023-10-16 15:03:58','dbdeploy','682-3.11.01.sql'),(683,'Main','2023-10-16 15:03:58','2023-10-16 15:03:58','dbdeploy','683-3.11.01.sql'),(684,'Main','2023-10-16 15:03:58','2023-10-16 15:03:58','dbdeploy','684-3.11.01.sql'),(685,'Main','2023-10-16 15:03:58','2023-10-16 15:03:58','dbdeploy','685-3.12.01.sql'),(686,'Main','2023-10-16 15:03:58','2023-10-16 15:03:58','dbdeploy','686-3.12.02.sql'),(687,'Main','2023-10-16 15:03:58','2023-10-16 15:03:58','dbdeploy','687-3.12.03.sql'),(688,'Main','2023-10-16 15:03:58','2023-10-16 15:03:58','dbdeploy','688-3.12.03.sql'),(689,'Main','2023-10-16 15:03:58','2023-10-16 15:03:58','dbdeploy','689-3.12.03.sql'),(690,'Main','2023-10-16 15:03:58','2023-10-16 15:03:58','dbdeploy','690-3.12.03.sql'),(691,'Main','2023-10-16 15:03:58','2023-10-16 15:03:59','dbdeploy','691-3.12.04.sql'),(692,'Main','2023-10-16 15:03:59','2023-10-16 15:03:59','dbdeploy','692-3.12.04.sql'),(693,'Main','2023-10-16 15:03:59','2023-10-16 15:03:59','dbdeploy','693-3.12.04.sql'),(694,'Main','2023-10-16 15:03:59','2023-10-16 15:03:59','dbdeploy','694-3.12.04.sql'),(695,'Main','2023-10-16 15:03:59','2023-10-16 15:03:59','dbdeploy','695-3.12.04.sql'),(696,'Main','2023-10-16 15:03:59','2023-10-16 15:04:00','dbdeploy','696-3.12.04.sql'),(697,'Main','2023-10-16 15:04:00','2023-10-16 15:04:00','dbdeploy','697-3.12.04.sql'),(698,'Main','2023-10-16 15:04:00','2023-10-16 15:04:00','dbdeploy','698-3.12.05.sql'),(699,'Main','2023-10-16 15:04:00','2023-10-16 15:04:00','dbdeploy','699-3.12.05.sql'),(700,'Main','2023-10-16 15:04:00','2023-10-16 15:04:00','dbdeploy','700-3.12.05.sql'),(701,'Main','2023-10-16 15:04:00','2023-10-16 15:04:00','dbdeploy','701-3.12.05.sql'),(702,'Main','2023-10-16 15:04:00','2023-10-16 15:04:00','dbdeploy','702-3.12.05.sql'),(703,'Main','2023-10-16 15:04:00','2023-10-16 15:04:01','dbdeploy','703-3.12.05.sql'),(704,'Main','2023-10-16 15:04:01','2023-10-16 15:04:01','dbdeploy','704-3.12.05.sql'),(705,'Main','2023-10-16 15:04:01','2023-10-16 15:04:01','dbdeploy','705-3.12.05.sql'),(706,'Main','2023-10-16 15:04:01','2023-10-16 15:04:01','dbdeploy','706-3.12.05.sql'),(707,'Main','2023-10-16 15:04:01','2023-10-16 15:04:01','dbdeploy','707-3.12.05.sql'),(708,'Main','2023-10-16 15:04:01','2023-10-16 15:04:01','dbdeploy','708-3.12.05.sql'),(709,'Main','2023-10-16 15:04:01','2023-10-16 15:04:01','dbdeploy','709-3.12.05.sql'),(710,'Main','2023-10-16 15:04:01','2023-10-16 15:04:01','dbdeploy','710-3.12.05.sql'),(711,'Main','2023-10-16 15:04:01','2023-10-16 15:04:01','dbdeploy','711-3.12.05.sql'),(712,'Main','2023-10-16 15:04:01','2023-10-16 15:04:02','dbdeploy','712-3.12.05.sql'),(713,'Main','2023-10-16 15:04:02','2023-10-16 15:04:02','dbdeploy','713-3.12.05.sql'),(714,'Main','2023-10-16 15:04:02','2023-10-16 15:04:02','dbdeploy','714-3.12.05.sql'),(715,'Main','2023-10-16 15:04:02','2023-10-16 15:04:02','dbdeploy','715-3.12.05.sql'),(716,'Main','2023-10-16 15:04:02','2023-10-16 15:04:02','dbdeploy','716-3.12.05.sql'),(717,'Main','2023-10-16 15:04:02','2023-10-16 15:04:02','dbdeploy','717-3.12.05.sql'),(718,'Main','2023-10-16 15:04:02','2023-10-16 15:04:02','dbdeploy','718-3.12.05.sql'),(719,'Main','2023-10-16 15:04:02','2023-10-16 15:04:02','dbdeploy','719-3.12.05.sql'),(720,'Main','2023-10-16 15:04:02','2023-10-16 15:04:02','dbdeploy','720-3.12.05.sql'),(721,'Main','2023-10-16 15:04:02','2023-10-16 15:04:02','dbdeploy','721-3.12.05.sql'),(722,'Main','2023-10-16 15:04:02','2023-10-16 15:04:02','dbdeploy','722-3.12.05.sql'),(723,'Main','2023-10-16 15:04:02','2023-10-16 15:04:02','dbdeploy','723-3.12.05.sql'),(724,'Main','2023-10-16 15:04:02','2023-10-16 15:04:02','dbdeploy','724-3.12.05.sql'),(725,'Main','2023-10-16 15:04:02','2023-10-16 15:04:02','dbdeploy','725-3.12.05.sql'),(726,'Main','2023-10-16 15:04:02','2023-10-16 15:04:02','dbdeploy','726-3.12.06.sql'),(727,'Main','2023-10-16 15:04:02','2023-10-16 15:04:02','dbdeploy','727-3.12.06.sql'),(728,'Main','2023-10-16 15:04:02','2023-10-16 15:04:03','dbdeploy','728-3.12.06.sql'),(729,'Main','2023-10-16 15:04:03','2023-10-16 15:04:03','dbdeploy','729-3.12.06.sql'),(730,'Main','2023-10-16 15:04:03','2023-10-16 15:04:03','dbdeploy','730-3.12.06.sql'),(731,'Main','2023-10-16 15:04:03','2023-10-16 15:04:03','dbdeploy','731-3.12.07.sql'),(732,'Main','2023-10-16 15:04:03','2023-10-16 15:04:03','dbdeploy','732-3.12.07.sql'),(733,'Main','2023-10-16 15:04:03','2023-10-16 15:04:03','dbdeploy','733-3.12.07.sql'),(734,'Main','2023-10-16 15:04:03','2023-10-16 15:04:03','dbdeploy','734-3.12.07.sql'),(735,'Main','2023-10-16 15:04:03','2023-10-16 15:04:03','dbdeploy','735-3.12.07.sql'),(736,'Main','2023-10-16 15:04:03','2023-10-16 15:04:03','dbdeploy','736-3.12.07.sql'),(737,'Main','2023-10-16 15:04:03','2023-10-16 15:04:03','dbdeploy','737-3.12.07.sql'),(738,'Main','2023-10-16 15:04:03','2023-10-16 15:04:04','dbdeploy','738-3.12.07.sql'),(739,'Main','2023-10-16 15:04:04','2023-10-16 15:04:04','dbdeploy','739-3.12.07.sql'),(740,'Main','2023-10-16 15:04:04','2023-10-16 15:04:04','dbdeploy','740-3.12.07.sql'),(741,'Main','2023-10-16 15:04:04','2023-10-16 15:04:04','dbdeploy','741-3.12.07.sql'),(742,'Main','2023-10-16 15:04:04','2023-10-16 15:04:04','dbdeploy','742-3.12.07.sql'),(743,'Main','2023-10-16 15:04:04','2023-10-16 15:04:04','dbdeploy','743-3.12.07.sql'),(744,'Main','2023-10-16 15:04:04','2023-10-16 15:04:05','dbdeploy','744-3.12.07.sql'),(745,'Main','2023-10-16 15:04:05','2023-10-16 15:04:05','dbdeploy','745-3.12.07.sql'),(746,'Main','2023-10-16 15:04:05','2023-10-16 15:04:05','dbdeploy','746-3.12.07.sql'),(747,'Main','2023-10-16 15:04:05','2023-10-16 15:04:05','dbdeploy','747-3.12.07.sql'),(748,'Main','2023-10-16 15:04:05','2023-10-16 15:04:05','dbdeploy','748-3.12.07.sql'),(749,'Main','2023-10-16 15:04:05','2023-10-16 15:04:05','dbdeploy','749-3.12.07.sql'),(750,'Main','2023-10-16 15:04:05','2023-10-16 15:04:05','dbdeploy','750-3.12.07.sql'),(751,'Main','2023-10-16 15:04:05','2023-10-16 15:04:05','dbdeploy','751-3.12.07.sql'),(752,'Main','2023-10-16 15:04:05','2023-10-16 15:04:05','dbdeploy','752-3.12.07.sql'),(753,'Main','2023-10-16 15:04:05','2023-10-16 15:04:05','dbdeploy','753-3.12.07.sql'),(754,'Main','2023-10-16 15:04:05','2023-10-16 15:04:05','dbdeploy','754-3.12.07.sql'),(755,'Main','2023-10-16 15:04:05','2023-10-16 15:04:05','dbdeploy','755-3.12.07.sql'),(756,'Main','2023-10-16 15:04:05','2023-10-16 15:04:06','dbdeploy','756-3.12.07.sql'),(757,'Main','2023-10-16 15:04:06','2023-10-16 15:04:06','dbdeploy','757-3.12.07.sql'),(758,'Main','2023-10-16 15:04:06','2023-10-16 15:04:06','dbdeploy','758-3.12.07.sql'),(759,'Main','2023-10-16 15:04:06','2023-10-16 15:04:06','dbdeploy','759-3.12.07.sql'),(760,'Main','2023-10-16 15:04:06','2023-10-16 15:04:06','dbdeploy','760-3.12.08.sql'),(761,'Main','2023-10-16 15:04:06','2023-10-16 15:04:06','dbdeploy','761-3.12.08.sql'),(762,'Main','2023-10-16 15:04:06','2023-10-16 15:04:06','dbdeploy','762-3.12.08.sql'),(763,'Main','2023-10-16 15:04:06','2023-10-16 15:04:07','dbdeploy','763-3.12.08.sql'),(764,'Main','2023-10-16 15:04:07','2023-10-16 15:04:07','dbdeploy','764-3.12.08.sql'),(765,'Main','2023-10-16 15:04:07','2023-10-16 15:04:07','dbdeploy','765-3.12.08.sql'),(766,'Main','2023-10-16 15:04:07','2023-10-16 15:04:08','dbdeploy','766-3.12.08.sql'),(767,'Main','2023-10-16 15:04:08','2023-10-16 15:04:08','dbdeploy','767-3.12.08.sql'),(768,'Main','2023-10-16 15:04:08','2023-10-16 15:04:08','dbdeploy','768-3.12.08.sql'),(769,'Main','2023-10-16 15:04:09','2023-10-16 15:04:09','dbdeploy','769-3.12.08.sql'),(770,'Main','2023-10-16 15:04:09','2023-10-16 15:04:09','dbdeploy','770-3.12.08.sql'),(771,'Main','2023-10-16 15:04:09','2023-10-16 15:04:09','dbdeploy','771-3.12.08.sql'),(772,'Main','2023-10-16 15:04:09','2023-10-16 15:04:09','dbdeploy','772-3.12.08.sql'),(773,'Main','2023-10-16 15:04:09','2023-10-16 15:04:09','dbdeploy','773-3.12.08.sql'),(774,'Main','2023-10-16 15:04:09','2023-10-16 15:04:09','dbdeploy','774-3.12.08.sql'),(775,'Main','2023-10-16 15:04:09','2023-10-16 15:04:10','dbdeploy','775-3.12.08.sql'),(776,'Main','2023-10-16 15:04:10','2023-10-16 15:04:10','dbdeploy','776-3.12.08.sql'),(777,'Main','2023-10-16 15:04:10','2023-10-16 15:04:10','dbdeploy','777-3.12.08.sql'),(778,'Main','2023-10-16 15:04:10','2023-10-16 15:04:10','dbdeploy','778-3.12.08.sql'),(779,'Main','2023-10-16 15:04:10','2023-10-16 15:04:11','dbdeploy','779-3.12.08.sql'),(780,'Main','2023-10-16 15:04:11','2023-10-16 15:04:11','dbdeploy','780-3.12.08.sql'),(781,'Main','2023-10-16 15:04:11','2023-10-16 15:04:11','dbdeploy','781-3.12.08.sql'),(782,'Main','2023-10-16 15:04:11','2023-10-16 15:04:11','dbdeploy','782-3.12.08.sql'),(783,'Main','2023-10-16 15:04:11','2023-10-16 15:04:11','dbdeploy','783-3.12.09.sql'),(784,'Main','2023-10-16 15:04:11','2023-10-16 15:04:11','dbdeploy','784-3.12.09.sql'),(785,'Main','2023-10-16 15:04:11','2023-10-16 15:04:11','dbdeploy','785-3.12.09.sql'),(786,'Main','2023-10-16 15:04:11','2023-10-16 15:04:11','dbdeploy','786-3.12.09.sql'),(787,'Main','2023-10-16 15:04:11','2023-10-16 15:04:11','dbdeploy','787-3.12.09.sql'),(788,'Main','2023-10-16 15:04:11','2023-10-16 15:04:11','dbdeploy','788-3.12.10.sql'),(789,'Main','2023-10-16 15:04:11','2023-10-16 15:04:11','dbdeploy','789-3.12.10.sql'),(790,'Main','2023-10-16 15:04:11','2023-10-16 15:04:11','dbdeploy','790-3.12.10.sql'),(791,'Main','2023-10-16 15:04:11','2023-10-16 15:04:11','dbdeploy','791-3.12.11.sql'),(792,'Main','2023-10-16 15:04:11','2023-10-16 15:04:11','dbdeploy','792-3.12.11.sql'),(793,'Main','2023-10-16 15:04:11','2023-10-16 15:04:11','dbdeploy','793-3.12.11.sql'),(794,'Main','2023-10-16 15:04:11','2023-10-16 15:04:11','dbdeploy','794-3.12.11.sql'),(795,'Main','2023-10-16 15:04:11','2023-10-16 15:04:11','dbdeploy','795-3.12.11.sql'),(796,'Main','2023-10-16 15:04:11','2023-10-16 15:04:11','dbdeploy','796-3.12.11.sql'),(797,'Main','2023-10-16 15:04:11','2023-10-16 15:04:11','dbdeploy','797-3.12.11.sql'),(798,'Main','2023-10-16 15:04:11','2023-10-16 15:04:12','dbdeploy','798-3.12.11.sql'),(799,'Main','2023-10-16 15:04:12','2023-10-16 15:04:12','dbdeploy','799-3.12.11.sql'),(800,'Main','2023-10-16 15:04:12','2023-10-16 15:04:12','dbdeploy','800-3.12.11.sql'),(801,'Main','2023-10-16 15:04:12','2023-10-16 15:04:12','dbdeploy','801-3.12.11.sql'),(802,'Main','2023-10-16 15:04:12','2023-10-16 15:04:12','dbdeploy','802-3.12.11.sql'),(803,'Main','2023-10-16 15:04:12','2023-10-16 15:04:12','dbdeploy','803-3.12.11.sql'),(804,'Main','2023-10-16 15:04:12','2023-10-16 15:04:12','dbdeploy','804-3.12.11.sql'),(805,'Main','2023-10-16 15:04:12','2023-10-16 15:04:12','dbdeploy','805-3.12.11.sql'),(806,'Main','2023-10-16 15:04:12','2023-10-16 15:04:12','dbdeploy','806-3.12.11.sql'),(807,'Main','2023-10-16 15:04:12','2023-10-16 15:04:12','dbdeploy','807-3.12.11.sql'),(808,'Main','2023-10-16 15:04:12','2023-10-16 15:04:12','dbdeploy','808-3.12.11.sql'),(809,'Main','2023-10-16 15:04:12','2023-10-16 15:04:12','dbdeploy','809-3.12.11.sql'),(810,'Main','2023-10-16 15:04:12','2023-10-16 15:04:12','dbdeploy','810-3.12.12.sql'),(811,'Main','2023-10-16 15:04:12','2023-10-16 15:04:12','dbdeploy','811-3.12.13.sql'),(812,'Main','2023-10-16 15:04:12','2023-10-16 15:04:12','dbdeploy','812-3.12.13.sql'),(813,'Main','2023-10-16 15:04:12','2023-10-16 15:04:13','dbdeploy','813-3.12.13.sql'),(814,'Main','2023-10-16 15:04:13','2023-10-16 15:04:13','dbdeploy','814-3.12.13.sql'),(815,'Main','2023-10-16 15:04:13','2023-10-16 15:04:13','dbdeploy','815-3.12.13.sql'),(816,'Main','2023-10-16 15:04:13','2023-10-16 15:04:13','dbdeploy','816-3.12.13.sql'),(817,'Main','2023-10-16 15:04:13','2023-10-16 15:04:13','dbdeploy','817-3.12.13.sql'),(818,'Main','2023-10-16 15:04:13','2023-10-16 15:04:13','dbdeploy','818-3.12.13.sql'),(819,'Main','2023-10-16 15:04:13','2023-10-16 15:04:13','dbdeploy','819-3.12.13.sql'),(820,'Main','2023-10-16 15:04:13','2023-10-16 15:04:13','dbdeploy','820-3.12.13.sql'),(821,'Main','2023-10-16 15:04:13','2023-10-16 15:04:13','dbdeploy','821-3.12.13.sql'),(822,'Main','2023-10-16 15:04:13','2023-10-16 15:04:13','dbdeploy','822-3.12.13.sql'),(823,'Main','2023-10-16 15:04:13','2023-10-16 15:04:13','dbdeploy','823-3.12.13.sql'),(824,'Main','2023-10-16 15:04:13','2023-10-16 15:04:13','dbdeploy','824-3.12.13.sql'),(825,'Main','2023-10-16 15:04:13','2023-10-16 15:04:13','dbdeploy','825-3.12.13.sql'),(826,'Main','2023-10-16 15:04:13','2023-10-16 15:04:13','dbdeploy','826-3.12.13.sql'),(827,'Main','2023-10-16 15:04:13','2023-10-16 15:04:13','dbdeploy','827-3.12.13.sql'),(828,'Main','2023-10-16 15:04:13','2023-10-16 15:04:13','dbdeploy','828-3.12.13.sql'),(829,'Main','2023-10-16 15:04:13','2023-10-16 15:04:13','dbdeploy','829-3.12.13.sql'),(830,'Main','2023-10-16 15:04:13','2023-10-16 15:04:13','dbdeploy','830-3.12.13.sql'),(831,'Main','2023-10-16 15:04:13','2023-10-16 15:04:13','dbdeploy','831-3.12.13.sql'),(832,'Main','2023-10-16 15:04:13','2023-10-16 15:04:13','dbdeploy','832-3.12.13.sql'),(833,'Main','2023-10-16 15:04:13','2023-10-16 15:04:13','dbdeploy','833-3.12.13.sql'),(834,'Main','2023-10-16 15:04:13','2023-10-16 15:04:13','dbdeploy','834-3.12.13.sql'),(835,'Main','2023-10-16 15:04:13','2023-10-16 15:04:13','dbdeploy','835-3.12.13.sql'),(836,'Main','2023-10-16 15:04:13','2023-10-16 15:04:14','dbdeploy','836-3.12.13.sql'),(837,'Main','2023-10-16 15:04:14','2023-10-16 15:04:14','dbdeploy','837-3.12.13.sql'),(838,'Main','2023-10-16 15:04:14','2023-10-16 15:04:14','dbdeploy','838-3.12.13.sql'),(839,'Main','2023-10-16 15:04:14','2023-10-16 15:04:14','dbdeploy','839-3.12.13.sql'),(840,'Main','2023-10-16 15:04:14','2023-10-16 15:04:14','dbdeploy','840-3.12.13.sql'),(841,'Main','2023-10-16 15:04:14','2023-10-16 15:04:14','dbdeploy','841-3.13.01.sql'),(842,'Main','2023-10-16 15:04:14','2023-10-16 15:04:14','dbdeploy','842-3.13.01.sql'),(843,'Main','2023-10-16 15:04:14','2023-10-16 15:04:15','dbdeploy','843-3.13.01.sql'),(844,'Main','2023-10-16 15:04:15','2023-10-16 15:04:15','dbdeploy','844-3.13.01.sql'),(845,'Main','2023-10-16 15:04:15','2023-10-16 15:04:15','dbdeploy','845-3.13.01.sql'),(846,'Main','2023-10-16 15:04:15','2023-10-16 15:04:15','dbdeploy','846-3.13.01.sql'),(847,'Main','2023-10-16 15:04:15','2023-10-16 15:04:15','dbdeploy','847-3.13.01.sql'),(848,'Main','2023-10-16 15:04:15','2023-10-16 15:04:15','dbdeploy','848-3.13.01.sql'),(849,'Main','2023-10-16 15:04:15','2023-10-16 15:04:15','dbdeploy','849-3.13.01.sql'),(850,'Main','2023-10-16 15:04:15','2023-10-16 15:04:15','dbdeploy','850-3.13.02.sql'),(851,'Main','2023-10-16 15:04:15','2023-10-16 15:04:15','dbdeploy','851-3.13.02.sql'),(852,'Main','2023-10-16 15:04:15','2023-10-16 15:04:15','dbdeploy','852-3.13.02.sql'),(853,'Main','2023-10-16 15:04:15','2023-10-16 15:04:15','dbdeploy','853-3.13.02.sql'),(854,'Main','2023-10-16 15:04:15','2023-10-16 15:04:16','dbdeploy','854-3.13.02.sql'),(855,'Main','2023-10-16 15:04:16','2023-10-16 15:04:16','dbdeploy','855-3.13.02.sql'),(856,'Main','2023-10-16 15:04:16','2023-10-16 15:04:16','dbdeploy','856-3.13.02.sql'),(857,'Main','2023-10-16 15:04:16','2023-10-16 15:04:16','dbdeploy','857-3.13.02.sql'),(858,'Main','2023-10-16 15:04:16','2023-10-16 15:04:16','dbdeploy','858-3.13.02.sql'),(859,'Main','2023-10-16 15:04:16','2023-10-16 15:04:16','dbdeploy','859-3.13.02.sql'),(860,'Main','2023-10-16 15:04:16','2023-10-16 15:04:16','dbdeploy','860-3.13.02.sql'),(861,'Main','2023-10-16 15:04:16','2023-10-16 15:04:16','dbdeploy','861-3.13.02.sql'),(862,'Main','2023-10-16 15:04:16','2023-10-16 15:04:16','dbdeploy','862-3.13.02.sql'),(863,'Main','2023-10-16 15:04:16','2023-10-16 15:04:16','dbdeploy','863-3.13.02.sql'),(864,'Main','2023-10-16 15:04:16','2023-10-16 15:04:16','dbdeploy','864-3.13.02.sql'),(865,'Main','2023-10-16 15:04:16','2023-10-16 15:04:16','dbdeploy','865-3.13.02.sql'),(866,'Main','2023-10-16 15:04:16','2023-10-16 15:04:16','dbdeploy','866-3.13.02.sql'),(867,'Main','2023-10-16 15:04:16','2023-10-16 15:04:16','dbdeploy','867-3.13.02.sql'),(868,'Main','2023-10-16 15:04:16','2023-10-16 15:04:17','dbdeploy','868-3.13.02.sql'),(869,'Main','2023-10-16 15:04:17','2023-10-16 15:04:17','dbdeploy','869-3.13.02.sql'),(870,'Main','2023-10-16 15:04:17','2023-10-16 15:04:17','dbdeploy','870-3.13.02.sql'),(871,'Main','2023-10-16 15:04:17','2023-10-16 15:04:17','dbdeploy','871-3.13.02.sql'),(872,'Main','2023-10-16 15:04:17','2023-10-16 15:04:18','dbdeploy','872-3.13.02.sql'),(873,'Main','2023-10-16 15:04:18','2023-10-16 15:04:18','dbdeploy','873-3.13.02.sql'),(874,'Main','2023-10-16 15:04:18','2023-10-16 15:04:18','dbdeploy','874-3.13.02.sql'),(875,'Main','2023-10-16 15:04:18','2023-10-16 15:04:18','dbdeploy','875-3.13.02.sql'),(876,'Main','2023-10-16 15:04:18','2023-10-16 15:04:18','dbdeploy','876-3.13.02.sql'),(877,'Main','2023-10-16 15:04:18','2023-10-16 15:04:18','dbdeploy','877-3.13.02.sql'),(878,'Main','2023-10-16 15:04:18','2023-10-16 15:04:18','dbdeploy','878-3.13.03.sql'),(879,'Main','2023-10-16 15:04:18','2023-10-16 15:04:18','dbdeploy','879-3.13.03.sql'),(880,'Main','2023-10-16 15:04:18','2023-10-16 15:04:18','dbdeploy','880-3.13.03.sql'),(881,'Main','2023-10-16 15:04:18','2023-10-16 15:04:18','dbdeploy','881-3.13.03.sql'),(882,'Main','2023-10-16 15:04:18','2023-10-16 15:04:19','dbdeploy','882-3.13.03.sql'),(883,'Main','2023-10-16 15:04:19','2023-10-16 15:04:19','dbdeploy','883-3.13.03.sql'),(884,'Main','2023-10-16 15:04:19','2023-10-16 15:04:19','dbdeploy','884-3.13.03.sql'),(885,'Main','2023-10-16 15:04:19','2023-10-16 15:04:19','dbdeploy','885-3.13.03.sql'),(886,'Main','2023-10-16 15:04:19','2023-10-16 15:04:19','dbdeploy','886-3.13.03.sql'),(887,'Main','2023-10-16 15:04:19','2023-10-16 15:04:19','dbdeploy','887-3.13.04.sql'),(888,'Main','2023-10-16 15:04:19','2023-10-16 15:04:19','dbdeploy','888-3.13.04.sql'),(889,'Main','2023-10-16 15:04:19','2023-10-16 15:04:19','dbdeploy','889-3.13.04.sql'),(890,'Main','2023-10-16 15:04:19','2023-10-16 15:04:20','dbdeploy','890-3.13.04.sql'),(891,'Main','2023-10-16 15:04:20','2023-10-16 15:04:20','dbdeploy','891-3.13.04.sql'),(892,'Main','2023-10-16 15:04:20','2023-10-16 15:04:20','dbdeploy','892-3.13.04.sql'),(893,'Main','2023-10-16 15:04:20','2023-10-16 15:04:20','dbdeploy','893-3.13.04.sql'),(894,'Main','2023-10-16 15:04:20','2023-10-16 15:04:20','dbdeploy','894-3.13.04.sql'),(895,'Main','2023-10-16 15:04:20','2023-10-16 15:04:20','dbdeploy','895-3.13.04.sql'),(896,'Main','2023-10-16 15:04:21','2023-10-16 15:04:21','dbdeploy','896-3.13.04.sql'),(897,'Main','2023-10-16 15:04:21','2023-10-16 15:04:21','dbdeploy','897-3.13.05.sql'),(898,'Main','2023-10-16 15:04:21','2023-10-16 15:04:21','dbdeploy','898-3.13.05.sql'),(899,'Main','2023-10-16 15:04:21','2023-10-16 15:04:21','dbdeploy','899-3.13.05.sql'),(900,'Main','2023-10-16 15:04:21','2023-10-16 15:04:21','dbdeploy','900-3.13.05.sql'),(901,'Main','2023-10-16 15:04:21','2023-10-16 15:04:21','dbdeploy','901-3.13.05.sql'),(902,'Main','2023-10-16 15:04:21','2023-10-16 15:04:21','dbdeploy','902-3.13.05.sql'),(903,'Main','2023-10-16 15:04:21','2023-10-16 15:04:21','dbdeploy','903-3.13.05.sql'),(904,'Main','2023-10-16 15:04:21','2023-10-16 15:04:21','dbdeploy','904-3.13.05.sql'),(905,'Main','2023-10-16 15:04:21','2023-10-16 15:04:21','dbdeploy','905-3.13.05.sql'),(906,'Main','2023-10-16 15:04:21','2023-10-16 15:04:21','dbdeploy','906-3.13.05.sql'),(907,'Main','2023-10-16 15:04:21','2023-10-16 15:04:22','dbdeploy','907-3.13.06.sql'),(908,'Main','2023-10-16 15:04:22','2023-10-16 15:04:22','dbdeploy','908-3.13.06.sql'),(909,'Main','2023-10-16 15:04:22','2023-10-16 15:04:22','dbdeploy','909-3.13.06.sql'),(910,'Main','2023-10-16 15:04:22','2023-10-16 15:04:22','dbdeploy','910-3.13.06.sql'),(911,'Main','2023-10-16 15:04:22','2023-10-16 15:04:22','dbdeploy','911-3.13.06.sql'),(912,'Main','2023-10-16 15:04:22','2023-10-16 15:04:22','dbdeploy','912-3.13.06.sql'),(913,'Main','2023-10-16 15:04:22','2023-10-16 15:04:22','dbdeploy','913-3.13.07.sql'),(914,'Main','2023-10-16 15:04:22','2023-10-16 15:04:22','dbdeploy','914-3.13.07.sql'),(915,'Main','2023-10-16 15:04:22','2023-10-16 15:04:22','dbdeploy','915-3.13.07.sql'),(916,'Main','2023-10-16 15:04:22','2023-10-16 15:04:22','dbdeploy','916-3.13.07.sql'),(917,'Main','2023-10-16 15:04:22','2023-10-16 15:04:22','dbdeploy','917-3.13.07.sql'),(918,'Main','2023-10-16 15:04:22','2023-10-16 15:04:22','dbdeploy','918-3.13.07.sql'),(919,'Main','2023-10-16 15:04:22','2023-10-16 15:04:22','dbdeploy','919-3.13.07.sql'),(920,'Main','2023-10-16 15:04:22','2023-10-16 15:04:22','dbdeploy','920-3.13.07.sql'),(921,'Main','2023-10-16 15:04:22','2023-10-16 15:04:22','dbdeploy','921-3.13.08.sql'),(922,'Main','2023-10-16 15:04:22','2023-10-16 15:04:22','dbdeploy','922-3.13.08.sql'),(923,'Main','2023-10-16 15:04:22','2023-10-16 15:04:23','dbdeploy','923-3.13.08.sql'),(924,'Main','2023-10-16 15:04:23','2023-10-16 15:04:23','dbdeploy','924-3.13.08.sql'),(925,'Main','2023-10-16 15:04:23','2023-10-16 15:04:24','dbdeploy','925-3.13.08.sql'),(926,'Main','2023-10-16 15:04:24','2023-10-16 15:04:24','dbdeploy','926-3.13.08.sql'),(927,'Main','2023-10-16 15:04:24','2023-10-16 15:04:24','dbdeploy','927-3.13.08.sql'),(928,'Main','2023-10-16 15:04:24','2023-10-16 15:04:24','dbdeploy','928-3.13.08.sql'),(929,'Main','2023-10-16 15:04:24','2023-10-16 15:04:24','dbdeploy','929-3.13.08.sql'),(930,'Main','2023-10-16 15:04:24','2023-10-16 15:04:24','dbdeploy','930-3.13.08.sql'),(931,'Main','2023-10-16 15:04:24','2023-10-16 15:04:24','dbdeploy','931-3.13.09.sql'),(932,'Main','2023-10-16 15:04:24','2023-10-16 15:04:24','dbdeploy','932-3.13.09.sql'),(933,'Main','2023-10-16 15:04:24','2023-10-16 15:04:24','dbdeploy','933-3.13.09.sql'),(934,'Main','2023-10-16 15:04:24','2023-10-16 15:04:24','dbdeploy','934-3.13.09.sql'),(935,'Main','2023-10-16 15:04:24','2023-10-16 15:04:25','dbdeploy','935-3.13.10.sql'),(936,'Main','2023-10-16 15:04:25','2023-10-16 15:04:25','dbdeploy','936-3.13.10.sql'),(937,'Main','2023-10-16 15:04:25','2023-10-16 15:04:25','dbdeploy','937-3.13.10.sql'),(938,'Main','2023-10-16 15:04:25','2023-10-16 15:04:25','dbdeploy','938-3.13.10.sql'),(939,'Main','2023-10-16 15:04:25','2023-10-16 15:04:25','dbdeploy','939-3.13.10.sql'),(940,'Main','2023-10-16 15:04:25','2023-10-16 15:04:25','dbdeploy','940-3.13.10.sql'),(941,'Main','2023-10-16 15:04:25','2023-10-16 15:04:25','dbdeploy','941-3.13.10 .sql'),(942,'Main','2023-10-16 15:04:25','2023-10-16 15:04:25','dbdeploy','942-3.13.10.sql'),(943,'Main','2023-10-16 15:04:25','2023-10-16 15:04:25','dbdeploy','943-3.13.11.sql'),(944,'Main','2023-10-16 15:04:25','2023-10-16 15:04:25','dbdeploy','944-3.13.11.sql'),(945,'Main','2023-10-16 15:04:25','2023-10-16 15:04:25','dbdeploy','945-3.13.11.sql');
/*!40000 ALTER TABLE `changelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_component_types`
--

DROP TABLE IF EXISTS `com_component_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `com_component_types` (
  `com_typeid` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `com_type` varchar(32) NOT NULL,
  PRIMARY KEY (`com_typeid`),
  KEY `com_type` (`com_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Типы компонентов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_component_types`
--

LOCK TABLES `com_component_types` WRITE;
/*!40000 ALTER TABLE `com_component_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `com_component_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_component_validators`
--

DROP TABLE IF EXISTS `com_component_validators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `com_component_validators` (
  `com_validator_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `validator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `validator_description` varchar(128) NOT NULL,
  PRIMARY KEY (`com_validator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Валидаторы компонент';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_component_validators`
--

LOCK TABLES `com_component_validators` WRITE;
/*!40000 ALTER TABLE `com_component_validators` DISABLE KEYS */;
/*!40000 ALTER TABLE `com_component_validators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_components`
--

DROP TABLE IF EXISTS `com_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `com_components` (
  `com_id` int unsigned NOT NULL AUTO_INCREMENT,
  `com_typeid` tinyint unsigned NOT NULL,
  `com_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `com_locale` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `component` longblob NOT NULL,
  `com_description` varchar(256) NOT NULL DEFAULT '',
  PRIMARY KEY (`com_id`),
  KEY `com_name` (`com_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Компоненты';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_components`
--

LOCK TABLES `com_components` WRITE;
/*!40000 ALTER TABLE `com_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `com_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_element_types`
--

DROP TABLE IF EXISTS `com_element_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `com_element_types` (
  `com_elementid` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `com_el_type` varchar(32) NOT NULL,
  PRIMARY KEY (`com_elementid`),
  KEY `com_type` (`com_el_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Типы Элементов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_element_types`
--

LOCK TABLES `com_element_types` WRITE;
/*!40000 ALTER TABLE `com_element_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `com_element_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_locale_lang`
--

DROP TABLE IF EXISTS `com_locale_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `com_locale_lang` (
  `langid` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `langcode` varchar(4) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL,
  `comment` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`langid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Языки системы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_locale_lang`
--

LOCK TABLES `com_locale_lang` WRITE;
/*!40000 ALTER TABLE `com_locale_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `com_locale_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_locale_words`
--

DROP TABLE IF EXISTS `com_locale_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `com_locale_words` (
  `wordid` bigint unsigned NOT NULL AUTO_INCREMENT,
  `langid` tinyint unsigned NOT NULL,
  `locale` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `translate` blob NOT NULL,
  PRIMARY KEY (`wordid`),
  KEY `lang_words` (`langid`,`locale`),
  KEY `langid` (`langid`),
  KEY `locale` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Словарь переводов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_locale_words`
--

LOCK TABLES `com_locale_words` WRITE;
/*!40000 ALTER TABLE `com_locale_words` DISABLE KEYS */;
/*!40000 ALTER TABLE `com_locale_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `com_window_types`
--

DROP TABLE IF EXISTS `com_window_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `com_window_types` (
  `com_win_typeid` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `com_win_type` varchar(32) NOT NULL,
  PRIMARY KEY (`com_win_typeid`),
  KEY `com_type` (`com_win_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Типы окон';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `com_window_types`
--

LOCK TABLES `com_window_types` WRITE;
/*!40000 ALTER TABLE `com_window_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `com_window_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connect_template`
--

DROP TABLE IF EXISTS `connect_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connect_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `templatename` varchar(128) NOT NULL,
  `templatetypeid` int NOT NULL,
  `usersgroupid` int NOT NULL DEFAULT '0',
  `userdevid` int NOT NULL DEFAULT '0',
  `userlegaldevid` int NOT NULL DEFAULT '0',
  `user_gid` int NOT NULL DEFAULT '0',
  `segments` blob,
  `switchid` int NOT NULL DEFAULT '0',
  `users_type` smallint NOT NULL DEFAULT '0',
  `as_default` tinyint NOT NULL DEFAULT '0',
  `show_custom_price` tinyint NOT NULL DEFAULT '0',
  `show_custom_speed` tinyint NOT NULL DEFAULT '0',
  `show_phone` tinyint NOT NULL DEFAULT '1',
  `show_email` tinyint NOT NULL DEFAULT '1',
  `show_note` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connect_template`
--

LOCK TABLES `connect_template` WRITE;
/*!40000 ALTER TABLE `connect_template` DISABLE KEYS */;
INSERT INTO `connect_template` VALUES (1,'Default FTTH',1,0,0,0,0,_binary '[]',0,0,0,0,0,1,1,1),(4,'Default ADSL',2,0,0,0,0,_binary '[]',0,0,0,0,0,1,1,1),(7,'Default Wifi',3,0,0,0,0,_binary '[]',0,0,0,0,0,1,1,1),(10,'Default Docsis',4,0,0,0,0,_binary '[]',0,0,0,0,0,1,1,1),(13,'Default EPon',5,0,0,0,0,_binary '[]',0,0,0,0,0,1,1,1),(16,'Default GPon',6,0,0,0,0,_binary '[]',0,0,0,0,0,1,1,1);
/*!40000 ALTER TABLE `connect_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connect_template_type`
--

DROP TABLE IF EXISTS `connect_template_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connect_template_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `usersgroupid` smallint NOT NULL DEFAULT '0',
  `segment` tinyint NOT NULL DEFAULT '1',
  `local_ip` tinyint NOT NULL DEFAULT '1',
  `local_mac` tinyint NOT NULL DEFAULT '1',
  `switch` tinyint NOT NULL DEFAULT '1',
  `dev_mac` tinyint NOT NULL DEFAULT '1',
  `dev_sn` tinyint NOT NULL DEFAULT '1',
  `packet_current` tinyint NOT NULL DEFAULT '1',
  `packet_next` tinyint NOT NULL DEFAULT '1',
  `packet_custom` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connect_template_type`
--

LOCK TABLES `connect_template_type` WRITE;
/*!40000 ALTER TABLE `connect_template_type` DISABLE KEYS */;
INSERT INTO `connect_template_type` VALUES (1,'FTTH',0,1,1,1,1,0,0,1,1,0),(4,'ADSL',0,1,1,1,0,0,0,1,1,0),(7,'Wifi',0,1,1,1,1,1,1,1,1,0),(10,'Docsis',0,1,1,1,1,1,1,1,1,0),(13,'EPon',0,1,1,1,1,1,1,1,1,0),(16,'GPon',0,1,1,1,1,1,1,1,1,0);
/*!40000 ALTER TABLE `connect_template_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dev_fields`
--

DROP TABLE IF EXISTS `dev_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dev_fields` (
  `devid` int unsigned NOT NULL,
  `key` varchar(32) NOT NULL,
  `value` varchar(64) NOT NULL,
  UNIQUE KEY `id_key` (`devid`,`key`),
  KEY `devid` (`devid`),
  KEY `key_value` (`key`,`value`),
  KEY `dev_value` (`value`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dev_fields`
--

LOCK TABLES `dev_fields` WRITE;
/*!40000 ALTER TABLE `dev_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `dev_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dev_packets`
--

DROP TABLE IF EXISTS `dev_packets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dev_packets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `enabled` tinyint NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  `description` varchar(254) NOT NULL DEFAULT '',
  `device_id` int DEFAULT NULL,
  `period` enum('d','m','a','') NOT NULL DEFAULT 'd',
  `dev_condition` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dev_packets`
--

LOCK TABLES `dev_packets` WRITE;
/*!40000 ALTER TABLE `dev_packets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dev_packets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dev_types`
--

DROP TABLE IF EXISTS `dev_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dev_types` (
  `devtypeid` smallint unsigned NOT NULL AUTO_INCREMENT,
  `devtypename` varchar(64) NOT NULL,
  `dev_alias` varchar(64) CHARACTER SET koi8r COLLATE koi8r_general_ci NOT NULL DEFAULT '',
  `dev_ip` tinyint NOT NULL DEFAULT '0',
  `dev_mac` tinyint NOT NULL DEFAULT '0',
  `device_sn` tinyint NOT NULL DEFAULT '0',
  `dev_sectorid` tinyint NOT NULL DEFAULT '0',
  `card_id` tinyint unsigned NOT NULL DEFAULT '0',
  `module_id` tinyint NOT NULL DEFAULT '0',
  `portal` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'признак портала: 0 - нет, 1 - IPTVPORTAL, 2 - Stalker, 3 - olltv',
  `portal_login` tinyint NOT NULL DEFAULT '0' COMMENT 'Логин на портале',
  `portal_password` tinyint NOT NULL DEFAULT '0' COMMENT 'Пароль на портале',
  `default_cost` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `default_rent` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `default_owner` tinyint NOT NULL DEFAULT '0',
  `deny_to_change_owner_settings` tinyint unsigned NOT NULL DEFAULT '0',
  `description` varchar(128) NOT NULL DEFAULT '',
  `installments_price` double(20,6) NOT NULL DEFAULT '0.000000',
  `installments_count` smallint NOT NULL DEFAULT '0',
  `type` tinyint DEFAULT '0',
  `license_count` tinyint NOT NULL DEFAULT '0',
  `code_activation` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`devtypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dev_types`
--

LOCK TABLES `dev_types` WRITE;
/*!40000 ALTER TABLE `dev_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `dev_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dev_user`
--

DROP TABLE IF EXISTS `dev_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dev_user` (
  `devid` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned NOT NULL,
  `devtypeid` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`devid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dev_user`
--

LOCK TABLES `dev_user` WRITE;
/*!40000 ALTER TABLE `dev_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `dev_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc_templates`
--

DROP TABLE IF EXISTS `doc_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doc_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `doc_type` smallint NOT NULL DEFAULT '1' COMMENT '1 - invoice',
  `user_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - Физ. лицо\r\n1- Юр. лицо',
  `by_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Использовать по умолчанию',
  `usersgroupid` int NOT NULL DEFAULT '0',
  `date_create` int NOT NULL,
  `file` mediumblob,
  PRIMARY KEY (`id`),
  KEY `doc_type` (`doc_type`),
  KEY `usersgroupid` (`usersgroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_templates`
--

LOCK TABLES `doc_templates` WRITE;
/*!40000 ALTER TABLE `doc_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `doc_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `errorcodes`
--

DROP TABLE IF EXISTS `errorcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `errorcodes` (
  `code` char(4) NOT NULL,
  `text` blob NOT NULL,
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=73 COMMENT='Коды ошибок VPN';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `errorcodes`
--

LOCK TABLES `errorcodes` WRITE;
/*!40000 ALTER TABLE `errorcodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `errorcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `event_logs`
--

DROP TABLE IF EXISTS `event_logs`;
/*!50001 DROP VIEW IF EXISTS `event_logs`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `event_logs` AS SELECT 
 1 AS `evid`,
 1 AS `time`,
 1 AS `use_queue`,
 1 AS `uid`,
 1 AS `evname`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `event_system`
--

DROP TABLE IF EXISTS `event_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_system` (
  `evid` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `time` int unsigned NOT NULL COMMENT 'unixtime',
  `evtpid` int unsigned NOT NULL COMMENT 'event type id',
  `queue` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'use queue 0/1',
  `uid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'user id',
  PRIMARY KEY (`evid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='MB event system log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_system`
--

LOCK TABLES `event_system` WRITE;
/*!40000 ALTER TABLE `event_system` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_type`
--

DROP TABLE IF EXISTS `event_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_type` (
  `evtpid` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'event type id',
  `evname` varchar(64) NOT NULL COMMENT 'event name',
  PRIMARY KEY (`evtpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='MB event type';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_type`
--

LOCK TABLES `event_type` WRITE;
/*!40000 ALTER TABLE `event_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extended_fields_devtype`
--

DROP TABLE IF EXISTS `extended_fields_devtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extended_fields_devtype` (
  `id` tinyint unsigned NOT NULL,
  `key` varchar(48) NOT NULL,
  `value` varchar(128) NOT NULL,
  PRIMARY KEY (`id`,`key`),
  UNIQUE KEY `full` (`id`,`key`,`value`),
  KEY `search` (`key`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Custom dev type fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extended_fields_devtype`
--

LOCK TABLES `extended_fields_devtype` WRITE;
/*!40000 ALTER TABLE `extended_fields_devtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `extended_fields_devtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failover_group`
--

DROP TABLE IF EXISTS `failover_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failover_group` (
  `rfgid` smallint NOT NULL AUTO_INCREMENT COMMENT 'id failover группы',
  `name` varchar(128) DEFAULT NULL COMMENT 'имя failover группы',
  `vrf` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`rfgid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failover_group`
--

LOCK TABLES `failover_group` WRITE;
/*!40000 ALTER TABLE `failover_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `failover_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failover_group_radnas`
--

DROP TABLE IF EXISTS `failover_group_radnas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failover_group_radnas` (
  `rfgid` smallint NOT NULL COMMENT 'id failover группы',
  `radnasid` smallint NOT NULL COMMENT 'id nas',
  PRIMARY KEY (`rfgid`,`radnasid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failover_group_radnas`
--

LOCK TABLES `failover_group_radnas` WRITE;
/*!40000 ALTER TABLE `failover_group_radnas` DISABLE KEYS */;
/*!40000 ALTER TABLE `failover_group_radnas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failover_group_switches`
--

DROP TABLE IF EXISTS `failover_group_switches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failover_group_switches` (
  `rfgid` smallint NOT NULL COMMENT 'id failover группы',
  `swid` smallint NOT NULL COMMENT 'id switches',
  PRIMARY KEY (`rfgid`,`swid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failover_group_switches`
--

LOCK TABLES `failover_group_switches` WRITE;
/*!40000 ALTER TABLE `failover_group_switches` DISABLE KEYS */;
/*!40000 ALTER TABLE `failover_group_switches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fiscalization_data`
--

DROP TABLE IF EXISTS `fiscalization_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fiscalization_data` (
  `id` int NOT NULL,
  `check` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fiscalization_data`
--

LOCK TABLES `fiscalization_data` WRITE;
/*!40000 ALTER TABLE `fiscalization_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `fiscalization_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fiscalization_report`
--

DROP TABLE IF EXISTS `fiscalization_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fiscalization_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` enum('1','2','3') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '1 - komtet, 2 - atol, 3- webkassa',
  `transaction` text,
  `uid` int DEFAULT NULL,
  `queue_id` text,
  `group_id` smallint NOT NULL DEFAULT '0',
  `amount` mediumint NOT NULL DEFAULT '0',
  `created` int DEFAULT NULL,
  `completed` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `retry` tinyint NOT NULL DEFAULT '0',
  `info` text,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `transaction` (`transaction`(255)),
  KEY `queue` (`queue_id`(128)),
  KEY `group` (`group_id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `uid + status` (`uid`,`status`),
  KEY `status` (`id`),
  KEY `status + retry` (`id`,`type`),
  KEY `created` (`created`),
  KEY `completed` (`completed`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fiscalization_report`
--

LOCK TABLES `fiscalization_report` WRITE;
/*!40000 ALTER TABLE `fiscalization_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `fiscalization_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_map_geometry`
--

DROP TABLE IF EXISTS `geo_map_geometry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geo_map_geometry` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_id` int NOT NULL,
  `type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `coordinates` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `onject_type` (`object_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_map_geometry`
--

LOCK TABLES `geo_map_geometry` WRITE;
/*!40000 ALTER TABLE `geo_map_geometry` DISABLE KEYS */;
/*!40000 ALTER TABLE `geo_map_geometry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_map_maps`
--

DROP TABLE IF EXISTS `geo_map_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geo_map_maps` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` blob NOT NULL,
  `description` blob,
  `lat` double(8,6) NOT NULL,
  `lon` double(9,6) NOT NULL,
  `zoom` smallint NOT NULL DEFAULT '4',
  PRIMARY KEY (`id`),
  KEY `map_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_map_maps`
--

LOCK TABLES `geo_map_maps` WRITE;
/*!40000 ALTER TABLE `geo_map_maps` DISABLE KEYS */;
/*!40000 ALTER TABLE `geo_map_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_map_objects`
--

DROP TABLE IF EXISTS `geo_map_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geo_map_objects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `map_id` int NOT NULL,
  `type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `map_id` (`map_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_map_objects`
--

LOCK TABLES `geo_map_objects` WRITE;
/*!40000 ALTER TABLE `geo_map_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `geo_map_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_map_properties`
--

DROP TABLE IF EXISTS `geo_map_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `geo_map_properties` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_id` int NOT NULL,
  `key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` blob,
  PRIMARY KEY (`id`),
  KEY `object_id` (`object_id`),
  KEY `object_key` (`object_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_map_properties`
--

LOCK TABLES `geo_map_properties` WRITE;
/*!40000 ALTER TABLE `geo_map_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `geo_map_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `holidays` (
  `holiday_date` char(5) NOT NULL DEFAULT '',
  `comment` char(64) NOT NULL,
  PRIMARY KEY (`holiday_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotspot_free`
--

DROP TABLE IF EXISTS `hotspot_free`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotspot_free` (
  `hsid` int unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `address` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mac_address` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `host_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`hsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Free HotSpot Stat';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotspot_free`
--

LOCK TABLES `hotspot_free` WRITE;
/*!40000 ALTER TABLE `hotspot_free` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotspot_free` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotspot_free_radacct`
--

DROP TABLE IF EXISTS `hotspot_free_radacct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotspot_free_radacct` (
  `radacctid` bigint NOT NULL AUTO_INCREMENT,
  `acctsessionid` varchar(64) NOT NULL,
  `acctuniqueid` varchar(32) NOT NULL,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `uid` bigint unsigned DEFAULT NULL,
  `gid` smallint unsigned DEFAULT NULL,
  `nasipaddress` varchar(15) NOT NULL,
  `nasportid` varchar(15) DEFAULT NULL,
  `acctstarttime` datetime DEFAULT NULL,
  `acctstoptime` datetime DEFAULT NULL,
  `acctsessiontime` int DEFAULT NULL,
  `acctinputoctets` bigint DEFAULT NULL,
  `acctoutputoctets` bigint DEFAULT NULL,
  `calledstationid` varchar(50) NOT NULL,
  `callingstationid` varchar(50) NOT NULL,
  `acctterminatecause` varchar(32) NOT NULL,
  `framedipaddress` varchar(15) NOT NULL,
  `last_change` int unsigned NOT NULL DEFAULT '0',
  `before_billing` double(20,6) NOT NULL,
  `billing_minus` double(20,6) NOT NULL,
  PRIMARY KEY (`radacctid`),
  KEY `acctsessionid` (`acctsessionid`),
  KEY `acctsessiontime` (`acctsessiontime`),
  KEY `acctstarttime` (`acctstarttime`),
  KEY `acctstoptime` (`acctstoptime`),
  KEY `acctuniqueid` (`acctuniqueid`),
  KEY `framedipaddress` (`framedipaddress`),
  KEY `framed-terminate` (`framedipaddress`,`acctterminatecause`),
  KEY `mrtggid` (`gid`,`acctterminatecause`),
  KEY `mrtguid` (`uid`,`acctterminatecause`),
  KEY `nasipaddress` (`nasipaddress`),
  KEY `Online_index` (`acctterminatecause`),
  KEY `ses-user-nas` (`acctsessionid`,`username`,`nasipaddress`),
  KEY `time_user` (`username`,`acctsessionid`,`acctsessiontime`,`acctstarttime`,`acctstoptime`),
  KEY `uid` (`uid`,`gid`),
  KEY `uniq-user-nas` (`acctuniqueid`,`username`,`nasipaddress`),
  KEY `user_uid` (`uid`),
  KEY `username` (`username`),
  KEY `user-start-time` (`username`,`acctstarttime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotspot_free_radacct`
--

LOCK TABLES `hotspot_free_radacct` WRITE;
/*!40000 ALTER TABLE `hotspot_free_radacct` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotspot_free_radacct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotspot_free_users`
--

DROP TABLE IF EXISTS `hotspot_free_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotspot_free_users` (
  `user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '*',
  `crypt_method` tinyint unsigned NOT NULL DEFAULT '0',
  `uid` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gid` int unsigned NOT NULL DEFAULT '1',
  `deposit` double(20,6) NOT NULL DEFAULT '0.000000',
  `credit` double(20,2) NOT NULL DEFAULT '0.00',
  `fio` char(128) NOT NULL,
  `phone` char(128) NOT NULL,
  `address` char(128) NOT NULL,
  `prim` char(254) NOT NULL,
  `add_date` date NOT NULL DEFAULT '0000-00-00',
  `blocked` tinyint unsigned NOT NULL DEFAULT '0',
  `activated` tinyint unsigned NOT NULL DEFAULT '1',
  `expired` date NOT NULL DEFAULT '0000-00-00',
  `total_time` int NOT NULL DEFAULT '0',
  `total_traffic` bigint NOT NULL DEFAULT '0',
  `total_money` double(20,6) NOT NULL DEFAULT '0.000000',
  `last_connection` date NOT NULL DEFAULT '0000-00-00',
  `framed_ip` char(16) NOT NULL,
  `framed_mask` char(16) NOT NULL DEFAULT '255.255.255.255',
  `callback_number` char(64) NOT NULL,
  `local_ip` char(16) NOT NULL DEFAULT '10.0.',
  `local_mac` char(22) DEFAULT NULL,
  `sectorid` smallint unsigned NOT NULL DEFAULT '1',
  `create_mail` smallint unsigned NOT NULL DEFAULT '1',
  `user_installed` smallint unsigned NOT NULL DEFAULT '1',
  `speed_rate` int unsigned NOT NULL DEFAULT '0',
  `speed_burst` int unsigned NOT NULL DEFAULT '0',
  `gidd` smallint unsigned NOT NULL DEFAULT '0',
  `link_to_ip_mac` tinyint unsigned NOT NULL DEFAULT '0',
  `email` char(64) DEFAULT NULL,
  `passportserie` char(16) DEFAULT NULL,
  `passportpropiska` char(128) DEFAULT NULL,
  `passportvoenkomat` char(128) DEFAULT NULL,
  `passportgdevidan` char(128) DEFAULT NULL,
  `inn` char(64) DEFAULT NULL,
  `real_ip` tinyint unsigned NOT NULL DEFAULT '0',
  `real_price` double(20,6) NOT NULL DEFAULT '0.000000',
  `real_ipfree` tinyint NOT NULL DEFAULT '0',
  `dogovor` tinyint NOT NULL DEFAULT '0',
  `credit_procent` tinyint unsigned NOT NULL DEFAULT '0',
  `rating` smallint NOT NULL DEFAULT '0',
  `mob_tel` char(32) DEFAULT NULL,
  `sms_tel` char(32) DEFAULT NULL,
  `date_birth` date DEFAULT '0000-00-00',
  `date_birth_do` tinyint unsigned NOT NULL DEFAULT '0',
  `languarddisable` tinyint unsigned NOT NULL DEFAULT '0',
  `credit_unlimited` tinyint unsigned NOT NULL DEFAULT '0',
  `dontshowspeed` tinyint unsigned NOT NULL DEFAULT '0',
  `numdogovor` char(16) DEFAULT NULL,
  `app` char(4) NOT NULL,
  `switchport` int unsigned DEFAULT '0',
  `houseid` int unsigned NOT NULL,
  `swid` int unsigned DEFAULT '0',
  `use_router` tinyint unsigned NOT NULL DEFAULT '0',
  `router_model` char(16) NOT NULL,
  `router_login` char(16) NOT NULL,
  `router_pass` char(16) NOT NULL,
  `router_ssid` char(16) NOT NULL,
  `router_wep_pass` char(16) NOT NULL,
  `router_we_saled` tinyint unsigned NOT NULL DEFAULT '0',
  `router_use_dual` tinyint unsigned NOT NULL DEFAULT '0',
  `router_add_date` char(10) NOT NULL DEFAULT '00/00/0000',
  `router_serial` char(16) NOT NULL,
  `router_port` char(16) NOT NULL DEFAULT '8080',
  `credit_stop` tinyint unsigned NOT NULL DEFAULT '0',
  `date_abonka` tinyint unsigned NOT NULL DEFAULT '1',
  `mac_reg` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uname` (`user`),
  KEY `gid` (`gid`),
  KEY `gidd` (`gidd`),
  KEY `mrtgusname` (`user`,`uid`),
  KEY `sectorid` (`sectorid`),
  KEY `swid` (`swid`),
  KEY `swid-port` (`swid`,`switchport`),
  KEY `swport` (`switchport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotspot_free_users`
--

LOCK TABLES `hotspot_free_users` WRITE;
/*!40000 ALTER TABLE `hotspot_free_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotspot_free_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `inetonline`
--

DROP TABLE IF EXISTS `inetonline`;
/*!50001 DROP VIEW IF EXISTS `inetonline`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `inetonline` AS SELECT 
 1 AS `gid`,
 1 AS `uid`,
 1 AS `user`,
 1 AS `port`,
 1 AS `server`,
 1 AS `ip`,
 1 AS `call_from`,
 1 AS `fstart_time`,
 1 AS `time_on`,
 1 AS `in_bytes`,
 1 AS `out_bytes`,
 1 AS `billing_minus`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `inetonlinenew`
--

DROP TABLE IF EXISTS `inetonlinenew`;
/*!50001 DROP VIEW IF EXISTS `inetonlinenew`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `inetonlinenew` AS SELECT 
 1 AS `radacctid`,
 1 AS `acctsessionid`,
 1 AS `acctuniqueid`,
 1 AS `username`,
 1 AS `uid`,
 1 AS `gid`,
 1 AS `nasipaddress`,
 1 AS `nasportid`,
 1 AS `acctstarttime`,
 1 AS `acctstoptime`,
 1 AS `acctsessiontime`,
 1 AS `acctinputoctets`,
 1 AS `acctoutputoctets`,
 1 AS `calledstationid`,
 1 AS `callingstationid`,
 1 AS `acctterminatecause`,
 1 AS `framedipaddress`,
 1 AS `last_change`,
 1 AS `before_billing`,
 1 AS `billing_minus`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `inetonlinewithspeed`
--

DROP TABLE IF EXISTS `inetonlinewithspeed`;
/*!50001 DROP VIEW IF EXISTS `inetonlinewithspeed`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `inetonlinewithspeed` AS SELECT 
 1 AS `radacctid`,
 1 AS `acctsessionid`,
 1 AS `acctuniqueid`,
 1 AS `username`,
 1 AS `uid`,
 1 AS `gid`,
 1 AS `nasipaddress`,
 1 AS `nasportid`,
 1 AS `acctstarttime`,
 1 AS `acctstoptime`,
 1 AS `acctsessiontime`,
 1 AS `acctinputoctets`,
 1 AS `acctoutputoctets`,
 1 AS `calledstationid`,
 1 AS `callingstationid`,
 1 AS `acctterminatecause`,
 1 AS `framedipaddress`,
 1 AS `last_change`,
 1 AS `before_billing`,
 1 AS `billing_minus`,
 1 AS `user_speed_in`,
 1 AS `user_speed_out`,
 1 AS `use_radius_shaper`,
 1 AS `tarif_speed_in`,
 1 AS `tarif_speed_out`,
 1 AS `tarif_shaper_prio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `inetspeedlist`
--

DROP TABLE IF EXISTS `inetspeedlist`;
/*!50001 DROP VIEW IF EXISTS `inetspeedlist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `inetspeedlist` AS SELECT 
 1 AS `username`,
 1 AS `framedipaddress`,
 1 AS `local_ip`,
 1 AS `user_speed_in`,
 1 AS `user_speed_out`,
 1 AS `tarif_speed_in`,
 1 AS `tarif_speed_out`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doc_type` smallint NOT NULL DEFAULT '1' COMMENT '1 - invoice',
  `date_create` int NOT NULL,
  `date_period` int NOT NULL,
  `uid` int NOT NULL,
  `summa` double(20,2) NOT NULL DEFAULT '0.00',
  `usersgroupid` int NOT NULL DEFAULT '0',
  `legal_person` tinyint NOT NULL DEFAULT '0',
  `customer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dogovor_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `settlementid` int NOT NULL DEFAULT '0',
  `laneid` int NOT NULL DEFAULT '0',
  `houseid` int NOT NULL DEFAULT '0',
  `gid` int NOT NULL DEFAULT '0',
  `json` blob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `date_uid` (`date_period`,`uid`) USING BTREE,
  KEY `doc_type` (`doc_type`),
  KEY `usersgroupid` (`usersgroupid`),
  KEY `settlementid` (`settlementid`),
  KEY `laneid` (`laneid`),
  KEY `houseid` (`houseid`),
  KEY `gid` (`gid`),
  KEY `legal_person` (`legal_person`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_access`
--

DROP TABLE IF EXISTS `ip_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_access` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ipaddress` varchar(255) NOT NULL,
  `stuffid` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ip_address` (`ipaddress`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_access`
--

LOCK TABLES `ip_access` WRITE;
/*!40000 ALTER TABLE `ip_access` DISABLE KEYS */;
INSERT INTO `ip_access` VALUES (1,'0.0.0.0/0',0);
/*!40000 ALTER TABLE `ip_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_lease`
--

DROP TABLE IF EXISTS `ip_lease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_lease` (
  `ip` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_lease`
--

LOCK TABLES `ip_lease` WRITE;
/*!40000 ALTER TABLE `ip_lease` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_lease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_pools`
--

DROP TABLE IF EXISTS `ip_pools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_pools` (
  `poolid` int unsigned NOT NULL AUTO_INCREMENT,
  `poolname` char(128) NOT NULL,
  `usemask` tinyint unsigned NOT NULL DEFAULT '0',
  `poolmask` tinyint unsigned NOT NULL DEFAULT '24',
  `usegw` tinyint unsigned NOT NULL DEFAULT '0',
  `poolgw` char(15) NOT NULL DEFAULT '',
  `pool_dns1` varchar(15) DEFAULT NULL,
  `pool_dns2` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`poolid`),
  KEY `poolname` (`poolname`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=133;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_pools`
--

LOCK TABLES `ip_pools` WRITE;
/*!40000 ALTER TABLE `ip_pools` DISABLE KEYS */;
INSERT INTO `ip_pools` VALUES (1,'Без денег',0,24,0,'',NULL,NULL),(2,'Main ip-Pool',0,24,0,'',NULL,NULL);
/*!40000 ALTER TABLE `ip_pools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_pools_packets`
--

DROP TABLE IF EXISTS `ip_pools_packets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_pools_packets` (
  `ippoolpacketid` int unsigned NOT NULL AUTO_INCREMENT,
  `gid` int unsigned NOT NULL,
  `poolid` int unsigned NOT NULL,
  PRIMARY KEY (`ippoolpacketid`),
  KEY `gid` (`gid`),
  KEY `gid-poolid` (`poolid`,`gid`),
  KEY `poolid` (`poolid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_pools_packets`
--

LOCK TABLES `ip_pools_packets` WRITE;
/*!40000 ALTER TABLE `ip_pools_packets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_pools_packets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_pools_packets_ipv6_static`
--

DROP TABLE IF EXISTS `ip_pools_packets_ipv6_static`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_pools_packets_ipv6_static` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gid` int NOT NULL,
  `poolid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gid` (`gid`),
  KEY `poolid` (`poolid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_pools_packets_ipv6_static`
--

LOCK TABLES `ip_pools_packets_ipv6_static` WRITE;
/*!40000 ALTER TABLE `ip_pools_packets_ipv6_static` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_pools_packets_ipv6_static` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_pools_packets_real`
--

DROP TABLE IF EXISTS `ip_pools_packets_real`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_pools_packets_real` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gid` int NOT NULL COMMENT 'id тарифа',
  `poolid` int NOT NULL COMMENT 'id pool',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq` (`gid`,`poolid`),
  KEY `poolid_index` (`poolid`) USING BTREE,
  KEY `gid_index` (`gid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_pools_packets_real`
--

LOCK TABLES `ip_pools_packets_real` WRITE;
/*!40000 ALTER TABLE `ip_pools_packets_real` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_pools_packets_real` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_pools_pool`
--

DROP TABLE IF EXISTS `ip_pools_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_pools_pool` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `poolip` char(15) NOT NULL DEFAULT '',
  `poolid` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`poolid`),
  KEY `ip` (`poolip`),
  KEY `ip-id` (`poolip`,`poolid`),
  KEY `idpoolid` (`id`,`poolid`)
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_pools_pool`
--

LOCK TABLES `ip_pools_pool` WRITE;
/*!40000 ALTER TABLE `ip_pools_pool` DISABLE KEYS */;
INSERT INTO `ip_pools_pool` VALUES (1,'172.31.255.1',1),(10,'172.31.255.10',1),(100,'172.31.255.100',1),(101,'172.31.255.101',1),(102,'172.31.255.102',1),(103,'172.31.255.103',1),(104,'172.31.255.104',1),(105,'172.31.255.105',1),(106,'172.31.255.106',1),(107,'172.31.255.107',1),(108,'172.31.255.108',1),(109,'172.31.255.109',1),(11,'172.31.255.11',1),(110,'172.31.255.110',1),(111,'172.31.255.111',1),(112,'172.31.255.112',1),(113,'172.31.255.113',1),(114,'172.31.255.114',1),(115,'172.31.255.115',1),(116,'172.31.255.116',1),(117,'172.31.255.117',1),(118,'172.31.255.118',1),(119,'172.31.255.119',1),(12,'172.31.255.12',1),(120,'172.31.255.120',1),(121,'172.31.255.121',1),(122,'172.31.255.122',1),(123,'172.31.255.123',1),(124,'172.31.255.124',1),(125,'172.31.255.125',1),(126,'172.31.255.126',1),(127,'172.31.255.127',1),(128,'172.31.255.128',1),(129,'172.31.255.129',1),(13,'172.31.255.13',1),(130,'172.31.255.130',1),(131,'172.31.255.131',1),(132,'172.31.255.132',1),(133,'172.31.255.133',1),(134,'172.31.255.134',1),(135,'172.31.255.135',1),(136,'172.31.255.136',1),(137,'172.31.255.137',1),(138,'172.31.255.138',1),(139,'172.31.255.139',1),(14,'172.31.255.14',1),(140,'172.31.255.140',1),(141,'172.31.255.141',1),(142,'172.31.255.142',1),(143,'172.31.255.143',1),(144,'172.31.255.144',1),(145,'172.31.255.145',1),(146,'172.31.255.146',1),(147,'172.31.255.147',1),(148,'172.31.255.148',1),(149,'172.31.255.149',1),(15,'172.31.255.15',1),(150,'172.31.255.150',1),(151,'172.31.255.151',1),(152,'172.31.255.152',1),(153,'172.31.255.153',1),(154,'172.31.255.154',1),(155,'172.31.255.155',1),(156,'172.31.255.156',1),(157,'172.31.255.157',1),(158,'172.31.255.158',1),(159,'172.31.255.159',1),(16,'172.31.255.16',1),(160,'172.31.255.160',1),(161,'172.31.255.161',1),(162,'172.31.255.162',1),(163,'172.31.255.163',1),(164,'172.31.255.164',1),(165,'172.31.255.165',1),(166,'172.31.255.166',1),(167,'172.31.255.167',1),(168,'172.31.255.168',1),(169,'172.31.255.169',1),(17,'172.31.255.17',1),(170,'172.31.255.170',1),(171,'172.31.255.171',1),(172,'172.31.255.172',1),(173,'172.31.255.173',1),(174,'172.31.255.174',1),(175,'172.31.255.175',1),(176,'172.31.255.176',1),(177,'172.31.255.177',1),(178,'172.31.255.178',1),(179,'172.31.255.179',1),(18,'172.31.255.18',1),(180,'172.31.255.180',1),(181,'172.31.255.181',1),(182,'172.31.255.182',1),(183,'172.31.255.183',1),(184,'172.31.255.184',1),(185,'172.31.255.185',1),(186,'172.31.255.186',1),(187,'172.31.255.187',1),(188,'172.31.255.188',1),(189,'172.31.255.189',1),(19,'172.31.255.19',1),(190,'172.31.255.190',1),(191,'172.31.255.191',1),(192,'172.31.255.192',1),(193,'172.31.255.193',1),(194,'172.31.255.194',1),(195,'172.31.255.195',1),(196,'172.31.255.196',1),(197,'172.31.255.197',1),(198,'172.31.255.198',1),(199,'172.31.255.199',1),(2,'172.31.255.2',1),(20,'172.31.255.20',1),(200,'172.31.255.200',1),(201,'172.31.255.201',1),(202,'172.31.255.202',1),(203,'172.31.255.203',1),(204,'172.31.255.204',1),(205,'172.31.255.205',1),(206,'172.31.255.206',1),(207,'172.31.255.207',1),(208,'172.31.255.208',1),(209,'172.31.255.209',1),(21,'172.31.255.21',1),(210,'172.31.255.210',1),(211,'172.31.255.211',1),(212,'172.31.255.212',1),(213,'172.31.255.213',1),(214,'172.31.255.214',1),(215,'172.31.255.215',1),(216,'172.31.255.216',1),(217,'172.31.255.217',1),(218,'172.31.255.218',1),(219,'172.31.255.219',1),(22,'172.31.255.22',1),(220,'172.31.255.220',1),(221,'172.31.255.221',1),(222,'172.31.255.222',1),(223,'172.31.255.223',1),(224,'172.31.255.224',1),(225,'172.31.255.225',1),(226,'172.31.255.226',1),(227,'172.31.255.227',1),(228,'172.31.255.228',1),(229,'172.31.255.229',1),(23,'172.31.255.23',1),(230,'172.31.255.230',1),(231,'172.31.255.231',1),(232,'172.31.255.232',1),(233,'172.31.255.233',1),(234,'172.31.255.234',1),(235,'172.31.255.235',1),(236,'172.31.255.236',1),(237,'172.31.255.237',1),(238,'172.31.255.238',1),(239,'172.31.255.239',1),(24,'172.31.255.24',1),(240,'172.31.255.240',1),(241,'172.31.255.241',1),(242,'172.31.255.242',1),(243,'172.31.255.243',1),(244,'172.31.255.244',1),(245,'172.31.255.245',1),(246,'172.31.255.246',1),(247,'172.31.255.247',1),(248,'172.31.255.248',1),(249,'172.31.255.249',1),(25,'172.31.255.25',1),(250,'172.31.255.250',1),(251,'172.31.255.251',1),(252,'172.31.255.252',1),(253,'172.31.255.253',1),(254,'172.31.255.254',1),(26,'172.31.255.26',1),(27,'172.31.255.27',1),(28,'172.31.255.28',1),(29,'172.31.255.29',1),(3,'172.31.255.3',1),(30,'172.31.255.30',1),(31,'172.31.255.31',1),(32,'172.31.255.32',1),(33,'172.31.255.33',1),(34,'172.31.255.34',1),(35,'172.31.255.35',1),(36,'172.31.255.36',1),(37,'172.31.255.37',1),(38,'172.31.255.38',1),(39,'172.31.255.39',1),(4,'172.31.255.4',1),(40,'172.31.255.40',1),(41,'172.31.255.41',1),(42,'172.31.255.42',1),(43,'172.31.255.43',1),(44,'172.31.255.44',1),(45,'172.31.255.45',1),(46,'172.31.255.46',1),(47,'172.31.255.47',1),(48,'172.31.255.48',1),(49,'172.31.255.49',1),(5,'172.31.255.5',1),(50,'172.31.255.50',1),(51,'172.31.255.51',1),(52,'172.31.255.52',1),(53,'172.31.255.53',1),(54,'172.31.255.54',1),(55,'172.31.255.55',1),(56,'172.31.255.56',1),(57,'172.31.255.57',1),(58,'172.31.255.58',1),(59,'172.31.255.59',1),(6,'172.31.255.6',1),(60,'172.31.255.60',1),(61,'172.31.255.61',1),(62,'172.31.255.62',1),(63,'172.31.255.63',1),(64,'172.31.255.64',1),(65,'172.31.255.65',1),(66,'172.31.255.66',1),(67,'172.31.255.67',1),(68,'172.31.255.68',1),(69,'172.31.255.69',1),(7,'172.31.255.7',1),(70,'172.31.255.70',1),(71,'172.31.255.71',1),(72,'172.31.255.72',1),(73,'172.31.255.73',1),(74,'172.31.255.74',1),(75,'172.31.255.75',1),(76,'172.31.255.76',1),(77,'172.31.255.77',1),(78,'172.31.255.78',1),(79,'172.31.255.79',1),(8,'172.31.255.8',1),(80,'172.31.255.80',1),(81,'172.31.255.81',1),(82,'172.31.255.82',1),(83,'172.31.255.83',1),(84,'172.31.255.84',1),(85,'172.31.255.85',1),(86,'172.31.255.86',1),(87,'172.31.255.87',1),(88,'172.31.255.88',1),(89,'172.31.255.89',1),(9,'172.31.255.9',1),(90,'172.31.255.90',1),(91,'172.31.255.91',1),(92,'172.31.255.92',1),(93,'172.31.255.93',1),(94,'172.31.255.94',1),(95,'172.31.255.95',1),(96,'172.31.255.96',1),(97,'172.31.255.97',1),(98,'172.31.255.98',1),(99,'172.31.255.99',1);
/*!40000 ALTER TABLE `ip_pools_pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_pools_pool_use`
--

DROP TABLE IF EXISTS `ip_pools_pool_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_pools_pool_use` (
  `poolip` char(15) NOT NULL DEFAULT '',
  `poolid` int unsigned NOT NULL,
  `last_change` int NOT NULL DEFAULT '0',
  `acctsessionid` varchar(64) DEFAULT NULL,
  `acctuniqueid` varchar(32) DEFAULT NULL,
  `uid` int unsigned NOT NULL,
  PRIMARY KEY (`poolip`),
  KEY `ip-uid-ses-uniq` (`poolip`,`uid`,`acctsessionid`,`acctuniqueid`),
  KEY `poolid` (`poolid`),
  KEY `time` (`last_change`),
  KEY `uid` (`uid`),
  KEY `uid-ip` (`poolip`,`uid`),
  KEY `real_ip` (`uid`,`poolid`,`poolip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_pools_pool_use`
--

LOCK TABLES `ip_pools_pool_use` WRITE;
/*!40000 ALTER TABLE `ip_pools_pool_use` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_pools_pool_use` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_real`
--

DROP TABLE IF EXISTS `ip_real`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_real` (
  `real` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`real`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_real`
--

LOCK TABLES `ip_real` WRITE;
/*!40000 ALTER TABLE `ip_real` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_real` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iptv_requests_log`
--

DROP TABLE IF EXISTS `iptv_requests_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iptv_requests_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL DEFAULT '0',
  `middleware` smallint NOT NULL DEFAULT '0',
  `package_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '',
  `subscription_id` smallint DEFAULT '0',
  `order_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `order_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `order_time` datetime DEFAULT NULL,
  `status_code` tinyint NOT NULL DEFAULT '0',
  `status_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `json_data` blob NOT NULL,
  `json_response` blob,
  PRIMARY KEY (`id`),
  KEY `update_status` (`order_id`),
  KEY `last10logs` (`uid`,`middleware`),
  KEY `full_logs` (`middleware`,`order_time`),
  KEY `subscription_id` (`subscription_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iptv_requests_log`
--

LOCK TABLES `iptv_requests_log` WRITE;
/*!40000 ALTER TABLE `iptv_requests_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `iptv_requests_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipv6_pool`
--

DROP TABLE IF EXISTS `ipv6_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipv6_pool` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Pool ID',
  `name` varchar(128) NOT NULL COMMENT 'Pool name',
  `default_dns1` varchar(35) NOT NULL,
  `default_dns2` varchar(35) NOT NULL,
  `delegated_prefix` smallint NOT NULL DEFAULT '64' COMMENT 'Prefix delegation',
  `router_prefix` smallint NOT NULL DEFAULT '64' COMMENT 'Prefix delegation',
  `usersgroupid` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipv6_pool`
--

LOCK TABLES `ipv6_pool` WRITE;
/*!40000 ALTER TABLE `ipv6_pool` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipv6_pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipv6_pool_networks`
--

DROP TABLE IF EXISTS `ipv6_pool_networks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipv6_pool_networks` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'network id',
  `pool_id` int NOT NULL COMMENT 'pool id',
  `delegated_network` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'delegated network',
  `delegated_prefix1` smallint NOT NULL DEFAULT '32' COMMENT 'delegated prefix1',
  `delegated_prefix2` smallint NOT NULL DEFAULT '0',
  `router_network` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `router_prefix1` smallint NOT NULL DEFAULT '32',
  `router_prefix2` smallint NOT NULL DEFAULT '0',
  `dns1` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'override pool dns1',
  `dns2` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'override pool dns2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipv6_pool_networks`
--

LOCK TABLES `ipv6_pool_networks` WRITE;
/*!40000 ALTER TABLE `ipv6_pool_networks` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipv6_pool_networks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipv6_pool_networks_address`
--

DROP TABLE IF EXISTS `ipv6_pool_networks_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipv6_pool_networks_address` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'network address id',
  `network_id` int NOT NULL COMMENT 'network id',
  `delegated_network` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'delegated network address',
  `delegated_network_bin` varbinary(16) DEFAULT NULL COMMENT 'binary network address',
  `router_network` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `delegated_address` (`delegated_network_bin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipv6_pool_networks_address`
--

LOCK TABLES `ipv6_pool_networks_address` WRITE;
/*!40000 ALTER TABLE `ipv6_pool_networks_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipv6_pool_networks_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipv6_pool_networks_exclude`
--

DROP TABLE IF EXISTS `ipv6_pool_networks_exclude`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipv6_pool_networks_exclude` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'exclude id',
  `network_id` int NOT NULL COMMENT 'exclude network id',
  `network` varchar(35) NOT NULL COMMENT 'network address',
  `prefix` smallint NOT NULL COMMENT 'network prefix',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipv6_pool_networks_exclude`
--

LOCK TABLES `ipv6_pool_networks_exclude` WRITE;
/*!40000 ALTER TABLE `ipv6_pool_networks_exclude` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipv6_pool_networks_exclude` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipv6_users`
--

DROP TABLE IF EXISTS `ipv6_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipv6_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL COMMENT 'user uid',
  `address_id` int NOT NULL COMMENT 'ipv6 address id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  UNIQUE KEY `address_id` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipv6_users`
--

LOCK TABLES `ipv6_users` WRITE;
/*!40000 ALTER TABLE `ipv6_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipv6_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lanes`
--

DROP TABLE IF EXISTS `lanes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lanes` (
  `laneid` int unsigned NOT NULL AUTO_INCREMENT,
  `lane` char(64) NOT NULL DEFAULT '',
  `settlementid` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`laneid`),
  UNIQUE KEY `id-lane` (`laneid`,`lane`),
  KEY `lane` (`lane`),
  KEY `stateid` (`settlementid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=73;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lanes`
--

LOCK TABLES `lanes` WRITE;
/*!40000 ALTER TABLE `lanes` DISABLE KEYS */;
INSERT INTO `lanes` VALUES (1,'Lane 1',1),(2,'Lane 2',1);
/*!40000 ALTER TABLE `lanes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lanes_houses`
--

DROP TABLE IF EXISTS `lanes_houses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lanes_houses` (
  `houseid` int unsigned NOT NULL AUTO_INCREMENT,
  `laneid` int unsigned NOT NULL,
  `neighborhoodid` int unsigned NOT NULL DEFAULT '0',
  `house` char(32) NOT NULL DEFAULT '',
  `porches` int unsigned NOT NULL DEFAULT '4',
  `floors` int unsigned NOT NULL DEFAULT '5',
  `app_count_id` smallint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`houseid`),
  UNIQUE KEY `laneid-houseid` (`laneid`,`houseid`),
  KEY `lane-house` (`laneid`,`house`),
  KEY `laneid` (`laneid`),
  KEY `house` (`house`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=53;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lanes_houses`
--

LOCK TABLES `lanes_houses` WRITE;
/*!40000 ALTER TABLE `lanes_houses` DISABLE KEYS */;
INSERT INTO `lanes_houses` VALUES (1,1,0,'1',4,5,1),(2,1,0,'2',4,5,1),(3,1,0,'3',4,5,1);
/*!40000 ALTER TABLE `lanes_houses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lanes_houses_blocks`
--

DROP TABLE IF EXISTS `lanes_houses_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lanes_houses_blocks` (
  `houseblockid` int unsigned NOT NULL AUTO_INCREMENT,
  `houseblockname` varchar(36) NOT NULL,
  `housingid` int unsigned NOT NULL,
  PRIMARY KEY (`houseblockid`),
  KEY `hgid` (`housingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lanes_houses_blocks`
--

LOCK TABLES `lanes_houses_blocks` WRITE;
/*!40000 ALTER TABLE `lanes_houses_blocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `lanes_houses_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lanes_housings`
--

DROP TABLE IF EXISTS `lanes_housings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lanes_housings` (
  `housingid` int unsigned NOT NULL AUTO_INCREMENT,
  `housingname` varchar(36) NOT NULL,
  `houseid` int unsigned NOT NULL,
  PRIMARY KEY (`housingid`),
  KEY `hid` (`houseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lanes_housings`
--

LOCK TABLES `lanes_housings` WRITE;
/*!40000 ALTER TABLE `lanes_housings` DISABLE KEYS */;
/*!40000 ALTER TABLE `lanes_housings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lanes_neighborhoods`
--

DROP TABLE IF EXISTS `lanes_neighborhoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lanes_neighborhoods` (
  `neighborhoodid` int unsigned NOT NULL AUTO_INCREMENT,
  `neighborhoodname` varchar(36) NOT NULL DEFAULT '',
  `settlementid` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`neighborhoodid`),
  KEY `sat` (`settlementid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lanes_neighborhoods`
--

LOCK TABLES `lanes_neighborhoods` WRITE;
/*!40000 ALTER TABLE `lanes_neighborhoods` DISABLE KEYS */;
/*!40000 ALTER TABLE `lanes_neighborhoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lanes_settlements`
--

DROP TABLE IF EXISTS `lanes_settlements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lanes_settlements` (
  `settlementid` int unsigned NOT NULL AUTO_INCREMENT,
  `settlementname` varchar(36) NOT NULL DEFAULT '',
  PRIMARY KEY (`settlementid`),
  KEY `name` (`settlementname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lanes_settlements`
--

LOCK TABLES `lanes_settlements` WRITE;
/*!40000 ALTER TABLE `lanes_settlements` DISABLE KEYS */;
INSERT INTO `lanes_settlements` VALUES (1,'Default Settlement');
/*!40000 ALTER TABLE `lanes_settlements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `logid` int unsigned NOT NULL AUTO_INCREMENT,
  `stuffid` tinyint unsigned NOT NULL,
  `date` datetime NOT NULL,
  `logtypeid` int unsigned NOT NULL,
  `uid` bigint unsigned DEFAULT NULL,
  `gid` smallint unsigned DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `valuename` varchar(64) NOT NULL,
  `oldvalue` varchar(64) DEFAULT NULL,
  `newvalue` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`logid`),
  KEY `date` (`date`),
  KEY `gid` (`gid`),
  KEY `uid` (`uid`),
  KEY `logtypeid` (`logtypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=66;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,0,'2020-12-25 12:21:36',17,0,0,'192.168.1.184','gui_autologinbyip','','0'),(2,0,'2020-12-25 12:21:36',17,0,0,'192.168.1.184','gui_autologinbyframedip','','0'),(3,0,'2020-12-25 12:21:36',17,0,0,'192.168.1.184','gui_autologinbyonlineip','','0'),(4,0,'2020-12-25 12:21:40',17,0,0,'192.168.1.184','gui_autologinbyip','','0'),(5,0,'2020-12-25 12:21:40',17,0,0,'192.168.1.184','gui_autologinbyframedip','','0'),(6,0,'2020-12-25 12:21:40',17,0,0,'192.168.1.184','gui_autologinbyonlineip','','0');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs_auth_admin`
--

DROP TABLE IF EXISTS `logs_auth_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs_auth_admin` (
  `auth_id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `login` varchar(32) NOT NULL COMMENT 'логин',
  `stuffid` tinyint unsigned DEFAULT NULL COMMENT 'ID сотрудника',
  `auth_ip` int unsigned NOT NULL COMMENT 'IP авторизации',
  `auth_type` enum('check2fa','allow2fa','deny2fa','denied','allowed','session','') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Результат авторизации: вход запрещён/разрешён/сессионный',
  `auth_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs_auth_admin`
--

LOCK TABLES `logs_auth_admin` WRITE;
/*!40000 ALTER TABLE `logs_auth_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs_auth_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs_auth_cabinet`
--

DROP TABLE IF EXISTS `logs_auth_cabinet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs_auth_cabinet` (
  `auth_id` mediumint unsigned NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `login` varchar(32) NOT NULL COMMENT 'логин',
  `auth_ip` int unsigned NOT NULL COMMENT 'IP авторизации',
  `auth_type` enum('denied','allowed','session','') NOT NULL COMMENT 'Результат авторизации: вход запрещён/разрешён/сессионный',
  `auth_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=106;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs_auth_cabinet`
--

LOCK TABLES `logs_auth_cabinet` WRITE;
/*!40000 ALTER TABLE `logs_auth_cabinet` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs_auth_cabinet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs_extra`
--

DROP TABLE IF EXISTS `logs_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs_extra` (
  `logid` int NOT NULL,
  `object_id` int NOT NULL DEFAULT '0',
  `message` varchar(128) CHARACTER SET koi8r COLLATE koi8r_general_ci DEFAULT NULL,
  `extra` blob,
  PRIMARY KEY (`logid`),
  KEY `object_id` (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs_extra`
--

LOCK TABLES `logs_extra` WRITE;
/*!40000 ALTER TABLE `logs_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logtype`
--

DROP TABLE IF EXISTS `logtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logtype` (
  `logtypeid` smallint unsigned NOT NULL AUTO_INCREMENT,
  `logtype` char(32) NOT NULL,
  PRIMARY KEY (`logtypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=35;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logtype`
--

LOCK TABLES `logtype` WRITE;
/*!40000 ALTER TABLE `logtype` DISABLE KEYS */;
INSERT INTO `logtype` VALUES (1,'LOGTYPE_ABONENT'),(2,'LOGTYPE_TARIF'),(3,'LOGTYPE_CARDS'),(4,'LOGTYPE_PRODUCTS'),(5,'LOGTYPE_OPTIONS'),(6,'LOGTYPE_WHITELISTSRV'),(7,'LOGTYPE_NAS'),(8,'LOGTYPE_ACTIONS'),(9,'LOGTYPE_HANDBOOK'),(10,'LOGTYPE_EMAIL'),(11,'LOGTYPE_STUFF'),(12,'LOGTYPE_REPORTS'),(13,'LOGTYPE_CONSOLE'),(14,'LOGTYPE_PROTECTION'),(15,'LOGTYPE_HACKING'),(16,'LOGTYPE_USERDEVICES'),(17,'LOGTYPE_CABINET'),(18,'LOGTYPE_FINANCE'),(19,'LOGTYPE_DEVICES'),(20,'LOGTYPE_DEVICETYPES'),(21,'LOGTYPE_MBPCONSTRUCTOR'),(22,'LOGTYPE_TICKET'),(23,'LOGTYPE_IPV6_Pool'),(24,'LOGTYPE_IPV6_Network'),(25,'LOGTYPE_IPV6_Address'),(26,'LOGTYPE_IPV6_Exclude'),(27,'LOGTYPE_IPV6_Users'),(28,'LOGTYPE_USERDEVTYPES'),(29,'LOGTYPE_PAY_API'),(30,'LOGTYPE_CABINET_NEWS'),(31,'LOGTYPE_DOCSIS'),(32,'LOGTYPE_PENDING_CHANGES'),(33,'LOGTYPE_CABINET_CONFIG'),(34,'LOGTYPE_GEOGRAPHY_SETTLEMENT'),(35,'LOGTYPE_GEOGRAPHY_NEIGHBORHOOD'),(36,'LOGTYPE_GEOGRAPHY_LANE'),(37,'LOGTYPE_GEOGRAPHY_HOUSE'),(38,'LOGTYPE_SUBSCRIPTIONS'),(39,'LOGTYPE_TIMECREDIT'),(40,'LOGTYPE_STICKYNOTES'),(41,'LOGTYPE_USERSNOTES'),(42,'LOGTYPE_SECTOR'),(43,'LOGTYPE_STUFFDOLGNOST'),(44,'LOGTYPE_STUFFKOEF'),(45,'LOGTYPE_STUFFROLE'),(46,'LOGTYPE_USERSGROUPS'),(47,'LOGTYPE_CARDS_ACTIVE'),(48,'LOGTYPE_CARDS_PAY'),(49,'LOGTYPE_CARDS_RESELLER'),(50,'LOGTYPE_PARTNERS'),(51,'LOGTYPE_TICKET_CATEGORY'),(52,'LOGTYPE_USERS_CUSTOM_KEY'),(53,'LOGTYPE_BONUS_PARROT'),(54,'LOGTYPE_BONUS_SHOP'),(55,'LOGTYPE_DOCS_TEMPLATE'),(56,'LOGTYPE_BASE_STATION'),(57,'LOGTYPE_CONNECTION_TEMPLATE'),(58,'LOGTYPE_CONNECTION_TYPE'),(59,'LOGTYPE_SNMP_TEMPLATE'),(60,'LOGTYPE_SNMP_COMMANDS'),(61,'LOGTYPE_REAL_IP'),(62,'LOGTYPE_IP_POOL'),(63,'LOGTYPE_DEV_PACKETS'),(64,'LOGTYPE_SENDER_TEMPLATE'),(65,'LOGTYPE_SENDER_CONDITION'),(66,'LOGTYPE_SENDER_GATEWAYS');
/*!40000 ALTER TABLE `logtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `macdb`
--

DROP TABLE IF EXISTS `macdb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `macdb` (
  `macid` bigint unsigned NOT NULL AUTO_INCREMENT,
  `macint` bigint unsigned NOT NULL,
  PRIMARY KEY (`macid`),
  KEY `mac INT` (`macint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='mac database';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `macdb`
--

LOCK TABLES `macdb` WRITE;
/*!40000 ALTER TABLE `macdb` DISABLE KEYS */;
/*!40000 ALTER TABLE `macdb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_criterions`
--

DROP TABLE IF EXISTS `map_criterions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `map_criterions` (
  `criterionid` int unsigned NOT NULL AUTO_INCREMENT,
  `criterionname` varchar(250) NOT NULL,
  `mapid` int unsigned NOT NULL,
  PRIMARY KEY (`criterionid`),
  KEY `id` (`mapid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_criterions`
--

LOCK TABLES `map_criterions` WRITE;
/*!40000 ALTER TABLE `map_criterions` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_criterions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_maps`
--

DROP TABLE IF EXISTS `map_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `map_maps` (
  `mapid` int unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int unsigned NOT NULL DEFAULT '0',
  `stuffid` int unsigned NOT NULL,
  `mapname` varchar(36) NOT NULL,
  `width` int unsigned NOT NULL DEFAULT '1000',
  `height` int unsigned NOT NULL DEFAULT '1000',
  `px` int unsigned NOT NULL DEFAULT '1',
  `m` int unsigned NOT NULL DEFAULT '1',
  `background_visible` tinyint unsigned NOT NULL DEFAULT '0',
  `background_grayscale` tinyint(1) NOT NULL DEFAULT '0',
  `background_alpha` int unsigned NOT NULL DEFAULT '50',
  `background_x` int NOT NULL DEFAULT '0',
  `background_y` int NOT NULL DEFAULT '0',
  `background_scale` int unsigned NOT NULL DEFAULT '100',
  `google_map_visible` tinyint(1) NOT NULL DEFAULT '0',
  `google_map_grayscale` tinyint(1) NOT NULL DEFAULT '0',
  `google_map_alpha` int NOT NULL DEFAULT '100',
  `google_map_type` tinyint(1) NOT NULL DEFAULT '2',
  `google_map_longitude_a` int NOT NULL DEFAULT '0',
  `google_map_longitude_b` int NOT NULL DEFAULT '0',
  `google_map_longitude_c` int NOT NULL DEFAULT '0',
  `google_map_longitude_d` int NOT NULL DEFAULT '0',
  `google_map_latitude_a` int NOT NULL DEFAULT '0',
  `google_map_latitude_b` int NOT NULL DEFAULT '0',
  `google_map_latitude_c` int NOT NULL DEFAULT '0',
  `google_map_latitude_d` int NOT NULL DEFAULT '0',
  `google_map_scale` float NOT NULL DEFAULT '0',
  `grid_visible` tinyint unsigned NOT NULL DEFAULT '1',
  `grid_alpha` int unsigned NOT NULL DEFAULT '50',
  `grid_width` int unsigned NOT NULL DEFAULT '100',
  `grid_height` int unsigned NOT NULL DEFAULT '100',
  `grid_show_center` tinyint unsigned NOT NULL DEFAULT '1',
  `grid_color` varchar(8) NOT NULL DEFAULT '0x6495ED',
  `objects_layer_x` int NOT NULL DEFAULT '0',
  `objects_layer_y` int NOT NULL DEFAULT '0',
  `houses_visible` tinyint unsigned NOT NULL DEFAULT '1',
  `houses_labels_visible` tinyint unsigned NOT NULL DEFAULT '1',
  `houses_labels_name_visible` tinyint unsigned NOT NULL DEFAULT '1',
  `houses_labels_online_visible` tinyint unsigned NOT NULL DEFAULT '1',
  `houses_alpha` int unsigned NOT NULL DEFAULT '100',
  `lines_visible` tinyint unsigned NOT NULL DEFAULT '1',
  `lines_alpha` int unsigned NOT NULL DEFAULT '100',
  `cables_visible` tinyint unsigned NOT NULL DEFAULT '1',
  `cables_alpha` int unsigned NOT NULL DEFAULT '100',
  `devices_visible` tinyint unsigned NOT NULL DEFAULT '1',
  `devices_labels_visible` tinyint(1) NOT NULL DEFAULT '1',
  `devices_alpha` int unsigned NOT NULL DEFAULT '100',
  `wifis_visible` tinyint unsigned NOT NULL DEFAULT '1',
  `wifis_labels_visible` tinyint(1) NOT NULL DEFAULT '1',
  `wifis_cover_visible` tinyint unsigned NOT NULL DEFAULT '0',
  `wifis_alpha` int unsigned NOT NULL DEFAULT '100',
  `serial` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`mapid`),
  KEY `stuff` (`stuffid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_maps`
--

LOCK TABLES `map_maps` WRITE;
/*!40000 ALTER TABLE `map_maps` DISABLE KEYS */;
INSERT INTO `map_maps` VALUES (1,0,1,'asdasd+',0,0,1,1,0,0,50,0,0,100,0,0,100,2,0,0,0,0,0,0,0,0,1,1,50,0,0,1,'6591981',0,0,1,1,1,1,100,1,100,1,100,1,1,100,1,1,0,100,'2013-07-19 16:00:22');
/*!40000 ALTER TABLE `map_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_maps_criterions`
--

DROP TABLE IF EXISTS `map_maps_criterions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `map_maps_criterions` (
  `mapcriterionid` int unsigned NOT NULL AUTO_INCREMENT,
  `mapid` int unsigned NOT NULL,
  `criterionid` int unsigned NOT NULL,
  PRIMARY KEY (`mapcriterionid`),
  KEY `cr` (`criterionid`),
  KEY `id` (`mapid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_maps_criterions`
--

LOCK TABLES `map_maps_criterions` WRITE;
/*!40000 ALTER TABLE `map_maps_criterions` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_maps_criterions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_maps_permissions`
--

DROP TABLE IF EXISTS `map_maps_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `map_maps_permissions` (
  `mappermissionid` int unsigned NOT NULL AUTO_INCREMENT,
  `permissionid` int unsigned NOT NULL,
  `mapid` int unsigned NOT NULL,
  `stuffid` int unsigned NOT NULL,
  `issued` int unsigned NOT NULL,
  PRIMARY KEY (`mappermissionid`),
  KEY `id` (`mapid`),
  KEY `stuff` (`stuffid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_maps_permissions`
--

LOCK TABLES `map_maps_permissions` WRITE;
/*!40000 ALTER TABLE `map_maps_permissions` DISABLE KEYS */;
INSERT INTO `map_maps_permissions` VALUES (1,1,1,1,1),(2,2,1,1,1);
/*!40000 ALTER TABLE `map_maps_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_objects`
--

DROP TABLE IF EXISTS `map_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `map_objects` (
  `objectid` int unsigned NOT NULL AUTO_INCREMENT,
  `mapid` int unsigned NOT NULL,
  `typeid` tinyint unsigned NOT NULL,
  `x` int NOT NULL,
  `y` int NOT NULL,
  `objectname` varchar(32) NOT NULL,
  `description` varchar(256) NOT NULL,
  `serial` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`objectid`),
  KEY `map` (`mapid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_objects`
--

LOCK TABLES `map_objects` WRITE;
/*!40000 ALTER TABLE `map_objects` DISABLE KEYS */;
INSERT INTO `map_objects` VALUES (1,1,2,-359,-288,'','','2013-07-19 15:52:33'),(2,1,2,-233,-207,'','','2013-07-19 15:52:43'),(3,1,2,-122,-261,'','','2013-07-19 15:52:53'),(4,1,2,-86,-259,'','','2013-07-19 15:53:03'),(5,1,2,10,-258,'','','2013-07-19 15:53:18'),(6,1,2,-233,-119,'','','2013-07-19 15:53:31'),(7,1,2,-145,-57,'','','2013-07-19 15:53:40'),(8,1,2,-18,-115,'','','2013-07-19 15:55:23'),(9,1,2,69,-34,'','','2013-07-19 15:55:31');
/*!40000 ALTER TABLE `map_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_objects_cables`
--

DROP TABLE IF EXISTS `map_objects_cables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `map_objects_cables` (
  `objectcableid` int unsigned NOT NULL AUTO_INCREMENT,
  `objectid` int unsigned NOT NULL,
  PRIMARY KEY (`objectcableid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_objects_cables`
--

LOCK TABLES `map_objects_cables` WRITE;
/*!40000 ALTER TABLE `map_objects_cables` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_objects_cables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_objects_criterions`
--

DROP TABLE IF EXISTS `map_objects_criterions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `map_objects_criterions` (
  `objectcriterionid` int unsigned NOT NULL AUTO_INCREMENT,
  `objectid` int unsigned NOT NULL,
  `criterionid` int unsigned NOT NULL,
  PRIMARY KEY (`objectcriterionid`),
  KEY `obj` (`objectid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_objects_criterions`
--

LOCK TABLES `map_objects_criterions` WRITE;
/*!40000 ALTER TABLE `map_objects_criterions` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_objects_criterions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_objects_devices`
--

DROP TABLE IF EXISTS `map_objects_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `map_objects_devices` (
  `objectdeviceid` int unsigned NOT NULL AUTO_INCREMENT,
  `swid` int unsigned NOT NULL DEFAULT '0',
  `objectid` int unsigned NOT NULL DEFAULT '0',
  `label_x` int NOT NULL DEFAULT '0',
  `label_y` int NOT NULL DEFAULT '0',
  `icontype` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`objectdeviceid`),
  KEY `obj` (`objectid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_objects_devices`
--

LOCK TABLES `map_objects_devices` WRITE;
/*!40000 ALTER TABLE `map_objects_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_objects_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_objects_houses`
--

DROP TABLE IF EXISTS `map_objects_houses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `map_objects_houses` (
  `objecthouseid` int unsigned NOT NULL AUTO_INCREMENT,
  `houseid` int unsigned NOT NULL DEFAULT '0',
  `objectid` int unsigned NOT NULL,
  `label_x` int NOT NULL DEFAULT '0',
  `label_y` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`objecthouseid`),
  KEY `obj` (`objectid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_objects_houses`
--

LOCK TABLES `map_objects_houses` WRITE;
/*!40000 ALTER TABLE `map_objects_houses` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_objects_houses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_objects_lines`
--

DROP TABLE IF EXISTS `map_objects_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `map_objects_lines` (
  `objectlineid` int unsigned NOT NULL AUTO_INCREMENT,
  `objectid` int unsigned NOT NULL,
  PRIMARY KEY (`objectlineid`),
  KEY `obj` (`objectid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_objects_lines`
--

LOCK TABLES `map_objects_lines` WRITE;
/*!40000 ALTER TABLE `map_objects_lines` DISABLE KEYS */;
INSERT INTO `map_objects_lines` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9);
/*!40000 ALTER TABLE `map_objects_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_objects_types`
--

DROP TABLE IF EXISTS `map_objects_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `map_objects_types` (
  `typeid` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `typename` varchar(36) NOT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=20;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_objects_types`
--

LOCK TABLES `map_objects_types` WRITE;
/*!40000 ALTER TABLE `map_objects_types` DISABLE KEYS */;
INSERT INTO `map_objects_types` VALUES (1,'house'),(2,'line'),(3,'cable');
/*!40000 ALTER TABLE `map_objects_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_objects_wifis`
--

DROP TABLE IF EXISTS `map_objects_wifis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `map_objects_wifis` (
  `objectwifiid` int unsigned NOT NULL AUTO_INCREMENT,
  `objectid` int NOT NULL,
  `label_x` int NOT NULL DEFAULT '0',
  `label_y` int NOT NULL DEFAULT '0',
  `cover_radius` int NOT NULL DEFAULT '300',
  `cover_degree` int NOT NULL DEFAULT '45',
  `cover_rotation` int NOT NULL DEFAULT '0',
  `cover_color` varchar(8) NOT NULL DEFAULT '0x0000FF',
  `icon_size` int NOT NULL DEFAULT '100',
  `icon_color` varchar(8) NOT NULL DEFAULT '0x000000',
  PRIMARY KEY (`objectwifiid`),
  KEY `obj` (`objectid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_objects_wifis`
--

LOCK TABLES `map_objects_wifis` WRITE;
/*!40000 ALTER TABLE `map_objects_wifis` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_objects_wifis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `map_online`
--

DROP TABLE IF EXISTS `map_online`;
/*!50001 DROP VIEW IF EXISTS `map_online`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `map_online` AS SELECT 
 1 AS `radacctid`,
 1 AS `acctsessionid`,
 1 AS `acctuniqueid`,
 1 AS `username`,
 1 AS `uid`,
 1 AS `gid`,
 1 AS `nasipaddress`,
 1 AS `nasportid`,
 1 AS `acctstarttime`,
 1 AS `acctstoptime`,
 1 AS `acctsessiontime`,
 1 AS `acctinputoctets`,
 1 AS `acctoutputoctets`,
 1 AS `calledstationid`,
 1 AS `callingstationid`,
 1 AS `acctterminatecause`,
 1 AS `framedipaddress`,
 1 AS `last_change`,
 1 AS `before_billing`,
 1 AS `billing_minus`,
 1 AS `app`,
 1 AS `swid`,
 1 AS `switchport`,
 1 AS `houseid`,
 1 AS `user_speed_in`,
 1 AS `user_speed_out`,
 1 AS `use_radius_shaper`,
 1 AS `tarif_speed_in`,
 1 AS `tarif_speed_out`,
 1 AS `tarif_shaper_prio`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `map_permissions_types`
--

DROP TABLE IF EXISTS `map_permissions_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `map_permissions_types` (
  `permissionid` int unsigned NOT NULL AUTO_INCREMENT,
  `permissionname` varchar(45) NOT NULL,
  PRIMARY KEY (`permissionid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=20;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_permissions_types`
--

LOCK TABLES `map_permissions_types` WRITE;
/*!40000 ALTER TABLE `map_permissions_types` DISABLE KEYS */;
INSERT INTO `map_permissions_types` VALUES (1,'map_view'),(2,'map_edit');
/*!40000 ALTER TABLE `map_permissions_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_points`
--

DROP TABLE IF EXISTS `map_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `map_points` (
  `pointid` int unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int unsigned NOT NULL,
  `objectid` int unsigned NOT NULL,
  `x` int NOT NULL,
  `y` int NOT NULL,
  `serial` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pointid`),
  KEY `obj` (`objectid`),
  KEY `parent` (`parentid`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_points`
--

LOCK TABLES `map_points` WRITE;
/*!40000 ALTER TABLE `map_points` DISABLE KEYS */;
INSERT INTO `map_points` VALUES (1,2,1,0,0,'2013-07-19 15:52:34'),(2,3,1,32,41,'2013-07-19 15:52:34'),(3,4,1,67,4,'2013-07-19 15:52:34'),(4,0,1,6,85,'2013-07-19 15:52:34'),(5,6,2,0,0,'2013-07-19 15:52:43'),(6,7,2,1,-57,'2013-07-19 15:52:43'),(7,8,2,22,-30,'2013-07-19 15:52:43'),(8,9,2,47,-55,'2013-07-19 15:52:43'),(9,0,2,45,0,'2013-07-19 15:52:43'),(10,11,3,0,0,'2013-07-19 15:52:53'),(11,12,3,-35,-2,'2013-07-19 15:52:53'),(12,13,3,-34,24,'2013-07-19 15:52:53'),(13,14,3,-6,26,'2013-07-19 15:52:53'),(14,15,3,-35,30,'2013-07-19 15:52:53'),(15,16,3,-35,48,'2013-07-19 15:52:53'),(16,0,3,-6,50,'2013-07-19 15:52:53'),(17,18,4,0,0,'2013-07-19 15:53:03'),(18,19,4,-4,56,'2013-07-19 15:53:03'),(19,20,4,1,24,'2013-07-19 15:53:03'),(20,21,4,23,26,'2013-07-19 15:53:03'),(21,22,4,27,-4,'2013-07-19 15:53:03'),(22,0,4,25,51,'2013-07-19 15:53:03'),(23,24,5,-5,50,'2013-07-19 15:53:22'),(24,25,5,3,-3,'2013-07-19 15:53:18'),(25,26,5,-22,-4,'2013-07-19 15:53:19'),(26,27,5,-27,16,'2013-07-19 15:53:19'),(27,28,5,-8,22,'2013-07-19 15:53:19'),(28,0,5,-30,47,'2013-07-19 15:53:19'),(29,30,6,0,0,'2013-07-19 15:53:31'),(30,31,6,-4,67,'2013-07-19 15:53:32'),(31,32,6,-2,29,'2013-07-19 15:53:32'),(32,33,6,34,31,'2013-07-19 15:53:32'),(33,34,6,36,-6,'2013-07-19 15:53:32'),(34,0,6,30,59,'2013-07-19 15:53:32'),(35,36,7,0,0,'2013-07-19 15:53:40'),(36,37,7,5,-68,'2013-07-19 15:53:40'),(37,38,7,62,-64,'2013-07-19 15:53:40'),(38,39,7,55,12,'2013-07-19 15:53:40'),(39,0,7,6,3,'2013-07-19 15:53:40'),(40,41,8,0,0,'2013-07-19 15:55:23'),(41,42,8,-9,64,'2013-07-19 15:55:23'),(42,43,8,4,-1,'2013-07-19 15:55:23'),(43,44,8,34,1,'2013-07-19 15:55:24'),(44,45,8,37,22,'2013-07-19 15:55:24'),(45,0,8,-3,26,'2013-07-19 15:55:24'),(46,47,9,0,0,'2013-07-19 15:55:31'),(47,48,9,1,-83,'2013-07-19 15:55:31'),(48,49,9,26,-43,'2013-07-19 15:55:32'),(49,50,9,60,-83,'2013-07-19 15:55:32'),(50,0,9,53,-1,'2013-07-19 15:55:32');
/*!40000 ALTER TABLE `map_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `mb_view_tickets_messages`
--

DROP TABLE IF EXISTS `mb_view_tickets_messages`;
/*!50001 DROP VIEW IF EXISTS `mb_view_tickets_messages`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mb_view_tickets_messages` AS SELECT 
 1 AS `messageid`,
 1 AS `date`,
 1 AS `ticketid`,
 1 AS `stuffid`,
 1 AS `stuff_fio`,
 1 AS `useruid`,
 1 AS `user_fio`,
 1 AS `message`,
 1 AS `unread`,
 1 AS `statustypename`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mbp_devices`
--

DROP TABLE IF EXISTS `mbp_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mbp_devices` (
  `deviceid` int NOT NULL AUTO_INCREMENT,
  `swid` int DEFAULT NULL,
  `update_date` int DEFAULT NULL,
  PRIMARY KEY (`deviceid`),
  KEY `swid` (`swid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mbp_devices`
--

LOCK TABLES `mbp_devices` WRITE;
/*!40000 ALTER TABLE `mbp_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `mbp_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mbp_devices_interface`
--

DROP TABLE IF EXISTS `mbp_devices_interface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mbp_devices_interface` (
  `id` int NOT NULL AUTO_INCREMENT,
  `deviceid` int NOT NULL,
  `interface_index` int NOT NULL,
  `update_date` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mbp_devices_interface`
--

LOCK TABLES `mbp_devices_interface` WRITE;
/*!40000 ALTER TABLE `mbp_devices_interface` DISABLE KEYS */;
/*!40000 ALTER TABLE `mbp_devices_interface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mbp_devices_interface_proper`
--

DROP TABLE IF EXISTS `mbp_devices_interface_proper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mbp_devices_interface_proper` (
  `id` int NOT NULL AUTO_INCREMENT,
  `interface_id` int NOT NULL,
  `key` varchar(128) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `interface_id_key` (`interface_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mbp_devices_interface_proper`
--

LOCK TABLES `mbp_devices_interface_proper` WRITE;
/*!40000 ALTER TABLE `mbp_devices_interface_proper` DISABLE KEYS */;
/*!40000 ALTER TABLE `mbp_devices_interface_proper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mbp_devices_onut`
--

DROP TABLE IF EXISTS `mbp_devices_onut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mbp_devices_onut` (
  `id` int NOT NULL AUTO_INCREMENT,
  `deviceid` int NOT NULL,
  `onut_index` varchar(255) NOT NULL,
  `onut_mac` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `update_date` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `onut_mac` (`onut_mac`),
  KEY `deviceid` (`deviceid`),
  KEY `deviceid_index` (`deviceid`,`onut_index`),
  KEY `deviceid_mac` (`deviceid`,`onut_mac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mbp_devices_onut`
--

LOCK TABLES `mbp_devices_onut` WRITE;
/*!40000 ALTER TABLE `mbp_devices_onut` DISABLE KEYS */;
/*!40000 ALTER TABLE `mbp_devices_onut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mbp_devices_onut_customers`
--

DROP TABLE IF EXISTS `mbp_devices_onut_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mbp_devices_onut_customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `deviceid` int NOT NULL,
  `onut_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mbp_devices_onut_customers`
--

LOCK TABLES `mbp_devices_onut_customers` WRITE;
/*!40000 ALTER TABLE `mbp_devices_onut_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mbp_devices_onut_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mbp_devices_onut_proper`
--

DROP TABLE IF EXISTS `mbp_devices_onut_proper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mbp_devices_onut_proper` (
  `id` int NOT NULL AUTO_INCREMENT,
  `onut_id` int NOT NULL,
  `key` varchar(128) NOT NULL,
  `value` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `onut_id_key` (`onut_id`,`key`),
  KEY `onut_id` (`onut_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mbp_devices_onut_proper`
--

LOCK TABLES `mbp_devices_onut_proper` WRITE;
/*!40000 ALTER TABLE `mbp_devices_onut_proper` DISABLE KEYS */;
/*!40000 ALTER TABLE `mbp_devices_onut_proper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mbp_devices_proper`
--

DROP TABLE IF EXISTS `mbp_devices_proper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mbp_devices_proper` (
  `id` int NOT NULL AUTO_INCREMENT,
  `deviceid` int NOT NULL,
  `key` varchar(128) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `deviceid_key` (`deviceid`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mbp_devices_proper`
--

LOCK TABLES `mbp_devices_proper` WRITE;
/*!40000 ALTER TABLE `mbp_devices_proper` DISABLE KEYS */;
/*!40000 ALTER TABLE `mbp_devices_proper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migratenodeny`
--

DROP TABLE IF EXISTS `migratenodeny`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migratenodeny` (
  `ip` varchar(15) NOT NULL,
  `user` varchar(32) NOT NULL,
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `deposit` double(20,6) NOT NULL DEFAULT '0.000000',
  `credit` double(20,6) NOT NULL DEFAULT '0.000000',
  `gid` int unsigned NOT NULL,
  `packet` varchar(64) DEFAULT NULL,
  `contract_date` date DEFAULT NULL,
  `fio` varchar(128) DEFAULT NULL,
  `numdogovor` varchar(16) DEFAULT NULL,
  `adress` varchar(64) DEFAULT NULL,
  `mac` varchar(32) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `prim` varchar(254) NOT NULL,
  `phone` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migratenodeny`
--

LOCK TABLES `migratenodeny` WRITE;
/*!40000 ALTER TABLE `migratenodeny` DISABLE KEYS */;
/*!40000 ALTER TABLE `migratenodeny` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mod_camera_packets`
--

DROP TABLE IF EXISTS `mod_camera_packets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mod_camera_packets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `enabled` tinyint NOT NULL DEFAULT '0',
  `name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `description` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `devices` blob NOT NULL,
  `preset` int DEFAULT '0',
  `period` enum('d','m','a') NOT NULL DEFAULT 'd',
  `dev_condition` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_camera_packets`
--

LOCK TABLES `mod_camera_packets` WRITE;
/*!40000 ALTER TABLE `mod_camera_packets` DISABLE KEYS */;
/*!40000 ALTER TABLE `mod_camera_packets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mod_camera_presets`
--

DROP TABLE IF EXISTS `mod_camera_presets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mod_camera_presets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `middleware` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_camera_presets`
--

LOCK TABLES `mod_camera_presets` WRITE;
/*!40000 ALTER TABLE `mod_camera_presets` DISABLE KEYS */;
/*!40000 ALTER TABLE `mod_camera_presets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mod_camera_presets_options`
--

DROP TABLE IF EXISTS `mod_camera_presets_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mod_camera_presets_options` (
  `id` int NOT NULL,
  `key` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `value` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  UNIQUE KEY `uniq` (`id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_camera_presets_options`
--

LOCK TABLES `mod_camera_presets_options` WRITE;
/*!40000 ALTER TABLE `mod_camera_presets_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `mod_camera_presets_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mod_cards_act_cards`
--

DROP TABLE IF EXISTS `mod_cards_act_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mod_cards_act_cards` (
  `cardactid` int unsigned NOT NULL AUTO_INCREMENT,
  `serieid` int unsigned NOT NULL,
  `secret` char(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `resellerid` int unsigned NOT NULL DEFAULT '0',
  `status` enum('a','l','u') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'a',
  PRIMARY KEY (`cardactid`),
  UNIQUE KEY `secret` (`secret`),
  KEY `res` (`resellerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_cards_act_cards`
--

LOCK TABLES `mod_cards_act_cards` WRITE;
/*!40000 ALTER TABLE `mod_cards_act_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `mod_cards_act_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mod_cards_act_logs`
--

DROP TABLE IF EXISTS `mod_cards_act_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mod_cards_act_logs` (
  `cardsactid` int unsigned NOT NULL AUTO_INCREMENT,
  `serieid` int unsigned NOT NULL,
  `secret` char(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ip` char(16) DEFAULT NULL,
  `mac` char(22) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uid` bigint unsigned NOT NULL,
  `gid` smallint unsigned NOT NULL,
  `cardactid` int unsigned NOT NULL,
  PRIMARY KEY (`cardsactid`),
  KEY `time` (`timestamp`),
  KEY `uid` (`uid`),
  KEY `secret` (`secret`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_cards_act_logs`
--

LOCK TABLES `mod_cards_act_logs` WRITE;
/*!40000 ALTER TABLE `mod_cards_act_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mod_cards_act_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mod_cards_act_serie`
--

DROP TABLE IF EXISTS `mod_cards_act_serie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mod_cards_act_serie` (
  `serieid` int unsigned NOT NULL AUTO_INCREMENT,
  `serie` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `gid` smallint unsigned NOT NULL,
  `deposit` double(20,3) NOT NULL DEFAULT '0.000',
  `credit` double(20,3) NOT NULL DEFAULT '0.000',
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `expired` date NOT NULL DEFAULT '0000-00-00',
  `count` int unsigned NOT NULL,
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`serieid`),
  UNIQUE KEY `serie` (`serie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_cards_act_serie`
--

LOCK TABLES `mod_cards_act_serie` WRITE;
/*!40000 ALTER TABLE `mod_cards_act_serie` DISABLE KEYS */;
/*!40000 ALTER TABLE `mod_cards_act_serie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mod_cards_cards`
--

DROP TABLE IF EXISTS `mod_cards_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mod_cards_cards` (
  `cards_id` int unsigned NOT NULL AUTO_INCREMENT,
  `series` char(4) NOT NULL DEFAULT '0',
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nominal` double(8,2) NOT NULL DEFAULT '0.00',
  `expired` date NOT NULL DEFAULT '0000-00-00',
  `sn` char(20) NOT NULL DEFAULT '0',
  `resellerid` int unsigned NOT NULL DEFAULT '0',
  `status` enum('a','l','u') NOT NULL DEFAULT 'a',
  PRIMARY KEY (`cards_id`),
  KEY `series` (`sn`,`series`),
  KEY `status` (`status`),
  KEY `sn` (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_cards_cards`
--

LOCK TABLES `mod_cards_cards` WRITE;
/*!40000 ALTER TABLE `mod_cards_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `mod_cards_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mod_cards_errors`
--

DROP TABLE IF EXISTS `mod_cards_errors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mod_cards_errors` (
  `when` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `who` char(255) NOT NULL,
  `what` char(255) NOT NULL,
  `resellerid` int unsigned NOT NULL,
  KEY `who` (`who`),
  KEY `res` (`resellerid`),
  KEY `when` (`when`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_cards_errors`
--

LOCK TABLES `mod_cards_errors` WRITE;
/*!40000 ALTER TABLE `mod_cards_errors` DISABLE KEYS */;
/*!40000 ALTER TABLE `mod_cards_errors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mod_cards_params`
--

DROP TABLE IF EXISTS `mod_cards_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mod_cards_params` (
  `series` char(4) NOT NULL DEFAULT '',
  `sectorid` smallint NOT NULL DEFAULT '0',
  `bonus` double(20,6) DEFAULT NULL,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_cards_params`
--

LOCK TABLES `mod_cards_params` WRITE;
/*!40000 ALTER TABLE `mod_cards_params` DISABLE KEYS */;
/*!40000 ALTER TABLE `mod_cards_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mod_cards_resellers`
--

DROP TABLE IF EXISTS `mod_cards_resellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mod_cards_resellers` (
  `resellerid` int unsigned NOT NULL AUTO_INCREMENT,
  `resellername` varchar(32) NOT NULL,
  `strategytype` tinyint NOT NULL DEFAULT '0',
  `strategyvalue` double(20,6) NOT NULL DEFAULT '0.000000',
  `description` varchar(254) NOT NULL DEFAULT '',
  `archived` tinyint unsigned NOT NULL DEFAULT '0',
  `usersgroupid` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`resellerid`),
  KEY `usersgroupid` (`usersgroupid`),
  KEY `archived` (`archived`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_cards_resellers`
--

LOCK TABLES `mod_cards_resellers` WRITE;
/*!40000 ALTER TABLE `mod_cards_resellers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mod_cards_resellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mod_cards_resellers_strategy`
--

DROP TABLE IF EXISTS `mod_cards_resellers_strategy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mod_cards_resellers_strategy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cards_seria` char(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `cards_nominal` int NOT NULL DEFAULT '0',
  `cards_recived` int DEFAULT NULL,
  `reseller_id` int NOT NULL DEFAULT '0',
  `strategytype` tinyint DEFAULT NULL,
  `strategyvalue` decimal(20,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cards_seria` (`cards_seria`),
  KEY `reseller_id` (`reseller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_cards_resellers_strategy`
--

LOCK TABLES `mod_cards_resellers_strategy` WRITE;
/*!40000 ALTER TABLE `mod_cards_resellers_strategy` DISABLE KEYS */;
/*!40000 ALTER TABLE `mod_cards_resellers_strategy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mod_flussonic_cameras`
--

DROP TABLE IF EXISTS `mod_flussonic_cameras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mod_flussonic_cameras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `camera_id` varchar(128) DEFAULT NULL,
  `house_id` int DEFAULT '0',
  `entrance` int DEFAULT '0',
  `uid` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_flussonic_cameras`
--

LOCK TABLES `mod_flussonic_cameras` WRITE;
/*!40000 ALTER TABLE `mod_flussonic_cameras` DISABLE KEYS */;
/*!40000 ALTER TABLE `mod_flussonic_cameras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mod_forpost_profiles`
--

DROP TABLE IF EXISTS `mod_forpost_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mod_forpost_profiles` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id профиля',
  `profile_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `serviceid` int NOT NULL DEFAULT '0' COMMENT 'подписка',
  `block_user` tinyint NOT NULL DEFAULT '1' COMMENT 'блокировать юзера',
  `block_camera` tinyint NOT NULL DEFAULT '0' COMMENT 'блокировать камеры',
  `block_archive` tinyint NOT NULL DEFAULT '0' COMMENT 'блокировать архив',
  `change_pass` tinyint NOT NULL DEFAULT '0' COMMENT 'смена пароля при входе',
  `camera_online` tinyint NOT NULL DEFAULT '1' COMMENT 'просмотр онлайн',
  `camera_archive_view` tinyint NOT NULL DEFAULT '1' COMMENT 'просмотр архива',
  `camera_archive_save` tinyint NOT NULL DEFAULT '1' COMMENT 'загрузка архива',
  `camera_settings` tinyint NOT NULL DEFAULT '0' COMMENT 'доступ к настройкам',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_forpost_profiles`
--

LOCK TABLES `mod_forpost_profiles` WRITE;
/*!40000 ALTER TABLE `mod_forpost_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `mod_forpost_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mod_omnicell_bundles`
--

DROP TABLE IF EXISTS `mod_omnicell_bundles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mod_omnicell_bundles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `serviceid` int NOT NULL,
  `level1` tinyblob NOT NULL,
  `level2` tinyblob NOT NULL,
  `level3` tinyblob,
  `level4` tinyblob,
  `level5` tinyblob,
  `usersgroupid` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_omnicell_bundles`
--

LOCK TABLES `mod_omnicell_bundles` WRITE;
/*!40000 ALTER TABLE `mod_omnicell_bundles` DISABLE KEYS */;
/*!40000 ALTER TABLE `mod_omnicell_bundles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mod_omnicell_data`
--

DROP TABLE IF EXISTS `mod_omnicell_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mod_omnicell_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `serviceid` int NOT NULL,
  `main` tinyint NOT NULL DEFAULT '1',
  `uslid` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uslid` (`uslid`) USING BTREE,
  KEY `userid` (`userid`,`serviceid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_omnicell_data`
--

LOCK TABLES `mod_omnicell_data` WRITE;
/*!40000 ALTER TABLE `mod_omnicell_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mod_omnicell_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mod_omnicell_info`
--

DROP TABLE IF EXISTS `mod_omnicell_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mod_omnicell_info` (
  `phoneNumber` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `serviceid` int unsigned NOT NULL DEFAULT '0',
  `key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`phoneNumber`,`serviceid`,`key`) USING BTREE,
  KEY `Phone_Serviceid` (`phoneNumber`,`serviceid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_omnicell_info`
--

LOCK TABLES `mod_omnicell_info` WRITE;
/*!40000 ALTER TABLE `mod_omnicell_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `mod_omnicell_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mod_omnicell_packets`
--

DROP TABLE IF EXISTS `mod_omnicell_packets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mod_omnicell_packets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(254) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `level` tinyint NOT NULL,
  `usersgroupid` int NOT NULL DEFAULT '0',
  `enabled` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_omnicell_packets`
--

LOCK TABLES `mod_omnicell_packets` WRITE;
/*!40000 ALTER TABLE `mod_omnicell_packets` DISABLE KEYS */;
INSERT INTO `mod_omnicell_packets` VALUES (1,'O_MVNO_LEGO_2020_MF',1,0,1);
/*!40000 ALTER TABLE `mod_omnicell_packets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mod_omnicell_transactions`
--

DROP TABLE IF EXISTS `mod_omnicell_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mod_omnicell_transactions` (
  `transaction_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'ID транзакции',
  `uid` int NOT NULL DEFAULT '0' COMMENT 'ID абонента',
  `phone_number` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'номер телефона',
  `serviceid` int NOT NULL DEFAULT '0' COMMENT 'id подписки',
  `operation_name` varchar(64) DEFAULT NULL COMMENT 'название запроса',
  `request_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'время отправки запроса',
  `response_time` datetime DEFAULT NULL COMMENT 'время приёма ответа',
  `request_code` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'код запроса',
  `response_code` varchar(16) DEFAULT NULL COMMENT 'код ответа',
  `response_desc` varchar(254) DEFAULT NULL COMMENT 'описание из ответа',
  UNIQUE KEY `transaction_id` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_omnicell_transactions`
--

LOCK TABLES `mod_omnicell_transactions` WRITE;
/*!40000 ALTER TABLE `mod_omnicell_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mod_omnicell_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mod_omnicell_users`
--

DROP TABLE IF EXISTS `mod_omnicell_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mod_omnicell_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` int unsigned NOT NULL COMMENT 'users UID',
  `phoneNumber` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'users phoneNumber',
  `migrated_at` datetime DEFAULT NULL,
  `leaved_at` datetime DEFAULT NULL,
  `otp_send_attempts` tinyint DEFAULT '0',
  `otp_send_blocked` datetime DEFAULT NULL,
  `otp_enter_attempts` tinyint DEFAULT '0',
  `otp_enter_blocked` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `phoneNumber` (`phoneNumber`) USING BTREE,
  KEY `uid_serviceid` (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Users who transfer phone numbers to our service';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_omnicell_users`
--

LOCK TABLES `mod_omnicell_users` WRITE;
/*!40000 ALTER TABLE `mod_omnicell_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `mod_omnicell_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mod_reports`
--

DROP TABLE IF EXISTS `mod_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mod_reports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned NOT NULL,
  `status_id` smallint unsigned DEFAULT NULL COMMENT '1 - sleep  2-outflow  3-delete',
  `data` longtext,
  `date_start` datetime DEFAULT NULL,
  `date_stop` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `created_at` (`date_start`),
  KEY `date_stop` (`date_stop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_reports`
--

LOCK TABLES `mod_reports` WRITE;
/*!40000 ALTER TABLE `mod_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `mod_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mod_sms_template`
--

DROP TABLE IF EXISTS `mod_sms_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mod_sms_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `template` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_sms_template`
--

LOCK TABLES `mod_sms_template` WRITE;
/*!40000 ALTER TABLE `mod_sms_template` DISABLE KEYS */;
INSERT INTO `mod_sms_template` VALUES (1,'Пополнение счета (deposit)','Счет пополнен успешно. Ваш баланс %deposit% %currency%'),(2,'Пополнение счета (login, deposit)','Уважаемый абонент (login %login%) счет пополнен. Ваш баланс %deposit% %currency%'),(3,'Пополнение счета (pay_amount, deposit)','Ваш счет пополнен на сумму %pay_amount% %currency% Теперь ваш баланс составляет %deposit% %currency%'),(4,'Пополнение счета (dogovor, pay_amount, deposit)','Ув. абонент ( лиц счет №: %dogovor%). Ваш счет пополнен на %pay_amount% %currency% На вашем счете %deposit% %currency%'),(5,'Осталось дней. (left_day)','Уважаемый абонент, услуга Интернет будет отключена через %left_day%-дня. Пополните свой счет.'),(6,'Остался 1 день','Уважаемый абонент, услуга Интернет будет отключена через 1 день. Пополните свой счет.'),(7,'Услуга будет отключена через n-дней (dogovor, left_day)','Ув.абонент (лиц счет №: %dogovor%). Услуга интернет будет отключена через %left_day%-дня. Пополните свой счет'),(8,'Смена тарифа (old_packet, new_packet)','Тариф: \"%old_packet%\" успешно изменен на новый тариф: \"%new_packet%\".');
/*!40000 ALTER TABLE `mod_sms_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mod_trade_mobile_transactions`
--

DROP TABLE IF EXISTS `mod_trade_mobile_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mod_trade_mobile_transactions` (
  `mbtr_id` int unsigned NOT NULL AUTO_INCREMENT,
  `mob_tr_time` datetime NOT NULL,
  `vaucher` char(25) NOT NULL,
  `vaucher_price_in` double(20,6) unsigned DEFAULT NULL,
  `vaucher_price_out` double(20,6) unsigned DEFAULT NULL,
  `uid` bigint NOT NULL,
  `tpmv_id` tinyint unsigned NOT NULL,
  PRIMARY KEY (`mbtr_id`),
  UNIQUE KEY `vaucher` (`vaucher`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='transactions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_trade_mobile_transactions`
--

LOCK TABLES `mod_trade_mobile_transactions` WRITE;
/*!40000 ALTER TABLE `mod_trade_mobile_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mod_trade_mobile_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mod_trade_mobile_type`
--

DROP TABLE IF EXISTS `mod_trade_mobile_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mod_trade_mobile_type` (
  `tpmv_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name_type` char(128) DEFAULT NULL,
  UNIQUE KEY `tpmv_id` (`tpmv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='mobile vaucher types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_trade_mobile_type`
--

LOCK TABLES `mod_trade_mobile_type` WRITE;
/*!40000 ALTER TABLE `mod_trade_mobile_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `mod_trade_mobile_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mod_trade_mobile_vauchers`
--

DROP TABLE IF EXISTS `mod_trade_mobile_vauchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mod_trade_mobile_vauchers` (
  `vaucher` char(25) NOT NULL,
  `tpmv_id` smallint unsigned DEFAULT NULL,
  `vaucher_price_in` double(20,6) NOT NULL,
  `vaucher_price_out` double(20,6) NOT NULL,
  UNIQUE KEY `vaucher` (`vaucher`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='mobile vauchers table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_trade_mobile_vauchers`
--

LOCK TABLES `mod_trade_mobile_vauchers` WRITE;
/*!40000 ALTER TABLE `mod_trade_mobile_vauchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mod_trade_mobile_vauchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mod_trueip_objects`
--

DROP TABLE IF EXISTS `mod_trueip_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mod_trueip_objects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `houseid` int DEFAULT NULL,
  `unique_id` varchar(128) DEFAULT NULL,
  `token` varchar(128) NOT NULL,
  `sip_server_address` varchar(128) DEFAULT NULL,
  `sip_server_port` int DEFAULT NULL,
  `concierge_sip_number` varchar(128) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`unique_id`),
  KEY `houseid` (`houseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_trueip_objects`
--

LOCK TABLES `mod_trueip_objects` WRITE;
/*!40000 ALTER TABLE `mod_trueip_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `mod_trueip_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mod_trueip_panels`
--

DROP TABLE IF EXISTS `mod_trueip_panels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mod_trueip_panels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `login` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `ip_address` varchar(128) DEFAULT NULL,
  `rtsp_port` int DEFAULT NULL,
  `dtmf_1` varchar(128) DEFAULT NULL,
  `dtmf_2` varchar(128) DEFAULT NULL,
  `houseid` int DEFAULT NULL,
  `porch` int DEFAULT NULL,
  `external` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `houseid` (`houseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mod_trueip_panels`
--

LOCK TABLES `mod_trueip_panels` WRITE;
/*!40000 ALTER TABLE `mod_trueip_panels` DISABLE KEYS */;
/*!40000 ALTER TABLE `mod_trueip_panels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nms_docsis_commands`
--

DROP TABLE IF EXISTS `nms_docsis_commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nms_docsis_commands` (
  `id` int NOT NULL,
  `command` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nms_docsis_commands`
--

LOCK TABLES `nms_docsis_commands` WRITE;
/*!40000 ALTER TABLE `nms_docsis_commands` DISABLE KEYS */;
INSERT INTO `nms_docsis_commands` VALUES (1,'CREATE_MODEM'),(2,'DELETE_MODEM'),(3,'BLOCK_MODEM'),(4,'UNBLOCK_MODEM'),(5,'CHANGE_PROFILE'),(6,'AUXILIARI'),(7,'BAN_MODEM');
/*!40000 ALTER TABLE `nms_docsis_commands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nms_docsis_queue`
--

DROP TABLE IF EXISTS `nms_docsis_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nms_docsis_queue` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id очереди',
  `uid` int NOT NULL COMMENT 'uid абонента',
  `devid` int NOT NULL COMMENT 'id устройства',
  `dev_mac` varchar(17) NOT NULL COMMENT 'MAC адрес оборудования',
  `gid` int NOT NULL COMMENT 'id тарифа',
  `command_id` smallint NOT NULL COMMENT 'id команды',
  `date` datetime NOT NULL COMMENT 'дата добавления/выполнения',
  `status` tinyint NOT NULL COMMENT 'статус очереди (-1 ошибка, 0 ждет выполнения, 1 в очереди, 2 выполнено)',
  PRIMARY KEY (`id`),
  KEY `gid` (`gid`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `status_by_date` (`date`,`status`) USING BTREE,
  KEY `commands` (`command_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nms_docsis_queue`
--

LOCK TABLES `nms_docsis_queue` WRITE;
/*!40000 ALTER TABLE `nms_docsis_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `nms_docsis_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notificationid` int unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(600) NOT NULL,
  `startdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `enddate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `numofrepeats` int NOT NULL DEFAULT '1',
  `showtime` int NOT NULL DEFAULT '20',
  `gidsids` varchar(32) NOT NULL,
  `active` tinyint unsigned NOT NULL,
  PRIMARY KEY (`notificationid`),
  KEY `act` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `onu_registration_data`
--

DROP TABLE IF EXISTS `onu_registration_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `onu_registration_data` (
  `uid` smallint NOT NULL,
  `keyid` smallint NOT NULL,
  `value` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  KEY `index` (`uid`,`keyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `onu_registration_data`
--

LOCK TABLES `onu_registration_data` WRITE;
/*!40000 ALTER TABLE `onu_registration_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `onu_registration_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `onu_registration_keys`
--

DROP TABLE IF EXISTS `onu_registration_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `onu_registration_keys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `onu_registration_keys`
--

LOCK TABLES `onu_registration_keys` WRITE;
/*!40000 ALTER TABLE `onu_registration_keys` DISABLE KEYS */;
INSERT INTO `onu_registration_keys` VALUES (1,'fio'),(2,'sattlementid'),(3,'laneid'),(4,'houseid'),(5,'apartment'),(6,'tele_number'),(7,'tele_sms'),(8,'email'),(9,'pass_seria'),(10,'pass_date'),(11,'pass_address'),(12,'pass_who_give'),(13,'inn'),(14,'devid'),(15,'serial'),(16,'tarif_cost'),(17,'speed'),(18,'work_cost'),(19,'add_dop_opor_count'),(20,'add_dop_opor_price'),(21,'real_ip'),(22,'link_length_optical'),(23,'link_length_utp'),(24,'pon_box'),(25,'report_date'),(26,'packet'),(27,'address'),(28,'stuff'),(29,'groupname'),(30,'partner'),(31,'partnerid'),(32,'no key');
/*!40000 ALTER TABLE `onu_registration_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packets`
--

DROP TABLE IF EXISTS `packets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packets` (
  `num` int NOT NULL DEFAULT '0',
  `packet` char(128) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `prefix` char(4) NOT NULL DEFAULT '',
  `gid` smallint unsigned NOT NULL AUTO_INCREMENT,
  `tos` tinyint(1) NOT NULL DEFAULT '2',
  `do_with_tos` tinyint(1) NOT NULL DEFAULT '1',
  `direction` tinyint(1) NOT NULL DEFAULT '0',
  `fixed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 - не снимать; 1 - КД, если было подключение; 7 - ОКД (фикс.); 10 - ОКД (пропорц.); 8 - обязательно каждый месяц; 9 - обязательно каждый месяц, потратить сумму; 11 - обязательно каждый месяц, плавающая дата',
  `fixed_cost` double(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Цена тарифа',
  `fixed_cost2` double(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Минимальная сумма для активации интернета',
  `fixed_cost3` double(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Тип4, сколько снимать каждый день',
  `fixed_type4` tinyint NOT NULL DEFAULT '0' COMMENT 'Тип4, снимать пропорцеонально/фиксировано',
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  `simultaneous_use` smallint NOT NULL DEFAULT '1',
  `port_limit` smallint NOT NULL DEFAULT '1',
  `session_timeout` int unsigned NOT NULL DEFAULT '86400',
  `idle_timeout` int NOT NULL DEFAULT '30',
  `no_pass` tinyint(1) NOT NULL DEFAULT '0',
  `no_acct` tinyint(1) NOT NULL DEFAULT '0',
  `floor_traffic` tinyint(1) NOT NULL DEFAULT '0',
  `user_installed` smallint NOT NULL DEFAULT '0',
  `speed_rate` int unsigned NOT NULL DEFAULT '0',
  `speed_burst` int unsigned NOT NULL DEFAULT '0',
  `do_block` tinyint unsigned NOT NULL DEFAULT '0',
  `shaper_prio` tinyint unsigned NOT NULL DEFAULT '1',
  `real_ip` tinyint NOT NULL DEFAULT '0',
  `real_price` double(20,6) NOT NULL DEFAULT '0.000000',
  `real_pay_period` tinyint NOT NULL DEFAULT '0' COMMENT 'Период снятия: 0-день,1-месяц',
  `real_pay_on_connect` tinyint NOT NULL DEFAULT '0' COMMENT 'АП при подключении',
  `credit_procent` double(20,6) unsigned NOT NULL DEFAULT '0.000000',
  `mk_limit_sh` smallint unsigned NOT NULL DEFAULT '0',
  `mk_limit_sh_traf` int unsigned DEFAULT '0',
  `limit_shaper_do` tinyint unsigned NOT NULL DEFAULT '0',
  `limit_shaper_policy_on` tinyint NOT NULL DEFAULT '0',
  `limit_shaper_policy_name` varchar(128) NOT NULL DEFAULT '',
  `limit_start_gb` int unsigned NOT NULL DEFAULT '0',
  `limit_type` tinyint NOT NULL DEFAULT '3',
  `limit_speed_in` int unsigned NOT NULL DEFAULT '0',
  `limit_speed_out` int unsigned NOT NULL DEFAULT '0',
  `limit_speed_prio` tinyint unsigned NOT NULL DEFAULT '1',
  `do_shapers` tinyint NOT NULL DEFAULT '0',
  `do_mik_rad_shapers` tinyint NOT NULL DEFAULT '0',
  `shaper_def_policy_on` tinyint NOT NULL DEFAULT '0',
  `shaper_def_policy_name` varchar(128) NOT NULL DEFAULT '',
  `do_ippool` tinyint NOT NULL DEFAULT '0',
  `do_perevod_na_tarif` tinyint unsigned NOT NULL DEFAULT '0',
  `do_turbo` tinyint unsigned NOT NULL DEFAULT '0',
  `do_shapers_day_night` tinyint unsigned NOT NULL DEFAULT '0',
  `dop_do_interval2` tinyint unsigned NOT NULL DEFAULT '0',
  `dop_do_interval3` tinyint unsigned NOT NULL DEFAULT '0',
  `dop_interval1_time1` char(10) NOT NULL DEFAULT '0',
  `dop_interval1_time2` char(10) NOT NULL DEFAULT '0',
  `dop_interval1_speed_out` int unsigned NOT NULL DEFAULT '0',
  `dop_interval1_speed_in` int unsigned NOT NULL DEFAULT '0',
  `dop_interval1_prio` int unsigned NOT NULL DEFAULT '1',
  `dop_interval1_burst_limit_out` int unsigned NOT NULL DEFAULT '0',
  `dop_interval1_burst_limit_in` int unsigned NOT NULL DEFAULT '0',
  `dop_interval1_burst_threshold_out` int unsigned NOT NULL DEFAULT '0',
  `dop_interval1_burst_threshold_in` int unsigned NOT NULL DEFAULT '0',
  `dop_interval1_burst_time_out` int unsigned NOT NULL DEFAULT '0',
  `dop_interval1_burst_time_in` int unsigned NOT NULL DEFAULT '0',
  `dop_interval2_time1` char(10) NOT NULL DEFAULT '0',
  `dop_interval2_time2` char(10) NOT NULL DEFAULT '0',
  `dop_interval2_speed_out` int unsigned NOT NULL DEFAULT '0',
  `dop_interval2_speed_in` int unsigned NOT NULL DEFAULT '0',
  `dop_interval2_prio` int unsigned NOT NULL DEFAULT '1',
  `dop_interval2_burst_limit_out` int unsigned NOT NULL DEFAULT '0',
  `dop_interval2_burst_limit_in` int unsigned NOT NULL DEFAULT '0',
  `dop_interval2_burst_threshold_out` int unsigned NOT NULL DEFAULT '0',
  `dop_interval2_burst_threshold_in` int unsigned NOT NULL DEFAULT '0',
  `dop_interval2_burst_time_out` int unsigned NOT NULL DEFAULT '0',
  `dop_interval2_burst_time_in` int unsigned NOT NULL DEFAULT '0',
  `dop_interval3_time1` char(10) NOT NULL DEFAULT '0',
  `dop_interval3_time2` char(10) NOT NULL DEFAULT '0',
  `dop_interval3_speed_out` int unsigned NOT NULL DEFAULT '0',
  `dop_interval3_speed_in` int unsigned NOT NULL DEFAULT '0',
  `dop_interval3_prio` int unsigned NOT NULL DEFAULT '1',
  `dop_interval3_burst_limit_out` int unsigned NOT NULL DEFAULT '0',
  `dop_interval3_burst_limit_in` int unsigned NOT NULL DEFAULT '0',
  `dop_interval3_burst_threshold_out` int unsigned NOT NULL DEFAULT '0',
  `dop_interval3_burst_threshold_in` int unsigned NOT NULL DEFAULT '0',
  `dop_interval3_burst_time_out` int unsigned NOT NULL DEFAULT '0',
  `dop_interval3_burst_time_in` int unsigned NOT NULL DEFAULT '0',
  `do_perevod_akciya` tinyint unsigned NOT NULL DEFAULT '0',
  `do_perevod_akciya_cena` double(20,6) unsigned NOT NULL DEFAULT '0.000000',
  `acct_interval` int unsigned NOT NULL DEFAULT '300',
  `do_pipe_shapers` tinyint unsigned NOT NULL DEFAULT '0',
  `do_credit_vremen` tinyint unsigned NOT NULL DEFAULT '0',
  `do_credit_procent_vremen` tinyint unsigned NOT NULL DEFAULT '0',
  `use_cards` tinyint unsigned NOT NULL DEFAULT '0',
  `use_shop` tinyint unsigned NOT NULL DEFAULT '0',
  `use_perevod` tinyint unsigned NOT NULL DEFAULT '0',
  `use_change_pass` tinyint unsigned NOT NULL DEFAULT '0',
  `use_change_data` tinyint unsigned NOT NULL DEFAULT '1',
  `credit_active_cena` double(10,2) NOT NULL DEFAULT '0.00',
  `credit_procent_active_cena` double(10,2) NOT NULL DEFAULT '0.00',
  `turbo_active_cena` double(10,2) NOT NULL DEFAULT '0.00',
  `turbo_speed_in` int unsigned NOT NULL DEFAULT '0',
  `turbo_speed_out` int unsigned NOT NULL DEFAULT '0',
  `turbo_time` int unsigned NOT NULL DEFAULT '24',
  `speed_mik_treshold_in` int unsigned NOT NULL DEFAULT '0',
  `speed_mik_treshold_out` int unsigned NOT NULL DEFAULT '0',
  `speed_mik_burst_in` int unsigned NOT NULL DEFAULT '0',
  `speed_mik_burst_out` int unsigned NOT NULL DEFAULT '0',
  `speed_mik_limit_treshold_in` int unsigned NOT NULL DEFAULT '0',
  `speed_mik_limit_treshold_out` int unsigned NOT NULL DEFAULT '0',
  `speed_mik_limit_burst_in` int unsigned NOT NULL DEFAULT '0',
  `speed_mik_limit_burst_out` int unsigned NOT NULL DEFAULT '0',
  `zapret_uhoda_s_tarifa` tinyint unsigned NOT NULL DEFAULT '0',
  `kabinet_do_freeze` tinyint unsigned NOT NULL DEFAULT '0',
  `cena_freeze` double(20,2) NOT NULL DEFAULT '0.00',
  `cena_unfreeze` double(20,2) NOT NULL DEFAULT '0.00',
  `cena_sutok_freeze` double(20,2) NOT NULL DEFAULT '0.00',
  `freeze_do_return_abonolata` tinyint NOT NULL DEFAULT '0',
  `speed_mik_burst_time_in` int unsigned NOT NULL DEFAULT '0',
  `speed_mik_burst_time_out` int unsigned NOT NULL DEFAULT '0',
  `speed_mik_limit_burst_time_in` int unsigned NOT NULL DEFAULT '0',
  `speed_mik_limit_burst_time_out` int unsigned NOT NULL DEFAULT '0',
  `min_sutok_freeze` int unsigned NOT NULL DEFAULT '7',
  `cena_podklucheniya` double(20,2) NOT NULL DEFAULT '0.00',
  `cena_akt_otkl` double(20,2) NOT NULL DEFAULT '0.00',
  `cena_akt_del` double(20,2) NOT NULL DEFAULT '0.00',
  `enable_vkl_user` tinyint unsigned NOT NULL DEFAULT '1',
  `enable_create_user` tinyint unsigned NOT NULL DEFAULT '1',
  `dont_show_speed` tinyint unsigned NOT NULL DEFAULT '0',
  `use_drweb` tinyint unsigned NOT NULL DEFAULT '0',
  `freeze_do_ever` tinyint unsigned NOT NULL DEFAULT '0',
  `count_free_freeze` tinyint unsigned NOT NULL DEFAULT '0',
  `do_print_dogovor` tinyint unsigned NOT NULL DEFAULT '0',
  `world_shaper_do` tinyint unsigned NOT NULL DEFAULT '0',
  `world_speed_in` int NOT NULL DEFAULT '0',
  `world_speed_out` int NOT NULL DEFAULT '0',
  `world_speed_prio` int NOT NULL DEFAULT '1',
  `world_speed_burst_in` int NOT NULL DEFAULT '0',
  `world_speed_burst_out` int NOT NULL DEFAULT '0',
  `world_speed_treshold_in` int NOT NULL DEFAULT '0',
  `world_speed_treshold_out` int NOT NULL DEFAULT '0',
  `world_speed_burst_time_in` int NOT NULL DEFAULT '0',
  `world_speed_burst_time_out` int NOT NULL DEFAULT '0',
  `do_credit_vozvrat_aktiv_cena` tinyint unsigned NOT NULL DEFAULT '0',
  `do_fixed_credit` tinyint unsigned NOT NULL DEFAULT '0',
  `do_fixed_credit_summa` double(20,2) unsigned NOT NULL DEFAULT '0.00',
  `do_credit_swing_date` tinyint unsigned NOT NULL DEFAULT '0',
  `do_credit_swing_date_days` int unsigned NOT NULL DEFAULT '7',
  `numgroup` int unsigned NOT NULL DEFAULT '0',
  `do_block_local` tinyint unsigned NOT NULL DEFAULT '0',
  `mikrotik_addr_list` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `do_addrlist` tinyint unsigned NOT NULL DEFAULT '0',
  `do_acct_interval` tinyint unsigned NOT NULL DEFAULT '1',
  `do_simple_shapers_mikrotik` tinyint unsigned NOT NULL DEFAULT '0',
  `do_session_time_out` tinyint unsigned NOT NULL DEFAULT '0',
  `use_mik_ip_pool` tinyint unsigned NOT NULL DEFAULT '0',
  `framed_ip_pool` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `do_idle_timeout_out` tinyint unsigned NOT NULL DEFAULT '0',
  `kabinet_do_freeze_balanse_plus` tinyint unsigned NOT NULL DEFAULT '0',
  `use_cards_auto` tinyint unsigned NOT NULL DEFAULT '0',
  `use_cards_auto_date` tinyint unsigned NOT NULL DEFAULT '0',
  `real_ip_nolk` tinyint unsigned NOT NULL DEFAULT '0',
  `razresh_minus` double unsigned NOT NULL DEFAULT '0',
  `usersgroupid` smallint NOT NULL DEFAULT '0',
  `use_installments` tinyint NOT NULL DEFAULT '0',
  `installments_count` int NOT NULL DEFAULT '0',
  `do_recalculation` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`gid`),
  UNIQUE KEY `packet` (`packet`),
  KEY `num` (`num`),
  KEY `prefix` (`prefix`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=80;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packets`
--

LOCK TABLES `packets` WRITE;
/*!40000 ALTER TABLE `packets` DISABLE KEYS */;
INSERT INTO `packets` VALUES (0,'Tarif 1',NULL,'',1,2,1,0,0,0.000000,0.000000,0.000000,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0.000000,0,0,0.000000,0,0,0,0,'',0,3,0,0,1,0,0,0,'',0,0,0,0,0,0,'0','0',0,0,0,0,0,0,0,0,0,'0','0',0,0,0,0,0,0,0,0,0,'0','0',0,0,0,0,0,0,0,0,0,0,0.000000,300,0,0,0,0,0,0,0,0,0.00,0.00,0.00,0,0,24,0,0,0,0,0,0,0,0,0,0,0.00,0.00,0.00,0,0,0,0,0,7,0.00,0.00,0.00,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0.00,0,7,0,0,'',0,1,0,0,0,'',0,0,0,0,0,0,0,0,0,0),(0,'Tarif 2',NULL,'',2,2,1,0,0,0.000000,0.000000,0.000000,0,0,1,1,0,0,0,0,0,0,15000,15000,0,0,0,0.000000,0,0,0.000000,0,0,0,0,'',0,3,0,0,1,1,1,0,'',0,0,0,0,0,0,'0','0',0,0,0,0,0,0,0,0,0,'0','0',0,0,0,0,0,0,0,0,0,'0','0',0,0,0,0,0,0,0,0,0,0,0.000000,300,0,0,0,0,0,0,0,0,0.00,0.00,0.00,0,0,24,0,0,0,0,0,0,0,0,0,0,0.00,0.00,0.00,0,0,0,0,0,7,0.00,0.00,0.00,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0.00,0,7,0,0,'',0,1,0,0,0,'',0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `packets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packets_limits`
--

DROP TABLE IF EXISTS `packets_limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packets_limits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gid` int NOT NULL,
  `day1` blob,
  `day2` blob,
  `day3` blob,
  `day4` blob,
  `day5` blob,
  `day6` blob,
  `day7` blob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gid` (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Расписание учета лимит. трафика';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packets_limits`
--

LOCK TABLES `packets_limits` WRITE;
/*!40000 ALTER TABLE `packets_limits` DISABLE KEYS */;
/*!40000 ALTER TABLE `packets_limits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packets_rad_attr`
--

DROP TABLE IF EXISTS `packets_rad_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packets_rad_attr` (
  `gid` smallint unsigned NOT NULL,
  `key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  KEY `gid` (`gid`),
  KEY `gid-key` (`gid`,`key`),
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packets_rad_attr`
--

LOCK TABLES `packets_rad_attr` WRITE;
/*!40000 ALTER TABLE `packets_rad_attr` DISABLE KEYS */;
/*!40000 ALTER TABLE `packets_rad_attr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packetsnas`
--

DROP TABLE IF EXISTS `packetsnas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packetsnas` (
  `paknasid` int unsigned NOT NULL AUTO_INCREMENT,
  `gid` smallint unsigned NOT NULL,
  `nasid` int unsigned NOT NULL,
  PRIMARY KEY (`paknasid`),
  KEY `gid` (`gid`),
  KEY `nas-gid` (`gid`,`nasid`),
  KEY `nasid` (`nasid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packetsnas`
--

LOCK TABLES `packetsnas` WRITE;
/*!40000 ALTER TABLE `packetsnas` DISABLE KEYS */;
/*!40000 ALTER TABLE `packetsnas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferences`
--

DROP TABLE IF EXISTS `preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferences` (
  `preferenceid` int unsigned NOT NULL AUTO_INCREMENT,
  `preferencename` varchar(128) NOT NULL,
  `programid` int unsigned NOT NULL,
  `stuffid` int unsigned NOT NULL,
  `value` varchar(256) NOT NULL,
  PRIMARY KEY (`preferenceid`),
  KEY `idname` (`stuffid`,`preferencename`),
  KEY `stuff` (`stuffid`),
  KEY `spid` (`stuffid`,`preferenceid`)
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=62;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferences`
--

LOCK TABLES `preferences` WRITE;
/*!40000 ALTER TABLE `preferences` DISABLE KEYS */;
INSERT INTO `preferences` VALUES (155,'ClearPreferencesPopUpWindow_autoupdateBox_delay',4,1,'1'),(156,'SubscribersReportWindow_autoupdateBox_delay',4,1,'1'),(157,'ReferencesWindow_2x_autoupdateBox_delay',4,1,'1'),(158,'PaymentsReportWindow_autoupdateBox_delay',4,1,'1'),(159,'SearchWindow_autoupdateBox_delay',4,1,'1'),(160,'OnlineWindow_autoupdateBox_delay',4,1,'1'),(161,'IdentificationWindow_autoupdateBox_delay',4,1,'1'),(168,'TariffsWindow_autoupdateBox_delay',4,1,'1'),(172,'SectorsReferencePopUpWindow_autoupdateBox_delay',4,1,'1'),(179,'DevicesReferencePopUpWindow_autoupdateBox_delay',4,1,'1'),(180,'ConfirmPopUpWindow_autoupdateBox_delay',4,1,'1'),(190,'IpPoolsListPopUpWindow_autoupdateBox_delay',4,1,'1'),(193,'IpPoolsReferencePopUpWindow_autoupdateBox_delay',4,1,'1'),(194,'ip_pools_list_window_align',4,1,'popUpWindowsBox'),(195,'AddIpsToIpPoolPopUpWindow_autoupdateBox_delay',4,1,'1'),(196,'system_options_pop_up_window_align',4,1,'popUpWindowsBox'),(197,'SystemOptionsPopUpWindow_autoupdateBox_delay',4,1,'1'),(203,'NasServersReferencePopUpWindow_autoupdateBox_delay',4,1,'1'),(211,'sectors_reference_pop_up_window_align',4,1,'popUpWindowsBox'),(213,'selected_index',4,1,'0'),(222,'nas_servers_reference_pop_up_window_align',4,1,'popUpWindowsBox'),(260,'GraphicsWindow_autoupdateBox_delay',4,1,'1'),(262,'EditTariffPopUpWindow_autoupdateBox_delay',4,1,'1'),(263,'auto_launch;SearchWindow',1,1,''),(265,'user_info_box_info_box_width',4,1,'370'),(266,'SearchWindow_SearchWindowFiltersBox_emptySearchCheckBox_selected',4,1,'0'),(267,'AccountPopUpWindow_33x_autoupdateBox_delay',4,1,'1');
/*!40000 ALTER TABLE `preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prices` (
  `gid` smallint unsigned NOT NULL DEFAULT '1',
  `week_day` tinyint(1) NOT NULL DEFAULT '0',
  `h0` double(8,6) NOT NULL DEFAULT '0.000000',
  `input0` double(8,6) NOT NULL DEFAULT '0.000000',
  `output0` double(8,6) NOT NULL DEFAULT '0.000000',
  `h1` double(8,6) NOT NULL DEFAULT '0.000000',
  `input1` double(8,6) NOT NULL DEFAULT '0.000000',
  `output1` double(8,6) NOT NULL DEFAULT '0.000000',
  `h2` double(8,6) NOT NULL DEFAULT '0.000000',
  `input2` double(8,6) NOT NULL DEFAULT '0.000000',
  `output2` double(8,6) NOT NULL DEFAULT '0.000000',
  `h3` double(8,6) NOT NULL DEFAULT '0.000000',
  `input3` double(8,6) NOT NULL DEFAULT '0.000000',
  `output3` double(8,6) NOT NULL DEFAULT '0.000000',
  `h4` double(8,6) NOT NULL DEFAULT '0.000000',
  `input4` double(8,6) NOT NULL DEFAULT '0.000000',
  `output4` double(8,6) NOT NULL DEFAULT '0.000000',
  `h5` double(8,6) NOT NULL DEFAULT '0.000000',
  `input5` double(8,6) NOT NULL DEFAULT '0.000000',
  `output5` double(8,6) NOT NULL DEFAULT '0.000000',
  `h6` double(8,6) NOT NULL DEFAULT '0.000000',
  `input6` double(8,6) NOT NULL DEFAULT '0.000000',
  `output6` double(8,6) NOT NULL DEFAULT '0.000000',
  `h7` double(8,6) NOT NULL DEFAULT '0.000000',
  `input7` double(8,6) NOT NULL DEFAULT '0.000000',
  `output7` double(8,6) NOT NULL DEFAULT '0.000000',
  `h8` double(8,6) NOT NULL DEFAULT '0.000000',
  `input8` double(8,6) NOT NULL DEFAULT '0.000000',
  `output8` double(8,6) NOT NULL DEFAULT '0.000000',
  `h9` double(8,6) NOT NULL DEFAULT '0.000000',
  `input9` double(8,6) NOT NULL DEFAULT '0.000000',
  `output9` double(8,6) NOT NULL DEFAULT '0.000000',
  `h10` double(8,6) NOT NULL DEFAULT '0.000000',
  `input10` double(8,6) NOT NULL DEFAULT '0.000000',
  `output10` double(8,6) NOT NULL DEFAULT '0.000000',
  `h11` double(8,6) NOT NULL DEFAULT '0.000000',
  `input11` double(8,6) NOT NULL DEFAULT '0.000000',
  `output11` double(8,6) NOT NULL DEFAULT '0.000000',
  `h12` double(8,6) NOT NULL DEFAULT '0.000000',
  `input12` double(8,6) NOT NULL DEFAULT '0.000000',
  `output12` double(8,6) NOT NULL DEFAULT '0.000000',
  `h13` double(8,6) NOT NULL DEFAULT '0.000000',
  `input13` double(8,6) NOT NULL DEFAULT '0.000000',
  `output13` double(8,6) NOT NULL DEFAULT '0.000000',
  `h14` double(8,6) NOT NULL DEFAULT '0.000000',
  `input14` double(8,6) NOT NULL DEFAULT '0.000000',
  `output14` double(8,6) NOT NULL DEFAULT '0.000000',
  `h15` double(8,6) NOT NULL DEFAULT '0.000000',
  `input15` double(8,6) NOT NULL DEFAULT '0.000000',
  `output15` double(8,6) NOT NULL DEFAULT '0.000000',
  `h16` double(8,6) NOT NULL DEFAULT '0.000000',
  `input16` double(8,6) NOT NULL DEFAULT '0.000000',
  `output16` double(8,6) NOT NULL DEFAULT '0.000000',
  `h17` double(8,6) NOT NULL DEFAULT '0.000000',
  `input17` double(8,6) NOT NULL DEFAULT '0.000000',
  `output17` double(8,6) NOT NULL DEFAULT '0.000000',
  `h18` double(8,6) NOT NULL DEFAULT '0.000000',
  `input18` double(8,6) NOT NULL DEFAULT '0.000000',
  `output18` double(8,6) NOT NULL DEFAULT '0.000000',
  `h19` double(8,6) NOT NULL DEFAULT '0.000000',
  `input19` double(8,6) NOT NULL DEFAULT '0.000000',
  `output19` double(8,6) NOT NULL DEFAULT '0.000000',
  `h20` double(8,6) NOT NULL DEFAULT '0.000000',
  `input20` double(8,6) NOT NULL DEFAULT '0.000000',
  `output20` double(8,6) NOT NULL DEFAULT '0.000000',
  `h21` double(8,6) NOT NULL DEFAULT '0.000000',
  `input21` double(8,6) NOT NULL DEFAULT '0.000000',
  `output21` double(8,6) NOT NULL DEFAULT '0.000000',
  `h22` double(8,6) NOT NULL DEFAULT '0.000000',
  `input22` double(8,6) NOT NULL DEFAULT '0.000000',
  `output22` double(8,6) NOT NULL DEFAULT '0.000000',
  `h23` double(8,6) NOT NULL DEFAULT '0.000000',
  `input23` double(8,6) NOT NULL DEFAULT '0.000000',
  `output23` double(8,6) NOT NULL DEFAULT '0.000000',
  `floor` double NOT NULL DEFAULT '0',
  `floor_payments` double(8,6) NOT NULL DEFAULT '0.000000',
  KEY `gid` (`gid`),
  KEY `week` (`week_day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programs`
--

DROP TABLE IF EXISTS `programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programs` (
  `programid` int unsigned NOT NULL AUTO_INCREMENT,
  `programname` varchar(45) NOT NULL,
  `version` char(8) NOT NULL,
  `build` int NOT NULL,
  PRIMARY KEY (`programid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=33;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs`
--

LOCK TABLES `programs` WRITE;
/*!40000 ALTER TABLE `programs` DISABLE KEYS */;
INSERT INTO `programs` VALUES (2,'Billing Stat','2.01',71111),(3,'Billing Monitor','1.01',71111),(4,'Billing Ticket','1.0',71111),(6,'Billing Admin','2.7.24',141124);
/*!40000 ALTER TABLE `programs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `queue_active`
--

DROP TABLE IF EXISTS `queue_active`;
/*!50001 DROP VIEW IF EXISTS `queue_active`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `queue_active` AS SELECT 
 1 AS `m_id`,
 1 AS `mq_name`,
 1 AS `uid`,
 1 AS `m_created`,
 1 AS `m_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `queue_conax`
--

DROP TABLE IF EXISTS `queue_conax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue_conax` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL DEFAULT '0',
  `card_id` varchar(32) NOT NULL,
  `order_id` varchar(128) NOT NULL,
  `order_name` varchar(128) NOT NULL,
  `order_time` datetime DEFAULT NULL,
  `status_code` varchar(128) NOT NULL,
  `status_message` varchar(255) NOT NULL,
  `json_data` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `card_ud` (`card_id`),
  KEY `uid_cardid` (`uid`,`card_id`),
  KEY `status_code` (`status_code`),
  KEY `order_id` (`order_id`),
  KEY `order_date` (`order_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_conax`
--

LOCK TABLES `queue_conax` WRITE;
/*!40000 ALTER TABLE `queue_conax` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_conax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_messages`
--

DROP TABLE IF EXISTS `queue_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue_messages` (
  `m_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Simple rolling counter (no real use except to keep mySQL happy)',
  `mq_id` bigint NOT NULL DEFAULT '0' COMMENT 'The queue that this message is targeted',
  `m_msg` text NOT NULL COMMENT 'The message to the task processor in JSON format',
  `m_action` varchar(255) NOT NULL DEFAULT '' COMMENT 'дополнительный параметр сообщения',
  `m_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'When message was received',
  `m_log` text COMMENT 'Log of task (reserved for later)',
  `m_respond` varchar(128) DEFAULT NULL COMMENT 'url to poll on completion',
  `m_status` enum('new','open','done','closed','failed') NOT NULL DEFAULT 'new',
  `m_started` timestamp NULL DEFAULT NULL COMMENT 'When the task processor was last initiated',
  `m_reply` text COMMENT 'Task response in JSON format',
  `m_rc` int NOT NULL DEFAULT '0' COMMENT 'Consume return code',
  `m_completed` timestamp NULL DEFAULT NULL COMMENT 'When the task completed processing and returned',
  `m_errors` int NOT NULL DEFAULT '0' COMMENT 'The number of times this task entry has failed',
  `m_uuid` varchar(36) NOT NULL DEFAULT '' COMMENT 'Message uuid generated by the server for api access',
  PRIMARY KEY (`m_id`),
  UNIQUE KEY `m_uuid` (`m_uuid`),
  KEY `m_errors` (`m_errors`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_messages`
--

LOCK TABLES `queue_messages` WRITE;
/*!40000 ALTER TABLE `queue_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_messages_history`
--

DROP TABLE IF EXISTS `queue_messages_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue_messages_history` (
  `m_id` bigint NOT NULL AUTO_INCREMENT,
  `mq_id` bigint NOT NULL,
  `mq_name` varchar(36) NOT NULL,
  `m_msg` text NOT NULL,
  `m_created` timestamp NOT NULL,
  `m_completed` timestamp NOT NULL,
  `m_uuid` varchar(36) NOT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_messages_history`
--

LOCK TABLES `queue_messages_history` WRITE;
/*!40000 ALTER TABLE `queue_messages_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue_messages_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue_types`
--

DROP TABLE IF EXISTS `queue_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue_types` (
  `mq_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Internal message queue id',
  `mq_name` varchar(64) NOT NULL COMMENT 'The name used to access this queue programtically',
  `mq_type` enum('message','api','fork','intval','dataval') NOT NULL DEFAULT 'message' COMMENT 'What type of queue is this',
  `mq_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Note of when this Queue was initially written to (or created ''manually'')',
  `mq_timeout` int NOT NULL DEFAULT '30' COMMENT 'Retry timeout',
  `mq_maxerrors` int NOT NULL DEFAULT '5' COMMENT 'Maximum number of times to try a task before giving up',
  `mq_desc` text COMMENT 'Additional (optional) comments about this queue',
  `mq_respond` varchar(128) DEFAULT NULL COMMENT 'Optional url to send response information (overriden by m_respond)n/loop',
  `mq_intval` bigint DEFAULT NULL COMMENT 'Value for queue type intval (otherwise null)',
  `mq_data` text COMMENT 'Value for queue type dataval and fork with list of messages queues to write to (otherwise null)',
  PRIMARY KEY (`mq_id`),
  UNIQUE KEY `mq_name` (`mq_name`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue_types`
--

LOCK TABLES `queue_types` WRITE;
/*!40000 ALTER TABLE `queue_types` DISABLE KEYS */;
INSERT INTO `queue_types` VALUES (1,'userproperchange','message','2018-11-08 08:51:24',3000,1,NULL,NULL,2,NULL),(2,'kk','message','2018-11-16 19:58:05',3000,1,NULL,NULL,3,NULL),(3,'coapay','message','2018-11-30 11:08:11',3000,1,NULL,NULL,0,NULL),(4,'iptvadd','message','2018-12-19 09:59:18',3000,1,NULL,NULL,1,NULL),(5,'coablock','message','2019-02-07 19:57:02',3000,1,NULL,NULL,0,NULL),(6,'iptvdel','message','2019-02-07 19:58:07',3000,1,NULL,NULL,1,NULL),(7,'iptvglobalsuspended','message','2019-03-25 11:44:44',3000,1,NULL,NULL,1,NULL),(8,'call_mikbill_event','message','2019-04-02 15:02:19',3000,1,NULL,NULL,3,NULL),(9,'userchangepassword','message','2019-04-10 05:06:08',3000,1,NULL,NULL,2,NULL),(10,'userchangefio','message','2019-04-25 08:52:02',3000,1,NULL,NULL,2,NULL),(11,'coadevbill','message','2019-04-26 17:58:07',3000,1,NULL,NULL,0,NULL),(12,'iptvserviceportalchange','message','2019-05-02 08:23:17',3000,1,NULL,NULL,1,NULL),(13,'usdevportalchange','message','2019-05-21 08:49:05',3000,1,NULL,NULL,2,NULL),(14,'coaenable','message','2019-05-29 06:35:22',3000,1,NULL,NULL,0,NULL),(15,'iptvservicecategorychange','message','2019-07-16 07:26:57',3000,1,NULL,NULL,1,NULL),(16,'coafreeze','message','2019-07-16 10:08:07',3000,1,NULL,NULL,0,NULL),(17,'pod','message','2019-08-05 13:32:50',3000,1,NULL,NULL,3,NULL),(18,'iptvservicealiaschange','message','2019-08-08 12:38:06',3000,1,NULL,NULL,1,NULL),(19,'coachtarif','message','2019-08-22 04:31:38',3000,1,NULL,NULL,0,NULL),(20,'coabill','message','2019-08-26 11:32:01',3000,1,NULL,NULL,0,NULL),(21,'iptvservicetarifchange','message','2019-11-27 10:08:41',3000,1,NULL,NULL,1,NULL),(22,'komtet','message','2019-11-28 09:36:10',3000,1,NULL,NULL,3,NULL),(23,'nagrasyncsubs','message','2019-12-30 08:46:20',3000,1,NULL,NULL,1,NULL),(24,'userchangeemail','message','2020-01-15 11:45:37',3000,1,NULL,NULL,2,NULL),(25,'nagraaddmodule','message','2020-01-17 09:32:49',3000,1,NULL,NULL,1,NULL),(26,'nagrasyncpairing','message','2020-01-17 10:40:40',3000,1,NULL,NULL,1,NULL),(27,'iptvglobalenable','message','2020-01-20 11:22:51',3000,1,NULL,NULL,1,NULL),(28,'userchangedatebirth','message','2020-01-27 06:12:03',3000,1,NULL,NULL,2,NULL),(29,'userchangelogin','message','2020-06-09 08:53:28',3000,1,NULL,NULL,2,NULL),(30,'coapayment','message','2020-07-22 06:54:34',3000,1,NULL,NULL,0,NULL),(31,'iptvenable','message','2020-10-26 12:16:09',3000,1,NULL,NULL,1,NULL),(32,'iptvmultiadd','message','2020-11-19 13:58:19',3000,1,NULL,NULL,1,NULL),(33,'iptvmultidel','message','2020-11-19 14:04:37',3000,1,NULL,NULL,1,NULL),(34,'iptvdisable','message','2021-02-23 09:00:47',3000,1,NULL,NULL,1,NULL),(35,'drecryptaddcard','message','2021-04-13 11:27:56',3000,1,NULL,NULL,1,NULL),(36,'drecryptdelcard','message','2021-04-14 07:15:00',3000,1,NULL,NULL,1,NULL),(37,'drecryptchangecard','message','2021-04-14 07:15:00',3000,1,NULL,NULL,1,NULL),(38,'infocasmessage','message','2021-08-27 10:24:43',30,5,NULL,NULL,1,NULL),(39,'infocasmessageall','message','2021-09-10 06:50:12',3000,1,NULL,NULL,1,NULL),(40,'tarifchangespeed','message','2022-04-12 07:33:00',30,5,NULL,NULL,3,NULL),(41,'coarealip','message','2022-04-13 10:05:50',30,5,NULL,NULL,0,NULL),(42,'coaturboblock','message','2022-04-13 10:05:50',30,5,NULL,NULL,0,NULL),(43,'coaturbostart','message','2022-04-13 10:05:50',30,5,NULL,NULL,0,NULL),(44,'coafreezed','message','2022-04-13 10:05:50',30,5,NULL,NULL,0,NULL),(45,'coaunfreeze','message','2022-04-13 10:05:50',30,5,NULL,NULL,0,NULL),(46,'coaunfreezed','message','2022-04-13 10:05:50',30,5,NULL,NULL,0,NULL),(47,'coadisabled','message','2022-04-13 10:05:50',30,5,NULL,NULL,0,NULL),(48,'coadeleted','message','2022-04-13 10:05:50',30,5,NULL,NULL,0,NULL),(49,'coaunfreezedolg','message','2022-04-13 10:05:50',30,5,NULL,NULL,0,NULL),(50,'coauserup','message','2022-04-13 10:05:50',30,5,NULL,NULL,0,NULL),(51,'coacronblock','message','2022-04-13 10:05:50',30,5,NULL,NULL,0,NULL),(52,'caocreditnull','message','2022-04-13 10:05:50',30,5,NULL,NULL,0,NULL),(53,'caocreditpay','message','2022-04-13 10:05:50',30,5,NULL,NULL,0,NULL),(54,'kernelkick','message','2022-04-13 10:05:50',30,5,NULL,NULL,3,NULL),(55,'coamacreg','message','2022-04-13 10:05:50',30,5,NULL,NULL,0,NULL),(56,'coaspeed','message','2022-04-13 10:05:50',30,5,NULL,NULL,0,NULL),(57,'usdevdel','message','2022-04-13 10:05:50',30,5,NULL,NULL,2,NULL),(58,'usdevadd','message','2022-04-13 10:05:50',30,5,NULL,NULL,2,NULL),(59,'usdevchange','message','2022-04-13 10:05:50',30,5,NULL,NULL,2,NULL),(60,'iptvmultienable','message','2022-04-13 10:05:50',30,5,NULL,NULL,1,NULL),(61,'iptvmultidisable','message','2022-04-13 10:05:50',30,5,NULL,NULL,1,NULL),(62,'iptvgidadd','message','2022-04-13 10:05:50',30,5,NULL,NULL,1,NULL),(63,'iptvgiddel','message','2022-04-13 10:05:50',30,5,NULL,NULL,1,NULL),(64,'atol','message','2022-04-13 10:05:50',30,5,NULL,NULL,3,NULL),(65,'nagraaddcard','message','2022-04-13 10:05:50',30,5,NULL,NULL,1,NULL),(66,'nagrachangecard','message','2022-04-13 10:05:50',30,5,NULL,NULL,1,NULL),(67,'nagradelcard','message','2022-04-13 10:05:50',30,5,NULL,NULL,1,NULL),(68,'nagrachangemodule','message','2022-04-13 10:05:50',30,5,NULL,NULL,1,NULL),(69,'nagradelmodule','message','2022-04-13 10:05:50',30,5,NULL,NULL,1,NULL),(70,'mail','message','2022-04-13 10:05:50',30,5,NULL,NULL,3,NULL),(71,'mailingsms','message','2022-04-13 10:05:50',30,5,NULL,NULL,3,NULL),(72,'mailingemail','message','2022-04-13 10:05:50',30,5,NULL,NULL,3,NULL),(73,'mailingpost','message','2022-04-13 10:05:50',30,5,NULL,NULL,3,NULL),(74,'multisms','message','2022-04-13 10:05:50',30,5,NULL,NULL,3,NULL),(75,'trueipadddevice','message','2022-04-13 10:05:50',30,5,NULL,NULL,1,NULL),(76,'trueipchangedevice','message','2022-04-13 10:05:50',30,5,NULL,NULL,1,NULL),(77,'trueipdeldevice','message','2022-04-13 10:05:50',30,5,NULL,NULL,1,NULL),(78,'sendsms','message','2023-07-28 08:47:03',30,5,NULL,NULL,4,NULL),(79,'iptvupdate','message','2023-07-28 08:47:03',30,5,NULL,NULL,2,NULL),(80,'webkassa','message','2023-08-16 14:31:27',30,5,NULL,NULL,0,NULL),(81,'payed_packet_fee','message','2023-08-29 13:48:27',30,5,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `queue_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rad_limit_traffic`
--

DROP TABLE IF EXISTS `rad_limit_traffic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rad_limit_traffic` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `gid` int NOT NULL,
  `week_number` tinyint NOT NULL DEFAULT '0',
  `date_created` date DEFAULT NULL,
  `traffic_in` bigint NOT NULL DEFAULT '0',
  `traffic_out` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_gid` (`uid`,`gid`),
  KEY `uid_gid_week` (`uid`,`gid`,`week_number`),
  KEY `uid_gid_date` (`uid`,`gid`,`date_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rad_limit_traffic`
--

LOCK TABLES `rad_limit_traffic` WRITE;
/*!40000 ALTER TABLE `rad_limit_traffic` DISABLE KEYS */;
/*!40000 ALTER TABLE `rad_limit_traffic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radacct`
--

DROP TABLE IF EXISTS `radacct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `radacct` (
  `radacctid` bigint NOT NULL AUTO_INCREMENT,
  `acctsessionid` varchar(64) NOT NULL,
  `acctuniqueid` varchar(32) NOT NULL,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `uid` bigint unsigned DEFAULT NULL,
  `gid` smallint unsigned DEFAULT NULL,
  `nasipaddress` varchar(15) NOT NULL,
  `nasportid` varchar(15) DEFAULT NULL,
  `acctstarttime` datetime DEFAULT NULL,
  `acctstoptime` datetime DEFAULT NULL,
  `acctsessiontime` int DEFAULT NULL,
  `acctinputoctets` bigint DEFAULT NULL,
  `acctoutputoctets` bigint DEFAULT NULL,
  `calledstationid` varchar(50) NOT NULL,
  `callingstationid` varchar(50) NOT NULL,
  `acctterminatecause` varchar(32) NOT NULL,
  `framedipaddress` varchar(15) NOT NULL,
  `last_change` int unsigned NOT NULL DEFAULT '0',
  `before_billing` double(20,6) NOT NULL,
  `billing_minus` double(20,6) NOT NULL,
  PRIMARY KEY (`radacctid`),
  KEY `acctsessionid` (`acctsessionid`),
  KEY `acctstarttime` (`acctstarttime`),
  KEY `acctstoptime` (`acctstoptime`),
  KEY `acctuniqueid` (`acctuniqueid`),
  KEY `framedipaddress` (`framedipaddress`),
  KEY `framed-terminate` (`framedipaddress`,`acctterminatecause`),
  KEY `nasipaddress` (`nasipaddress`),
  KEY `ses-user-nas` (`acctsessionid`,`username`,`nasipaddress`),
  KEY `uid` (`uid`,`gid`),
  KEY `uniq-user-nas` (`acctuniqueid`,`username`,`nasipaddress`),
  KEY `user_uid` (`uid`),
  KEY `username` (`username`),
  KEY `user-start-time` (`username`,`acctstarttime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radacct`
--

LOCK TABLES `radacct` WRITE;
/*!40000 ALTER TABLE `radacct` DISABLE KEYS */;
/*!40000 ALTER TABLE `radacct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radacctbras`
--

DROP TABLE IF EXISTS `radacctbras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `radacctbras` (
  `radacctid` bigint NOT NULL AUTO_INCREMENT,
  `acctsessionid` varchar(64) NOT NULL,
  `acctuniqueid` varchar(32) NOT NULL,
  `username` varchar(32) CHARACTER SET koi8r COLLATE koi8r_bin NOT NULL,
  `uid` bigint unsigned NOT NULL DEFAULT '0',
  `devid` bigint NOT NULL DEFAULT '0',
  `gid` smallint unsigned NOT NULL DEFAULT '0',
  `nasipaddress` varchar(15) NOT NULL,
  `nasportid` varchar(15) DEFAULT NULL,
  `acctstarttime` datetime DEFAULT NULL,
  `acctstoptime` datetime DEFAULT NULL,
  `acctsessiontime` int DEFAULT NULL,
  `acctinputoctets` bigint DEFAULT NULL,
  `acctoutputoctets` bigint DEFAULT NULL,
  `calledstationid` varchar(50) NOT NULL,
  `callingstationid` varchar(50) NOT NULL,
  `acctterminatecause` varchar(32) NOT NULL,
  `framedipaddress` varchar(15) NOT NULL,
  `last_change` int unsigned NOT NULL DEFAULT '0',
  `before_billing` double(20,6) NOT NULL,
  `billing_minus` double(20,6) NOT NULL,
  PRIMARY KEY (`radacctid`),
  UNIQUE KEY `unique_session` (`acctsessionid`,`uid`,`devid`,`nasipaddress`,`nasportid`) USING HASH,
  UNIQUE KEY `find_session` (`acctsessionid`,`nasipaddress`,`framedipaddress`,`nasportid`) USING HASH,
  KEY `soft_close_user_sessions` (`uid`,`devid`),
  KEY `sort_radacctid` (`radacctid`),
  KEY `check_ip_is_used` (`framedipaddress`),
  KEY `sort_last_change` (`last_change`)
) ENGINE=MEMORY DEFAULT CHARSET=koi8r;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radacctbras`
--

LOCK TABLES `radacctbras` WRITE;
/*!40000 ALTER TABLE `radacctbras` DISABLE KEYS */;
/*!40000 ALTER TABLE `radacctbras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radacctmem`
--

DROP TABLE IF EXISTS `radacctmem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `radacctmem` (
  `acctsessionid` varchar(64) CHARACTER SET koi8r COLLATE koi8r_bin NOT NULL,
  `acctuniqueid` varchar(32) CHARACTER SET koi8r COLLATE koi8r_bin NOT NULL,
  `uid` bigint unsigned NOT NULL COMMENT 'UID абонента',
  `devid` bigint NOT NULL DEFAULT '0',
  `gid` int unsigned NOT NULL COMMENT 'тарифа в момент авторизации',
  `blocked` tinyint unsigned NOT NULL COMMENT 'Блокировка в момент авторизации',
  `deposit` double(20,6) NOT NULL COMMENT 'Баланс при авторизации',
  `credit` double(20,6) NOT NULL,
  `last_change` int unsigned NOT NULL COMMENT 'Последнее изменение',
  UNIQUE KEY `unique_session` (`acctsessionid`,`uid`,`devid`),
  KEY `delete_all_user_sessions` (`uid`,`devid`)
) ENGINE=MEMORY DEFAULT CHARSET=koi8r COMMENT='Вспомогательная таблица для raddact типа Memory';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radacctmem`
--

LOCK TABLES `radacctmem` WRITE;
/*!40000 ALTER TABLE `radacctmem` DISABLE KEYS */;
/*!40000 ALTER TABLE `radacctmem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radacctterminatecause`
--

DROP TABLE IF EXISTS `radacctterminatecause`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `radacctterminatecause` (
  `acctterminatecauseid` int unsigned NOT NULL AUTO_INCREMENT,
  `acctterminatecause` varchar(32) NOT NULL,
  PRIMARY KEY (`acctterminatecauseid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=1365;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radacctterminatecause`
--

LOCK TABLES `radacctterminatecause` WRITE;
/*!40000 ALTER TABLE `radacctterminatecause` DISABLE KEYS */;
INSERT INTO `radacctterminatecause` VALUES (1,'Online'),(2,'User-Request'),(3,'Admin-Reboot'),(4,'Admin-Reset'),(5,'BILL-Request'),(6,'User-Error'),(7,'Lost-Carrier'),(8,'Lost-Service'),(9,'NAS-Error'),(10,'NAS-Request'),(11,'Port-Error'),(12,'Service-Unavailable'),(13,'Double session stop');
/*!40000 ALTER TABLE `radacctterminatecause` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raddactnew`
--

DROP TABLE IF EXISTS `raddactnew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raddactnew` (
  `radacctid` bigint unsigned NOT NULL AUTO_INCREMENT,
  `acctsessionid` varchar(32) NOT NULL,
  `acctuniqueid` bigint NOT NULL,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `uid` int unsigned DEFAULT NULL,
  `gid` int unsigned DEFAULT NULL,
  `nasid` int unsigned NOT NULL,
  `nasportid` int unsigned NOT NULL,
  `acctstarttime` timestamp NULL DEFAULT NULL,
  `acctstoptime` timestamp NULL DEFAULT NULL,
  `acctsessiontime` int unsigned NOT NULL DEFAULT '0',
  `acctinputoctets` bigint unsigned NOT NULL DEFAULT '0',
  `acctoutputoctets` bigint unsigned NOT NULL DEFAULT '0',
  `calledstationid` varchar(16) NOT NULL,
  `callingstationid` varchar(17) NOT NULL,
  `acctterminatecauseid` int unsigned NOT NULL,
  `framedipaddress` int unsigned NOT NULL,
  `last_change` int unsigned NOT NULL DEFAULT '0',
  `before_billing` double(20,6) NOT NULL,
  `billing_minus` double(20,6) NOT NULL,
  PRIMARY KEY (`radacctid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raddactnew`
--

LOCK TABLES `raddactnew` WRITE;
/*!40000 ALTER TABLE `raddactnew` DISABLE KEYS */;
/*!40000 ALTER TABLE `raddactnew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radgroupcheck`
--

DROP TABLE IF EXISTS `radgroupcheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `radgroupcheck` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `groupname` char(64) NOT NULL,
  `attribute` char(64) NOT NULL,
  `op` char(2) NOT NULL DEFAULT '==',
  `value` char(253) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groupname` (`groupname`(32))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=388;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radgroupcheck`
--

LOCK TABLES `radgroupcheck` WRITE;
/*!40000 ALTER TABLE `radgroupcheck` DISABLE KEYS */;
INSERT INTO `radgroupcheck` VALUES (1,'system','Simultaneous-Use',':=','1');
/*!40000 ALTER TABLE `radgroupcheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radgroupreply`
--

DROP TABLE IF EXISTS `radgroupreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `radgroupreply` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `groupname` char(64) NOT NULL,
  `attribute` char(64) NOT NULL,
  `op` char(2) NOT NULL DEFAULT ':=',
  `value` char(253) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groupname` (`groupname`(32))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=388;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radgroupreply`
--

LOCK TABLES `radgroupreply` WRITE;
/*!40000 ALTER TABLE `radgroupreply` DISABLE KEYS */;
INSERT INTO `radgroupreply` VALUES (1,'system','Framed-Protocol',':=','PPP'),(2,'system','Service-Type',':=','Framed-User'),(4,'system','Framed-Protocol',':=','PPP'),(5,'system','Framed-IP-Netmask',':=','255.255.255.255'),(6,'system','Port-Limit',':=','1'),(7,'system','Acct-Interim-Interval',':=','300'),(8,'system','Framed-Compression',':=','Van-Jacobson-TCP-IP'),(9,'system','Framed-MTU',':=','1500');
/*!40000 ALTER TABLE `radgroupreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radnas`
--

DROP TABLE IF EXISTS `radnas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `radnas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nasname` char(32) NOT NULL,
  `shortname` char(32) DEFAULT NULL,
  `type` char(30) DEFAULT 'other',
  `ports` int DEFAULT NULL,
  `secret` char(32) NOT NULL DEFAULT 'secret',
  `community` char(50) DEFAULT NULL,
  `description` char(200) DEFAULT 'RADIUS Client',
  `nastype` char(32) NOT NULL DEFAULT 'mikrotik',
  `shapertype` int NOT NULL DEFAULT '0',
  `impruport` char(5) DEFAULT '3799',
  `monitoring_nas_do` tinyint NOT NULL DEFAULT '1',
  `world_iface` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `country_iface` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `use_wolrd` tinyint NOT NULL DEFAULT '0',
  `use_country` tinyint NOT NULL DEFAULT '0',
  `naslogin` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `naspass` char(32) NOT NULL,
  `usessh` tinyint unsigned NOT NULL DEFAULT '1',
  `macaslogin` tinyint unsigned NOT NULL DEFAULT '0',
  `calleridauth` tinyint NOT NULL DEFAULT '0',
  `usepass` tinyint unsigned NOT NULL DEFAULT '1',
  `swid` int unsigned NOT NULL DEFAULT '0',
  `vlan_control_do` tinyint unsigned NOT NULL DEFAULT '0',
  `ipauth` tinyint unsigned NOT NULL DEFAULT '0',
  `mikver` tinyint unsigned NOT NULL DEFAULT '0',
  `houseid` int DEFAULT NULL,
  `housingid` int DEFAULT NULL,
  `houseblockid` int DEFAULT NULL,
  `porch` int DEFAULT NULL,
  `floor` int DEFAULT NULL,
  `app` varchar(8) DEFAULT NULL,
  `default_extra_auth` tinyint NOT NULL DEFAULT '1',
  `use_api` tinyint NOT NULL DEFAULT '0',
  `networks` varchar(256) DEFAULT NULL,
  `usersgroupid` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `nasname` (`nasname`),
  KEY `type` (`nastype`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=568;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radnas`
--

LOCK TABLES `radnas` WRITE;
/*!40000 ALTER TABLE `radnas` DISABLE KEYS */;
INSERT INTO `radnas` VALUES (1,'10.0.0.1','NAS 1','other',NULL,'secret',NULL,'Mikrotik 6x PPPoE example','mikrotik',4,'3799',0,'','',0,0,'','',0,0,0,1,0,0,0,2,NULL,NULL,NULL,NULL,NULL,NULL,1,0,NULL,0),(2,'10.0.1.1','NAS 2','other',NULL,'secret',NULL,'Mikrotik 6x HOTSPOT mac auth example','HotSpot',4,'3799',1,'','',0,0,'','',0,0,1,0,0,0,0,2,NULL,NULL,NULL,NULL,NULL,NULL,1,0,NULL,0);
/*!40000 ALTER TABLE `radnas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radnaslog`
--

DROP TABLE IF EXISTS `radnaslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `radnaslog` (
  `naslogid` bigint unsigned NOT NULL AUTO_INCREMENT,
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `nasipaddress` char(15) NOT NULL,
  `acctstatustype` varchar(32) NOT NULL,
  `nasIdentifier` varchar(64) NOT NULL,
  PRIMARY KEY (`naslogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radnaslog`
--

LOCK TABLES `radnaslog` WRITE;
/*!40000 ALTER TABLE `radnaslog` DISABLE KEYS */;
/*!40000 ALTER TABLE `radnaslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `radpostauth`
--

DROP TABLE IF EXISTS `radpostauth`;
/*!50001 DROP VIEW IF EXISTS `radpostauth`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `radpostauth` AS SELECT 
 1 AS `id`,
 1 AS `username`,
 1 AS `pass`,
 1 AS `packettype`,
 1 AS `replymessage`,
 1 AS `nasipaddress`,
 1 AS `nasportid`,
 1 AS `nasident`,
 1 AS `callingstationid`,
 1 AS `authdate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `radpostauthnew`
--

DROP TABLE IF EXISTS `radpostauthnew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `radpostauthnew` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` int unsigned NOT NULL,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `pass` varchar(32) NOT NULL,
  `packettypeid` int unsigned NOT NULL,
  `replymessageid` int unsigned NOT NULL,
  `nasid` int unsigned NOT NULL,
  `nasportid` int unsigned NOT NULL,
  `callingstationid` varchar(64) NOT NULL,
  `authdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `name` (`username`),
  KEY `namedate` (`username`,`authdate`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radpostauthnew`
--

LOCK TABLES `radpostauthnew` WRITE;
/*!40000 ALTER TABLE `radpostauthnew` DISABLE KEYS */;
/*!40000 ALTER TABLE `radpostauthnew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radpostauthpackettype`
--

DROP TABLE IF EXISTS `radpostauthpackettype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `radpostauthpackettype` (
  `packettypeid` int unsigned NOT NULL AUTO_INCREMENT,
  `packettype` varchar(64) NOT NULL,
  PRIMARY KEY (`packettypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=8192;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radpostauthpackettype`
--

LOCK TABLES `radpostauthpackettype` WRITE;
/*!40000 ALTER TABLE `radpostauthpackettype` DISABLE KEYS */;
INSERT INTO `radpostauthpackettype` VALUES (1,'Accept'),(2,'Reject'),(5,'Заморожен'),(10,'Отключен'),(11,'Удален');
/*!40000 ALTER TABLE `radpostauthpackettype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radpostauthreplymessage`
--

DROP TABLE IF EXISTS `radpostauthreplymessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `radpostauthreplymessage` (
  `replymessageid` int unsigned NOT NULL AUTO_INCREMENT,
  `replymessage` varchar(64) NOT NULL,
  PRIMARY KEY (`replymessageid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radpostauthreplymessage`
--

LOCK TABLES `radpostauthreplymessage` WRITE;
/*!40000 ALTER TABLE `radpostauthreplymessage` DISABLE KEYS */;
INSERT INTO `radpostauthreplymessage` VALUES (1,'Успех'),(2,'Несовпадение'),(3,'PAP Успешный вход'),(4,'PAP Неправильный пароль'),(5,'CHAP Успешный вход'),(6,'CHAP Неправильный пароль'),(7,'Интернет у него отключен'),(8,'В пул без денег'),(9,'У абонента отключена локальная сеть'),(10,'Не найден в базе данных вызывающий IP/MAC'),(11,'Пользователь в группе отключенных'),(12,'Пользователь в группе удаленных'),(13,'IP/MAC не совпадает с привязкой'),(14,'Нет средств и закончилися пул без денег'),(15,'У абонента недостаточно средств'),(16,'IP уже выдан другому пользователю'),(17,'IP не выдан'),(18,'результат неопределен'),(19,'Учетка уже в Online'),(20,'Дубликат IP в Pool'),(21,'IP не найден в пуле'),(22,'Учетная запись заблокирована'),(23,'Закончились деньги'),(24,'2й раз не пустим'),(25,'MSCHAP-v1 Успешный вход'),(26,'MSCHAP-v1 Неправильный пароль'),(27,'MSCHAP-v2 Успешный вход'),(28,'MSCHAP-v2 Неправильный пароль'),(29,'Выкинуть.Accel Пополнение счета.'),(30,'Пользователь в группе замороженных'),(31,'Пользователь в группе неизвестные'),(32,'пул для STB/ONU');
/*!40000 ALTER TABLE `radpostauthreplymessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_users_count`
--

DROP TABLE IF EXISTS `report_users_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_users_count` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` date DEFAULT NULL,
  `usersgroupid` int NOT NULL DEFAULT '0',
  `gid` int NOT NULL DEFAULT '0',
  `users_count` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `time_gid` (`create_time`,`gid`),
  KEY `time_usersgroupid` (`create_time`,`usersgroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_users_count`
--

LOCK TABLES `report_users_count` WRITE;
/*!40000 ALTER TABLE `report_users_count` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_users_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectors`
--

DROP TABLE IF EXISTS `sectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sectors` (
  `sectorid` smallint unsigned NOT NULL AUTO_INCREMENT,
  `sector` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `iface` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `classless_route` blob,
  `static_routes` blob,
  `mask` char(15) DEFAULT '255.255.255.0',
  `subnet` char(15) DEFAULT '',
  `broadcast` char(15) DEFAULT '',
  `dns_serv` char(15) DEFAULT '',
  `wins_serv` char(15) DEFAULT '',
  `netbios_dd_serv` char(15) DEFAULT '',
  `routers` char(15) DEFAULT '',
  `dns_serv2` char(15) DEFAULT '',
  `time_serv` char(15) DEFAULT '',
  `dhcp_ranges` char(200) NOT NULL,
  `shared_network1` tinyint unsigned NOT NULL DEFAULT '0',
  `shared_network2` tinyint unsigned NOT NULL DEFAULT '0',
  `shared_network3` tinyint unsigned NOT NULL DEFAULT '0',
  `vlanid` int unsigned NOT NULL DEFAULT '1',
  `del_ip1` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `del_ip2` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `del_ip3` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `del_ip4` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `ip_unnumbered_mode` tinyint NOT NULL DEFAULT '0',
  UNIQUE KEY `sectorid` (`sectorid`),
  KEY `vlanid` (`vlanid`),
  KEY `sector` (`sector`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=168;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectors`
--

LOCK TABLES `sectors` WRITE;
/*!40000 ALTER TABLE `sectors` DISABLE KEYS */;
INSERT INTO `sectors` VALUES (1,'10.0.0.1','segment 1','','','255.255.255.0','10.0.0.0','10.0.0.255','10.0.0.1','','','10.0.0.1','10.0.0.2','','',0,0,0,1,'10.0.0.1','','10.0.0.2','',0),(2,'10.0.1.1','segment 2','','','255.255.255.0','10.0.1.0','10.0.1.255','10.0.1.1','','','10.0.1.1','8.8.8.8','','',0,0,0,1,'10.0.1.1','','','',0);
/*!40000 ALTER TABLE `sectors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectorspool`
--

DROP TABLE IF EXISTS `sectorspool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sectorspool` (
  `ip2long` bigint NOT NULL,
  `ip` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `sectorid` smallint unsigned NOT NULL,
  KEY `sectorid` (`sectorid`),
  KEY `sector-ip` (`sectorid`,`ip`),
  KEY `ip-text` (`ip`),
  KEY `select_delete` (`ip2long`,`sectorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AVG_ROW_LENGTH=26;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectorspool`
--

LOCK TABLES `sectorspool` WRITE;
/*!40000 ALTER TABLE `sectorspool` DISABLE KEYS */;
INSERT INTO `sectorspool` VALUES (167772163,'10.0.0.3',1),(167772164,'10.0.0.4',1),(167772165,'10.0.0.5',1),(167772166,'10.0.0.6',1),(167772167,'10.0.0.7',1),(167772168,'10.0.0.8',1),(167772169,'10.0.0.9',1),(167772170,'10.0.0.10',1),(167772171,'10.0.0.11',1),(167772172,'10.0.0.12',1),(167772173,'10.0.0.13',1),(167772174,'10.0.0.14',1),(167772175,'10.0.0.15',1),(167772176,'10.0.0.16',1),(167772177,'10.0.0.17',1),(167772178,'10.0.0.18',1),(167772179,'10.0.0.19',1),(167772180,'10.0.0.20',1),(167772181,'10.0.0.21',1),(167772182,'10.0.0.22',1),(167772183,'10.0.0.23',1),(167772184,'10.0.0.24',1),(167772185,'10.0.0.25',1),(167772186,'10.0.0.26',1),(167772187,'10.0.0.27',1),(167772188,'10.0.0.28',1),(167772189,'10.0.0.29',1),(167772190,'10.0.0.30',1),(167772191,'10.0.0.31',1),(167772192,'10.0.0.32',1),(167772193,'10.0.0.33',1),(167772194,'10.0.0.34',1),(167772195,'10.0.0.35',1),(167772196,'10.0.0.36',1),(167772197,'10.0.0.37',1),(167772198,'10.0.0.38',1),(167772199,'10.0.0.39',1),(167772200,'10.0.0.40',1),(167772201,'10.0.0.41',1),(167772202,'10.0.0.42',1),(167772203,'10.0.0.43',1),(167772204,'10.0.0.44',1),(167772205,'10.0.0.45',1),(167772206,'10.0.0.46',1),(167772207,'10.0.0.47',1),(167772208,'10.0.0.48',1),(167772209,'10.0.0.49',1),(167772210,'10.0.0.50',1),(167772211,'10.0.0.51',1),(167772212,'10.0.0.52',1),(167772213,'10.0.0.53',1),(167772214,'10.0.0.54',1),(167772215,'10.0.0.55',1),(167772216,'10.0.0.56',1),(167772217,'10.0.0.57',1),(167772218,'10.0.0.58',1),(167772219,'10.0.0.59',1),(167772220,'10.0.0.60',1),(167772221,'10.0.0.61',1),(167772222,'10.0.0.62',1),(167772223,'10.0.0.63',1),(167772224,'10.0.0.64',1),(167772225,'10.0.0.65',1),(167772226,'10.0.0.66',1),(167772227,'10.0.0.67',1),(167772228,'10.0.0.68',1),(167772229,'10.0.0.69',1),(167772230,'10.0.0.70',1),(167772231,'10.0.0.71',1),(167772232,'10.0.0.72',1),(167772233,'10.0.0.73',1),(167772234,'10.0.0.74',1),(167772235,'10.0.0.75',1),(167772236,'10.0.0.76',1),(167772237,'10.0.0.77',1),(167772238,'10.0.0.78',1),(167772239,'10.0.0.79',1),(167772240,'10.0.0.80',1),(167772241,'10.0.0.81',1),(167772242,'10.0.0.82',1),(167772243,'10.0.0.83',1),(167772244,'10.0.0.84',1),(167772245,'10.0.0.85',1),(167772246,'10.0.0.86',1),(167772247,'10.0.0.87',1),(167772248,'10.0.0.88',1),(167772249,'10.0.0.89',1),(167772250,'10.0.0.90',1),(167772251,'10.0.0.91',1),(167772252,'10.0.0.92',1),(167772253,'10.0.0.93',1),(167772254,'10.0.0.94',1),(167772255,'10.0.0.95',1),(167772256,'10.0.0.96',1),(167772257,'10.0.0.97',1),(167772258,'10.0.0.98',1),(167772259,'10.0.0.99',1),(167772260,'10.0.0.100',1),(167772261,'10.0.0.101',1),(167772262,'10.0.0.102',1),(167772263,'10.0.0.103',1),(167772264,'10.0.0.104',1),(167772265,'10.0.0.105',1),(167772266,'10.0.0.106',1),(167772267,'10.0.0.107',1),(167772268,'10.0.0.108',1),(167772269,'10.0.0.109',1),(167772270,'10.0.0.110',1),(167772271,'10.0.0.111',1),(167772272,'10.0.0.112',1),(167772273,'10.0.0.113',1),(167772274,'10.0.0.114',1),(167772275,'10.0.0.115',1),(167772276,'10.0.0.116',1),(167772277,'10.0.0.117',1),(167772278,'10.0.0.118',1),(167772279,'10.0.0.119',1),(167772280,'10.0.0.120',1),(167772281,'10.0.0.121',1),(167772282,'10.0.0.122',1),(167772283,'10.0.0.123',1),(167772284,'10.0.0.124',1),(167772285,'10.0.0.125',1),(167772286,'10.0.0.126',1),(167772287,'10.0.0.127',1),(167772288,'10.0.0.128',1),(167772289,'10.0.0.129',1),(167772290,'10.0.0.130',1),(167772291,'10.0.0.131',1),(167772292,'10.0.0.132',1),(167772293,'10.0.0.133',1),(167772294,'10.0.0.134',1),(167772295,'10.0.0.135',1),(167772296,'10.0.0.136',1),(167772297,'10.0.0.137',1),(167772298,'10.0.0.138',1),(167772299,'10.0.0.139',1),(167772300,'10.0.0.140',1),(167772301,'10.0.0.141',1),(167772302,'10.0.0.142',1),(167772303,'10.0.0.143',1),(167772304,'10.0.0.144',1),(167772305,'10.0.0.145',1),(167772306,'10.0.0.146',1),(167772307,'10.0.0.147',1),(167772308,'10.0.0.148',1),(167772309,'10.0.0.149',1),(167772310,'10.0.0.150',1),(167772311,'10.0.0.151',1),(167772312,'10.0.0.152',1),(167772313,'10.0.0.153',1),(167772314,'10.0.0.154',1),(167772315,'10.0.0.155',1),(167772316,'10.0.0.156',1),(167772317,'10.0.0.157',1),(167772318,'10.0.0.158',1),(167772319,'10.0.0.159',1),(167772320,'10.0.0.160',1),(167772321,'10.0.0.161',1),(167772322,'10.0.0.162',1),(167772323,'10.0.0.163',1),(167772324,'10.0.0.164',1),(167772325,'10.0.0.165',1),(167772326,'10.0.0.166',1),(167772327,'10.0.0.167',1),(167772328,'10.0.0.168',1),(167772329,'10.0.0.169',1),(167772330,'10.0.0.170',1),(167772331,'10.0.0.171',1),(167772332,'10.0.0.172',1),(167772333,'10.0.0.173',1),(167772334,'10.0.0.174',1),(167772335,'10.0.0.175',1),(167772336,'10.0.0.176',1),(167772337,'10.0.0.177',1),(167772338,'10.0.0.178',1),(167772339,'10.0.0.179',1),(167772340,'10.0.0.180',1),(167772341,'10.0.0.181',1),(167772342,'10.0.0.182',1),(167772343,'10.0.0.183',1),(167772344,'10.0.0.184',1),(167772345,'10.0.0.185',1),(167772346,'10.0.0.186',1),(167772347,'10.0.0.187',1),(167772348,'10.0.0.188',1),(167772349,'10.0.0.189',1),(167772350,'10.0.0.190',1),(167772351,'10.0.0.191',1),(167772352,'10.0.0.192',1),(167772353,'10.0.0.193',1),(167772354,'10.0.0.194',1),(167772355,'10.0.0.195',1),(167772356,'10.0.0.196',1),(167772357,'10.0.0.197',1),(167772358,'10.0.0.198',1),(167772359,'10.0.0.199',1),(167772360,'10.0.0.200',1),(167772361,'10.0.0.201',1),(167772362,'10.0.0.202',1),(167772363,'10.0.0.203',1),(167772364,'10.0.0.204',1),(167772365,'10.0.0.205',1),(167772366,'10.0.0.206',1),(167772367,'10.0.0.207',1),(167772368,'10.0.0.208',1),(167772369,'10.0.0.209',1),(167772370,'10.0.0.210',1),(167772371,'10.0.0.211',1),(167772372,'10.0.0.212',1),(167772373,'10.0.0.213',1),(167772374,'10.0.0.214',1),(167772375,'10.0.0.215',1),(167772376,'10.0.0.216',1),(167772377,'10.0.0.217',1),(167772378,'10.0.0.218',1),(167772379,'10.0.0.219',1),(167772380,'10.0.0.220',1),(167772381,'10.0.0.221',1),(167772382,'10.0.0.222',1),(167772383,'10.0.0.223',1),(167772384,'10.0.0.224',1),(167772385,'10.0.0.225',1),(167772386,'10.0.0.226',1),(167772387,'10.0.0.227',1),(167772388,'10.0.0.228',1),(167772389,'10.0.0.229',1),(167772390,'10.0.0.230',1),(167772391,'10.0.0.231',1),(167772392,'10.0.0.232',1),(167772393,'10.0.0.233',1),(167772394,'10.0.0.234',1),(167772395,'10.0.0.235',1),(167772396,'10.0.0.236',1),(167772397,'10.0.0.237',1),(167772398,'10.0.0.238',1),(167772399,'10.0.0.239',1),(167772400,'10.0.0.240',1),(167772401,'10.0.0.241',1),(167772402,'10.0.0.242',1),(167772403,'10.0.0.243',1),(167772404,'10.0.0.244',1),(167772405,'10.0.0.245',1),(167772406,'10.0.0.246',1),(167772407,'10.0.0.247',1),(167772408,'10.0.0.248',1),(167772409,'10.0.0.249',1),(167772410,'10.0.0.250',1),(167772411,'10.0.0.251',1),(167772412,'10.0.0.252',1),(167772413,'10.0.0.253',1),(167772414,'10.0.0.254',1),(167772419,'10.0.1.3',2),(167772420,'10.0.1.4',2),(167772421,'10.0.1.5',2),(167772422,'10.0.1.6',2),(167772423,'10.0.1.7',2),(167772424,'10.0.1.8',2),(167772425,'10.0.1.9',2),(167772426,'10.0.1.10',2),(167772427,'10.0.1.11',2),(167772428,'10.0.1.12',2),(167772429,'10.0.1.13',2),(167772430,'10.0.1.14',2),(167772431,'10.0.1.15',2),(167772432,'10.0.1.16',2),(167772433,'10.0.1.17',2),(167772434,'10.0.1.18',2),(167772435,'10.0.1.19',2),(167772436,'10.0.1.20',2),(167772437,'10.0.1.21',2),(167772438,'10.0.1.22',2),(167772439,'10.0.1.23',2),(167772440,'10.0.1.24',2),(167772441,'10.0.1.25',2),(167772442,'10.0.1.26',2),(167772443,'10.0.1.27',2),(167772444,'10.0.1.28',2),(167772445,'10.0.1.29',2),(167772446,'10.0.1.30',2),(167772447,'10.0.1.31',2),(167772448,'10.0.1.32',2),(167772449,'10.0.1.33',2),(167772450,'10.0.1.34',2),(167772451,'10.0.1.35',2),(167772452,'10.0.1.36',2),(167772453,'10.0.1.37',2),(167772454,'10.0.1.38',2),(167772455,'10.0.1.39',2),(167772456,'10.0.1.40',2),(167772457,'10.0.1.41',2),(167772458,'10.0.1.42',2),(167772459,'10.0.1.43',2),(167772460,'10.0.1.44',2),(167772461,'10.0.1.45',2),(167772462,'10.0.1.46',2),(167772463,'10.0.1.47',2),(167772464,'10.0.1.48',2),(167772465,'10.0.1.49',2),(167772466,'10.0.1.50',2),(167772467,'10.0.1.51',2),(167772468,'10.0.1.52',2),(167772469,'10.0.1.53',2),(167772470,'10.0.1.54',2),(167772471,'10.0.1.55',2),(167772472,'10.0.1.56',2),(167772473,'10.0.1.57',2),(167772474,'10.0.1.58',2),(167772475,'10.0.1.59',2),(167772476,'10.0.1.60',2),(167772477,'10.0.1.61',2),(167772478,'10.0.1.62',2),(167772479,'10.0.1.63',2),(167772480,'10.0.1.64',2),(167772481,'10.0.1.65',2),(167772482,'10.0.1.66',2),(167772483,'10.0.1.67',2),(167772484,'10.0.1.68',2),(167772485,'10.0.1.69',2),(167772486,'10.0.1.70',2),(167772487,'10.0.1.71',2),(167772488,'10.0.1.72',2),(167772489,'10.0.1.73',2),(167772490,'10.0.1.74',2),(167772491,'10.0.1.75',2),(167772492,'10.0.1.76',2),(167772493,'10.0.1.77',2),(167772494,'10.0.1.78',2),(167772495,'10.0.1.79',2),(167772496,'10.0.1.80',2),(167772497,'10.0.1.81',2),(167772498,'10.0.1.82',2),(167772499,'10.0.1.83',2),(167772500,'10.0.1.84',2),(167772501,'10.0.1.85',2),(167772502,'10.0.1.86',2),(167772503,'10.0.1.87',2),(167772504,'10.0.1.88',2),(167772505,'10.0.1.89',2),(167772506,'10.0.1.90',2),(167772507,'10.0.1.91',2),(167772508,'10.0.1.92',2),(167772509,'10.0.1.93',2),(167772510,'10.0.1.94',2),(167772511,'10.0.1.95',2),(167772512,'10.0.1.96',2),(167772513,'10.0.1.97',2),(167772514,'10.0.1.98',2),(167772515,'10.0.1.99',2),(167772516,'10.0.1.100',2),(167772517,'10.0.1.101',2),(167772518,'10.0.1.102',2),(167772519,'10.0.1.103',2),(167772520,'10.0.1.104',2),(167772521,'10.0.1.105',2),(167772522,'10.0.1.106',2),(167772523,'10.0.1.107',2),(167772524,'10.0.1.108',2),(167772525,'10.0.1.109',2),(167772526,'10.0.1.110',2),(167772527,'10.0.1.111',2),(167772528,'10.0.1.112',2),(167772529,'10.0.1.113',2),(167772530,'10.0.1.114',2),(167772531,'10.0.1.115',2),(167772532,'10.0.1.116',2),(167772533,'10.0.1.117',2),(167772534,'10.0.1.118',2),(167772535,'10.0.1.119',2),(167772536,'10.0.1.120',2),(167772537,'10.0.1.121',2),(167772538,'10.0.1.122',2),(167772539,'10.0.1.123',2),(167772540,'10.0.1.124',2),(167772541,'10.0.1.125',2),(167772542,'10.0.1.126',2),(167772543,'10.0.1.127',2),(167772544,'10.0.1.128',2),(167772545,'10.0.1.129',2),(167772546,'10.0.1.130',2),(167772547,'10.0.1.131',2),(167772548,'10.0.1.132',2),(167772549,'10.0.1.133',2),(167772550,'10.0.1.134',2),(167772551,'10.0.1.135',2),(167772552,'10.0.1.136',2),(167772553,'10.0.1.137',2),(167772554,'10.0.1.138',2),(167772555,'10.0.1.139',2),(167772556,'10.0.1.140',2),(167772557,'10.0.1.141',2),(167772558,'10.0.1.142',2),(167772559,'10.0.1.143',2),(167772560,'10.0.1.144',2),(167772561,'10.0.1.145',2),(167772562,'10.0.1.146',2),(167772563,'10.0.1.147',2),(167772564,'10.0.1.148',2),(167772565,'10.0.1.149',2),(167772566,'10.0.1.150',2),(167772567,'10.0.1.151',2),(167772568,'10.0.1.152',2),(167772569,'10.0.1.153',2),(167772570,'10.0.1.154',2),(167772571,'10.0.1.155',2),(167772572,'10.0.1.156',2),(167772573,'10.0.1.157',2),(167772574,'10.0.1.158',2),(167772575,'10.0.1.159',2),(167772576,'10.0.1.160',2),(167772577,'10.0.1.161',2),(167772578,'10.0.1.162',2),(167772579,'10.0.1.163',2),(167772580,'10.0.1.164',2),(167772581,'10.0.1.165',2),(167772582,'10.0.1.166',2),(167772583,'10.0.1.167',2),(167772584,'10.0.1.168',2),(167772585,'10.0.1.169',2),(167772586,'10.0.1.170',2),(167772587,'10.0.1.171',2),(167772588,'10.0.1.172',2),(167772589,'10.0.1.173',2),(167772590,'10.0.1.174',2),(167772591,'10.0.1.175',2),(167772592,'10.0.1.176',2),(167772593,'10.0.1.177',2),(167772594,'10.0.1.178',2),(167772595,'10.0.1.179',2),(167772596,'10.0.1.180',2),(167772597,'10.0.1.181',2),(167772598,'10.0.1.182',2),(167772599,'10.0.1.183',2),(167772600,'10.0.1.184',2),(167772601,'10.0.1.185',2),(167772602,'10.0.1.186',2),(167772603,'10.0.1.187',2),(167772604,'10.0.1.188',2),(167772605,'10.0.1.189',2),(167772606,'10.0.1.190',2),(167772607,'10.0.1.191',2),(167772608,'10.0.1.192',2),(167772609,'10.0.1.193',2),(167772610,'10.0.1.194',2),(167772611,'10.0.1.195',2),(167772612,'10.0.1.196',2),(167772613,'10.0.1.197',2),(167772614,'10.0.1.198',2),(167772615,'10.0.1.199',2),(167772616,'10.0.1.200',2),(167772617,'10.0.1.201',2),(167772618,'10.0.1.202',2),(167772619,'10.0.1.203',2),(167772620,'10.0.1.204',2),(167772621,'10.0.1.205',2),(167772622,'10.0.1.206',2),(167772623,'10.0.1.207',2),(167772624,'10.0.1.208',2),(167772625,'10.0.1.209',2),(167772626,'10.0.1.210',2),(167772627,'10.0.1.211',2),(167772628,'10.0.1.212',2),(167772629,'10.0.1.213',2),(167772630,'10.0.1.214',2),(167772631,'10.0.1.215',2),(167772632,'10.0.1.216',2),(167772633,'10.0.1.217',2),(167772634,'10.0.1.218',2),(167772635,'10.0.1.219',2),(167772636,'10.0.1.220',2),(167772637,'10.0.1.221',2),(167772638,'10.0.1.222',2),(167772639,'10.0.1.223',2),(167772640,'10.0.1.224',2),(167772641,'10.0.1.225',2),(167772642,'10.0.1.226',2),(167772643,'10.0.1.227',2),(167772644,'10.0.1.228',2),(167772645,'10.0.1.229',2),(167772646,'10.0.1.230',2),(167772647,'10.0.1.231',2),(167772648,'10.0.1.232',2),(167772649,'10.0.1.233',2),(167772650,'10.0.1.234',2),(167772651,'10.0.1.235',2),(167772652,'10.0.1.236',2),(167772653,'10.0.1.237',2),(167772654,'10.0.1.238',2),(167772655,'10.0.1.239',2),(167772656,'10.0.1.240',2),(167772657,'10.0.1.241',2),(167772658,'10.0.1.242',2),(167772659,'10.0.1.243',2),(167772660,'10.0.1.244',2),(167772661,'10.0.1.245',2),(167772662,'10.0.1.246',2),(167772663,'10.0.1.247',2),(167772664,'10.0.1.248',2),(167772665,'10.0.1.249',2),(167772666,'10.0.1.250',2),(167772667,'10.0.1.251',2),(167772668,'10.0.1.252',2),(167772669,'10.0.1.253',2),(167772670,'10.0.1.254',2);
/*!40000 ALTER TABLE `sectorspool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectorspool_lease`
--

DROP TABLE IF EXISTS `sectorspool_lease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sectorspool_lease` (
  `ip2long` bigint NOT NULL,
  `ip` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `sectorid` smallint unsigned NOT NULL,
  `used` tinyint unsigned NOT NULL DEFAULT '0',
  `expired` int NOT NULL DEFAULT '86400',
  `mac` char(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  KEY `expired` (`expired`),
  KEY `sectorid` (`sectorid`),
  KEY `sector-ip` (`sectorid`,`ip`),
  KEY `used` (`used`),
  KEY `uid` (`mac`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectorspool_lease`
--

LOCK TABLES `sectorspool_lease` WRITE;
/*!40000 ALTER TABLE `sectorspool_lease` DISABLE KEYS */;
/*!40000 ALTER TABLE `sectorspool_lease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secureauth`
--

DROP TABLE IF EXISTS `secureauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secureauth` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned NOT NULL,
  `CallingStationId` char(64) NOT NULL,
  `permit` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `prmit` (`permit`),
  KEY `uid` (`uid`),
  KEY `uid-caller` (`uid`,`CallingStationId`),
  KEY `caller` (`CallingStationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secureauth`
--

LOCK TABLES `secureauth` WRITE;
/*!40000 ALTER TABLE `secureauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `secureauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sender_conditions`
--

DROP TABLE IF EXISTS `sender_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sender_conditions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT 'Название',
  `period` varchar(32) NOT NULL COMMENT 'Период:(all,day,month,year)',
  `period_count` int NOT NULL COMMENT 'Кол-во выполнений за указанный период',
  `active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Признак активности условия',
  `event_id` int NOT NULL COMMENT 'ID события',
  `sender_template_id` int NOT NULL COMMENT 'ID шаблона',
  `sender_gateway_id` int DEFAULT '0' COMMENT 'ID шлюза',
  `conditions` text COMMENT 'Коллекция условий',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sender_conditions`
--

LOCK TABLES `sender_conditions` WRITE;
/*!40000 ALTER TABLE `sender_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sender_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sender_gateway_types`
--

DROP TABLE IF EXISTS `sender_gateway_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sender_gateway_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT 'Название',
  `fields` text COMMENT 'JSON параметры',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sender_gateway_types`
--

LOCK TABLES `sender_gateway_types` WRITE;
/*!40000 ALTER TABLE `sender_gateway_types` DISABLE KEYS */;
INSERT INTO `sender_gateway_types` VALUES (1,'SMS Ukraine','{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}'),(2,'SMS Pilot','{\"sender\":\"text\",\"api_key\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}'),(3,'SMS Fly','{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}'),(4,'TextLocal','{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\",\"api_key\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}'),(5,'Beeline (beeline.amega-inform.ru)','{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}'),(6,'TurboSMS','{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}'),(7,'IQSMS','{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}'),(8,'smsc.ru','{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}'),(9,'SMS Fenix','{\"sender\":\"text\",\"api_key\":\"text\",\"api_host\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}'),(10,'SMS Eskiz (eskiz.uz)','{\"sender\":\"text\",\"login\":\"text\",\"api_key\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}'),(11,'МТС ru','{\"sender\":\"text\",\"api_key\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}'),(12,'LIBONET','{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}'),(13,'SMS API','{\"sender\":\"text\",\"api_key\":\"text\",\"api_host\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}'),(14,'SMS e-Vostok','{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}'),(15,'SMS Lugacom','{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\",\"api_host\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}'),(16,'SMS OmniCell','{\"sender\":\"text\",\"login\":\"text\",\"password\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}'),(17,'SMS TurboSMS with Viber','{\"sender\":\"text\",\"transactional\":\"checkbox\",\"api_key\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}'),(18,'Mobizon.kz','{\"sender\":\"text\",\"api_key\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}'),(19,'Mobizon.ua','{\"sender\":\"text\",\"api_key\":\"text\",\"sleep\":\"number\",\"timeout\":\"number\"}');
/*!40000 ALTER TABLE `sender_gateway_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sender_gateways`
--

DROP TABLE IF EXISTS `sender_gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sender_gateways` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender_gateway_type` int NOT NULL COMMENT 'Тип используемого шлюза',
  `name` varchar(128) NOT NULL COMMENT 'Название',
  `params` text COMMENT 'JSON параметры',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sender_gateways`
--

LOCK TABLES `sender_gateways` WRITE;
/*!40000 ALTER TABLE `sender_gateways` DISABLE KEYS */;
/*!40000 ALTER TABLE `sender_gateways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sender_jobs`
--

DROP TABLE IF EXISTS `sender_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sender_jobs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender_condition_id` int NOT NULL COMMENT 'ID условия',
  `uid` int NOT NULL COMMENT 'UID абонента',
  `payload` longtext NOT NULL COMMENT 'Тело задания',
  `created_at` int DEFAULT NULL COMMENT 'Время создания задания',
  `send_at` int DEFAULT NULL COMMENT 'Время отправки',
  `completed_at` int DEFAULT NULL COMMENT 'Время выполнения',
  `attempts` tinyint NOT NULL DEFAULT '0' COMMENT 'Количество попыток',
  PRIMARY KEY (`id`),
  KEY `send_at` (`send_at`),
  KEY `completed_at` (`completed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sender_jobs`
--

LOCK TABLES `sender_jobs` WRITE;
/*!40000 ALTER TABLE `sender_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `sender_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sender_templates`
--

DROP TABLE IF EXISTS `sender_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sender_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `template` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sender_templates`
--

LOCK TABLES `sender_templates` WRITE;
/*!40000 ALTER TABLE `sender_templates` DISABLE KEYS */;
INSERT INTO `sender_templates` VALUES (1,'Ув. абонент, Ваш счет пополнен на %pay_amount% %currency% На вашем счете %deposit% %currency%'),(2,'Уважаемый абонент, услуга Интернет будет отключена через %left_day%-дня. Пополните свой счет.'),(3,'Уважаемый абонент, услуга Интернет будет отключена через 1 день. Пополните свой счет.');
/*!40000 ALTER TABLE `sender_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `serviceid` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID услуги',
  `servicename` varchar(64) NOT NULL COMMENT 'Название Услуги',
  `service_alias` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Outer service index',
  `amount` double(20,2) NOT NULL DEFAULT '0.00' COMMENT 'Цена услуги',
  `users_states` set('n','f','d','r') NOT NULL DEFAULT 'n' COMMENT 'Статус пользователя n-normal.f-freeze,d-disabled,r-removed',
  `period` enum('m','w','d','daily_proportionally') NOT NULL DEFAULT 'm' COMMENT 'm - ежемесячно, w - еженедельно, d - ежедневно',
  `service_type` enum('fee','gift') NOT NULL DEFAULT 'fee' COMMENT 'fee-списание,gift-подарок',
  `service_activation` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '0 - базовая (всем в тарифе), 1-индивидуально (по назначению)',
  `service_groupid` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'ID группы для организации типа услуги "1 из множества"',
  `service_loyal_recalculation` tinyint NOT NULL DEFAULT '0' COMMENT 'Лояльное отключение с возвратом средств. Относится ',
  `service_portal` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'признак портала: 0 - нет, 1 - IPTVPORTAL, 2 - Stalker, 3 - olltv',
  `trigger_condition` tinyint NOT NULL DEFAULT '0' COMMENT 'Условие срабатывания услуги. 0 - безусловное (всегда).1 - положительный баланс и Инет включён.2 - отрицательный баланс и Инет выключен, иначе - своё условие',
  `sql_condition` text NOT NULL COMMENT 'дополнительное SQL условие',
  `suspended` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Услуга приостановлена',
  `priority` tinyint unsigned NOT NULL DEFAULT '1' COMMENT 'Приоритет применения услуги. 0 - самый важный. Чем меньше - тем раньше она будет запущена (списана оплата)',
  `service_like_packet` tinyint NOT NULL DEFAULT '0' COMMENT 'указываем, чтоб исполнять логику, как в тарифе. При 1 игнорирует "период" услуги',
  `activation_by_admin` tinyint NOT NULL DEFAULT '0' COMMENT 'подключается администратором',
  `activation_by_user` tinyint NOT NULL DEFAULT '0' COMMENT 'подключается абонентом',
  `deactivation_by_admin` tinyint NOT NULL DEFAULT '0' COMMENT 'деактивация инд. услуги персоналом',
  `deactivation_by_user` tinyint NOT NULL DEFAULT '0' COMMENT 'деактивация инд. услуги абонентом',
  `description` text NOT NULL COMMENT 'описание услуги',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Последнее обновление',
  `tarifservice` tinyint unsigned NOT NULL DEFAULT '0',
  `serviceacl` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `service_category` int unsigned NOT NULL DEFAULT '0' COMMENT 'Категория',
  `trial` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Use trial function',
  `trial_price` double(20,6) NOT NULL DEFAULT '0.000000',
  `trial_period_on` tinyint NOT NULL DEFAULT '0',
  `trial_period_days` smallint NOT NULL DEFAULT '0',
  `trial_change_on` tinyint NOT NULL DEFAULT '0',
  `trial_change_serviceid` mediumint NOT NULL DEFAULT '0',
  `discount_on` tinyint NOT NULL DEFAULT '0' COMMENT 'Разрешена ли скидка',
  `exclusion_services` varchar(128) CHARACTER SET koi8r COLLATE koi8r_general_ci NOT NULL DEFAULT '[]',
  `usersgroupid` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`serviceid`),
  KEY `service_alias` (`service_alias`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Услуга Кредит','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(2,'Услуга Кредит с %','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(3,'Услуга \"Турбо\"','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(4,'Лимит трафика (месяц)','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','2023-10-16 15:04:03',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(5,'Услуга \"Заморозка\"','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(6,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(7,'Услуга \"IVI.RU\"','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','2020-12-25 14:53:48',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(8,'Аренда оборудования','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','2020-12-25 14:53:52',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(9,'Услуга: Реальный IP','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','2020-12-25 14:53:52',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(10,'Лимит трафика (день)','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','2023-10-16 15:04:03',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(11,'Лимит трафика (неделя)','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','2023-10-16 15:04:03',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(12,'Лимит трафика (плав. дата)','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','2023-10-16 15:04:03',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(13,'Временной Кредит','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','2023-10-16 15:04:03',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(14,'Услуга \"Заморозка с возвратом АП\"','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','2023-10-16 15:04:12',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(15,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(16,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(17,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(18,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(19,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(20,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(21,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(22,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(23,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(24,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(25,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(26,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(27,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(28,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(29,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(30,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(31,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(32,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(33,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(34,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(35,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(36,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(37,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(38,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(39,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(40,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(41,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(42,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(43,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(44,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(45,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(46,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(47,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(48,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(49,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(50,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(51,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(52,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(53,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(54,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(55,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(56,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(57,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(58,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(59,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(60,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(61,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(62,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(63,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(64,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(65,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(66,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(67,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(68,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(69,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(70,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(71,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(72,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(73,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(74,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(75,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(76,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(77,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(78,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(79,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(80,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(81,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(82,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(83,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(84,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(85,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(86,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(87,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(88,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(89,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(90,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(91,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(92,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(93,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(94,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(95,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(96,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(97,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(98,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(99,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0),(100,'','',0.00,'n','m','fee',0,0,1,0,0,'',1,1,0,0,0,0,0,'reserved','2016-09-11 15:02:47','0000-00-00 00:00:00',0,'',0,0,0.000000,0,0,0,0,0,'[]',0);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_exclusions`
--

DROP TABLE IF EXISTS `services_exclusions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services_exclusions` (
  `serviceid` smallint unsigned NOT NULL,
  `serviceid_exclusion` smallint unsigned NOT NULL,
  KEY `serviceid` (`serviceid`) USING BTREE,
  KEY `serviceid_exclusion` (`serviceid_exclusion`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_exclusions`
--

LOCK TABLES `services_exclusions` WRITE;
/*!40000 ALTER TABLE `services_exclusions` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_exclusions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_inclusions`
--

DROP TABLE IF EXISTS `services_inclusions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services_inclusions` (
  `serviceid` smallint unsigned NOT NULL,
  `serviceid_inclusion` smallint unsigned NOT NULL,
  KEY `serviceid` (`serviceid`) USING BTREE,
  KEY `serviceid_inclusion` (`serviceid_inclusion`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_inclusions`
--

LOCK TABLES `services_inclusions` WRITE;
/*!40000 ALTER TABLE `services_inclusions` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_inclusions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_logs`
--

DROP TABLE IF EXISTS `services_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services_logs` (
  `record_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned NOT NULL,
  `gid` smallint unsigned NOT NULL,
  `serviceid` smallint unsigned NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `before_billing` double(20,6) NOT NULL,
  `amount` double(20,6) NOT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_logs`
--

LOCK TABLES `services_logs` WRITE;
/*!40000 ALTER TABLE `services_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_packets_pairs`
--

DROP TABLE IF EXISTS `services_packets_pairs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services_packets_pairs` (
  `serviceid` smallint unsigned NOT NULL,
  `gid` smallint unsigned NOT NULL,
  `service_price` double(20,2) DEFAULT NULL,
  `service_loyal_recalculation` tinyint DEFAULT NULL COMMENT 'Лояльное отключение с возвратом средств. Относится ',
  `service_activation` tinyint NOT NULL DEFAULT '0' COMMENT '0 - базовая, 1 - индивидуальная',
  `activation_by_admin` tinyint DEFAULT NULL COMMENT 'подключается администратором',
  `activation_by_user` tinyint DEFAULT NULL COMMENT 'подключается абонентом',
  `deactivation_by_admin` tinyint DEFAULT NULL COMMENT 'деактивация инд. услуги персоналом',
  `deactivation_by_user` tinyint DEFAULT NULL COMMENT 'деактивация инд. услуги абонентом',
  `discount_on` tinyint DEFAULT NULL COMMENT 'Разрешена ли скидка',
  KEY `gid` (`gid`),
  KEY `serviceid` (`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_packets_pairs`
--

LOCK TABLES `services_packets_pairs` WRITE;
/*!40000 ALTER TABLE `services_packets_pairs` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_packets_pairs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_users_pairs`
--

DROP TABLE IF EXISTS `services_users_pairs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services_users_pairs` (
  `serviceid` smallint unsigned NOT NULL,
  `uid` bigint unsigned NOT NULL,
  KEY `serviceid` (`serviceid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_users_pairs`
--

LOCK TABLES `services_users_pairs` WRITE;
/*!40000 ALTER TABLE `services_users_pairs` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_users_pairs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_admin`
--

DROP TABLE IF EXISTS `session_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session_admin` (
  `id` char(32) NOT NULL DEFAULT '',
  `modified` int DEFAULT NULL,
  `lifetime` int DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_admin`
--

LOCK TABLES `session_admin` WRITE;
/*!40000 ALTER TABLE `session_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_stat`
--

DROP TABLE IF EXISTS `session_stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session_stat` (
  `id` char(32) NOT NULL DEFAULT '',
  `modified` int DEFAULT NULL,
  `lifetime` int DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_stat`
--

LOCK TABLES `session_stat` WRITE;
/*!40000 ALTER TABLE `session_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `session_stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `sessionid` int unsigned NOT NULL AUTO_INCREMENT,
  `userID` int unsigned NOT NULL,
  `auth` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastActivity` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(15) CHARACTER SET ucs2 COLLATE ucs2_bin NOT NULL,
  PRIMARY KEY (`sessionid`),
  UNIQUE KEY `sessionid` (`sessionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_logs`
--

DROP TABLE IF EXISTS `sms_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_logs` (
  `sms_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'AI',
  `sms_type_id` tinyint unsigned NOT NULL COMMENT 'Тип СМС - OTP регистрация и прочие категории',
  `gateway_id` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Шлюз СМС. По умолчанию - 0 (сис. опции)',
  `uid` bigint unsigned DEFAULT NULL COMMENT 'ID абонента, NULL - для OTP регистрации',
  `staffid` smallint DEFAULT NULL COMMENT 'ID сотрудника',
  `sms_phone` varchar(20) NOT NULL,
  `sms_text` varchar(254) NOT NULL,
  `sms_code` tinyint DEFAULT NULL COMMENT 'Код СМС. 0 - всё ОК, иначе - ошибка. NULL - не известен',
  `sms_error_text` varchar(254) NOT NULL DEFAULT '' COMMENT 'Описание ошибки, если есть',
  `sms_send_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время отправки СМС',
  PRIMARY KEY (`sms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Логи отправленных СМС';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_logs`
--

LOCK TABLES `sms_logs` WRITE;
/*!40000 ALTER TABLE `sms_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_type`
--

DROP TABLE IF EXISTS `sms_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_type`
--

LOCK TABLES `sms_type` WRITE;
/*!40000 ALTER TABLE `sms_type` DISABLE KEYS */;
INSERT INTO `sms_type` VALUES (1,'OTP'),(2,'SMS Register'),(3,'Restore pass'),(4,'Multi-SMS'),(5,'SMS-Info'),(6,'Balance Info');
/*!40000 ALTER TABLE `sms_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_users_left_days`
--

DROP TABLE IF EXISTS `sms_users_left_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_users_left_days` (
  `uid` int NOT NULL,
  `days` smallint NOT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(12) DEFAULT NULL,
  UNIQUE KEY `uid` (`uid`),
  KEY `days_left` (`days`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_users_left_days`
--

LOCK TABLES `sms_users_left_days` WRITE;
/*!40000 ALTER TABLE `sms_users_left_days` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_users_left_days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snmp_templates`
--

DROP TABLE IF EXISTS `snmp_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `snmp_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mode` enum('b','f') NOT NULL DEFAULT 'b',
  `usersgroupid` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snmp_templates`
--

LOCK TABLES `snmp_templates` WRITE;
/*!40000 ALTER TABLE `snmp_templates` DISABLE KEYS */;
INSERT INTO `snmp_templates` VALUES (1,'PON BDCOM 33xx','b',0),(2,'PON ZTE','b',0),(3,'WiFi UBNT v7.x','b',0),(4,'WiFi UBNT v6.x','b',0),(5,'WiFi RouterOS 5.x','b',0),(6,'WiFi RouterOS 6.x','b',0);
/*!40000 ALTER TABLE `snmp_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sorm_data`
--

DROP TABLE IF EXISTS `sorm_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sorm_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sorm_id` int NOT NULL,
  `entity` varchar(128) NOT NULL,
  `entity_id` int NOT NULL,
  `entity_data` text,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entity` (`entity`,`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sorm_data`
--

LOCK TABLES `sorm_data` WRITE;
/*!40000 ALTER TABLE `sorm_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `sorm_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sticky_notes`
--

DROP TABLE IF EXISTS `sticky_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sticky_notes` (
  `stickynoteid` int unsigned NOT NULL AUTO_INCREMENT,
  `stickynotename` varchar(36) NOT NULL DEFAULT '',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stuffid` int unsigned NOT NULL,
  `ispublic` tinyint unsigned NOT NULL DEFAULT '0',
  `x` int unsigned NOT NULL DEFAULT '10',
  `y` int unsigned NOT NULL DEFAULT '10',
  `visible` tinyint unsigned NOT NULL DEFAULT '1',
  `pinned` tinyint unsigned NOT NULL DEFAULT '0',
  `note` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`stickynoteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sticky_notes`
--

LOCK TABLES `sticky_notes` WRITE;
/*!40000 ALTER TABLE `sticky_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `sticky_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sticky_notes_stuff`
--

DROP TABLE IF EXISTS `sticky_notes_stuff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sticky_notes_stuff` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `stuffid` int unsigned NOT NULL,
  `ispublic` tinyint unsigned NOT NULL DEFAULT '0',
  `x` int unsigned NOT NULL DEFAULT '10',
  `y` int unsigned NOT NULL DEFAULT '10',
  `visible` tinyint unsigned NOT NULL DEFAULT '1',
  `pinned` tinyint unsigned NOT NULL DEFAULT '0',
  `note` varchar(500) NOT NULL DEFAULT '',
  `options` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sticky_notes_stuff`
--

LOCK TABLES `sticky_notes_stuff` WRITE;
/*!40000 ALTER TABLE `sticky_notes_stuff` DISABLE KEYS */;
/*!40000 ALTER TABLE `sticky_notes_stuff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sticky_notes_user`
--

DROP TABLE IF EXISTS `sticky_notes_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sticky_notes_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` int unsigned DEFAULT NULL,
  `stuffid` int NOT NULL DEFAULT '0',
  `note` varchar(500) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sticky_notes_user`
--

LOCK TABLES `sticky_notes_user` WRITE;
/*!40000 ALTER TABLE `sticky_notes_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `sticky_notes_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stuff`
--

DROP TABLE IF EXISTS `stuff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stuff` (
  `stuffid` int unsigned NOT NULL AUTO_INCREMENT,
  `sLogin` varchar(36) NOT NULL,
  `sPwd` varchar(36) NOT NULL,
  PRIMARY KEY (`stuffid`),
  UNIQUE KEY `stuffid` (`stuffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stuff`
--

LOCK TABLES `stuff` WRITE;
/*!40000 ALTER TABLE `stuff` DISABLE KEYS */;
/*!40000 ALTER TABLE `stuff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stuff_aclid`
--

DROP TABLE IF EXISTS `stuff_aclid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stuff_aclid` (
  `aclid` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `acl` char(64) NOT NULL,
  `usersgroupid` smallint NOT NULL DEFAULT '0',
  `admin_gui_templateid` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`aclid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=66;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stuff_aclid`
--

LOCK TABLES `stuff_aclid` WRITE;
/*!40000 ALTER TABLE `stuff_aclid` DISABLE KEYS */;
INSERT INTO `stuff_aclid` VALUES (1,'Администратор',0,0),(2,'Монтажник',0,0),(9,'Директор',0,0),(10,'Управляющий',0,0),(11,'Офис-менеджер',0,0),(12,'Бухгалтер',0,0),(13,'Бригадир монтажников',0,0);
/*!40000 ALTER TABLE `stuff_aclid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stuff_aclresource`
--

DROP TABLE IF EXISTS `stuff_aclresource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stuff_aclresource` (
  `resourceid` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `resource` char(64) NOT NULL,
  PRIMARY KEY (`resourceid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=66;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stuff_aclresource`
--

LOCK TABLES `stuff_aclresource` WRITE;
/*!40000 ALTER TABLE `stuff_aclresource` DISABLE KEYS */;
INSERT INTO `stuff_aclresource` VALUES (1,'bugh'),(2,'stuff'),(3,'options'),(4,'cards'),(5,'vaucher'),(6,'logs'),(7,'modsendmail'),(8,'modules'),(9,'monitoring'),(10,'tarif'),(11,'users'),(12,'mapview'),(13,'mapedit'),(14,'ticketedit'),(15,'ticketview'),(16,'monitorview'),(17,'devel'),(18,'cabnews'),(19,'bras');
/*!40000 ALTER TABLE `stuff_aclresource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stuff_aclrole`
--

DROP TABLE IF EXISTS `stuff_aclrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stuff_aclrole` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `aclid` tinyint unsigned NOT NULL,
  `resourceid` tinyint unsigned NOT NULL,
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `aclid` (`aclid`),
  KEY `resourceid` (`resourceid`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stuff_aclrole`
--

LOCK TABLES `stuff_aclrole` WRITE;
/*!40000 ALTER TABLE `stuff_aclrole` DISABLE KEYS */;
INSERT INTO `stuff_aclrole` VALUES (1,1,1,1),(2,1,2,1),(3,1,3,1),(4,1,4,1),(5,1,5,1),(6,1,6,1),(8,1,7,1),(9,1,8,1),(10,1,9,1),(11,1,10,1),(12,1,11,1),(80,1,13,1),(81,1,14,1),(82,1,15,1),(83,1,16,1),(84,1,17,0),(85,1,12,1);
/*!40000 ALTER TABLE `stuff_aclrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stuff_apikeys`
--

DROP TABLE IF EXISTS `stuff_apikeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stuff_apikeys` (
  `apikeyid` int unsigned NOT NULL AUTO_INCREMENT,
  `apikeyname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `stuffid` tinyint unsigned NOT NULL,
  `secret` blob NOT NULL,
  PRIMARY KEY (`apikeyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stuff_apikeys`
--

LOCK TABLES `stuff_apikeys` WRITE;
/*!40000 ALTER TABLE `stuff_apikeys` DISABLE KEYS */;
/*!40000 ALTER TABLE `stuff_apikeys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stuff_dolgnost`
--

DROP TABLE IF EXISTS `stuff_dolgnost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stuff_dolgnost` (
  `dolgnostid` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `dolgnost` char(128) NOT NULL,
  `stavka` double(20,3) unsigned NOT NULL,
  PRIMARY KEY (`dolgnostid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=138;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stuff_dolgnost`
--

LOCK TABLES `stuff_dolgnost` WRITE;
/*!40000 ALTER TABLE `stuff_dolgnost` DISABLE KEYS */;
INSERT INTO `stuff_dolgnost` VALUES (1,'Монтажник',1.000),(2,'Офис-менеджер',7.000),(3,'Системный администратор',12.500),(4,'Бригадир монтажников',8.500),(5,'Руководитель',15.000),(6,'Управляющий',13.000);
/*!40000 ALTER TABLE `stuff_dolgnost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stuff_groups`
--

DROP TABLE IF EXISTS `stuff_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stuff_groups` (
  `stuffid` int unsigned NOT NULL,
  `groupid` smallint unsigned NOT NULL,
  KEY `stuffid` (`stuffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stuff_groups`
--

LOCK TABLES `stuff_groups` WRITE;
/*!40000 ALTER TABLE `stuff_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `stuff_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stuff_koef_stavki`
--

DROP TABLE IF EXISTS `stuff_koef_stavki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stuff_koef_stavki` (
  `koefid` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` char(64) NOT NULL,
  `koef` double(20,2) NOT NULL,
  `usersgroupid` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`koefid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=74;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stuff_koef_stavki`
--

LOCK TABLES `stuff_koef_stavki` WRITE;
/*!40000 ALTER TABLE `stuff_koef_stavki` DISABLE KEYS */;
INSERT INTO `stuff_koef_stavki` VALUES (1,'Рабочий день',1.00,0),(2,'Рабочий день (переработка)',12.00,0),(3,'Выходной день',3.00,0),(4,'Выходной день (переработка)',1.00,0),(5,'Штраф',-1.00,0),(6,'Премия',1.00,0),(7,'Больничный',0.50,0);
/*!40000 ALTER TABLE `stuff_koef_stavki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stuff_password_history`
--

DROP TABLE IF EXISTS `stuff_password_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stuff_password_history` (
  `stuffid` smallint NOT NULL,
  `hash` char(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `time` int NOT NULL,
  UNIQUE KEY `stuffid_hash` (`stuffid`,`hash`),
  KEY `stuffid_time` (`stuffid`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='история паролей сотрудников';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stuff_password_history`
--

LOCK TABLES `stuff_password_history` WRITE;
/*!40000 ALTER TABLE `stuff_password_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `stuff_password_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stuff_permissions`
--

DROP TABLE IF EXISTS `stuff_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stuff_permissions` (
  `stuffid` tinyint unsigned NOT NULL,
  `permissionid` int unsigned NOT NULL,
  `value` tinyint unsigned NOT NULL,
  PRIMARY KEY (`stuffid`,`permissionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stuff_permissions`
--

LOCK TABLES `stuff_permissions` WRITE;
/*!40000 ALTER TABLE `stuff_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `stuff_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stuff_permissions_types`
--

DROP TABLE IF EXISTS `stuff_permissions_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stuff_permissions_types` (
  `permissionid` int unsigned NOT NULL AUTO_INCREMENT,
  `permissionname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `aclid_1` tinyint unsigned NOT NULL DEFAULT '0',
  `aclid_2` tinyint unsigned NOT NULL DEFAULT '0',
  `aclid_9` tinyint unsigned NOT NULL DEFAULT '0',
  `aclid_10` tinyint unsigned NOT NULL DEFAULT '0',
  `aclid_11` tinyint unsigned NOT NULL DEFAULT '0',
  `aclid_12` tinyint unsigned NOT NULL DEFAULT '0',
  `aclid_13` tinyint unsigned NOT NULL DEFAULT '0',
  `necessary_aclids` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `description` varchar(128) NOT NULL,
  PRIMARY KEY (`permissionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stuff_permissions_types`
--

LOCK TABLES `stuff_permissions_types` WRITE;
/*!40000 ALTER TABLE `stuff_permissions_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `stuff_permissions_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stuff_personal`
--

DROP TABLE IF EXISTS `stuff_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stuff_personal` (
  `stuffid` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `login` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `pass` char(35) CHARACTER SET koi8r COLLATE koi8r_bin NOT NULL,
  `twofactorgauth` tinyint unsigned NOT NULL DEFAULT '0',
  `aclid` tinyint unsigned DEFAULT '1',
  `dolgnostid` tinyint unsigned NOT NULL DEFAULT '1',
  `stavka` double(20,2) unsigned NOT NULL DEFAULT '0.00',
  `fio` char(128) DEFAULT NULL,
  `adress` char(128) DEFAULT NULL,
  `passportserie` char(16) DEFAULT NULL,
  `passportpropiska` char(128) DEFAULT NULL,
  `passportvoenkomat` char(128) DEFAULT NULL,
  `passportgdevidan` char(128) DEFAULT NULL,
  `inn` char(64) DEFAULT NULL,
  `ndogovora` tinyint unsigned DEFAULT NULL,
  `semeynoepologenie` char(128) DEFAULT NULL,
  `phone_home` char(128) DEFAULT NULL,
  `phone_mob` char(128) DEFAULT NULL,
  `phone_mob2` char(128) DEFAULT NULL,
  `chasi` int DEFAULT NULL,
  `active` tinyint unsigned NOT NULL DEFAULT '0',
  `active_gosorgan` tinyint NOT NULL DEFAULT '0' COMMENT 'доступ для гос. органов',
  `do_freeze` tinyint NOT NULL DEFAULT '1',
  `do_credit` tinyint unsigned NOT NULL DEFAULT '0',
  `do_credit_max_summa` int NOT NULL DEFAULT '0',
  `do_credit_like_cabinet` tinyint NOT NULL DEFAULT '0',
  `do_timecredit` tinyint NOT NULL DEFAULT '0',
  `timecredit_value_change` tinyint NOT NULL DEFAULT '0',
  `timecredit_change_start` tinyint NOT NULL DEFAULT '0',
  `timecredit_change_stop` tinyint NOT NULL DEFAULT '0',
  `timecredit_miminum_days` smallint NOT NULL DEFAULT '1',
  `timecredit_maximum_days` smallint NOT NULL DEFAULT '7',
  `do_payment` tinyint unsigned NOT NULL DEFAULT '0',
  `payment_date_change` tinyint NOT NULL DEFAULT '0',
  `do_show_passwd` tinyint unsigned NOT NULL DEFAULT '0',
  `do_minus_payments` tinyint unsigned NOT NULL DEFAULT '0',
  `do_change_speed` tinyint unsigned NOT NULL DEFAULT '0',
  `do_scvlansearch` tinyint NOT NULL DEFAULT '0',
  `do_options` tinyint unsigned NOT NULL DEFAULT '0',
  `do_change_tarif` tinyint unsigned NOT NULL DEFAULT '0',
  `theme` char(16) DEFAULT NULL,
  `date_birth` char(16) DEFAULT NULL,
  `print_check` tinyint(1) NOT NULL DEFAULT '0',
  `doexportcvs` tinyint unsigned NOT NULL DEFAULT '0',
  `search_display_all` tinyint(1) NOT NULL DEFAULT '1',
  `search_default_or` tinyint(1) NOT NULL DEFAULT '0',
  `use_block_local_inet` tinyint(1) NOT NULL DEFAULT '0',
  `do_simple_change_tarif` tinyint unsigned NOT NULL DEFAULT '1',
  `do_full_change_tarif` tinyint unsigned NOT NULL DEFAULT '0',
  `use_beznal_plateg` tinyint unsigned NOT NULL DEFAULT '0',
  `do_edit_ip` tinyint unsigned NOT NULL DEFAULT '0',
  `do_window_doubleclick` tinyint unsigned NOT NULL DEFAULT '0',
  `access_ticket` tinyint unsigned NOT NULL DEFAULT '0',
  `access_map` tinyint unsigned NOT NULL DEFAULT '0',
  `map_create` tinyint unsigned NOT NULL DEFAULT '0',
  `map_superadmin` tinyint unsigned NOT NULL DEFAULT '0',
  `tickets_superadmin` tinyint unsigned NOT NULL DEFAULT '0',
  `tickets_add` tinyint unsigned NOT NULL DEFAULT '0',
  `tickets_update` tinyint unsigned NOT NULL DEFAULT '0',
  `tickets_delete` tinyint unsigned NOT NULL DEFAULT '0',
  `tickets_inwork` tinyint unsigned NOT NULL DEFAULT '0',
  `tickets_performed` tinyint unsigned NOT NULL DEFAULT '0',
  `tickets_dialogue` tinyint unsigned NOT NULL DEFAULT '0',
  `tickets_close` tinyint unsigned NOT NULL DEFAULT '0',
  `tickets_open` tinyint unsigned NOT NULL DEFAULT '0',
  `tickets_add_note` tinyint unsigned NOT NULL DEFAULT '0',
  `tickets_update_note` tinyint unsigned NOT NULL DEFAULT '0',
  `tickets_delete_note` tinyint unsigned NOT NULL DEFAULT '0',
  `tickets_performers_change` tinyint unsigned NOT NULL DEFAULT '0',
  `tickets_categories_edit` tinyint unsigned NOT NULL DEFAULT '0',
  `tickets_print` tinyint unsigned NOT NULL DEFAULT '0',
  `tickets_see_opened` tinyint unsigned NOT NULL DEFAULT '0',
  `tickets_see_inwork` tinyint unsigned NOT NULL DEFAULT '0',
  `tickets_see_performed` tinyint unsigned NOT NULL DEFAULT '0',
  `tickets_see_closed` tinyint unsigned NOT NULL DEFAULT '0',
  `tickets_access_reports` tinyint unsigned NOT NULL DEFAULT '0',
  `tickets_performer` tinyint NOT NULL DEFAULT '1' COMMENT 'исполнитель',
  `tickets_performed_without_visit` tinyint NOT NULL DEFAULT '1' COMMENT 'выполнено без выезда на место',
  `tickets_notify_on` tinyint NOT NULL DEFAULT '0' COMMENT 'recive notifications',
  `tickets_notify_period` smallint NOT NULL DEFAULT '60' COMMENT 'notifications check period',
  `tickets_notify_interval` smallint NOT NULL DEFAULT '15' COMMENT 'notifications show period',
  `tickets_notify_ticket_new` tinyint NOT NULL DEFAULT '0' COMMENT 'new ticket notifications',
  `tickets_notify_ticket_msg` tinyint NOT NULL DEFAULT '0' COMMENT 'new ticket msg notifications',
  `notify_volume` tinyint NOT NULL DEFAULT '50' COMMENT 'notify sound volume',
  `do_simple_online` tinyint unsigned NOT NULL DEFAULT '1',
  `hide_status_bar` tinyint NOT NULL DEFAULT '0',
  `allow_to_edit_old_address` tinyint NOT NULL DEFAULT '0',
  `usersgroupid` int unsigned NOT NULL DEFAULT '0',
  `do_skidka` tinyint unsigned NOT NULL DEFAULT '0',
  `do_planner` tinyint unsigned NOT NULL DEFAULT '0',
  `staff_search_escaping` tinyint NOT NULL DEFAULT '0',
  `staff_search_limit` smallint unsigned NOT NULL DEFAULT '0',
  `staff_payments_only_current_day` tinyint NOT NULL DEFAULT '0',
  `staff_payments_only_own` tinyint NOT NULL DEFAULT '0',
  `edit_login` tinyint unsigned NOT NULL DEFAULT '1',
  `edit_pass` tinyint unsigned NOT NULL DEFAULT '1',
  `komtet_on` tinyint(1) NOT NULL DEFAULT '0',
  `komtet_queue_id_kassa` varchar(128) DEFAULT NULL,
  `komtet_queue_id_online` varchar(128) DEFAULT NULL,
  `komtet_optionally` tinyint(1) NOT NULL DEFAULT '0',
  `atol_on` tinyint(1) NOT NULL DEFAULT '0',
  `atol_group_id` varchar(128) DEFAULT NULL,
  `atol_optionally` tinyint(1) NOT NULL DEFAULT '0',
  `webkassa_on` tinyint(1) NOT NULL DEFAULT '0',
  `webkassa_optionally` tinyint(1) NOT NULL DEFAULT '0',
  `webkassa_kassa_code` varchar(128) DEFAULT NULL,
  `show_tarif_zero_group` tinyint NOT NULL DEFAULT '1',
  `show_tarif_alias` tinyint NOT NULL DEFAULT '0',
  `input_interval` smallint NOT NULL DEFAULT '1500',
  `payments_delete_restore` tinyint(1) NOT NULL DEFAULT '0',
  `do_installments` tinyint NOT NULL DEFAULT '0',
  `do_installments_tarif` tinyint NOT NULL DEFAULT '0',
  `admin_gui_templateid` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`stuffid`),
  KEY `dolgnostid` (`dolgnostid`),
  KEY `usersgroupid` (`usersgroupid`),
  KEY `auth` (`login`,`pass`,`active`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=1390;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stuff_personal`
--

LOCK TABLES `stuff_personal` WRITE;
/*!40000 ALTER TABLE `stuff_personal` DISABLE KEYS */;
INSERT INTO `stuff_personal` VALUES (1,'admin','admin',0,1,3,0.00,'','','','','','','',0,'','','','',160,1,0,1,1,0,0,0,0,0,0,1,7,1,1,1,1,1,0,1,1,'','',0,1,1,0,0,1,0,0,1,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,60,15,0,0,1,1,0,0,0,0,0,0,0,0,0,1,1,0,NULL,NULL,0,0,NULL,0,0,0,NULL,1,0,1500,0,0,0,0);
/*!40000 ALTER TABLE `stuff_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stuff_vihoda`
--

DROP TABLE IF EXISTS `stuff_vihoda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stuff_vihoda` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `stuffid` tinyint unsigned NOT NULL,
  `chasi` double(11,2) NOT NULL,
  `comment` char(255) DEFAULT NULL,
  `month` date NOT NULL,
  `koefid` tinyint unsigned NOT NULL,
  `who` char(64) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stuffid` (`stuffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stuff_vihoda`
--

LOCK TABLES `stuff_vihoda` WRITE;
/*!40000 ALTER TABLE `stuff_vihoda` DISABLE KEYS */;
/*!40000 ALTER TABLE `stuff_vihoda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stuff_zarplata`
--

DROP TABLE IF EXISTS `stuff_zarplata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stuff_zarplata` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `stuffid` tinyint unsigned NOT NULL,
  `date` datetime NOT NULL,
  `who` varchar(128) NOT NULL,
  `comment` varchar(256) DEFAULT NULL,
  `month` date NOT NULL,
  `summa` double(20,2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stuff_zarplata`
--

LOCK TABLES `stuff_zarplata` WRITE;
/*!40000 ALTER TABLE `stuff_zarplata` DISABLE KEYS */;
/*!40000 ALTER TABLE `stuff_zarplata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `switch_ip_unnumbered`
--

DROP TABLE IF EXISTS `switch_ip_unnumbered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `switch_ip_unnumbered` (
  `ipunnumberedid` int unsigned NOT NULL AUTO_INCREMENT,
  `swid` int unsigned NOT NULL,
  `port` smallint unsigned NOT NULL DEFAULT '0',
  `vlan` smallint unsigned NOT NULL DEFAULT '0',
  `qnq` smallint unsigned DEFAULT NULL,
  `module_id` tinyint unsigned DEFAULT NULL,
  `slot_id` tinyint unsigned DEFAULT NULL,
  `virtual_ports` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ipunnumberedid`),
  KEY `vlanswid` (`vlan`,`swid`),
  KEY `swid_port` (`swid`,`port`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switch_ip_unnumbered`
--

LOCK TABLES `switch_ip_unnumbered` WRITE;
/*!40000 ALTER TABLE `switch_ip_unnumbered` DISABLE KEYS */;
/*!40000 ALTER TABLE `switch_ip_unnumbered` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `switch_logs`
--

DROP TABLE IF EXISTS `switch_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `switch_logs` (
  `swlogid` bigint unsigned NOT NULL AUTO_INCREMENT,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` bigint unsigned NOT NULL DEFAULT '0',
  `swid` int unsigned NOT NULL,
  `port` varchar(20) NOT NULL,
  `mac` char(17) NOT NULL,
  `vlan` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`swlogid`),
  KEY `time` (`time`),
  KEY `mac` (`mac`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switch_logs`
--

LOCK TABLES `switch_logs` WRITE;
/*!40000 ALTER TABLE `switch_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `switch_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `switch_modules`
--

DROP TABLE IF EXISTS `switch_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `switch_modules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `switch_id` int unsigned NOT NULL,
  `module_id` tinyint unsigned NOT NULL DEFAULT '0',
  `module_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `module_type` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `switch_id_module_id` (`switch_id`,`module_id`) USING BTREE,
  KEY `switchid` (`switch_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switch_modules`
--

LOCK TABLES `switch_modules` WRITE;
/*!40000 ALTER TABLE `switch_modules` DISABLE KEYS */;
INSERT INTO `switch_modules` VALUES (1,1,0,'default',0),(4,2,0,'default',0);
/*!40000 ALTER TABLE `switch_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `switch_opt82_logs`
--

DROP TABLE IF EXISTS `switch_opt82_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `switch_opt82_logs` (
  `logid` int unsigned NOT NULL AUTO_INCREMENT,
  `timedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uid` int unsigned NOT NULL,
  `user_mac` char(17) NOT NULL,
  `vlan` int unsigned NOT NULL,
  `user_port` int unsigned NOT NULL,
  `swid` int unsigned NOT NULL,
  `logtypeid` smallint unsigned NOT NULL,
  `swid_mac` char(17) NOT NULL,
  `switch_circuit_id` varchar(64) NOT NULL,
  `switch_remote_id` varchar(128) CHARACTER SET koi8r COLLATE koi8r_general_ci NOT NULL,
  PRIMARY KEY (`logid`),
  KEY `uid` (`uid`),
  KEY `time` (`timedate`),
  KEY `mac` (`user_mac`),
  KEY `swid` (`swid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switch_opt82_logs`
--

LOCK TABLES `switch_opt82_logs` WRITE;
/*!40000 ALTER TABLE `switch_opt82_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `switch_opt82_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `switch_opt82_logtype`
--

DROP TABLE IF EXISTS `switch_opt82_logtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `switch_opt82_logtype` (
  `logtypeid` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `logtype` char(64) NOT NULL,
  `access` int unsigned NOT NULL,
  PRIMARY KEY (`logtypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=910;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switch_opt82_logtype`
--

LOCK TABLES `switch_opt82_logtype` WRITE;
/*!40000 ALTER TABLE `switch_opt82_logtype` DISABLE KEYS */;
INSERT INTO `switch_opt82_logtype` VALUES (1,'В запросе отсутствует MAC абонента',0),(2,'Нет DHCP-Relay-Circuit-Id или DHCP-Relay-Remote-Id, поиск по MAC',1),(3,'Не обнаружено устройство по MAC',0),(4,'Не обнаружена пара vlan, parent_swid',0),(5,'unnumbered - пользователь найден',1),(6,'autoreg port by MAC - пользователь найден',1),(7,'port, swid, MAC - пользователь найден',1),(8,'регистрация по MAC - пользователь найден',1),(9,'unnumbered - пользователь не найден',0),(10,'autoreg port by MAC - пользователь не найден',0),(11,'port, swid, MAC - пользователь не найден',0),(12,'регистрация по MAC - пользователь не найден',0),(13,'Нет Remote-Id/-Circuit-Id: пользователь по MAC не найден',0),(14,'Регистрация по Vlan+Port',1),(15,'Выдаем IP из пула range в сегменте',1),(16,'свич не найден',0),(17,'Регистрация по mac отключена',0),(18,'найден по mac, порт/устройство не совпадают (opt82)',0),(19,'Наден по MAC - PON/ОНУ',1),(20,'Найден по Serial - PON/ОНУ',1),(21,'Привязка к порту отключена, поиск по MAC',0),(22,'Устройство не найдено, поиск по MAC',0),(23,'Не удалось разобрать Option82, поиск по МАС',0),(24,'Найден по swid + port',1),(25,'Найден по vlan + port + mac',1),(26,'dhcp strict: не совпадение',0),(27,'Найден по устройству абонента(MAC)',1),(28,'Найден по устройству абонента(Serial)',1),(30,'Найден по MAC',1),(31,'Найден по SVLAN + CVLAN (QinQ)',1);
/*!40000 ALTER TABLE `switch_opt82_logtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `switch_pon_logs`
--

DROP TABLE IF EXISTS `switch_pon_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `switch_pon_logs` (
  `swplgid` bigint unsigned NOT NULL AUTO_INCREMENT,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `swid` int unsigned NOT NULL,
  `ont` varchar(17) NOT NULL,
  `rx` double(20,2) NOT NULL,
  `tx` double(20,2) NOT NULL,
  `onuid` varchar(17) NOT NULL,
  `distanse` int unsigned NOT NULL,
  `temperature` double(20,2) NOT NULL,
  `uid` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`swplgid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switch_pon_logs`
--

LOCK TABLES `switch_pon_logs` WRITE;
/*!40000 ALTER TABLE `switch_pon_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `switch_pon_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `switch_port_dead`
--

DROP TABLE IF EXISTS `switch_port_dead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `switch_port_dead` (
  `swdeadportid` int unsigned NOT NULL AUTO_INCREMENT,
  `swid` int unsigned NOT NULL,
  `deadport` int unsigned NOT NULL,
  PRIMARY KEY (`swdeadportid`),
  KEY `swid` (`swid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switch_port_dead`
--

LOCK TABLES `switch_port_dead` WRITE;
/*!40000 ALTER TABLE `switch_port_dead` DISABLE KEYS */;
/*!40000 ALTER TABLE `switch_port_dead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `switch_port_grozi`
--

DROP TABLE IF EXISTS `switch_port_grozi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `switch_port_grozi` (
  `grozaid` int unsigned NOT NULL AUTO_INCREMENT,
  `swid` int unsigned NOT NULL,
  `grozaport` int unsigned NOT NULL,
  PRIMARY KEY (`grozaid`),
  KEY `swid` (`swid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switch_port_grozi`
--

LOCK TABLES `switch_port_grozi` WRITE;
/*!40000 ALTER TABLE `switch_port_grozi` DISABLE KEYS */;
/*!40000 ALTER TABLE `switch_port_grozi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `switch_slots`
--

DROP TABLE IF EXISTS `switch_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `switch_slots` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `switch_id` int unsigned NOT NULL DEFAULT '0',
  `slot_id` tinyint unsigned NOT NULL DEFAULT '0',
  `slot_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slot_type` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `switch_id_slot_id` (`switch_id`,`slot_id`) USING BTREE,
  KEY `switchid` (`switch_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switch_slots`
--

LOCK TABLES `switch_slots` WRITE;
/*!40000 ALTER TABLE `switch_slots` DISABLE KEYS */;
INSERT INTO `switch_slots` VALUES (1,1,0,'default',0),(4,2,0,'default',0);
/*!40000 ALTER TABLE `switch_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `switch_status`
--

DROP TABLE IF EXISTS `switch_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `switch_status` (
  `swlid` bigint unsigned NOT NULL AUTO_INCREMENT,
  `devid` int unsigned NOT NULL COMMENT 'swid or nasid',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '0 - swid , 1 - nasid',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL,
  `uptime` varchar(30) NOT NULL,
  `ping` double(20,2) NOT NULL,
  PRIMARY KEY (`swlid`),
  KEY `devid` (`devid`),
  KEY `time` (`time`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='logs uptime devices';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switch_status`
--

LOCK TABLES `switch_status` WRITE;
/*!40000 ALTER TABLE `switch_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `switch_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `switch_status_last`
--

DROP TABLE IF EXISTS `switch_status_last`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `switch_status_last` (
  `devid` int unsigned NOT NULL COMMENT 'switch_id or bras_id',
  `type` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '0 - switch , 1 - bras',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL,
  `uptime` varchar(30) NOT NULL,
  `ping` double(20,2) NOT NULL,
  UNIQUE KEY `devid=>type` (`devid`,`type`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='logs uptime devices';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switch_status_last`
--

LOCK TABLES `switch_status_last` WRITE;
/*!40000 ALTER TABLE `switch_status_last` DISABLE KEYS */;
/*!40000 ALTER TABLE `switch_status_last` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `switch_uplink`
--

DROP TABLE IF EXISTS `switch_uplink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `switch_uplink` (
  `uplinkid` int unsigned NOT NULL AUTO_INCREMENT,
  `swid` int unsigned NOT NULL,
  `port` int unsigned NOT NULL,
  `swiduplink` int unsigned NOT NULL,
  `speed` char(20) NOT NULL DEFAULT '100',
  `type_uplink` tinyint unsigned NOT NULL DEFAULT '0',
  `use_uplink` tinyint unsigned NOT NULL DEFAULT '1',
  `portdst` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uplinkid`),
  KEY `swid` (`swid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=43;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switch_uplink`
--

LOCK TABLES `switch_uplink` WRITE;
/*!40000 ALTER TABLE `switch_uplink` DISABLE KEYS */;
INSERT INTO `switch_uplink` VALUES (1,2,26,0,'1000',1,1,0);
/*!40000 ALTER TABLE `switch_uplink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `switch_vlans`
--

DROP TABLE IF EXISTS `switch_vlans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `switch_vlans` (
  `swvlanid` int unsigned NOT NULL AUTO_INCREMENT,
  `swid` int unsigned NOT NULL,
  `sectorid` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`swvlanid`),
  KEY `sectorid` (`sectorid`),
  KEY `swid` (`swid`),
  KEY `swid-sectorid` (`swid`,`sectorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=13;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switch_vlans`
--

LOCK TABLES `switch_vlans` WRITE;
/*!40000 ALTER TABLE `switch_vlans` DISABLE KEYS */;
/*!40000 ALTER TABLE `switch_vlans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `switche_type`
--

DROP TABLE IF EXISTS `switche_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `switche_type` (
  `swtypeid` smallint NOT NULL AUTO_INCREMENT,
  `devicetypeid` int NOT NULL DEFAULT '1',
  `swtypename` char(128) NOT NULL,
  `numports` char(6) CHARACTER SET koi8r COLLATE koi8r_general_ci NOT NULL DEFAULT '24',
  `snmp_type` tinyint unsigned NOT NULL DEFAULT '1',
  `dont_use_uplink` tinyint unsigned NOT NULL DEFAULT '1',
  `do_check_switch_port` tinyint unsigned NOT NULL DEFAULT '0',
  `do_mac_autoreg_by_radius` tinyint unsigned NOT NULL DEFAULT '0',
  `do_ip_unnumbered` tinyint unsigned NOT NULL DEFAULT '0',
  `use_circut_template` tinyint unsigned NOT NULL DEFAULT '0',
  `circut_template` varchar(64) NOT NULL DEFAULT '',
  `use_unit_find` tinyint unsigned NOT NULL DEFAULT '0',
  `use_module_find` tinyint unsigned NOT NULL DEFAULT '0',
  `strict_dhcp_mode` tinyint unsigned NOT NULL DEFAULT '0',
  `montype` tinyint unsigned NOT NULL DEFAULT '0',
  `cisco` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`swtypeid`),
  KEY `swtypeid-ports` (`swtypeid`,`numports`),
  KEY `swtypename` (`swtypename`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=139;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switche_type`
--

LOCK TABLES `switche_type` WRITE;
/*!40000 ALTER TABLE `switche_type` DISABLE KEYS */;
INSERT INTO `switche_type` VALUES (1,1,'Cisco','24',1,1,0,0,0,0,'',0,0,0,0,0),(2,1,'Summit-200','26',1,1,0,0,0,0,'',0,0,0,0,0);
/*!40000 ALTER TABLE `switche_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `switche_type_types`
--

DROP TABLE IF EXISTS `switche_type_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `switche_type_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switche_type_types`
--

LOCK TABLES `switche_type_types` WRITE;
/*!40000 ALTER TABLE `switche_type_types` DISABLE KEYS */;
INSERT INTO `switche_type_types` VALUES (1,'Switch'),(2,'OLT');
/*!40000 ALTER TABLE `switche_type_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `switches`
--

DROP TABLE IF EXISTS `switches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `switches` (
  `swid` int unsigned NOT NULL AUTO_INCREMENT,
  `nameswitch` char(128) NOT NULL DEFAULT 'switch',
  `swtypeid` smallint DEFAULT NULL,
  `login` char(64) DEFAULT NULL,
  `pass` char(64) DEFAULT NULL,
  `comunity` char(64) NOT NULL DEFAULT 'private',
  `snmpver` tinyint DEFAULT '2',
  `port` int DEFAULT '161',
  `ip` char(16) NOT NULL,
  `telnet` tinyint unsigned NOT NULL DEFAULT '0',
  `address` char(128) DEFAULT NULL,
  `use_snmp` tinyint NOT NULL DEFAULT '0',
  `managed` tinyint NOT NULL DEFAULT '0',
  `app` char(16) NOT NULL,
  `houseid` int unsigned NOT NULL DEFAULT '1',
  `housingid` int unsigned NOT NULL,
  `houseblockid` int unsigned NOT NULL,
  `porch` int unsigned NOT NULL,
  `floor` int unsigned NOT NULL,
  `productnum` char(128) NOT NULL,
  `serialnum` char(128) NOT NULL,
  `firmvarever` char(64) NOT NULL,
  `use_snmp_monitor` tinyint unsigned NOT NULL DEFAULT '0',
  `mac` char(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `use_ssh` tinyint unsigned NOT NULL DEFAULT '0',
  `use_web` tinyint unsigned NOT NULL DEFAULT '0',
  `ssh_port` int unsigned NOT NULL DEFAULT '22',
  `telnet_port` int unsigned NOT NULL DEFAULT '23',
  `web_port` int unsigned NOT NULL DEFAULT '80',
  `external_telnet_url` varchar(64) NOT NULL DEFAULT '',
  `external_ssh_url` varchar(64) NOT NULL DEFAULT '',
  `external_web_url` varchar(64) NOT NULL DEFAULT '',
  `parent_swid` int unsigned NOT NULL DEFAULT '0',
  `qnq` int unsigned NOT NULL DEFAULT '0',
  `swunit` int unsigned NOT NULL DEFAULT '0',
  `swmodule` int unsigned NOT NULL DEFAULT '0',
  `failovergroup` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`swid`),
  KEY `ip` (`ip`),
  KEY `mac` (`mac`),
  KEY `parent` (`parent_swid`),
  KEY `type` (`swtypeid`),
  KEY `parsw` (`swid`,`parent_swid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=80;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switches`
--

LOCK TABLES `switches` WRITE;
/*!40000 ALTER TABLE `switches` DISABLE KEYS */;
INSERT INTO `switches` VALUES (1,'rost-cisco',1,'','','private',2,161,'',1,'',1,1,'',1,0,0,0,0,'','','',0,'',0,0,22,23,80,'','','',0,0,0,0,0),(2,'test-summit',2,'admin','','private',2,161,'192.168.3.2',1,'',1,1,'',1,0,0,0,0,'','','',0,'',0,1,22,23,80,'','','',0,0,0,0,0);
/*!40000 ALTER TABLE `switches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `syslogs`
--

DROP TABLE IF EXISTS `syslogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `syslogs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `host` char(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `facility` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `priority` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `level` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tag` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `program` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `seq` bigint unsigned NOT NULL DEFAULT '0',
  `counter` int NOT NULL DEFAULT '1',
  `fo` datetime DEFAULT NULL,
  `lo` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `datetime` (`datetime`),
  KEY `facility` (`facility`),
  KEY `host` (`host`),
  KEY `priority` (`priority`),
  KEY `program` (`program`),
  KEY `sequence` (`seq`),
  KEY `mdate` (`msg`,`datetime`),
  KEY `msg` (`msg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `syslogs`
--

LOCK TABLES `syslogs` WRITE;
/*!40000 ALTER TABLE `syslogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `syslogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysopts`
--

DROP TABLE IF EXISTS `sysopts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sysopts` (
  `options_id` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysopts`
--

LOCK TABLES `sysopts` WRITE;
/*!40000 ALTER TABLE `sysopts` DISABLE KEYS */;
INSERT INTO `sysopts` VALUES (1);
/*!40000 ALTER TABLE `sysopts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysopts_voip`
--

DROP TABLE IF EXISTS `sysopts_voip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sysopts_voip` (
  `voipid` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `asterisk_spool_path` varchar(64) NOT NULL DEFAULT '/var/spool/asterisk/outgoing',
  `asterisk_channel` varchar(64) NOT NULL DEFAULT 'SIP/Promtelecom/',
  `asterisk_extension` varchar(32) NOT NULL DEFAULT 'anjeybill',
  `asterisk_context` varchar(32) NOT NULL DEFAULT 'anjeybill',
  `asterisk_callerid` varchar(32) NOT NULL DEFAULT 'bill',
  `asterisk_maxretries` varchar(3) NOT NULL DEFAULT '3',
  `asterisk_retrytime` varchar(3) NOT NULL DEFAULT '15',
  `asterisk_waittime` varchar(3) NOT NULL DEFAULT '45',
  `asterisk_priority` varchar(2) NOT NULL DEFAULT '1',
  `asterisk_nummin` varchar(2) NOT NULL DEFAULT '6',
  `asterisk_nummax` varchar(2) NOT NULL DEFAULT '7',
  `asterisk_numlines` varchar(2) NOT NULL DEFAULT '9',
  `asterisk_call_time` varchar(3) NOT NULL DEFAULT '180',
  PRIMARY KEY (`voipid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=92;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysopts_voip`
--

LOCK TABLES `sysopts_voip` WRITE;
/*!40000 ALTER TABLE `sysopts_voip` DISABLE KEYS */;
INSERT INTO `sysopts_voip` VALUES (1,'/var/spool/asterisk/outgoing','SIP/trunkname/','billing','billing','bill','3','15','45','1','6','7','9','180');
/*!40000 ALTER TABLE `sysopts_voip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_options`
--

DROP TABLE IF EXISTS `system_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_options` (
  `key` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AVG_ROW_LENGTH=161;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_options`
--

LOCK TABLES `system_options` WRITE;
/*!40000 ALTER TABLE `system_options` DISABLE KEYS */;
INSERT INTO `system_options` VALUES ('ARP_DO_ETHERS','/sbin/arp -f'),('CLRLINE_CISCO','/opt/freeradius/sbin/clrline'),('CLRLINE_PORTSLAVE','/usr/bin/finger'),('CLRLINE_PPPD','/usr/local/sbin/pppkill'),('COMPANY_NAME','MikBiLL Docker'),('CREATE_SYSTEM','0'),('CREDIT_LIMIT','6000'),('DELIVERY','1'),('DHCPD_PXE_FILE','pxelinux.0'),('DHCPD_RESTART','/bin/systemctl restart dhcpd'),('DHCP_CONF','/etc/dhcp/dhcpd.conf'),('DHCP_PARAM_DDNS_ZONE',''),('DHCP_PARAM_DOMAIN',''),('DHCP_PARAM_DOMAIN_SERV',''),('DHCP_USE_PXE','0'),('DHCPonuoneport','0'),('DISABLE_DHCP','1'),('DISABLE_DHCP_SYSLOG','0'),('DNS_LOCAL_FILE_ARPA_ZONE','/etc/bind/master/0.10.inaddr.arpa'),('DNS_LOCAL_FILE_ZONE','/etc/bind/master/newline.loc'),('DO_LOG','1'),('ECHO','/bin/echo'),('ETHERS_FILE','/etc/ethers'),('GB','1048576'),('IPROUTE_IP','/sbin/ip'),('IPROUTE_TC','/sbin/tc'),('IP_SENTINEL_CONF','/etc/ip-sentinel.cfg'),('IP_SENTINEL_RESTART','/etc/rc.d/init.d/ip-sentinel restart'),('LOG_FILE','/var/bill/logs/mbcore/mbcore.log'),('MAIL_BASE','/home/vmail'),('MAIL_DOMAIN','test.com'),('MBYTE','1048576'),('NAMED_RESTART','/etc/init.d/named restart'),('NET_VPN',''),('RNKB_login_prio','2'),('RNKB_numdogovor_prio','3'),('RNKB_uid_prio','1'),('SE100HTTPRedirProfBlocked','URL-BLOCKED'),('SE100HTTPRedirProfNegBal','URL-NEGBAL'),('SE100RedirForPolBlocked','in:FWPOL-BLOCKED-REDIRECT'),('SE100RedirForPolNegBal','in:FWPOL-NEGBAL-REDIRECT'),('SE100ServiceAction','DE-ACTIVATE'),('SE100ServiceName','service_inet'),('SE100ipoe_HTTPRedirProfBlocked',''),('SE100ipoe_HTTPRedirProfNegBal',''),('SE100ipoe_RedirForPolBlocked',''),('SE100ipoe_RedirForPolNegBal',''),('SE100ipoe_ServiceAction',''),('SE100ipoe_ServiceName',''),('SE100ipoe_useshaper','0'),('SE100pppauthnomoney','1'),('SE100useshaper','0'),('SPEED_CHANEL_IN','1200120'),('SPEED_CHANEL_OUT','1200120'),('SUDO_DHCPDRELOAD','0'),('SUDO_RADRELOAD','0'),('TRAF_LIST','./db/traf/'),('TYME_login_prio','2'),('TYME_numdogovor_prio','3'),('TYME_uid_prio','1'),('UE','грн'),('USER_LIST','./db/usrlist'),('USE_BLACK_LIST','0'),('USE_CARDS','0'),('USE_admins_kick_users','1'),('USE_languard','0'),('USE_link_IP_MAC','0'),('abank_debug_on','0'),('abank_link_with_dealer','0'),('abank_login','0'),('abank_network',''),('abank_numdogovor','0'),('abank_on','0'),('abank_payer_info_new','0'),('abank_procent','0'),('abank_uid','1'),('abank_use_bank_details','0'),('absebbankas_on','0'),('absebbankas_procent','0'),('accel_dns_sub_first',''),('accel_dns_sub_id','0'),('accel_dns_sub_ipset',''),('accel_dns_sub_on','0'),('accel_dns_sub_second',''),('accel_ipoe_real_mask','24'),('accel_parse_opt_82','0'),('accel_send_l4_ip','0'),('accel_unkn_session_timeout','300'),('accel_usdev_ipset','userdev'),('accel_use_sector_dns','0'),('accel_use_sector_gw_mask','1'),('add_user_packet_float_on','0'),('add_user_packet_float_type','1'),('address_suggestion_on','0'),('admin_gui_templateid','0'),('adv_mik_shaper','1'),('alfabankru_api_password',''),('alfabankru_api_username',''),('alfabankru_debug_on','0'),('alfabankru_on','0'),('alfabankru_procent','1'),('alfabankru_redirect_url',''),('alfabankru_return_url',''),('alfabankru_test','0'),('alltime24_network','0.0.0.0/0'),('ap_client_logs_on','0'),('ap_client_logs_timeout','300'),('api_network','0.0.0.0/0'),('api_on','0'),('api_secret_key',''),('api_sign_on','0'),('api_us_pon_debug','0'),('api_us_pon_demo','0'),('api_us_pon_enabled','0'),('api_us_pon_host',''),('api_us_pon_key',''),('atol_debug','0'),('atol_email',''),('atol_inn',''),('atol_item_name',''),('atol_login',''),('atol_on','0'),('atol_pass',''),('atol_payment_address',''),('atol_payments_type','1'),('auto_close_limit_by_deposit','0'),('auto_local_ip','1'),('auto_log_auth_days','30'),('auto_log_clear','1'),('auto_log_dhcp_days','7'),('auto_log_dhcp_mikbill_days','7'),('auto_log_sessions_months','6'),('auto_log_sessions_unknown','0'),('auto_log_sql_clear','1'),('auto_log_switch_log_days','0'),('auto_vpn_ip','1'),('autogen_login_length','8'),('autogen_login_type','uid'),('awk','/bin/awk'),('baltica_bank_login','1'),('baltica_bank_login_prio','2'),('baltica_bank_uid','1'),('baltica_bank_uid_prio','1'),('barcode_on','0'),('barcode_templ',''),('base_ip','10'),('brasacctreopen','0'),('builtin_clearportsdd','1'),('builtin_cyclecleaning','1'),('builtin_installments','1'),('builtin_pending','1'),('builtin_queue','1'),('builtin_statbalance','1'),('builtin_ticketsstatus','1'),('builtin_timecredit','1'),('card_hide_cellphone','0'),('card_hide_date_birth','0'),('card_hide_e_mail','0'),('card_hide_gender','0'),('card_hide_home_phone','0'),('card_hide_pass_date','0'),('card_hide_pass_inn','0'),('card_hide_pass_propiska','0'),('card_hide_pass_serie','0'),('card_hide_pass_vidan','0'),('card_hide_passport','0'),('card_hide_sms','0'),('casr_dhcp_session_time1','300'),('casr_dhcp_session_time2','300'),('casr_idle_timeout','3600'),('casr_timeout_direction','inbound'),('ciscoasr_blok_service','MBDISABLEDINET'),('ciscoasr_debt_service','MBNOMONEY'),('ciscoasr_del_service','MBDELETED'),('ciscoasr_frez_service','MBFREEZE'),('ciscoasr_garden_service','MBOPENGARDEN'),('ciscoasr_inet_service','MBINTERNET'),('ciscoasr_otkl_service','MBOTKL'),('ciscoasr_unkn_service','MBUNKNOWN'),('ciscoasr_unkn_sess_timeout','300'),('citypay_login','1'),('citypay_login_prio','2'),('citypay_network',''),('citypay_network2',''),('citypay_procent',''),('citypay_uid','1'),('citypay_uid_prio','1'),('citypaypr_debug_on','0'),('citypaypr_login','1'),('citypaypr_login_prio','2'),('citypaypr_network',''),('citypaypr_numdogovor','1'),('citypaypr_numdogovor_prio','3'),('citypaypr_on','0'),('citypaypr_procent','1'),('citypaypr_uid','1'),('citypaypr_uid_prio','1'),('ckassa_login','1'),('ckassa_login_prio','2'),('ckassa_network',''),('ckassa_next_url',''),('ckassa_numdogovor','1'),('ckassa_numdogovor_prio','3'),('ckassa_on','0'),('ckassa_password',''),('ckassa_procent','0'),('ckassa_provider_code',''),('ckassa_uid','1'),('ckassa_uid_prio','1'),('click_debug_on','0'),('click_merchant_id',''),('click_merchant_user_id',''),('click_on','0'),('click_procent','1'),('click_secret_key',''),('click_service_id',''),('compay_login','1'),('compay_login_prio','2'),('compay_numdogovor','0'),('compay_numdogovor_prio','3'),('compay_procent',''),('compay_secret',''),('compay_uid','1'),('compay_uid_prio','1'),('create_payment_on_user_blocked','0'),('create_ticket_blocked','0'),('create_ticket_blocked_category','1'),('create_ticket_blocked_days','0'),('create_ticket_blocked_priority','2'),('create_ticket_blocked_staffid','0'),('create_ticket_freezed','0'),('create_ticket_freezed_category','0'),('create_ticket_freezed_days','180'),('create_ticket_freezed_priority','1'),('create_ticket_freezed_staffid','0'),('create_ticket_offline','0'),('create_ticket_offline_category','0'),('create_ticket_offline_days','21'),('create_ticket_offline_priority','1'),('create_ticket_offline_staffid','0'),('creditpilot_login_prio','2'),('creditpilot_numdogovor_prio','3'),('creditpilot_uid_prio','1'),('crpsouth_login','1'),('crpsouth_login_prio','2'),('crpsouth_numdogovor','1'),('crpsouth_numdogovor_prio','3'),('crpsouth_on','0'),('crpsouth_percent','0'),('crpsouth_uid','1'),('crpsouth_uid_prio','1'),('cyberplat_login_prio','2'),('cyberplat_numdogovor_prio','3'),('cyberplat_private_passphrase',''),('cyberplat_private_path',''),('cyberplat_public_path',''),('cyberplat_uid_prio','1'),('days_to_delete','30'),('days_to_otkl','60'),('default_lease_time','21600'),('deleted_ippololid',''),('deny_full_delete','1'),('dhcp_do_unknown','0'),('dhcp_unknown_vlan','0'),('disabled_ippololid',''),('do_24nonstop_terminal','0'),('do_arping','1'),('do_citypay_terminal','0'),('do_compay_terminal','0'),('do_del_otkl','1'),('do_easysoft_terminal','0'),('do_elecsnet_terminal','0'),('do_ipoe_hosts_clean','0'),('do_liqpay_terminal','0'),('do_online_unlim','0'),('do_onpay_terminal','0'),('do_osmp_terminal','0'),('do_otkl_dolg','1'),('do_perevod_fixed','1'),('do_ping','1'),('do_privat24_terminal','0'),('do_vlan_opt82','0'),('do_wqiwiru_terminal','0'),('docsis_enabled','0'),('dolgnik_ippololid','1'),('dont_display_framed_ip','0'),('dont_display_local_ip','0'),('drecrypt_encoding',''),('drecrypt_host',''),('drecrypt_infocas_interval','1'),('drecrypt_infocas_on','0'),('drecrypt_infocas_period','1'),('drecrypt_infocas_version','2'),('drecrypt_login',''),('drecrypt_on',''),('drecrypt_password',''),('e_pay_com_ua_login_prio','2'),('e_pay_com_ua_numdogovor_prio','3'),('e_pay_com_ua_uid_prio','1'),('easypay_bank_account',''),('easypay_bank_mfo',''),('easypay_bank_name',''),('easypay_inn',''),('easypay_isp_name',''),('easypay_name',''),('easypay_purpose_name',''),('easypay_purpose_vat','0'),('easypayarm_debug_on','0'),('easypayarm_login','0'),('easypayarm_login_prio','2'),('easypayarm_network','195.250.87.195/32'),('easypayarm_numdogovor','0'),('easypayarm_numdogovor_prio','3'),('easypayarm_on','0'),('easypayarm_token',''),('easypayarm_uid','0'),('easypayarm_uid_prio','1'),('easysoft_cover','0'),('easysoft_default_dealer','0'),('easysoft_link_with_dealer','0'),('easysoft_login','1'),('easysoft_login_prio','2'),('easysoft_netork',''),('easysoft_procent',''),('easysoft_uid','1'),('easysoft_uid_prio','1'),('ekassir_login_prio','2'),('ekassir_numdogovor_prio','3'),('ekassir_uid_prio','1'),('elecsnet_login','1'),('elecsnet_login_prio','2'),('elecsnet_network_1',''),('elecsnet_network_2',''),('elecsnet_network_3',''),('elecsnet_numdogovor_prio','3'),('elecsnet_procent',''),('elecsnet_uid','1'),('elecsnet_uid_prio','1'),('email','test@test.com'),('en_search_cat_of_persons','0'),('en_search_dat_connection','0'),('en_search_multi','1'),('en_search_of_contr_concl','0'),('en_search_passport','0'),('en_search_states','1'),('en_tarif_razresh_minus','0'),('en_ticet_house_auto','0'),('en_uchetka_rezim_ulica_dyn','0'),('exec_radclient','/bin/radclient'),('exec_snmpwalk',''),('familny_cover','0'),('familny_link_with_dealer','0'),('familny_network','0.0.0.0/0'),('fcsistema_cover','0'),('fcsistema_debug_on','0'),('fcsistema_login','1'),('fcsistema_login_prio','2'),('fcsistema_merchant_id',''),('fcsistema_network',''),('fcsistema_numdogovor','1'),('fcsistema_numdogovor_prio','3'),('fcsistema_on','0'),('fcsistema_procent','1'),('fcsistema_provider_id_s',''),('fcsistema_uid','1'),('fcsistema_uid_prio','1'),('final_report_show_connect_amount','0'),('flussonic_api_key',''),('flussonic_debug_on','0'),('flussonic_host',''),('flussonic_on','0'),('flussonic_user_api_key',''),('flussonic_user_api_login',''),('flussonic_user_api_on','0'),('fondy_network','0.0.0.0/0'),('forpost_cabinet',''),('forpost_enabled','0'),('forpost_host',''),('forpost_logging','0'),('forpost_login',''),('forpost_password',''),('freedompay_check_url',''),('freedompay_debug_on','0'),('freedompay_failure_url',''),('freedompay_merchant_id',''),('freedompay_merchant_secret',''),('freedompay_on','0'),('freedompay_procent','1'),('freedompay_result_url',''),('freedompay_success_url',''),('freeradiusapi_key',''),('freeradiusapi_network','0.0.0.0/0'),('freeradiusapi_on','0'),('freeze_custom_days_count','365'),('freeze_custom_days_on','0'),('freeze_custom_period','start'),('freeze_disable_internet','0'),('freeze_do_realip_ap','0'),('freezed_ippololid',''),('generate_pwd_unique','0'),('get_from_online_framed_ip','0'),('get_from_online_local_ip','0'),('gorod_login','1'),('gorod_login_prio','2'),('gorod_numdogovor','1'),('gorod_numdogovor_prio','3'),('gorod_uid','1'),('gorod_uid_prio','1'),('grep','/bin/grep'),('guest_vlan_do','0'),('guest_vlan_id','124'),('guest_vlan_id_block','124'),('guest_vlan_id_del','124'),('guest_vlan_id_freeze','124'),('guest_vlan_id_no_money','124'),('guest_vlan_id_not_current_sector','124'),('guest_vlan_id_otkl','124'),('gui_hide_terminal','0'),('hs_acct_interim_interval','300'),('hs_address_list',''),('hs_do_addrlist','0'),('hs_idle_timeout','30'),('hs_prio','1'),('hs_session_timeout','300'),('hs_speed_in',''),('hs_speed_out',''),('hs_use_queue','0'),('huawei_ne40e_deleted_domain','blocked'),('huawei_ne40e_deleted_filter','ug-blocked'),('huawei_ne40e_disabled_domain','blocked'),('huawei_ne40e_disabled_filter','ug-blocked'),('huawei_ne40e_freezed_domain','blocked'),('huawei_ne40e_freezed_filter','ug-blocked'),('huawei_ne40e_internet_domain','cgnat'),('huawei_ne40e_noip','0'),('huawei_ne40e_nomoney_domain','blocked'),('huawei_ne40e_nomoney_filter','ug-blocked'),('huawei_ne40e_realip_domain',''),('huawei_ne40e_realip_filter',''),('huawei_ne40e_unknown_domain','newuser'),('huawei_ne40e_unknown_enabled','0'),('huawei_ne40e_unknown_filter','ug-newuser'),('huawei_ne40e_unknown_poolid','0'),('huawei_ne40e_unknown_timeout','300'),('ibox_bank_account_id',''),('ibox_bank_login','1'),('ibox_bank_login_prio','2'),('ibox_bank_name',''),('ibox_bank_uid','1'),('ibox_bank_uid_prio','1'),('ibox_iban',''),('ibox_login','1'),('ibox_login_prio','2'),('ibox_numdogovor','0'),('ibox_numdogovor_prio','3'),('ibox_okpo',''),('ibox_provider_name',''),('ibox_uid','1'),('ibox_uid_prio','1'),('ibox_use_subprovider_on','0'),('integra_login','2'),('integra_login_prio','2'),('integra_network',''),('integra_numdogovor','1'),('integra_numdogovor_prio','3'),('integra_on','0'),('integra_percent','0'),('integra_uid','1'),('integra_uid_prio','1'),('invoice_country_code','UA'),('invoice_date_format','d.m.Y'),('invoice_pvm_type','PVM1'),('invoice_pvm_value','18'),('invoice_revers_deposit_at_start','0'),('ipay_debug_on','0'),('ipay_key_nonmasterpass',''),('ipay_login_prio','2'),('ipay_numdogovor_prio','3'),('ipay_uid','1'),('ipay_uid_prio','1'),('iptvportal_login','login'),('iptvportal_on','0'),('iptvportal_pass','pass'),('iptvportal_subdomain','url'),('isbank_action_url','https://spos.isbank.com.tr/fim/est3Dgate'),('isbank_client_id',''),('isbank_on','0'),('isbank_redirect_url',''),('isbank_result_url',''),('isbank_store_key',''),('junv2Poolname','IPoE-Pool'),('junv2_dns_sub_first',''),('junv2_dns_sub_id','0'),('junv2_dns_sub_on','0'),('junv2_dns_sub_second',''),('junv2_dns_sub_service',''),('junv2kbshaper','1'),('junv2searchdevice','0'),('junv2sectorsettings','0'),('junv2servicebasic','svc-inet-profile'),('junv2servicedebtors','svc-nomaney-profile'),('junv2servicedeleteds','svc-nomaney-profile'),('junv2servicedisableds','svc-nomaney-profile'),('junv2servicefreezeds','svc-nomaney-profile'),('junv2serviceunknowns','svc-nomaney-profile'),('junv2usePPPv2','1'),('junv2usecoastate','0'),('junv2usecoatarif','1'),('junv2useshaper','1'),('kaspi_debug_on','0'),('kaspi_login','1'),('kaspi_login_prio','2'),('kaspi_network',''),('kaspi_numdogovor','1'),('kaspi_numdogovor_prio','3'),('kaspi_on','0'),('kaspi_procent','1'),('kaspi_uid','1'),('kaspi_uid_prio','1'),('kernelusecoa','0'),('kirovskpochta_debug_on','0'),('kirovskpochta_login','1'),('kirovskpochta_login_prio','2'),('kirovskpochta_numdogovor','1'),('kirovskpochta_numdogovor_prio','3'),('kirovskpochta_on','0'),('kirovskpochta_procent','0'),('kirovskpochta_secret',''),('kirovskpochta_uid','1'),('kirovskpochta_uid_prio','1'),('komtet_bughtypeid_40_on','0'),('komtet_bughtypeid_40_print_check','0'),('komtet_bughtypeid_40_queue_id',''),('komtet_bughtypeid_77_on','0'),('komtet_bughtypeid_77_print_check','0'),('komtet_bughtypeid_77_queue_id',''),('komtet_debug','0'),('komtet_email',''),('komtet_on','0'),('komtet_order_name',''),('komtet_print_check','1'),('komtet_queue_id_kassa',''),('komtet_queue_id_online',''),('komtet_shop_id',''),('komtet_shop_secret',''),('komtet_sno','0'),('komtet_vat','0'),('lifecell_easypay_cover','0'),('lifecell_easypay_default_dealer','0'),('lifecell_easypay_link_with_deale','0'),('lifecell_easypay_login','1'),('lifecell_easypay_login_prio','2'),('lifecell_easypay_network',''),('lifecell_easypay_numdogovor','1'),('lifecell_easypay_numdogovor_prio','3'),('lifecell_easypay_on','0'),('lifecell_easypay_procent','1'),('lifecell_easypay_uid','1'),('lifecell_easypay_uid_prio','1'),('lifecell_easypay_use_bank_detail','1'),('liqpay_curency',''),('liqpay_kommiss_on','0'),('liqpay_kommiss_percent','0'),('liqpay_network','0.0.0.0/0'),('liqpay_v3','0'),('luminorbank_on','0'),('luminorbank_procent','0'),('mac_autoreg','0'),('mac_autoreg_accel','0'),('mac_autoreg_always','0'),('mac_autoupdate_accel','1'),('mask_cellphone',''),('mask_cellphone_use','0'),('mask_phone_sms',''),('mask_series_and_number',''),('mask_series_and_number_use','0'),('mask_sms_phone_use','0'),('max_lease_time','864000'),('maxima_on','0'),('maxima_procent','0'),('mbp_graph_cpu','1'),('mbp_graph_ram','1'),('mbp_ping_bras','1'),('mbp_ping_devices','1'),('megogo_on','0'),('merc_sign',''),('merc_sign_other',''),('merchant_id',''),('mfisoft_date_format','Y-m-d H:i:s'),('mfisoft_filter_fiz_person','1'),('mfisoft_filter_legal_person','1'),('mfisoft_filter_person_on','0'),('mik_pcq_turbo','0'),('mikrotik_only_pass','0'),('mkb_login_prio','2'),('mkb_numdogovor_prio','3'),('mkb_uid_prio','1'),('monobank_debug_on','0'),('monobank_login','1'),('monobank_login_prio','2'),('monobank_network',''),('monobank_numdogovor','1'),('monobank_numdogovor_prio','3'),('monobank_on','0'),('monobank_procent','0'),('monobank_uid','1'),('monobank_uid_prio','1'),('moovitv_login',''),('moovitv_on','0'),('moovitv_password',''),('mrtg_exec_prog','/usr/bin/php -q /var/www/mikbill/admin/index.php'),('mrtg_on','1'),('mrtg_path_data','/var/mikbill/prod/mrtg'),('mrtg_tarifs_conf','/etc/mrtg/mrtg_tarif.conf'),('mrtg_threads','2'),('mrtg_users_conf','/etc/mrtg/mrtg_users.conf'),('mysqld_path','/bin/systemctl restart mysql'),('nagra_debug','0'),('nagra_on','0'),('nkorr_debug_on','0'),('nkorr_login','1'),('nkorr_login_prio','2'),('nkorr_network',''),('nkorr_numdogovor','1'),('nkorr_numdogovor_prio','3'),('nkorr_on','0'),('nkorr_procent','0'),('nkorr_uid','1'),('nkorr_uid_prio','1'),('nokia_deleted_msap_id','0'),('nokia_deleted_msap_iface',''),('nokia_deleted_policy',''),('nokia_deleted_sla_profile',''),('nokia_dhcp_lease','300'),('nokia_disabled_msap_id','0'),('nokia_disabled_msap_iface',''),('nokia_disabled_policy',''),('nokia_disabled_sla_profile',''),('nokia_freeze_msap_id','0'),('nokia_freeze_msap_iface',''),('nokia_freeze_sla_profile',''),('nokia_freezee_policy',''),('nokia_nomoney_msap_id','0'),('nokia_nomoney_msap_iface',''),('nokia_nomoney_policy',''),('nokia_nomoney_sla_profile',''),('nokia_normal_msap_id','0'),('nokia_normal_msap_iface',''),('nokia_normal_policy',''),('nokia_normal_vsa',''),('nokia_realip_gw',''),('nokia_realip_mask','24'),('nokia_realip_msap_id','0'),('nokia_realip_msap_iface',''),('nokia_realip_policy',''),('nokia_realip_vsa',''),('nokia_unknown_allowed','0'),('nokia_unknown_dns_primary','1.1.1.1'),('nokia_unknown_dns_secondary','4.2.2.2'),('nokia_unknown_msap_id','0'),('nokia_unknown_msap_iface',''),('nokia_unknown_policy',''),('nokia_unknown_poolid','0'),('nokia_unknown_sla_profile',''),('nokia_unknown_timeout','300'),('nonstop_key','0'),('nonstop_max_amount','1000'),('nonstop_min_amount','1'),('nonstop_procent','0.000'),('nonstop_service_id_login','2'),('nonstop_service_id_numdogovor','3'),('nonstop_service_id_uid','1'),('not_clear_port_for_deleted','1'),('not_clear_port_for_disabled','1'),('notes_user_style','0'),('novakom_code_c','1'),('novakom_code_firme',''),('novakom_code_plat','0'),('novakom_on','0'),('novakom_procent','0'),('olltv_domain',''),('olltv_on','0'),('omegatv_on','0'),('omegatv_private_key',''),('omegatv_public_key',''),('omnicell_enabled','0'),('omnicell_logging','0'),('omnicell_login',''),('omnicell_network',''),('omnicell_otplife','60'),('omnicell_password',''),('omnicell_secret',''),('omnicell_testing','0'),('online_timeout','400'),('only_one_online','0'),('only_one_online_action','Accept'),('onpay_ccy',''),('onpay_login',''),('onpay_procent',''),('onpay_secret',''),('onpay_url_success',''),('options_id','1'),('osmp_bank_login','1'),('osmp_bank_login_prio','2'),('osmp_bank_uid','1'),('osmp_bank_uid_prio','1'),('osmp_debug_on','0'),('osmp_key',''),('osmp_login','1'),('osmp_login_prio','2'),('osmp_numdogovor','0'),('osmp_numdogovor_prio','3'),('osmp_offset_value','0'),('osmp_procent','5'),('osmp_time_offset_on','0'),('osmp_uid','1'),('osmp_uid_prio','1'),('payberry_login_prio','2'),('payberry_numdogovor_prio','3'),('payberry_uid_prio','1'),('paykeeper_debug_on','0'),('paykeeper_network','0.0.0.0/0'),('paymaster_MrchID',''),('paymaster_network',''),('paymaster_on','0'),('paymaster_procent','0'),('paymaster_secretkey',''),('paymaster_test','0'),('payme_api_key',''),('payme_debug_on','0'),('payme_fail_redirect',''),('payme_merchant_id',''),('payme_on','0'),('payme_procent','1'),('payme_store_id',''),('payme_success_redirect',''),('payme_test_on','0'),('payment_bonus_type1','0'),('paymo_api_key',''),('paymo_debug_on','0'),('paymo_fail_redirect',''),('paymo_on','0'),('paymo_procent','1'),('paymo_store_id',''),('paymo_success_redirect',''),('paymo_test_on','0'),('paynet_debug','0'),('paynet_login','1'),('paynet_login_prio','2'),('paynet_network',''),('paynet_numdogovor','1'),('paynet_numdogovor_prio','3'),('paynet_on','0'),('paynet_password',''),('paynet_uid','1'),('paynet_uid_prio','1'),('paynet_username',''),('paysera_on','0'),('paysera_procent','1'),('paysera_project_id',''),('paysera_sign_password',''),('paysoft_MrchID',''),('paysoft_network',''),('paysoft_on','0'),('paysoft_procent','0'),('paysoft_secretkey',''),('paysoft_test','0'),('perevod_summa','0.5'),('perlas_on','0'),('perlas_procent','0'),('personal_area_address_type','0'),('phone_pay',''),('platezhka_cover','0'),('platezhka_network','62.149.15.210/32'),('platezhka_search_login','1'),('platezhka_search_login_prio','1'),('platezhka_search_numdogovor','0'),('platezhka_search_numdogovor_prio','3'),('platezhka_search_uid','1'),('platezhka_search_uid_prio','2'),('platika_login_prio','2'),('platika_numdogovor_prio','3'),('platika_uid_prio','1'),('platon_api_key',''),('platon_api_password',''),('platon_debug_on','0'),('platon_on',''),('platon_procent','1'),('platon_success_url',''),('pluspay_debug_on','0'),('pluspay_login','1'),('pluspay_login_prio','2'),('pluspay_network',''),('pluspay_numdogovor','1'),('pluspay_numdogovor_prio','3'),('pluspay_on','0'),('pluspay_procent','1'),('pluspay_uid','1'),('pluspay_uid_prio','1'),('pmon_key',''),('pmon_network','0.0.0.0/0'),('pmon_on','0'),('potmone_login_prio','2'),('potmone_numdogovor_prio','3'),('potmone_uid_prio','1'),('privat24_procent','0'),('privat_pay_acc_login_prio','2'),('privat_pay_acc_numdogovor_prio','3'),('privat_pay_acc_oshadbank','0'),('privat_pay_acc_uid_prio','1'),('privat_v2_coefficient_on','0'),('privat_v2_coefficient_size','1'),('privat_v2_deposit_inverse','1'),('privat_v2_lk','0'),('privat_v2_login','1'),('privat_v2_numdogovor','1'),('privat_v2_payer_info_new','0'),('privat_v2_static_token',''),('privat_v2_uid','1'),('prometheus_key',''),('prometheus_network','0.0.0.0/0'),('prometheus_on','0'),('prostotv_login',''),('prostotv_on','0'),('prostotv_password',''),('psbank_backref',''),('psbank_comp1',''),('psbank_comp2',''),('psbank_debug_on','0'),('psbank_desc','Internet'),('psbank_email',''),('psbank_login','0'),('psbank_login_prio','2'),('psbank_merch_name',''),('psbank_merchant','0'),('psbank_network','127.0.0.1'),('psbank_notify',''),('psbank_numdogovor','0'),('psbank_numdogovor_prio','3'),('psbank_on','0'),('psbank_terminal','0'),('psbank_testing','0'),('psbank_uid','0'),('psbank_uid_prio','1'),('pscb_MrchKey',''),('pscb_debug_on','0'),('pscb_marketPlace',''),('pscb_on','0'),('pscb_test','0'),('qiwi_debug_on','0'),('qiwi_network','0.0.0.0/0'),('qiwi_on','0'),('qiwi_procent','1'),('qiwi_public_key',''),('qiwi_site_id',''),('qrcode_on','0'),('qrcode_templ',''),('radiusd_path','/bin/systemctl restart radiusd'),('real_ip_buy_cena','0'),('real_ip_clear_del_on','1'),('real_ip_clear_otkl_on','1'),('real_ip_disable_cena','0'),('real_ip_link_with_packet_type','1'),('reeves_currency','USD'),('reeves_debug_on','0'),('reeves_language','ru'),('reeves_network',''),('reeves_notification_url',''),('reeves_on','0'),('reeves_procent','1'),('reeves_public_key',''),('reeves_return_url',''),('reeves_secret_key',''),('reeves_shop_id',''),('reeves_test_on','0'),('rentsoft_ag_name',''),('rentsoft_on','0'),('rentsoft_percent','0'),('rentsoft_secret',''),('reports_deleted_day_outflow','90'),('reports_deleted_on','0'),('reports_outflow_day_sleep','30'),('reports_outflow_on','0'),('reports_sleep_day_not_online','15'),('reports_sleep_on','0'),('required_gender','0'),('required_pasport_date_resive','0'),('required_pasport_inn','0'),('required_pasport_registration','0'),('required_pasport_serie','0'),('required_who_and_where_issued','0'),('revolut_access_token',''),('revolut_client',''),('revolut_debug','0'),('revolut_domain',''),('revolut_oauth_code',''),('revolut_on','0'),('revolut_private_key',''),('revolut_refresh_token',''),('revolut_testing','0'),('rncb_v1_debug_on','0'),('rncb_v1_login','1'),('rncb_v1_login_prio','2'),('rncb_v1_network',''),('rncb_v1_numdogovor','1'),('rncb_v1_numdogovor_prio','3'),('rncb_v1_on','0'),('rncb_v1_procent','1'),('rncb_v1_uid','1'),('rncb_v1_uid_prio','1'),('rnkb_site_filter_on','0'),('rnkb_site_login_prio','1'),('rnkb_site_numdogovor_prio','2'),('rnkb_site_uid_prio','3'),('rnkb_soap_debug_on','0'),('rnkb_soap_login','1'),('rnkb_soap_login_prio','2'),('rnkb_soap_network',''),('rnkb_soap_numdogovor','1'),('rnkb_soap_numdogovor_prio','3'),('rnkb_soap_on','0'),('rnkb_soap_procent','1'),('rnkb_soap_uid','1'),('rnkb_soap_uid_prio','1'),('robokassa_order_name',''),('robokassa_sno','osn'),('robokassa_tax','none'),('sberbank_russia_login_prio','2'),('sberbank_russia_numdogovor_prio','3'),('sberbank_russia_uid_prio','1'),('sberbankru2826_login_prio','2'),('sberbankru2826_numdogovor_prio','3'),('sberbankru2826_uid_prio','1'),('sberbankru_login_prio','2'),('sberbankru_numdogovor_prio','3'),('sberbankru_uid_prio','1'),('sberbankrumrch_bundle_city',''),('sberbankrumrch_bundle_country',''),('sberbankrumrch_bundle_on','0'),('sberbankrumrch_bundle_post_address',''),('sberbankruv1_debug_on','0'),('sberbankruv1_login','1'),('sberbankruv1_login_prio','2'),('sberbankruv1_network',''),('sberbankruv1_numdogovor','1'),('sberbankruv1_numdogovor_prio','3'),('sberbankruv1_on','0'),('sberbankruv1_procent','1'),('sberbankruv1_uid','1'),('sberbankruv1_uid_prio','1'),('sberbankruv2_debug_on','0'),('sberbankruv2_login','1'),('sberbankruv2_login_prio','2'),('sberbankruv2_network',''),('sberbankruv2_numdogovor','1'),('sberbankruv2_numdogovor_prio','3'),('sberbankruv2_on','0'),('sberbankruv2_procent','1'),('sberbankruv2_uid','1'),('sberbankruv2_uid_prio','1'),('send_accl_dolg_ipset','0'),('send_accl_frez_ipset','0'),('send_accl_unkn_ipset','0'),('shaper_dev_in','imq0'),('shaper_dev_out','imq1'),('shaper_koef','1024'),('simplepay_hashAlgo','SHA256'),('simplepay_on','0'),('simplepay_percent','0'),('simplepay_secretKey',''),('simplepay_secretKeyRes',''),('simplepay_shopID',''),('skat_default_service',''),('skat_deleted_policing',''),('skat_deleted_service',''),('skat_dhcp_lease','3600'),('skat_dhcp_use_sector_mask','0'),('skat_disabled_policing',''),('skat_disabled_service',''),('skat_freeze_policing',''),('skat_freeze_service',''),('skat_internet_service',''),('skat_nointernet_policing',''),('skat_nointernet_service',''),('skat_nomoney_policing',''),('skat_nomoney_service',''),('skysend_debug_on','0'),('skysend_login','1'),('skysend_login_prio','2'),('skysend_network',''),('skysend_numdogovor','1'),('skysend_numdogovor_prio','3'),('skysend_on','0'),('skysend_procent','0'),('skysend_uid','1'),('skysend_uid_prio','1'),('smotreshka_domain_login','0'),('smotreshka_on','0'),('sms_gateway_transactional','0'),('sms_info_uid','0'),('smtphost','localhost'),('smtplogin','test@test.com'),('smtppass','test'),('smtpport','25'),('smtpssl','1'),('sormuz_date_format','Y-m-d H:i:s'),('sormuz_filter_fiz_person','0'),('sormuz_filter_legal_person','0'),('sormuz_filter_on','0'),('sormuz_filter_person_on','0'),('sormuz_key','0123456789'),('sormuz_on','0'),('sormuz_region_id','1'),('sormuz_zip_code','100000'),('sotas_login_prio','2'),('sotas_numdogovor_prio','3'),('sotas_uid_prio','1'),('speed_mbit_on','1'),('ssh_path','/usr/bin/ssh'),('stalkerportal_on','1'),('start_credit_date','1'),('start_credit_procent_date','7'),('statfromadmin_enabled','0'),('statfromadminurl',''),('stop_all_credit','15'),('stop_credit_date','7'),('stop_credit_procent_date','15'),('strict_dhcp_mode','0'),('sudo','/usr/bin/sudo -u root'),('swedbank_on','0'),('swedbank_procent','0'),('tarif_chesniy_perehod','0'),('tarif_perevod_vniz','0'),('tarif_perevod_vverh','0'),('terminal_2click_max_amount','99999'),('terminal_2click_min_amount','1'),('terminal_2click_on','0'),('terminal_2click_procent','0'),('terminal_2click_secret','1234567890'),('terminal_2click_service_id_login','2'),('terminal_2click_service_id_numdogovor','3'),('terminal_2click_service_id_uid','1'),('terminal_api_noblock','0'),('tickets_show_address_filter','0'),('tinkoff_kommiss_percent','0'),('tinkoff_on','0'),('tinkoff_percent','0'),('tinkoff_secret_key',''),('tinkoff_terminal_key',''),('trinity_on','0'),('trinity_partnerID','0'),('trinity_salt',''),('trueip_def_sip_concierge','7000'),('trueip_def_sip_ip','127.0.0.1'),('trueip_def_sip_port','5060'),('trueip_on','0'),('turbo_buy_cena','0'),('turbo_speed','0'),('tvcom_debug','0'),('tvcom_on','0'),('tvcom_token',''),('ukrpays_debug_on','0'),('ukrpays_lang','uk'),('ukrpays_theme','default'),('unfreeze_always_pay_ap','0'),('unfreeze_earlier_minimum_period','standard'),('uniteller_debug_on','0'),('uniteller_test','0'),('upay_debug_on','0'),('upay_login','1'),('upay_login_prio','2'),('upay_network',''),('upay_numdogovor','1'),('upay_numdogovor_prio','3'),('upay_on','0'),('upay_password',''),('upay_uid','1'),('upay_uid_prio','1'),('url_result',''),('url_server',''),('us_network','0.0.0.0/0'),('use_accl_block_pool','0'),('use_accl_coa','0'),('use_accl_frez_on','0'),('use_accl_speed_dolg','0'),('use_accl_speed_frez','0'),('use_accl_speed_unkn','0'),('use_accl_unk_pool','0'),('use_accl_user_devices','0'),('use_ciscoasr_coa','1'),('use_deleted_ippool','0'),('use_disabled_ippool','0'),('use_dolg_ippool','1'),('use_freezed_ippool','0'),('use_pscb','0'),('user_card_legal_hide_1c_code','0'),('user_card_legal_hide_booker','0'),('user_card_legal_hide_contact_person','0'),('user_card_legal_hide_director','0'),('user_card_legal_hide_email','0'),('user_card_legal_hide_fax','0'),('user_card_legal_hide_numdogovor','0'),('user_card_legal_hide_phone','0'),('users_card_show_deposit_bonus','0'),('uzumbank_debug_on','0'),('uzumbank_login','1'),('uzumbank_login_prio','2'),('uzumbank_network',''),('uzumbank_numdogovor','1'),('uzumbank_numdogovor_prio','3'),('uzumbank_on','0'),('uzumbank_password',''),('uzumbank_uid','1'),('uzumbank_uid_prio','1'),('uzumbank_username',''),('vasexperts_filter_packet_inverse','0'),('vasexperts_filter_packet_on','0'),('vasexperts_filter_sub_inverse','0'),('vasexperts_filter_sub_on','0'),('vasexperts_filter_uid_inverse','0'),('vasexperts_filter_uid_on','0'),('vienasaskaita_on','0'),('vienasaskaita_procent','0'),('vpru_login_prio','1'),('vpru_numdogovor_prio','2'),('vpru_uid_prio','3'),('webkassa_api_key',''),('webkassa_debug','0'),('webkassa_item_name','Интернет'),('webkassa_kassa_id','0'),('webkassa_login',''),('webkassa_on','0'),('webkassa_password',''),('webkassa_tax_percent','12'),('webkassa_tax_type','100'),('webkassa_testing','0'),('wink_login',''),('wink_network',''),('wink_on','0'),('wink_partner_region_id',''),('wink_pasword',''),('wink_prefix_ott','rr'),('wqiwiru_procent',''),('wqiwiru_secret',''),('wqiwiru_shop_id',''),('xplat_login_prio','2'),('xplat_numdogovor_prio','3'),('xplat_uid_prio','1'),('yandex_debug_on','0'),('yapk_login_prio','2'),('yapk_numdogovor_prio','3'),('yapk_uid_prio','1'),('youtv_dealer_id',''),('youtv_login',''),('youtv_on','0'),('youtv_pasword','');
/*!40000 ALTER TABLE `system_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_categories_list`
--

DROP TABLE IF EXISTS `tickets_categories_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_categories_list` (
  `categoryid` int unsigned NOT NULL AUTO_INCREMENT,
  `maincategoryid` int unsigned NOT NULL DEFAULT '0',
  `categoryname` varchar(45) NOT NULL,
  `description` varchar(64) NOT NULL,
  `color` int unsigned NOT NULL DEFAULT '0',
  `req_uid` tinyint unsigned NOT NULL DEFAULT '0',
  `req_fio` tinyint unsigned NOT NULL DEFAULT '0',
  `req_phones` tinyint unsigned NOT NULL DEFAULT '0',
  `req_settlement` tinyint unsigned NOT NULL DEFAULT '0',
  `req_street` tinyint unsigned NOT NULL DEFAULT '0',
  `req_house` tinyint unsigned NOT NULL DEFAULT '0',
  `req_apartment` tinyint unsigned NOT NULL DEFAULT '0',
  `req_porch` tinyint unsigned NOT NULL DEFAULT '0',
  `req_floor` tinyint unsigned NOT NULL DEFAULT '0',
  `req_sector` tinyint unsigned NOT NULL DEFAULT '0',
  `link_to_uid` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`categoryid`),
  KEY `name` (`categoryname`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=51;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_categories_list`
--

LOCK TABLES `tickets_categories_list` WRITE;
/*!40000 ALTER TABLE `tickets_categories_list` DISABLE KEYS */;
INSERT INTO `tickets_categories_list` VALUES (1,0,'other','predefined_category',0,0,0,0,0,0,0,0,0,0,0,0),(2,0,'connection','predefined_category',0,0,0,0,0,0,1,0,0,0,0,1),(3,0,'maintenance','predefined_category',0,0,0,0,0,0,0,0,0,0,0,0),(4,0,'created_in_the_cabinet','predefined_category',0,1,0,0,0,0,0,0,0,0,0,0),(5,0,'cable_is_not_connected','predefined_category',0,1,0,0,0,0,0,0,0,0,0,0),(6,0,'ip_address_conflict','predefined_category',0,1,0,0,0,0,0,0,0,0,0,0),(7,0,'internet_does_not_work','predefined_category',0,1,0,0,0,0,0,0,0,0,0,0),(8,0,'pages_not_open','predefined_category',0,1,0,0,0,0,0,0,0,0,0,0),(9,0,'cable_replacement','predefined_category',0,0,0,0,0,0,0,0,0,0,0,0),(10,0,'does_not_work_the_whole_house','predefined_category',0,0,0,0,0,0,1,0,0,0,0,0),(11,0,'does_not_work_the_whole_sector','predefined_category',0,0,0,0,0,0,0,0,0,0,1,0),(12,0,'configuring_the_router','predefined_category',0,1,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `tickets_categories_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_crews`
--

DROP TABLE IF EXISTS `tickets_crews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_crews` (
  `crewid` int unsigned NOT NULL AUTO_INCREMENT,
  `crewname` varchar(45) NOT NULL,
  PRIMARY KEY (`crewid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_crews`
--

LOCK TABLES `tickets_crews` WRITE;
/*!40000 ALTER TABLE `tickets_crews` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets_crews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_logs`
--

DROP TABLE IF EXISTS `tickets_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_logs` (
  `ticketlogid` int unsigned NOT NULL AUTO_INCREMENT,
  `ticketid` int unsigned NOT NULL,
  `logdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `record` varchar(512) NOT NULL,
  `stuffid` int unsigned NOT NULL,
  PRIMARY KEY (`ticketlogid`),
  KEY `tid` (`ticketid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_logs`
--

LOCK TABLES `tickets_logs` WRITE;
/*!40000 ALTER TABLE `tickets_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_messages`
--

DROP TABLE IF EXISTS `tickets_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_messages` (
  `messageid` int unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ticketid` int unsigned NOT NULL,
  `stuffid` int unsigned NOT NULL,
  `useruid` int unsigned NOT NULL,
  `message` varchar(600) NOT NULL,
  `unread` tinyint unsigned NOT NULL,
  PRIMARY KEY (`messageid`),
  KEY `ticketid` (`ticketid`),
  KEY `tid_sid` (`ticketid`,`stuffid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_messages`
--

LOCK TABLES `tickets_messages` WRITE;
/*!40000 ALTER TABLE `tickets_messages` DISABLE KEYS */;
INSERT INTO `tickets_messages` VALUES (1,'2013-07-19 15:26:13',1,0,1,'what&#63;',1);
/*!40000 ALTER TABLE `tickets_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_notes`
--

DROP TABLE IF EXISTS `tickets_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_notes` (
  `noteid` int unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ticketid` int unsigned NOT NULL,
  `stuffid` int unsigned NOT NULL,
  `note` varchar(600) NOT NULL,
  PRIMARY KEY (`noteid`),
  KEY `tid` (`ticketid`),
  KEY `tnid` (`ticketid`,`noteid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_notes`
--

LOCK TABLES `tickets_notes` WRITE;
/*!40000 ALTER TABLE `tickets_notes` DISABLE KEYS */;
INSERT INTO `tickets_notes` VALUES (1,'2013-07-19 15:26:13',1,0,'what&#63;');
/*!40000 ALTER TABLE `tickets_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_performers`
--

DROP TABLE IF EXISTS `tickets_performers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_performers` (
  `performerid` int unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stuffid` int unsigned NOT NULL,
  `employed_by_stuffid` int unsigned NOT NULL,
  `ticketid` int unsigned NOT NULL,
  PRIMARY KEY (`performerid`),
  KEY `sid` (`stuffid`),
  KEY `tid` (`ticketid`),
  KEY `tsid` (`stuffid`,`ticketid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_performers`
--

LOCK TABLES `tickets_performers` WRITE;
/*!40000 ALTER TABLE `tickets_performers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets_performers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_priorities_types`
--

DROP TABLE IF EXISTS `tickets_priorities_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_priorities_types` (
  `prioritytypeid` int unsigned NOT NULL AUTO_INCREMENT,
  `prioritytypename` varchar(45) NOT NULL,
  PRIMARY KEY (`prioritytypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_priorities_types`
--

LOCK TABLES `tickets_priorities_types` WRITE;
/*!40000 ALTER TABLE `tickets_priorities_types` DISABLE KEYS */;
INSERT INTO `tickets_priorities_types` VALUES (1,'high'),(2,'normal'),(3,'low');
/*!40000 ALTER TABLE `tickets_priorities_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_status_types`
--

DROP TABLE IF EXISTS `tickets_status_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_status_types` (
  `statustypeid` int unsigned NOT NULL AUTO_INCREMENT,
  `statustypename` varchar(45) NOT NULL,
  PRIMARY KEY (`statustypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_status_types`
--

LOCK TABLES `tickets_status_types` WRITE;
/*!40000 ALTER TABLE `tickets_status_types` DISABLE KEYS */;
INSERT INTO `tickets_status_types` VALUES (1,'opened'),(2,'closed'),(3,'in_work'),(4,'performed');
/*!40000 ALTER TABLE `tickets_status_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets_tickets`
--

DROP TABLE IF EXISTS `tickets_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets_tickets` (
  `ticketid` int unsigned NOT NULL AUTO_INCREMENT,
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `performafter` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `performbefore` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `inworkdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `performingdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `order_number` varchar(128) DEFAULT NULL COMMENT 'Внешний номер наряда',
  `inwork_by_stuffid` int unsigned NOT NULL DEFAULT '0',
  `performed_by_stuffid` int unsigned NOT NULL DEFAULT '0',
  `closingdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `closed_by_stuffid` int unsigned NOT NULL DEFAULT '0',
  `useruid` bigint unsigned NOT NULL DEFAULT '0',
  `fio` char(128) NOT NULL DEFAULT '',
  `sectorid` int unsigned NOT NULL DEFAULT '0',
  `street` varchar(45) NOT NULL DEFAULT '',
  `settlementname` varchar(36) NOT NULL DEFAULT '',
  `neighborhoodname` varchar(36) NOT NULL DEFAULT '',
  `house` varchar(20) NOT NULL DEFAULT '',
  `porch` int unsigned NOT NULL DEFAULT '0',
  `floor` int unsigned NOT NULL DEFAULT '0',
  `apartment` varchar(10) NOT NULL DEFAULT '',
  `housingname` varchar(36) NOT NULL DEFAULT '',
  `houseblockname` varchar(36) NOT NULL DEFAULT '',
  `phones` varchar(60) NOT NULL DEFAULT '',
  `created_by_stuffid` int unsigned NOT NULL DEFAULT '0',
  `created_by_useruid` int unsigned NOT NULL DEFAULT '0',
  `categoryid` int unsigned NOT NULL DEFAULT '1',
  `prioritytypeid` int unsigned NOT NULL DEFAULT '1',
  `statustypeid` int unsigned NOT NULL DEFAULT '1',
  `performed_without_on_site_visit` tinyint unsigned NOT NULL DEFAULT '0',
  `can_not_be_performed` tinyint unsigned NOT NULL DEFAULT '0',
  `rating` tinyint unsigned NOT NULL DEFAULT '0',
  `emphasis` tinyint unsigned NOT NULL DEFAULT '0',
  `show_ticket_to_user` tinyint unsigned NOT NULL DEFAULT '0',
  `dialogue` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ticketid`),
  KEY `cat` (`categoryid`),
  KEY `creat` (`creationdate`),
  KEY `prio` (`prioritytypeid`),
  KEY `sd` (`statustypeid`,`creationdate`),
  KEY `sector` (`sectorid`),
  KEY `si` (`statustypeid`,`inworkdate`),
  KEY `uid` (`useruid`),
  KEY `uspristacre` (`useruid`,`prioritytypeid`,`statustypeid`,`creationdate`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets_tickets`
--

LOCK TABLES `tickets_tickets` WRITE;
/*!40000 ALTER TABLE `tickets_tickets` DISABLE KEYS */;
INSERT INTO `tickets_tickets` VALUES (1,'2013-07-19 15:26:13','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL,0,0,'0000-00-00 00:00:00',0,1,'',0,'Lane 1','','','1',0,0,'','','','',0,1,4,2,1,0,0,0,0,1,1);
/*!40000 ALTER TABLE `tickets_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traf_data`
--

DROP TABLE IF EXISTS `traf_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `traf_data` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `uid` bigint unsigned NOT NULL,
  `rx` bigint unsigned NOT NULL,
  `tx` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traf_data`
--

LOCK TABLES `traf_data` WRITE;
/*!40000 ALTER TABLE `traf_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `traf_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traf_data_day`
--

DROP TABLE IF EXISTS `traf_data_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `traf_data_day` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned NOT NULL,
  `date` datetime NOT NULL,
  `rx` bigint unsigned NOT NULL,
  `tx` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traf_data_day`
--

LOCK TABLES `traf_data_day` WRITE;
/*!40000 ALTER TABLE `traf_data_day` DISABLE KEYS */;
/*!40000 ALTER TABLE `traf_data_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traf_data_hour`
--

DROP TABLE IF EXISTS `traf_data_hour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `traf_data_hour` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned NOT NULL,
  `date` datetime NOT NULL,
  `rx` bigint unsigned NOT NULL,
  `tx` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traf_data_hour`
--

LOCK TABLES `traf_data_hour` WRITE;
/*!40000 ALTER TABLE `traf_data_hour` DISABLE KEYS */;
/*!40000 ALTER TABLE `traf_data_hour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traf_tx_rx`
--

DROP TABLE IF EXISTS `traf_tx_rx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `traf_tx_rx` (
  `uid` bigint unsigned NOT NULL,
  `rx` bigint unsigned NOT NULL,
  `tx` bigint unsigned NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traf_tx_rx`
--

LOCK TABLES `traf_tx_rx` WRITE;
/*!40000 ALTER TABLE `traf_tx_rx` DISABLE KEYS */;
/*!40000 ALTER TABLE `traf_tx_rx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_external_keys`
--

DROP TABLE IF EXISTS `user_external_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_external_keys` (
  `key_id` int NOT NULL AUTO_INCREMENT,
  `key_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`key_id`),
  UNIQUE KEY `uniq_name` (`key_name`) USING BTREE,
  KEY `key_name` (`key_id`,`key_name`(191)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_external_keys`
--

LOCK TABLES `user_external_keys` WRITE;
/*!40000 ALTER TABLE `user_external_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_external_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_external_values`
--

DROP TABLE IF EXISTS `user_external_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_external_values` (
  `uid` int NOT NULL,
  `key_id` int NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  KEY `user_key` (`uid`,`key_id`),
  KEY `user` (`uid`),
  KEY `key` (`key_id`),
  KEY `value` (`value`),
  KEY `user_value` (`uid`,`value`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_external_values`
--

LOCK TABLES `user_external_values` WRITE;
/*!40000 ALTER TABLE `user_external_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_external_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '*',
  `crypt_method` tinyint unsigned NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-обычный,\r\n2-замороженный,\r\n3-отключенный,\r\n4-удаленный',
  `uid` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gid` int unsigned NOT NULL DEFAULT '1',
  `deposit` double(20,6) NOT NULL DEFAULT '0.000000',
  `credit` double(20,2) NOT NULL DEFAULT '0.00',
  `fio` char(128) NOT NULL DEFAULT '',
  `phone` char(128) NOT NULL DEFAULT '',
  `address` char(128) NOT NULL DEFAULT '',
  `prim` char(254) NOT NULL DEFAULT '',
  `add_date` date DEFAULT NULL,
  `blocked` tinyint unsigned NOT NULL DEFAULT '0',
  `activated` tinyint unsigned NOT NULL DEFAULT '1',
  `expired` date DEFAULT NULL,
  `total_time` int NOT NULL DEFAULT '0',
  `total_traffic` bigint NOT NULL DEFAULT '0',
  `total_money` double(20,6) NOT NULL DEFAULT '0.000000',
  `last_connection` datetime DEFAULT NULL,
  `framed_ip` char(16) NOT NULL DEFAULT '',
  `framed_mask` char(16) NOT NULL DEFAULT '255.255.255.255',
  `callback_number` char(64) NOT NULL DEFAULT '',
  `local_ip` char(16) NOT NULL DEFAULT '10.0.',
  `local_mac` char(22) DEFAULT NULL,
  `sectorid` smallint unsigned NOT NULL DEFAULT '1',
  `create_mail` smallint unsigned NOT NULL DEFAULT '1',
  `user_installed` smallint unsigned NOT NULL DEFAULT '1',
  `speed_rate` int unsigned NOT NULL DEFAULT '0',
  `speed_burst` int unsigned NOT NULL DEFAULT '0',
  `gidd` smallint unsigned NOT NULL DEFAULT '0',
  `link_to_ip_mac` tinyint unsigned NOT NULL DEFAULT '0',
  `email` char(64) DEFAULT NULL,
  `passportserie` char(16) DEFAULT NULL,
  `passportpropiska` char(128) DEFAULT NULL,
  `passportvoenkomat` char(128) DEFAULT NULL,
  `passportgdevidan` char(128) DEFAULT NULL,
  `inn` char(64) DEFAULT NULL,
  `real_ip` tinyint unsigned NOT NULL DEFAULT '0',
  `real_price` double(20,6) NOT NULL DEFAULT '0.000000',
  `real_ipfree` tinyint NOT NULL DEFAULT '0',
  `dogovor` tinyint NOT NULL DEFAULT '0' COMMENT '0 - нет данных; 1 - активен; 2 - приостановлен; 3 - закрыт',
  `credit_procent` tinyint unsigned NOT NULL DEFAULT '0',
  `rating` smallint NOT NULL DEFAULT '0',
  `mob_tel` char(32) DEFAULT NULL,
  `sms_tel` char(32) DEFAULT NULL,
  `date_birth` date DEFAULT NULL,
  `date_birth_do` tinyint unsigned NOT NULL DEFAULT '0',
  `languarddisable` tinyint unsigned NOT NULL DEFAULT '0',
  `credit_unlimited` tinyint unsigned NOT NULL DEFAULT '0',
  `dontshowspeed` tinyint unsigned NOT NULL DEFAULT '0',
  `numdogovor` char(16) DEFAULT NULL,
  `app` char(8) NOT NULL DEFAULT '',
  `switchport` int unsigned DEFAULT '0',
  `houseid` int unsigned NOT NULL DEFAULT '1',
  `housingid` int unsigned NOT NULL DEFAULT '0',
  `houseblockid` int unsigned NOT NULL DEFAULT '0',
  `porch` int unsigned NOT NULL DEFAULT '0',
  `floor` int unsigned NOT NULL DEFAULT '0',
  `swid` int unsigned DEFAULT '0',
  `use_router` tinyint unsigned NOT NULL DEFAULT '0',
  `router_model` char(16) NOT NULL DEFAULT '',
  `router_login` char(16) NOT NULL DEFAULT '',
  `router_pass` char(16) NOT NULL DEFAULT '',
  `router_ssid` char(16) NOT NULL DEFAULT '',
  `router_wep_pass` char(16) NOT NULL DEFAULT '',
  `router_we_saled` tinyint unsigned NOT NULL DEFAULT '0',
  `router_use_dual` tinyint unsigned NOT NULL DEFAULT '0',
  `router_add_date` char(10) NOT NULL DEFAULT '00/00/0000',
  `router_serial` char(16) NOT NULL DEFAULT '',
  `router_port` char(16) NOT NULL DEFAULT '8080',
  `credit_stop` tinyint unsigned NOT NULL DEFAULT '0',
  `date_abonka` tinyint unsigned NOT NULL DEFAULT '1',
  `mac_reg` tinyint NOT NULL DEFAULT '0',
  `fixed_cost` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uname` (`user`),
  KEY `gid` (`gid`),
  KEY `gidd` (`gidd`),
  KEY `mrtgusname` (`user`,`uid`),
  KEY `sectorid` (`sectorid`),
  KEY `swid` (`swid`),
  KEY `swid-port` (`swid`,`switchport`),
  KEY `swport` (`switchport`),
  KEY `blockedinstalled` (`blocked`,`user_installed`),
  KEY `credit` (`credit`),
  KEY `deposit` (`deposit`),
  KEY `installed` (`user_installed`),
  KEY `localipmac` (`local_ip`,`local_mac`),
  KEY `mac` (`local_mac`),
  KEY `uiduser` (`uid`,`user`),
  KEY `session_by_2ip` (`local_ip`,`framed_ip`),
  KEY `session_by_local_ip` (`local_ip`),
  KEY `session_by_framed_ip` (`framed_ip`),
  KEY `user_state` (`state`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci AVG_ROW_LENGTH=3276;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('test','test',0,1,7,2,0.000000,0.00,'','','','','2013-07-19',0,1,NULL,0,0,0.000000,NULL,'10.0.1.2','255.255.255.255','','10.0.1.2',NULL,2,1,1,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0.000000,0,0,0,0,NULL,NULL,NULL,0,0,0,0,NULL,'',0,2,0,0,0,0,0,0,'','','','','',0,0,'00/00/0000','','8080',0,1,0,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_custom_fields`
--

DROP TABLE IF EXISTS `users_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_custom_fields` (
  `uid` bigint unsigned NOT NULL,
  `key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`uid`,`key`),
  UNIQUE KEY `full` (`uid`,`key`,`value`),
  KEY `search` (`key`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Custom users fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_custom_fields`
--

LOCK TABLES `users_custom_fields` WRITE;
/*!40000 ALTER TABLE `users_custom_fields` DISABLE KEYS */;
INSERT INTO `users_custom_fields` VALUES (7,'ext_date_fiz_contract_conclusion','2013-07-19');
/*!40000 ALTER TABLE `users_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_pending_changes`
--

DROP TABLE IF EXISTS `users_pending_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_pending_changes` (
  `pending_id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint unsigned NOT NULL,
  `pending_activation_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'время изменения атрибута абонента',
  `pending_attribute_name` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'название атрибута, если "тип измениния" = 0',
  `pending_attribute_value` varchar(255) NOT NULL DEFAULT '' COMMENT 'значение для изменения',
  `pending_inner_type` tinyint NOT NULL DEFAULT '0' COMMENT 'Внутренний тип действия для конкретного атрибута. 0: "по умолчанию"',
  `stuffid` tinyint unsigned NOT NULL,
  `pending_creation_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pending_activated` tinyint NOT NULL DEFAULT '0' COMMENT 'статус активации:: 0: не активирована, 1: была активирована, -1: отменена, -2: ошибка',
  PRIMARY KEY (`pending_id`),
  KEY `get tasks` (`pending_activation_datetime`,`pending_activated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='таблица отложенных изменений пользователя';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_pending_changes`
--

LOCK TABLES `users_pending_changes` WRITE;
/*!40000 ALTER TABLE `users_pending_changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_pending_changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `users_view_fsb`
--

DROP TABLE IF EXISTS `users_view_fsb`;
/*!50001 DROP VIEW IF EXISTS `users_view_fsb`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `users_view_fsb` AS SELECT 
 1 AS `state`,
 1 AS `uid`,
 1 AS `user`,
 1 AS `fio`,
 1 AS `phone`,
 1 AS `mob_tel`,
 1 AS `sms_tel`,
 1 AS `real_ip`,
 1 AS `framed_ip`,
 1 AS `local_ip`,
 1 AS `local_mac`,
 1 AS `passportserie`,
 1 AS `passportpropiska`,
 1 AS `passportvoenkomat`,
 1 AS `passportgdevidan`,
 1 AS `inn`,
 1 AS `date_birth`,
 1 AS `numdogovor`,
 1 AS `use_router`,
 1 AS `blocked`,
 1 AS `last_connection`,
 1 AS `app`,
 1 AS `houseid`,
 1 AS `housingid`,
 1 AS `houseblockid`,
 1 AS `porch`,
 1 AS `floor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `users_view_fsb_address`
--

DROP TABLE IF EXISTS `users_view_fsb_address`;
/*!50001 DROP VIEW IF EXISTS `users_view_fsb_address`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `users_view_fsb_address` AS SELECT 
 1 AS `address`,
 1 AS `lane`,
 1 AS `house`,
 1 AS `app`,
 1 AS `porches`,
 1 AS `floors`,
 1 AS `uid`,
 1 AS `user`,
 1 AS `fio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `usersadress`
--

DROP TABLE IF EXISTS `usersadress`;
/*!50001 DROP VIEW IF EXISTS `usersadress`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `usersadress` AS SELECT 
 1 AS `address`,
 1 AS `lane`,
 1 AS `house`,
 1 AS `app`,
 1 AS `porches`,
 1 AS `floors`,
 1 AS `uid`,
 1 AS `user`,
 1 AS `fio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `usersall`
--

DROP TABLE IF EXISTS `usersall`;
/*!50001 DROP VIEW IF EXISTS `usersall`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `usersall` AS SELECT 
 1 AS `user`,
 1 AS `password`,
 1 AS `uid`,
 1 AS `gid`,
 1 AS `deposit`,
 1 AS `credit`,
 1 AS `fio`,
 1 AS `phone`,
 1 AS `prim`,
 1 AS `add_date`,
 1 AS `blocked`,
 1 AS `activated`,
 1 AS `framed_ip`,
 1 AS `passportserie`,
 1 AS `passportpropiska`,
 1 AS `passportvoenkomat`,
 1 AS `passportgdevidan`,
 1 AS `dogovor`,
 1 AS `block_date`,
 1 AS `del_date`,
 1 AS `freeze_date`,
 1 AS `mob_tel`,
 1 AS `numdogovor`,
 1 AS `app`,
 1 AS `houseid`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `usersblok`
--

DROP TABLE IF EXISTS `usersblok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usersblok` (
  `blockid` int unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '*',
  `crypt_method` tinyint unsigned NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '3' COMMENT '1-обычный,\r\n2-замороженный,\r\n3-отключенный,\r\n4-удаленный',
  `uid` bigint unsigned NOT NULL,
  `gid` smallint unsigned NOT NULL DEFAULT '1',
  `deposit` double(20,6) NOT NULL DEFAULT '0.000000',
  `credit` double(20,2) NOT NULL DEFAULT '0.00',
  `fio` varchar(128) NOT NULL DEFAULT '',
  `phone` varchar(128) NOT NULL DEFAULT '',
  `address` varchar(128) NOT NULL DEFAULT '',
  `prim` varchar(254) NOT NULL DEFAULT '',
  `add_date` date DEFAULT NULL,
  `blocked` tinyint unsigned NOT NULL DEFAULT '0',
  `activated` tinyint unsigned NOT NULL DEFAULT '1',
  `expired` date DEFAULT NULL,
  `total_time` int NOT NULL DEFAULT '0',
  `total_traffic` bigint NOT NULL DEFAULT '0',
  `total_money` double(20,6) NOT NULL DEFAULT '0.000000',
  `last_connection` datetime DEFAULT NULL,
  `framed_ip` varchar(16) NOT NULL DEFAULT '',
  `framed_mask` varchar(16) NOT NULL DEFAULT '255.255.255.255',
  `callback_number` varchar(64) NOT NULL DEFAULT '',
  `local_ip` varchar(16) NOT NULL DEFAULT '10.0.',
  `local_mac` varchar(22) DEFAULT NULL,
  `sectorid` smallint unsigned NOT NULL DEFAULT '1',
  `create_mail` smallint unsigned NOT NULL DEFAULT '1',
  `user_installed` smallint unsigned NOT NULL DEFAULT '1',
  `speed_rate` int unsigned NOT NULL DEFAULT '0',
  `speed_burst` int unsigned NOT NULL DEFAULT '0',
  `gidd` smallint unsigned NOT NULL DEFAULT '0',
  `link_to_ip_mac` tinyint unsigned NOT NULL DEFAULT '0',
  `email` varchar(64) DEFAULT NULL,
  `passportserie` varchar(16) DEFAULT NULL,
  `passportpropiska` varchar(128) DEFAULT NULL,
  `passportvoenkomat` varchar(128) DEFAULT NULL,
  `passportgdevidan` varchar(128) DEFAULT NULL,
  `inn` varchar(64) DEFAULT NULL,
  `real_ip` tinyint unsigned NOT NULL DEFAULT '0',
  `real_price` double(20,6) NOT NULL DEFAULT '0.000000',
  `real_ipfree` tinyint NOT NULL DEFAULT '0',
  `dogovor` tinyint NOT NULL DEFAULT '0',
  `credit_procent` tinyint unsigned NOT NULL DEFAULT '0',
  `rating` smallint NOT NULL DEFAULT '0',
  `block_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mob_tel` varchar(32) DEFAULT NULL,
  `sms_tel` varchar(32) DEFAULT NULL,
  `date_birth` date DEFAULT NULL,
  `date_birth_do` tinyint unsigned NOT NULL DEFAULT '0',
  `languarddisable` tinyint unsigned NOT NULL DEFAULT '0',
  `credit_unlimited` tinyint unsigned NOT NULL DEFAULT '0',
  `dontshowspeed` tinyint unsigned NOT NULL DEFAULT '0',
  `numdogovor` varchar(16) DEFAULT NULL,
  `app` char(8) NOT NULL DEFAULT '',
  `switchport` int unsigned DEFAULT '0',
  `houseid` int unsigned NOT NULL DEFAULT '0',
  `housingid` int unsigned NOT NULL DEFAULT '0',
  `houseblockid` int unsigned NOT NULL DEFAULT '0',
  `porch` int unsigned NOT NULL DEFAULT '1',
  `floor` int unsigned NOT NULL DEFAULT '0',
  `swid` int unsigned DEFAULT '0',
  `use_router` tinyint unsigned NOT NULL DEFAULT '0',
  `router_model` varchar(16) NOT NULL DEFAULT '',
  `router_login` varchar(16) NOT NULL DEFAULT '',
  `router_pass` varchar(16) NOT NULL DEFAULT '',
  `router_ssid` varchar(16) NOT NULL DEFAULT '',
  `router_wep_pass` varchar(16) NOT NULL DEFAULT '',
  `router_we_saled` tinyint unsigned NOT NULL DEFAULT '0',
  `router_use_dual` tinyint unsigned NOT NULL DEFAULT '0',
  `router_add_date` varchar(10) NOT NULL DEFAULT '00/00/0000',
  `router_serial` varchar(16) NOT NULL DEFAULT '',
  `router_port` varchar(16) NOT NULL DEFAULT '8080',
  `credit_stop` tinyint unsigned NOT NULL DEFAULT '0',
  `date_abonka` tinyint unsigned NOT NULL DEFAULT '1',
  `mac_reg` tinyint NOT NULL DEFAULT '0',
  `fixed_cost` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`blockid`),
  UNIQUE KEY `uname` (`user`),
  KEY `gid` (`gid`),
  KEY `gidd` (`gidd`),
  KEY `mrtgusname` (`user`,`uid`),
  KEY `local_ip` (`local_ip`),
  KEY `local_mac` (`local_mac`),
  KEY `uid` (`uid`),
  KEY `user_switchport` (`switchport`),
  KEY `session_by_2ip` (`local_ip`,`framed_ip`),
  KEY `session_by_framed_ip` (`framed_ip`),
  KEY `user_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersblok`
--

LOCK TABLES `usersblok` WRITE;
/*!40000 ALTER TABLE `usersblok` DISABLE KEYS */;
/*!40000 ALTER TABLE `usersblok` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userscontacts`
--

DROP TABLE IF EXISTS `userscontacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userscontacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `contact_type_id` smallint NOT NULL,
  `contact` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid_contact_type` (`uid`,`contact_type_id`),
  KEY `contact` (`contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userscontacts`
--

LOCK TABLES `userscontacts` WRITE;
/*!40000 ALTER TABLE `userscontacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `userscontacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userscontacts_labels`
--

DROP TABLE IF EXISTS `userscontacts_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userscontacts_labels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(64) NOT NULL,
  `name` varchar(128) NOT NULL,
  `usersgroupid` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `label_group` (`label`,`usersgroupid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userscontacts_labels`
--

LOCK TABLES `userscontacts_labels` WRITE;
/*!40000 ALTER TABLE `userscontacts_labels` DISABLE KEYS */;
INSERT INTO `userscontacts_labels` VALUES (1,'calls','Звонки',0),(2,'messages','Сообщения',0),(3,'notify','Уведомление',0),(4,'letters','Рассылка',0),(5,'news','Новости',0),(6,'omnicell_sub','Lifecell',0);
/*!40000 ALTER TABLE `userscontacts_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userscontacts_labels_data`
--

DROP TABLE IF EXISTS `userscontacts_labels_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userscontacts_labels_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contact_id` int NOT NULL,
  `label_id` smallint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contact_label` (`contact_id`,`label_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userscontacts_labels_data`
--

LOCK TABLES `userscontacts_labels_data` WRITE;
/*!40000 ALTER TABLE `userscontacts_labels_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `userscontacts_labels_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userscontacts_types`
--

DROP TABLE IF EXISTS `userscontacts_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userscontacts_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(64) NOT NULL,
  `name` varchar(128) NOT NULL,
  `usersgroupid` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type_group` (`type`,`usersgroupid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userscontacts_types`
--

LOCK TABLES `userscontacts_types` WRITE;
/*!40000 ALTER TABLE `userscontacts_types` DISABLE KEYS */;
INSERT INTO `userscontacts_types` VALUES (1,'mobile','Мобильный',0),(2,'home','Домашний',0),(3,'email','EMail',0),(4,'telegram','Telegram',0),(5,'viber','Viber',0),(6,'skype','Skype',0),(7,'whatsapp','Whatsapp',0),(8,'subscription','Подписки',0);
/*!40000 ALTER TABLE `userscontacts_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersdel`
--

DROP TABLE IF EXISTS `usersdel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usersdel` (
  `delid` int unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '*',
  `crypt_method` tinyint unsigned NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '4' COMMENT '1-обычный,\r\n2-замороженный,\r\n3-отключенный,\r\n4-удаленный',
  `uid` bigint unsigned NOT NULL,
  `gid` smallint unsigned NOT NULL DEFAULT '1',
  `deposit` double(20,6) NOT NULL DEFAULT '0.000000',
  `credit` double(20,2) NOT NULL DEFAULT '0.00',
  `fio` varchar(128) NOT NULL DEFAULT '',
  `phone` varchar(128) NOT NULL DEFAULT '',
  `address` varchar(128) NOT NULL DEFAULT '',
  `prim` varchar(254) NOT NULL DEFAULT '',
  `add_date` date DEFAULT NULL,
  `blocked` tinyint unsigned NOT NULL DEFAULT '0',
  `activated` tinyint unsigned NOT NULL DEFAULT '1',
  `expired` date DEFAULT NULL,
  `total_time` int NOT NULL DEFAULT '0',
  `total_traffic` bigint NOT NULL DEFAULT '0',
  `total_money` double(20,6) NOT NULL DEFAULT '0.000000',
  `last_connection` datetime DEFAULT NULL,
  `framed_ip` varchar(16) NOT NULL DEFAULT '',
  `framed_mask` varchar(16) NOT NULL DEFAULT '255.255.255.255',
  `callback_number` varchar(64) NOT NULL DEFAULT '',
  `local_ip` varchar(16) NOT NULL DEFAULT '10.0.',
  `local_mac` varchar(22) DEFAULT NULL,
  `sectorid` smallint unsigned NOT NULL DEFAULT '1',
  `create_mail` smallint unsigned NOT NULL DEFAULT '1',
  `user_installed` smallint unsigned NOT NULL DEFAULT '1',
  `speed_rate` int unsigned NOT NULL DEFAULT '0',
  `speed_burst` int unsigned NOT NULL DEFAULT '0',
  `gidd` smallint unsigned NOT NULL DEFAULT '0',
  `link_to_ip_mac` tinyint unsigned NOT NULL DEFAULT '0',
  `email` varchar(64) DEFAULT NULL,
  `passportserie` varchar(16) DEFAULT NULL,
  `passportpropiska` varchar(128) DEFAULT NULL,
  `passportvoenkomat` varchar(128) DEFAULT NULL,
  `passportgdevidan` varchar(128) DEFAULT NULL,
  `inn` varchar(64) DEFAULT NULL,
  `real_ip` tinyint unsigned NOT NULL DEFAULT '0',
  `real_price` double(20,6) NOT NULL DEFAULT '0.000000',
  `real_ipfree` tinyint NOT NULL DEFAULT '0',
  `dogovor` tinyint NOT NULL DEFAULT '0',
  `credit_procent` tinyint unsigned NOT NULL DEFAULT '0',
  `rating` smallint NOT NULL DEFAULT '0',
  `block_date` datetime DEFAULT NULL,
  `del_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mob_tel` varchar(32) DEFAULT NULL,
  `sms_tel` varchar(32) DEFAULT NULL,
  `date_birth` date DEFAULT NULL,
  `date_birth_do` tinyint unsigned NOT NULL DEFAULT '0',
  `languarddisable` tinyint unsigned NOT NULL DEFAULT '0',
  `credit_unlimited` tinyint unsigned NOT NULL DEFAULT '0',
  `dontshowspeed` tinyint unsigned NOT NULL DEFAULT '0',
  `numdogovor` varchar(16) DEFAULT NULL,
  `app` char(8) NOT NULL DEFAULT '',
  `switchport` int unsigned DEFAULT '0',
  `houseid` int unsigned NOT NULL DEFAULT '0',
  `housingid` int unsigned NOT NULL DEFAULT '0',
  `houseblockid` int unsigned NOT NULL DEFAULT '0',
  `porch` int unsigned DEFAULT NULL,
  `floor` int unsigned NOT NULL DEFAULT '0',
  `swid` int unsigned DEFAULT '0',
  `use_router` tinyint unsigned NOT NULL DEFAULT '0',
  `router_model` varchar(16) NOT NULL DEFAULT '',
  `router_login` varchar(16) NOT NULL DEFAULT '',
  `router_pass` varchar(16) NOT NULL DEFAULT '',
  `router_ssid` varchar(16) NOT NULL DEFAULT '',
  `router_wep_pass` varchar(16) NOT NULL DEFAULT '',
  `router_we_saled` tinyint unsigned NOT NULL DEFAULT '0',
  `router_use_dual` tinyint unsigned NOT NULL DEFAULT '0',
  `router_add_date` varchar(10) NOT NULL DEFAULT '00/00/0000',
  `router_serial` varchar(16) NOT NULL DEFAULT '',
  `router_port` varchar(16) NOT NULL DEFAULT '8080',
  `credit_stop` tinyint unsigned NOT NULL DEFAULT '0',
  `date_abonka` tinyint unsigned NOT NULL DEFAULT '1',
  `mac_reg` tinyint NOT NULL DEFAULT '0',
  `fixed_cost` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`delid`),
  UNIQUE KEY `uname` (`user`),
  KEY `gid` (`gid`),
  KEY `gidd` (`gidd`),
  KEY `mrtgusname` (`user`,`uid`),
  KEY `local_ip` (`local_ip`),
  KEY `local_mac` (`local_mac`),
  KEY `uid` (`uid`),
  KEY `user_switchport` (`switchport`),
  KEY `session_by_2ip` (`local_ip`,`framed_ip`),
  KEY `session_by_framed_ip` (`framed_ip`),
  KEY `user_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersdel`
--

LOCK TABLES `usersdel` WRITE;
/*!40000 ALTER TABLE `usersdel` DISABLE KEYS */;
/*!40000 ALTER TABLE `usersdel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersfreeze`
--

DROP TABLE IF EXISTS `usersfreeze`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usersfreeze` (
  `freezeid` int unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '*',
  `crypt_method` tinyint unsigned NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1-обычный,\r\n2-замороженный,\r\n3-отключенный,\r\n4-удаленный',
  `uid` bigint unsigned NOT NULL,
  `gid` smallint unsigned NOT NULL DEFAULT '1',
  `deposit` double(20,6) NOT NULL DEFAULT '0.000000',
  `credit` double(20,2) NOT NULL DEFAULT '0.00',
  `fio` varchar(128) NOT NULL DEFAULT '',
  `phone` varchar(128) NOT NULL DEFAULT '',
  `address` varchar(128) NOT NULL DEFAULT '',
  `prim` varchar(254) NOT NULL DEFAULT '',
  `add_date` date DEFAULT NULL,
  `blocked` tinyint unsigned NOT NULL DEFAULT '0',
  `activated` tinyint unsigned NOT NULL DEFAULT '1',
  `expired` date DEFAULT NULL,
  `total_time` int NOT NULL DEFAULT '0',
  `total_traffic` bigint NOT NULL DEFAULT '0',
  `total_money` double(20,6) NOT NULL DEFAULT '0.000000',
  `last_connection` datetime DEFAULT NULL,
  `framed_ip` varchar(16) NOT NULL DEFAULT '',
  `framed_mask` varchar(16) NOT NULL DEFAULT '255.255.255.255',
  `callback_number` varchar(64) NOT NULL DEFAULT '',
  `local_ip` varchar(16) NOT NULL DEFAULT '10.0.',
  `local_mac` varchar(22) DEFAULT NULL,
  `sectorid` smallint unsigned NOT NULL DEFAULT '1',
  `create_mail` smallint unsigned NOT NULL DEFAULT '1',
  `user_installed` smallint unsigned NOT NULL DEFAULT '1',
  `speed_rate` int unsigned NOT NULL DEFAULT '0',
  `speed_burst` int unsigned NOT NULL DEFAULT '0',
  `gidd` smallint unsigned NOT NULL DEFAULT '0',
  `link_to_ip_mac` tinyint unsigned NOT NULL DEFAULT '0',
  `email` varchar(64) DEFAULT '',
  `passportserie` varchar(16) DEFAULT '',
  `passportpropiska` varchar(128) DEFAULT '',
  `passportvoenkomat` varchar(128) DEFAULT '',
  `passportgdevidan` varchar(128) DEFAULT '',
  `inn` varchar(64) DEFAULT '',
  `real_ip` tinyint unsigned NOT NULL DEFAULT '0',
  `real_price` double(20,6) NOT NULL DEFAULT '0.000000',
  `real_ipfree` tinyint NOT NULL DEFAULT '0',
  `dogovor` tinyint NOT NULL DEFAULT '0',
  `credit_procent` tinyint unsigned NOT NULL DEFAULT '0',
  `rating` smallint NOT NULL DEFAULT '0',
  `mob_tel` varchar(32) DEFAULT '',
  `sms_tel` varchar(32) DEFAULT '',
  `date_birth` date DEFAULT NULL,
  `date_birth_do` tinyint unsigned NOT NULL DEFAULT '0',
  `languarddisable` tinyint unsigned NOT NULL DEFAULT '0',
  `credit_unlimited` tinyint unsigned NOT NULL DEFAULT '0',
  `dontshowspeed` tinyint unsigned NOT NULL DEFAULT '0',
  `numdogovor` varchar(16) DEFAULT NULL,
  `app` char(8) NOT NULL DEFAULT '',
  `switchport` int unsigned DEFAULT '0',
  `houseid` int unsigned NOT NULL DEFAULT '1',
  `housingid` int unsigned NOT NULL DEFAULT '0',
  `houseblockid` int unsigned NOT NULL DEFAULT '0',
  `porch` int unsigned NOT NULL DEFAULT '0',
  `floor` int unsigned NOT NULL DEFAULT '0',
  `swid` int unsigned DEFAULT '0',
  `use_router` tinyint unsigned NOT NULL DEFAULT '0',
  `router_model` varchar(16) NOT NULL DEFAULT '',
  `router_login` varchar(16) NOT NULL DEFAULT '',
  `router_pass` varchar(16) NOT NULL DEFAULT '',
  `router_ssid` varchar(16) NOT NULL DEFAULT '',
  `router_wep_pass` varchar(16) NOT NULL DEFAULT '',
  `router_we_saled` tinyint unsigned NOT NULL DEFAULT '0',
  `router_use_dual` tinyint unsigned NOT NULL DEFAULT '0',
  `router_add_date` varchar(10) NOT NULL DEFAULT '00/00/0000',
  `router_serial` varchar(16) NOT NULL DEFAULT '',
  `router_port` varchar(16) NOT NULL DEFAULT '8080',
  `unfreeze_date` date NOT NULL DEFAULT '0000-00-00',
  `freeze_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `credit_stop` tinyint unsigned NOT NULL DEFAULT '0',
  `date_abonka` tinyint unsigned NOT NULL DEFAULT '1',
  `mac_reg` tinyint NOT NULL DEFAULT '0',
  `fixed_cost` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`freezeid`),
  UNIQUE KEY `uname` (`user`),
  KEY `gid` (`gid`),
  KEY `gidd` (`gidd`),
  KEY `mrtgusname` (`user`,`uid`),
  KEY `uid` (`uid`),
  KEY `user_switchport` (`switchport`),
  KEY `local_mac` (`local_mac`),
  KEY `session_by_2ip` (`local_ip`,`framed_ip`),
  KEY `session_by_local_ip` (`local_ip`),
  KEY `session_by_framed_ip` (`framed_ip`),
  KEY `user_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersfreeze`
--

LOCK TABLES `usersfreeze` WRITE;
/*!40000 ALTER TABLE `usersfreeze` DISABLE KEYS */;
/*!40000 ALTER TABLE `usersfreeze` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersgroups`
--

DROP TABLE IF EXISTS `usersgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usersgroups` (
  `usersgroupid` int unsigned NOT NULL AUTO_INCREMENT,
  `usersgroupname` varchar(64) NOT NULL,
  `description` varchar(254) NOT NULL DEFAULT '',
  `share` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT 'доля дилера',
  `archived` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`usersgroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersgroups`
--

LOCK TABLES `usersgroups` WRITE;
/*!40000 ALTER TABLE `usersgroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usersgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersgroups_extended_fields`
--

DROP TABLE IF EXISTS `usersgroups_extended_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usersgroups_extended_fields` (
  `id` tinyint unsigned NOT NULL,
  `key` varchar(48) NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`,`key`),
  KEY `search` (`key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Custom dealer fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersgroups_extended_fields`
--

LOCK TABLES `usersgroups_extended_fields` WRITE;
/*!40000 ALTER TABLE `usersgroups_extended_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `usersgroups_extended_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersgroups_partners`
--

DROP TABLE IF EXISTS `usersgroups_partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usersgroups_partners` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersgroups_partners`
--

LOCK TABLES `usersgroups_partners` WRITE;
/*!40000 ALTER TABLE `usersgroups_partners` DISABLE KEYS */;
/*!40000 ALTER TABLE `usersgroups_partners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersgroups_staff`
--

DROP TABLE IF EXISTS `usersgroups_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usersgroups_staff` (
  `stuffid` int unsigned NOT NULL,
  `usersgroupid` int unsigned NOT NULL,
  KEY `stuffid` (`stuffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersgroups_staff`
--

LOCK TABLES `usersgroups_staff` WRITE;
/*!40000 ALTER TABLE `usersgroups_staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `usersgroups_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersgroups_users`
--

DROP TABLE IF EXISTS `usersgroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usersgroups_users` (
  `uid` int unsigned NOT NULL,
  `usersgroupid` int unsigned NOT NULL,
  UNIQUE KEY `uid` (`uid`),
  KEY `usergroupid` (`usersgroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersgroups_users`
--

LOCK TABLES `usersgroups_users` WRITE;
/*!40000 ALTER TABLE `usersgroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `usersgroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors_oui`
--

DROP TABLE IF EXISTS `vendors_oui`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendors_oui` (
  `vendorid` int unsigned NOT NULL AUTO_INCREMENT,
  `base16` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `company` varchar(64) NOT NULL DEFAULT '',
  `address` text NOT NULL,
  PRIMARY KEY (`vendorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors_oui`
--

LOCK TABLES `vendors_oui` WRITE;
/*!40000 ALTER TABLE `vendors_oui` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendors_oui` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `white_list_srv`
--

DROP TABLE IF EXISTS `white_list_srv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `white_list_srv` (
  `srvid` int unsigned NOT NULL AUTO_INCREMENT,
  `serv` varchar(64) NOT NULL,
  `mikrotik` tinyint(1) NOT NULL DEFAULT '0',
  `ip` char(32) NOT NULL,
  `login` varchar(64) NOT NULL,
  `pass` varchar(64) NOT NULL,
  `disable` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`srvid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `white_list_srv`
--

LOCK TABLES `white_list_srv` WRITE;
/*!40000 ALTER TABLE `white_list_srv` DISABLE KEYS */;
/*!40000 ALTER TABLE `white_list_srv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `white_list_srv_ip`
--

DROP TABLE IF EXISTS `white_list_srv_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `white_list_srv_ip` (
  `white_ip` char(32) NOT NULL DEFAULT '',
  `action` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`white_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `white_list_srv_ip`
--

LOCK TABLES `white_list_srv_ip` WRITE;
/*!40000 ALTER TABLE `white_list_srv_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `white_list_srv_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mikbill'
--
/*!50003 DROP FUNCTION IF EXISTS `check_blocked_func` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `check_blocked_func`(input_uid int) RETURNS int
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Check user for blocked=1'
BEGIN
  DECLARE tmp_value int;
  DECLARE return_value int DEFAULT 0;

  
  SELECT
    blocked INTO tmp_value
  FROM users
  WHERE uid = input_uid;

  IF tmp_value
  THEN
    SET return_value = tmp_value;
  ELSE
    
    SELECT
      blocked INTO tmp_value
    FROM usersfreeze
    WHERE uid = input_uid;
    
    IF tmp_value
    THEN
      SET return_value = tmp_value;
    ELSE
      
      SELECT
        blocked INTO tmp_value
      FROM usersblok
      WHERE uid = input_uid;
      
      IF tmp_value
      THEN
        SET return_value = tmp_value;
      ELSE
        
        SELECT
          blocked INTO tmp_value
        FROM usersdel
        WHERE uid = input_uid;
        IF tmp_value
        THEN
          SET return_value = tmp_value;
        ELSE
          
          SET return_value = NULL;
        END IF;
      END IF;
    END IF;
  END IF;
  RETURN return_value;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `check_blocked_mem_func` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `check_blocked_mem_func`(input_uid INT) RETURNS int
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Проверка на блокировку абонента в radacctmem'
BEGIN
  DECLARE return_value INT DEFAULT 0;

  SELECT blocked
  INTO
    return_value
  FROM
    radacctmem
  WHERE
    uid = input_uid ORDER BY last_change LIMIT 1;

  RETURN return_value;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `check_ip_pool_simul_use` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `check_ip_pool_simul_use`(input_uid INT, input_ip VARCHAR(15)) RETURNS int
    DETERMINISTIC
    COMMENT 'Проверить на колличество IP по UID в пуле'
BEGIN
  DECLARE return_value INT DEFAULT 0;

  SELECT count(uid)
  INTO
    return_value
  FROM
    ip_pools_pool_use
  WHERE
    uid = input_uid
    AND
    poolip LIKE input_ip;
  RETURN return_value;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `check_ip_pool_simul_use_by_ip` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `check_ip_pool_simul_use_by_ip`(input_ip VARCHAR(15)) RETURNS int
    DETERMINISTIC
    COMMENT 'Проверить на колличество IP по IP в пуле'
BEGIN
  DECLARE return_value INT DEFAULT 0;

  SELECT count(uid)
  INTO
    return_value
  FROM
    ip_pools_pool_use
  WHERE
    poolip LIKE input_ip;
  RETURN return_value;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `check_money_func` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `check_money_func`(input_uid int) RETURNS int
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'get sum by user'
BEGIN
  DECLARE tmp_value int;
  DECLARE return_value int DEFAULT 0;

  
  SELECT
    SUM(deposit + credit) INTO tmp_value
  FROM users
  WHERE uid = input_uid;

  IF tmp_value
  THEN
    SET return_value = tmp_value;
  ELSE
    
    SELECT
      SUM(deposit + credit) INTO tmp_value
    FROM usersfreeze
    WHERE uid = input_uid;
    
    IF tmp_value
    THEN
      SET return_value = tmp_value;
    ELSE
      
      SELECT
        SUM(deposit + credit) INTO tmp_value
      FROM usersblok
      WHERE uid = input_uid;
      
      IF tmp_value
      THEN
        SET return_value = tmp_value;
      ELSE
        
        SELECT
          SUM(deposit + credit) INTO tmp_value
        FROM usersdel
        WHERE uid = input_uid;
        IF tmp_value
        THEN
          SET return_value = tmp_value;
        ELSE
          
          SET return_value = NULL;
        END IF;
      END IF;
    END IF;
  END IF;
  RETURN return_value;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `check_money_mem_func` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `check_money_mem_func`(input_uid INT) RETURNS int
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Получить сумму по абоненту из radacctmem'
BEGIN
  DECLARE return_value INT DEFAULT 0;

  SELECT sum(deposit + credit)
INTO
  return_value
FROM
  radacctmem
WHERE
  uid = input_uid ORDER BY last_change LIMIT 1;

  RETURN return_value;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `check_privat_pay_account_payment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `check_privat_pay_account_payment`(input_ref VARCHAR(255)) RETURNS varchar(255) CHARSET koi8r
    DETERMINISTIC
    COMMENT 'Ищет, был ли уже проведён данный платёж'
BEGIN
  DECLARE `exist` varchar(255) DEFAULT '0';

  SELECT `ref`
  INTO
    exist
  FROM
    `addons_privat_payment_account`
  WHERE
    `ref` = `input_ref`;

  RETURN `exist`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `check_simul_usage_func` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `check_simul_usage_func`(input_uid INT) RETURNS int
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'check online'
BEGIN
  DECLARE return_value INT DEFAULT 0;

  SELECT count(uid)
  INTO
    return_value
  FROM
    radacctbras
  WHERE
    uid = input_uid;

  RETURN return_value;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `check_simul_usage_ip_func` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `check_simul_usage_ip_func`(input_ip VARBINARY(15)) RETURNS int
    READS SQL DATA
    DETERMINISTIC
    COMMENT 'Check Online by IP'
BEGIN
  DECLARE return_value INT DEFAULT 0;

  SELECT count(uid)
  INTO
    return_value
  FROM
    radacctbras
  WHERE
    framedipaddress = input_ip;

  RETURN return_value;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `convert_int_to_mac` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `convert_int_to_mac`(bint_num bigint) RETURNS char(17) CHARSET utf8mb4
    DETERMINISTIC
    COMMENT 'get mac from bint'
BEGIN
  DECLARE temp char(17);
  SET temp = LPAD(HEX(bint_num), 12, '0');
  RETURN CONCAT(LEFT(temp, 2), ':', MID(temp, 3, 2), ':', MID(temp, 5, 2), ':', MID(temp, 7, 2), ':', MID(temp, 9, 2), ':', MID(temp, 11, 2));

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_macid_by_bint` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_macid_by_bint`(bint_num bigint) RETURNS int
    DETERMINISTIC
    COMMENT 'get mac id from macdb by bint'
BEGIN
  DECLARE return_value bigint DEFAULT 0;
  DECLARE tmp_value int;

  SELECT
    `macid` INTO tmp_value
  FROM `macdb`
  WHERE `macint` = bint_num;

  IF tmp_value THEN
    SET return_value = tmp_value;
  ELSE

    INSERT INTO `macdb` (`macid`, `macint`)
      VALUES (NULL, bint_num);

    SET return_value = LAST_INSERT_ID();
  END IF;


  RETURN return_value;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_macid_by_mac` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_macid_by_mac`(mac_str char(17)) RETURNS bigint
    DETERMINISTIC
    COMMENT 'get macid from macdb by mac'
BEGIN
  DECLARE return_value bigint DEFAULT 0;
  DECLARE tmp_bint bigint DEFAULT 0;
  DECLARE tmp_value int;
  DECLARE tmp_mac char(17);

  SET tmp_mac = REPLACE(mac_str, ':', '');
  SET tmp_bint = CONV(tmp_mac, 16, 10);

  SELECT
    `macid` INTO tmp_value
  FROM `macdb`
  WHERE `macint` = tmp_bint;

  IF tmp_value THEN
    SET return_value = tmp_value;
  ELSE

    INSERT INTO `macdb` (`macid`, `macint`)
      VALUES (NULL, tmp_bint);

    SET return_value = LAST_INSERT_ID();
  END IF;

  RETURN return_value;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_version` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_version`() RETURNS varchar(10) CHARSET koi8r
    DETERMINISTIC
    COMMENT 'get version of mikbill'
BEGIN
 DECLARE return_value varchar(10) DEFAULT '2.8.16';
SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(`description`,'-',-1),'.',3) INTO
    return_value FROM `changelog` order by `change_number` DESC LIMIT 1;
RETURN return_value;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `user_generate_login_algorithm` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `user_generate_login_algorithm`() RETURNS varchar(255) CHARSET koi8r
    DETERMINISTIC
    COMMENT 'Генерируем логин на основании заданного метода'
BEGIN
  DECLARE `vn` INT;
  DECLARE `login` varchar(255);
  SET @keyName = 'viitenumber';

  
  
  SELECT `value` + 1 
  INTO
    `vn`
  FROM
    `system_options`
  WHERE
    `key` = @keyName;

  IF (ISNULL(`vn`)) THEN
    INSERT INTO `system_options` (`key`,value) VALUES (@keyName ,'1');
    SET `vn` = 1;
  ELSE
    UPDATE `system_options` SET `value` = `vn` WHERE `key` = @keyName;
  END IF;

  
  

  
  SET @summ = CAST(
(SUBSTR(`vn`,1,1)*3)+
(SUBSTR(`vn`,2,1)*7)+
(SUBSTR(`vn`,3,1)*1)+
(SUBSTR(`vn`,4,1)*3)+
(SUBSTR(`vn`,5,1)*7)+
(SUBSTR(`vn`,6,1)*1)+
(SUBSTR(`vn`,7,1)*3 + (SUBSTR(`vn`,8,1)*7)) AS SIGNED);

  SET @lastnum = CEIL(@summ / 10) * 10 - @summ;

  SET `login` = CONCAT(`vn`, @lastnum);

  RETURN `login`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `connect_switch_to_KOI8` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `connect_switch_to_KOI8`()
    DETERMINISTIC
    COMMENT 'Переключаем соединение в koi8r'
BEGIN
SET `character_set_results` = 'koi8r';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `connect_switch_to_UTF8` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `connect_switch_to_UTF8`()
    DETERMINISTIC
    COMMENT 'Переключаем соединение в utf8'
BEGIN
  SET `character_set_results` = 'utf8';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `del_ip_pool_us_by_ip` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `del_ip_pool_us_by_ip`(IN input_ip VARCHAR(15))
    DETERMINISTIC
    COMMENT 'Удалить IP из pool_use'
BEGIN
  DELETE
  FROM
    ip_pools_pool
  WHERE
    poolip LIKE input_ip;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `do_post_auth` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `do_post_auth`(IN uid INT, IN username VARCHAR(32), IN pass VARCHAR(32), IN packettypeid INT, IN replymessageid INT, IN nasid INT, IN nasportid INT, IN callingstationid VARCHAR(64))
    DETERMINISTIC
BEGIN
  INSERT INTO `radpostauthnew` VALUES (NULL, uid, username, pass, packettypeid, replymessageid, nasid, nasportid, callingstationid, current_timestamp);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `do_radnas_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `do_radnas_log`(IN nasipaddress   VARCHAR(15),
                               IN acctstatustype VARCHAR(32),
                               IN nasIdentifier  VARCHAR(64)
                               )
    DETERMINISTIC
    COMMENT 'делать лог включения NAS'
BEGIN
  INSERT INTO radnaslog VALUES (NULL, current_timestamp, nasipaddress, acctstatustype, nasIdentifier);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `do_switch_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `do_switch_log`(IN uid INT, IN swid INT, IN port INT, IN mac VARCHAR(17), IN vlan INT(5))
    MODIFIES SQL DATA
    DETERMINISTIC
    COMMENT 'Выполнить логирование события на свиче'
BEGIN
  INSERT INTO `switch_logs` VALUES (NULL, current_timestamp, uid, swid, port, mac, vlan);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `do_switch_opt82_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `do_switch_opt82_log`(IN `uid` INT, IN `user_mac` VARCHAR(17), IN `vlan` INT(5), IN `user_port` int(4), IN `swid` int, IN `logtypeid` smallint(10), IN `swid_mac` VARCHAR(17), IN `switch_circuit_id` varchar(64), IN `switch_remote_id` varchar(64))
    DETERMINISTIC
    COMMENT 'Выполнить логирование события в ядре по DHCP Option 82'
BEGIN
  INSERT INTO `switch_opt82_logs` VALUES (NULL, CURRENT_TIMESTAMP, `uid`, `user_mac`, `vlan`, `user_port`, `swid`, `logtypeid`, `swid_mac`, `switch_circuit_id`, `switch_remote_id`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_proper_by_login_from_users` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_proper_by_login_from_users`(IN input_login VARCHAR(32))
    DETERMINISTIC
    COMMENT 'Получить данные пользователя для ядра mikbill по login из users'
BEGIN
  SELECT *
  FROM
    users
  WHERE
    user = input_login;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ip_pool_insert_del_ip_1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ip_pool_insert_del_ip_1`(IN input_ip VARCHAR(15), IN input_poolid INT, IN input_time INT, IN input_acctsessionid VARCHAR(64), IN input_acctuniqueid VARCHAR(32), IN input_uid INT)
    DETERMINISTIC
    COMMENT 'Вставить в use и удалить из pool'
BEGIN
  INSERT INTO ip_pools_pool_use VALUES (input_ip, input_poolid, input_time, input_acctsessionid, input_acctuniqueid, input_uid);
  DELETE
  FROM
    ip_pools_pool
  WHERE
    poolip LIKE input_ip;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `kurva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `kurva`()
    DETERMINISTIC
begin

declare id int;
declare name2 varchar(50);
declare oldname varchar(50);
declare number2 int;
DECLARE done INT DEFAULT 0;

declare cr cursor for
select a.uid, b.user
  from users a
 inner join users b
    on a.houseid = b.houseid
   and a.app = b.app
 where a.app != 0 and b.app != 0
   and a.gid = 37 and b.gid != 37
order by b.user;

DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;

open cr;


REPEAT


FETCH cr INTO id, name2;

if name2 != oldname then
    set number2 = 0;
end if;

set number2 = number2 + 1;

update users
   set user = concat(name2, "-", number2)
 where uid = id;

set oldname = name2;

UNTIL done END REPEAT;
close cr;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `last_connection` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `last_connection`(IN input_uid bigint(16), IN input_time bigint)
    MODIFIES SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
  UPDATE `users`
  SET `last_connection` = FROM_UNIXTIME(input_time)
  WHERE uid = input_uid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mb_analyze_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mb_analyze_all`()
    COMMENT 'Анализ таблиц БД биллинга'
BEGIN
  DECLARE endloop   INT DEFAULT 0;
  DECLARE tableName CHAR(100);
  DECLARE rCursor CURSOR FOR SELECT `TABLE_NAME`
                             FROM
                               `information_schema`.`TABLES`
                             WHERE
                               ENGINE = 'InnoDB'
                               AND
                               `TABLE_SCHEMA` = database();
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET endloop = 1;

  OPEN rCursor;
  FETCH rCursor INTO tableName;

  WHILE endloop = 0
  DO
    SET @sql = concat("ANALYZE NO_WRITE_TO_BINLOG TABLE `", tableName, "`");
    PREPARE statement FROM @sql;
    EXECUTE statement;

    FETCH rCursor INTO tableName;
  END WHILE;

  CLOSE rCursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mb_optimize_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mb_optimize_all`()
    COMMENT 'Оптимизация таблиц БД биллинга'
BEGIN
  DECLARE endloop   INT DEFAULT 0;
  DECLARE tableName CHAR(100);
  DECLARE rCursor CURSOR FOR SELECT `TABLE_NAME`
                             FROM
                               `information_schema`.`TABLES`
                             WHERE
                               ENGINE = 'InnoDB'
                               AND
                               `TABLE_SCHEMA` = database();
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET endloop = 1;

  OPEN rCursor;
  FETCH rCursor INTO tableName;

  WHILE endloop = 0
DO
  SET @sql = concat("OPTIMIZE TABLE `", tableName, "`");
  PREPARE statement FROM @sql;
  EXECUTE statement;

  FETCH rCursor INTO tableName;
END WHILE;

  CLOSE rCursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mb_repair_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mb_repair_all`()
    COMMENT 'Проверка таблиц БД биллинга'
BEGIN
  DECLARE endloop   INT DEFAULT 0;
  DECLARE tableName CHAR(100);
  DECLARE rCursor CURSOR FOR SELECT `TABLE_NAME`
                             FROM
                               `information_schema`.`TABLES`
                             WHERE 
                                ENGINE = 'InnoDB' AND
                               `TABLE_SCHEMA` = database();
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET endloop = 1;

  OPEN rCursor;
  FETCH rCursor INTO tableName;

  WHILE endloop = 0
  DO
    SET @sql = concat("REPAIR TABLE `", tableName, "`");
    PREPARE statement FROM @sql;
    EXECUTE statement;

    FETCH rCursor INTO tableName;
  END WHILE;

  CLOSE rCursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mikbill_analyze_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mikbill_analyze_all`()
    COMMENT 'Анализ таблиц БД mikbill'
BEGIN
  DECLARE endloop   INT DEFAULT 0;
  DECLARE tableName CHAR(100);
  DECLARE rCursor CURSOR FOR SELECT `TABLE_NAME`
                             FROM
                               `information_schema`.`TABLES`
                             WHERE
                               ENGINE = 'InnoDB'
                               AND
                               `TABLE_SCHEMA` = database();
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET endloop = 1;

  OPEN rCursor;
  FETCH rCursor INTO tableName;

  WHILE endloop = 0
  DO
    SET @sql = concat("ANALYZE NO_WRITE_TO_BINLOG TABLE `", tableName, "`");
    PREPARE statement FROM @sql;
    EXECUTE statement;

    FETCH rCursor INTO tableName;
  END WHILE;

  CLOSE rCursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mikbill_optimize_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mikbill_optimize_all`()
    COMMENT 'Оптимизация таблиц БД mikbill'
BEGIN
  DECLARE endloop   INT DEFAULT 0;
  DECLARE tableName CHAR(100);
  DECLARE rCursor CURSOR FOR SELECT `TABLE_NAME`
                             FROM
                               `information_schema`.`TABLES`
                             WHERE
                               ENGINE = 'InnoDB'
                               AND
                               `TABLE_SCHEMA` = database();
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET endloop = 1;

  OPEN rCursor;
  FETCH rCursor INTO tableName;

  WHILE endloop = 0
DO
  SET @sql = concat("OPTIMIZE TABLE `", tableName, "`");
  PREPARE statement FROM @sql;
  EXECUTE statement;

  FETCH rCursor INTO tableName;
END WHILE;

  CLOSE rCursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mikbill_repair_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mikbill_repair_all`()
    COMMENT 'Проверка таблиц БД mikbill'
BEGIN
  DECLARE endloop   INT DEFAULT 0;
  DECLARE tableName CHAR(100);
  DECLARE rCursor CURSOR FOR SELECT `TABLE_NAME`
                             FROM
                               `information_schema`.`TABLES`
                             WHERE 
                                ENGINE = 'InnoDB' AND
                               `TABLE_SCHEMA` = database();
  DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET endloop = 1;

  OPEN rCursor;
  FETCH rCursor INTO tableName;

  WHILE endloop = 0
  DO
    SET @sql = concat("REPAIR TABLE `", tableName, "`");
    PREPARE statement FROM @sql;
    EXECUTE statement;

    FETCH rCursor INTO tableName;
  END WHILE;

  CLOSE rCursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_ip_pool_use_by_acct_packet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_ip_pool_use_by_acct_packet`(IN input_uid           INT,
                                                   IN input_acctsessionid VARCHAR(64),
                                                   IN input_acctuniqueid  VARCHAR(32),
                                                   IN input_last_change   INT
                                                   )
    DETERMINISTIC
    COMMENT 'Обновить ip_pool_use во время acct пакетов из radius'
BEGIN
  UPDATE ip_pools_pool_use
  SET
    last_change = input_last_change, acctsessionid = input_acctsessionid, acctuniqueid = input_acctuniqueid
  WHERE
    uid = input_uid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_ip_pool_use_only_time` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_ip_pool_use_only_time`(IN input_uid INT, IN input_last_change INT)
    DETERMINISTIC
    COMMENT 'Обновить ip_pool_use только время по UID'
BEGIN
  UPDATE ip_pools_pool_use
  SET
    last_change = input_last_change
  WHERE
    uid = input_uid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `actions`
--

/*!50001 DROP VIEW IF EXISTS `actions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `actions` AS select `r`.`username` AS `user`,`r`.`gid` AS `gid`,`r`.`acctsessionid` AS `id`,`r`.`acctuniqueid` AS `unique_id`,`r`.`acctsessiontime` AS `time_on`,`r`.`acctstarttime` AS `start_time`,`r`.`acctstoptime` AS `stop_time`,`r`.`acctinputoctets` AS `in_bytes`,`r`.`acctoutputoctets` AS `out_bytes`,`r`.`framedipaddress` AS `ip`,`r`.`nasipaddress` AS `server`,`r`.`nasipaddress` AS `client_ip`,`r`.`calledstationid` AS `call_to`,`r`.`callingstationid` AS `call_from`,_utf8mb4'' AS `connect_info`,`r`.`acctterminatecause` AS `terminate_cause`,`r`.`last_change` AS `last_change`,`r`.`before_billing` AS `before_billing`,`r`.`billing_minus` AS `billing_minus` from `radacct` `r` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `event_logs`
--

/*!50001 DROP VIEW IF EXISTS `event_logs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `event_logs` AS select `event_system`.`evid` AS `evid`,from_unixtime(`event_system`.`time`) AS `time`,`event_system`.`queue` AS `use_queue`,`event_system`.`uid` AS `uid`,`event_type`.`evname` AS `evname` from (`event_system` left join `event_type` on((`event_system`.`evtpid` = `event_type`.`evtpid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `inetonline`
--

/*!50001 DROP VIEW IF EXISTS `inetonline`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `inetonline` AS select `r`.`gid` AS `gid`,`r`.`uid` AS `uid`,`r`.`username` AS `user`,`r`.`nasportid` AS `port`,`r`.`nasipaddress` AS `server`,`r`.`framedipaddress` AS `ip`,`r`.`callingstationid` AS `call_from`,date_format(`r`.`acctstarttime`,_utf8mb4'%d %b, %H:%i:%s') AS `fstart_time`,`r`.`acctsessiontime` AS `time_on`,`r`.`acctinputoctets` AS `in_bytes`,`r`.`acctoutputoctets` AS `out_bytes`,`r`.`billing_minus` AS `billing_minus` from `radacctbras` `r` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `inetonlinenew`
--

/*!50001 DROP VIEW IF EXISTS `inetonlinenew`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `inetonlinenew` AS select `r`.`radacctid` AS `radacctid`,`r`.`acctsessionid` AS `acctsessionid`,`r`.`acctuniqueid` AS `acctuniqueid`,`r`.`username` AS `username`,`r`.`uid` AS `uid`,`r`.`gid` AS `gid`,`r`.`nasipaddress` AS `nasipaddress`,`r`.`nasportid` AS `nasportid`,`r`.`acctstarttime` AS `acctstarttime`,`r`.`acctstoptime` AS `acctstoptime`,`r`.`acctsessiontime` AS `acctsessiontime`,`r`.`acctinputoctets` AS `acctinputoctets`,`r`.`acctoutputoctets` AS `acctoutputoctets`,`r`.`calledstationid` AS `calledstationid`,`r`.`callingstationid` AS `callingstationid`,`r`.`acctterminatecause` AS `acctterminatecause`,`r`.`framedipaddress` AS `framedipaddress`,`r`.`last_change` AS `last_change`,`r`.`before_billing` AS `before_billing`,`r`.`billing_minus` AS `billing_minus` from `radacctbras` `r` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `inetonlinewithspeed`
--

/*!50001 DROP VIEW IF EXISTS `inetonlinewithspeed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `inetonlinewithspeed` AS select `r`.`radacctid` AS `radacctid`,`r`.`acctsessionid` AS `acctsessionid`,`r`.`acctuniqueid` AS `acctuniqueid`,`r`.`username` AS `username`,`r`.`uid` AS `uid`,`r`.`gid` AS `gid`,`r`.`nasipaddress` AS `nasipaddress`,`r`.`nasportid` AS `nasportid`,`r`.`acctstarttime` AS `acctstarttime`,`r`.`acctstoptime` AS `acctstoptime`,`r`.`acctsessiontime` AS `acctsessiontime`,`r`.`acctinputoctets` AS `acctinputoctets`,`r`.`acctoutputoctets` AS `acctoutputoctets`,`r`.`calledstationid` AS `calledstationid`,`r`.`callingstationid` AS `callingstationid`,`r`.`acctterminatecause` AS `acctterminatecause`,`r`.`framedipaddress` AS `framedipaddress`,`r`.`last_change` AS `last_change`,`r`.`before_billing` AS `before_billing`,`r`.`billing_minus` AS `billing_minus`,`u`.`speed_rate` AS `user_speed_in`,`u`.`speed_burst` AS `user_speed_out`,`p`.`do_mik_rad_shapers` AS `use_radius_shaper`,`p`.`speed_rate` AS `tarif_speed_in`,`p`.`speed_burst` AS `tarif_speed_out`,`p`.`shaper_prio` AS `tarif_shaper_prio` from ((`radacctbras` `r` join `users` `u`) join `packets` `p`) where ((`r`.`gid` = `u`.`gid`) and (`r`.`gid` = `p`.`gid`) and (`r`.`uid` = `u`.`uid`) and (`u`.`gid` = `p`.`gid`)) group by `r`.`uid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `inetspeedlist`
--

/*!50001 DROP VIEW IF EXISTS `inetspeedlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `inetspeedlist` AS select `u`.`user` AS `username`,`u`.`framed_ip` AS `framedipaddress`,`u`.`local_ip` AS `local_ip`,`u`.`speed_rate` AS `user_speed_in`,`u`.`speed_burst` AS `user_speed_out`,`p`.`speed_rate` AS `tarif_speed_in`,`p`.`speed_rate` AS `tarif_speed_out` from (`users` `u` join `packets` `p`) where (`u`.`gid` = `p`.`gid`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `map_online`
--

/*!50001 DROP VIEW IF EXISTS `map_online`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `map_online` AS select `r`.`radacctid` AS `radacctid`,`r`.`acctsessionid` AS `acctsessionid`,`r`.`acctuniqueid` AS `acctuniqueid`,`r`.`username` AS `username`,`r`.`uid` AS `uid`,`r`.`gid` AS `gid`,`r`.`nasipaddress` AS `nasipaddress`,`r`.`nasportid` AS `nasportid`,`r`.`acctstarttime` AS `acctstarttime`,`r`.`acctstoptime` AS `acctstoptime`,`r`.`acctsessiontime` AS `acctsessiontime`,`r`.`acctinputoctets` AS `acctinputoctets`,`r`.`acctoutputoctets` AS `acctoutputoctets`,`r`.`calledstationid` AS `calledstationid`,`r`.`callingstationid` AS `callingstationid`,`r`.`acctterminatecause` AS `acctterminatecause`,`r`.`framedipaddress` AS `framedipaddress`,`r`.`last_change` AS `last_change`,`r`.`before_billing` AS `before_billing`,`r`.`billing_minus` AS `billing_minus`,`u`.`app` AS `app`,`u`.`swid` AS `swid`,`u`.`switchport` AS `switchport`,`u`.`houseid` AS `houseid`,`u`.`speed_rate` AS `user_speed_in`,`u`.`speed_burst` AS `user_speed_out`,`p`.`do_mik_rad_shapers` AS `use_radius_shaper`,`p`.`speed_rate` AS `tarif_speed_in`,`p`.`speed_burst` AS `tarif_speed_out`,`p`.`shaper_prio` AS `tarif_shaper_prio` from ((`radacctbras` `r` join `users` `u`) join `packets` `p`) where ((`r`.`gid` = `u`.`gid`) and (`r`.`gid` = `p`.`gid`) and (`r`.`uid` = `u`.`uid`) and (`u`.`gid` = `p`.`gid`)) group by `r`.`uid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mb_view_tickets_messages`
--

/*!50001 DROP VIEW IF EXISTS `mb_view_tickets_messages`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mb_view_tickets_messages` AS select `m`.`messageid` AS `messageid`,`m`.`date` AS `date`,`m`.`ticketid` AS `ticketid`,`m`.`stuffid` AS `stuffid`,`p`.`fio` AS `stuff_fio`,`m`.`useruid` AS `useruid`,`u`.`fio` AS `user_fio`,`m`.`message` AS `message`,`m`.`unread` AS `unread`,`s`.`statustypename` AS `statustypename` from ((((`tickets_messages` `m` left join `users` `u` on((`m`.`useruid` = `u`.`uid`))) left join `stuff_personal` `p` on((`m`.`stuffid` = `p`.`stuffid`))) join `tickets_tickets` `t`) join `tickets_status_types` `s`) where ((`m`.`ticketid` = `t`.`ticketid`) and (`t`.`statustypeid` = `s`.`statustypeid`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `queue_active`
--

/*!50001 DROP VIEW IF EXISTS `queue_active`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `queue_active` AS select `queue_messages`.`m_id` AS `m_id`,`queue_types`.`mq_name` AS `mq_name`,`queue_messages`.`m_msg` AS `uid`,`queue_messages`.`m_created` AS `m_created`,`queue_messages`.`m_status` AS `m_status` from (`queue_messages` left join `queue_types` on((`queue_messages`.`mq_id` = `queue_types`.`mq_id`))) where (`queue_messages`.`m_status` = 'new') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `radpostauth`
--

/*!50001 DROP VIEW IF EXISTS `radpostauth`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `radpostauth` AS select `a`.`id` AS `id`,`a`.`username` AS `username`,`a`.`pass` AS `pass`,`t`.`packettype` AS `packettype`,`m`.`replymessage` AS `replymessage`,`n`.`nasname` AS `nasipaddress`,`a`.`nasportid` AS `nasportid`,`n`.`shortname` AS `nasident`,`a`.`callingstationid` AS `callingstationid`,`a`.`authdate` AS `authdate` from (((`radpostauthnew` `a` join `radpostauthpackettype` `t`) join `radpostauthreplymessage` `m`) join `radnas` `n`) where ((`a`.`packettypeid` = `a`.`packettypeid`) and (`a`.`replymessageid` = `m`.`replymessageid`) and (`n`.`id` = `a`.`nasid`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `users_view_fsb`
--

/*!50001 DROP VIEW IF EXISTS `users_view_fsb`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `users_view_fsb` AS select '0' AS `state`,`u`.`uid` AS `uid`,`u`.`user` AS `user`,`u`.`fio` AS `fio`,`u`.`phone` AS `phone`,`u`.`mob_tel` AS `mob_tel`,`u`.`sms_tel` AS `sms_tel`,`u`.`real_ip` AS `real_ip`,`u`.`framed_ip` AS `framed_ip`,`u`.`local_ip` AS `local_ip`,`u`.`local_mac` AS `local_mac`,`u`.`passportserie` AS `passportserie`,`u`.`passportpropiska` AS `passportpropiska`,`u`.`passportvoenkomat` AS `passportvoenkomat`,`u`.`passportgdevidan` AS `passportgdevidan`,`u`.`inn` AS `inn`,`u`.`date_birth` AS `date_birth`,`u`.`numdogovor` AS `numdogovor`,`u`.`use_router` AS `use_router`,`u`.`blocked` AS `blocked`,`u`.`last_connection` AS `last_connection`,`u`.`app` AS `app`,`u`.`houseid` AS `houseid`,`u`.`housingid` AS `housingid`,`u`.`houseblockid` AS `houseblockid`,`u`.`porch` AS `porch`,`u`.`floor` AS `floor` from `users` `u` union select '1' AS `state`,`uf`.`uid` AS `uid`,`uf`.`user` AS `user`,`uf`.`fio` AS `fio`,`uf`.`phone` AS `phone`,`uf`.`mob_tel` AS `mob_tel`,`uf`.`sms_tel` AS `sms_tel`,`uf`.`real_ip` AS `real_ip`,`uf`.`framed_ip` AS `framed_ip`,`uf`.`local_ip` AS `local_ip`,`uf`.`local_mac` AS `local_mac`,`uf`.`passportserie` AS `passportserie`,`uf`.`passportpropiska` AS `passportpropiska`,`uf`.`passportvoenkomat` AS `passportvoenkomat`,`uf`.`passportgdevidan` AS `passportgdevidan`,`uf`.`inn` AS `inn`,`uf`.`date_birth` AS `date_birth`,`uf`.`numdogovor` AS `numdogovor`,`uf`.`use_router` AS `use_router`,`uf`.`blocked` AS `blocked`,`uf`.`last_connection` AS `last_connection`,`uf`.`app` AS `app`,`uf`.`houseid` AS `houseid`,`uf`.`housingid` AS `housingid`,`uf`.`houseblockid` AS `houseblockid`,`uf`.`porch` AS `porch`,`uf`.`floor` AS `floor` from `usersfreeze` `uf` union select '2' AS `state`,`ub`.`uid` AS `uid`,`ub`.`user` AS `user`,`ub`.`fio` AS `fio`,`ub`.`phone` AS `phone`,`ub`.`mob_tel` AS `mob_tel`,`ub`.`sms_tel` AS `sms_tel`,`ub`.`real_ip` AS `real_ip`,`ub`.`framed_ip` AS `framed_ip`,`ub`.`local_ip` AS `local_ip`,`ub`.`local_mac` AS `local_mac`,`ub`.`passportserie` AS `passportserie`,`ub`.`passportpropiska` AS `passportpropiska`,`ub`.`passportvoenkomat` AS `passportvoenkomat`,`ub`.`passportgdevidan` AS `passportgdevidan`,`ub`.`inn` AS `inn`,`ub`.`date_birth` AS `date_birth`,`ub`.`numdogovor` AS `numdogovor`,`ub`.`use_router` AS `use_router`,`ub`.`blocked` AS `blocked`,`ub`.`last_connection` AS `last_connection`,`ub`.`app` AS `app`,`ub`.`houseid` AS `houseid`,`ub`.`housingid` AS `housingid`,`ub`.`houseblockid` AS `houseblockid`,`ub`.`porch` AS `porch`,`ub`.`floor` AS `floor` from `usersblok` `ub` union select '3' AS `state`,`ud`.`uid` AS `uid`,`ud`.`user` AS `user`,`ud`.`fio` AS `fio`,`ud`.`phone` AS `phone`,`ud`.`mob_tel` AS `mob_tel`,`ud`.`sms_tel` AS `sms_tel`,`ud`.`real_ip` AS `real_ip`,`ud`.`framed_ip` AS `framed_ip`,`ud`.`local_ip` AS `local_ip`,`ud`.`local_mac` AS `local_mac`,`ud`.`passportserie` AS `passportserie`,`ud`.`passportpropiska` AS `passportpropiska`,`ud`.`passportvoenkomat` AS `passportvoenkomat`,`ud`.`passportgdevidan` AS `passportgdevidan`,`ud`.`inn` AS `inn`,`ud`.`date_birth` AS `date_birth`,`ud`.`numdogovor` AS `numdogovor`,`ud`.`use_router` AS `use_router`,`ud`.`blocked` AS `blocked`,`ud`.`last_connection` AS `last_connection`,`ud`.`app` AS `app`,`ud`.`houseid` AS `houseid`,`ud`.`housingid` AS `housingid`,`ud`.`houseblockid` AS `houseblockid`,`ud`.`porch` AS `porch`,`ud`.`floor` AS `floor` from `usersdel` `ud` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `users_view_fsb_address`
--

/*!50001 DROP VIEW IF EXISTS `users_view_fsb_address`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `users_view_fsb_address` AS select concat(`l`.`lane`,' ',`h`.`house`,'-',`f`.`app`) AS `address`,`l`.`lane` AS `lane`,`h`.`house` AS `house`,`f`.`app` AS `app`,`h`.`porches` AS `porches`,`h`.`floors` AS `floors`,`f`.`uid` AS `uid`,`f`.`user` AS `user`,`f`.`fio` AS `fio` from ((`lanes_houses` `h` join `lanes` `l` on((`l`.`laneid` = `h`.`laneid`))) join `users_view_fsb` `f` on((`h`.`houseid` = `f`.`houseid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `usersadress`
--

/*!50001 DROP VIEW IF EXISTS `usersadress`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `usersadress` AS select concat(`l`.`lane`,' ',`h`.`house`,'-',`u`.`app`) AS `address`,`l`.`lane` AS `lane`,`h`.`house` AS `house`,`u`.`app` AS `app`,`h`.`porches` AS `porches`,`h`.`floors` AS `floors`,`u`.`uid` AS `uid`,`u`.`user` AS `user`,`u`.`fio` AS `fio` from ((`lanes_houses` `h` join `lanes` `l` on((`l`.`laneid` = `h`.`laneid`))) join `users` `u` on((`h`.`houseid` = `u`.`houseid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `usersall`
--

/*!50001 DROP VIEW IF EXISTS `usersall`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `usersall` AS select `u`.`user` AS `user`,`u`.`password` AS `password`,`u`.`uid` AS `uid`,`u`.`gid` AS `gid`,`u`.`deposit` AS `deposit`,`u`.`credit` AS `credit`,`u`.`fio` AS `fio`,`u`.`phone` AS `phone`,`u`.`prim` AS `prim`,`u`.`add_date` AS `add_date`,`u`.`blocked` AS `blocked`,`u`.`activated` AS `activated`,`u`.`framed_ip` AS `framed_ip`,`u`.`passportserie` AS `passportserie`,`u`.`passportpropiska` AS `passportpropiska`,`u`.`passportvoenkomat` AS `passportvoenkomat`,`u`.`passportgdevidan` AS `passportgdevidan`,`u`.`dogovor` AS `dogovor`,'None' AS `block_date`,'None' AS `del_date`,'None' AS `freeze_date`,`u`.`mob_tel` AS `mob_tel`,`u`.`numdogovor` AS `numdogovor`,`u`.`app` AS `app`,`u`.`houseid` AS `houseid`,'рабочий' AS `status` from `users` `u` union all select `ub`.`user` AS `user`,`ub`.`password` AS `password`,`ub`.`uid` AS `uid`,`ub`.`gid` AS `gid`,`ub`.`deposit` AS `deposit`,`ub`.`credit` AS `credit`,`ub`.`fio` AS `fio`,`ub`.`phone` AS `phone`,`ub`.`prim` AS `prim`,`ub`.`add_date` AS `add_date`,`ub`.`blocked` AS `blocked`,`ub`.`activated` AS `activated`,`ub`.`framed_ip` AS `framed_ip`,`ub`.`passportserie` AS `passportserie`,`ub`.`passportpropiska` AS `passportpropiska`,`ub`.`passportvoenkomat` AS `passportvoenkomat`,`ub`.`passportgdevidan` AS `passportgdevidan`,`ub`.`dogovor` AS `dogovor`,`ub`.`block_date` AS `block_date`,'None' AS `del_date`,'None' AS `freeze_date`,`ub`.`mob_tel` AS `mob_tel`,`ub`.`numdogovor` AS `numdogovor`,`ub`.`app` AS `app`,`ub`.`houseid` AS `houseid`,'отключенный' AS `status` from `usersblok` `ub` union all select `ud`.`user` AS `user`,`ud`.`password` AS `password`,`ud`.`uid` AS `uid`,`ud`.`gid` AS `gid`,`ud`.`deposit` AS `deposit`,`ud`.`credit` AS `credit`,`ud`.`fio` AS `fio`,`ud`.`phone` AS `phone`,`ud`.`prim` AS `prim`,`ud`.`add_date` AS `add_date`,`ud`.`blocked` AS `blocked`,`ud`.`activated` AS `activated`,`ud`.`framed_ip` AS `framed_ip`,`ud`.`passportserie` AS `passportserie`,`ud`.`passportpropiska` AS `passportpropiska`,`ud`.`passportvoenkomat` AS `passportvoenkomat`,`ud`.`passportgdevidan` AS `passportgdevidan`,`ud`.`dogovor` AS `dogovor`,`ud`.`block_date` AS `block_date`,`ud`.`del_date` AS `del_date`,'None' AS `freeze_date`,`ud`.`mob_tel` AS `mob_tel`,`ud`.`numdogovor` AS `numdogovor`,`ud`.`app` AS `app`,`ud`.`houseid` AS `houseid`,'удаленный' AS `status` from `usersdel` `ud` union all select `uf`.`user` AS `user`,`uf`.`password` AS `password`,`uf`.`uid` AS `uid`,`uf`.`gid` AS `gid`,`uf`.`deposit` AS `deposit`,`uf`.`credit` AS `credit`,`uf`.`fio` AS `fio`,`uf`.`phone` AS `phone`,`uf`.`prim` AS `prim`,`uf`.`add_date` AS `add_date`,`uf`.`blocked` AS `blocked`,`uf`.`activated` AS `activated`,`uf`.`framed_ip` AS `framed_ip`,`uf`.`passportserie` AS `passportserie`,`uf`.`passportpropiska` AS `passportpropiska`,`uf`.`passportvoenkomat` AS `passportvoenkomat`,`uf`.`passportgdevidan` AS `passportgdevidan`,`uf`.`dogovor` AS `dogovor`,'None' AS `block_date`,'None' AS `del_date`,`uf`.`freeze_date` AS `freeze_date`,`uf`.`mob_tel` AS `mob_tel`,`uf`.`numdogovor` AS `numdogovor`,`uf`.`app` AS `app`,`uf`.`houseid` AS `houseid`,'замороженный' AS `status` from `usersfreeze` `uf` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50112 SET @disable_bulk_load = IF (@is_rocksdb_supported, 'SET SESSION rocksdb_bulk_load = @old_rocksdb_bulk_load', 'SET @dummy_rocksdb_bulk_load = 0') */;
/*!50112 PREPARE s FROM @disable_bulk_load */;
/*!50112 EXECUTE s */;
/*!50112 DEALLOCATE PREPARE s */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-17 17:32:11
