--
-- Dumping routines for database 'mikbill'
--
/*!50003 DROP FUNCTION IF EXISTS `check_blocked_func` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `check_blocked_func`(input_uid int) RETURNS int(11)
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `check_blocked_mem_func` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `check_blocked_mem_func`(input_uid INT) RETURNS int(11)
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

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `check_ip_pool_simul_use` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `check_ip_pool_simul_use`(input_uid INT, input_ip VARCHAR(15)) RETURNS int(11)
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `check_ip_pool_simul_use_by_ip` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `check_ip_pool_simul_use_by_ip`(input_ip VARCHAR(15)) RETURNS int(11)
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `check_money_func` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `check_money_func`(input_uid int) RETURNS int(11)
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

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `check_money_mem_func` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `check_money_mem_func`(input_uid INT) RETURNS int(11)
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

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `check_privat_pay_account_payment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `check_privat_pay_account_payment`(input_ref VARCHAR(255)) RETURNS varchar(255) CHARSET koi8r
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `check_simul_usage_func` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `check_simul_usage_func`(input_uid INT) RETURNS int(11)
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `check_simul_usage_ip_func` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `check_simul_usage_ip_func`(input_ip VARBINARY(15)) RETURNS int(11)
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_version` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `get_version`() RETURNS varchar(10) CHARSET koi8r
    DETERMINISTIC
    COMMENT 'get version of mikbill'
BEGIN
 DECLARE return_value varchar(10) DEFAULT '2.8.16';
SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(`description`,'-',-1),'.',3) INTO
    return_value FROM `changelog` order by `change_number` DESC LIMIT 1;
RETURN return_value;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `user_generate_login_algorithm` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `user_generate_login_algorithm`() RETURNS varchar(255) CHARSET koi8r
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `connect_switch_to_KOI8` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `connect_switch_to_KOI8`()
    DETERMINISTIC
    COMMENT 'Переключаем соединение в koi8r'
BEGIN
SET `character_set_results` = 'koi8r';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `connect_switch_to_UTF8` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `connect_switch_to_UTF8`()
    DETERMINISTIC
    COMMENT 'Переключаем соединение в utf8'
BEGIN
  SET `character_set_results` = 'utf8';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `del_ip_pool_us_by_ip` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `del_ip_pool_us_by_ip`(IN input_ip VARCHAR(15))
    DETERMINISTIC
    COMMENT 'Удалить IP из pool_use'
BEGIN
  DELETE
  FROM
    ip_pools_pool
  WHERE
    poolip LIKE input_ip;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `do_post_auth` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `do_post_auth`(IN uid INT, IN username VARCHAR(32), IN pass VARCHAR(32), IN packettypeid INT, IN replymessageid INT, IN nasid INT, IN nasportid INT, IN callingstationid VARCHAR(64))
    DETERMINISTIC
BEGIN
  INSERT INTO `radpostauthnew` VALUES (NULL, uid, username, pass, packettypeid, replymessageid, nasid, nasportid, callingstationid, current_timestamp);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `do_radnas_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `do_radnas_log`(IN nasipaddress   VARCHAR(15),
                               IN acctstatustype VARCHAR(32),
                               IN nasIdentifier  VARCHAR(64)
                               )
    DETERMINISTIC
    COMMENT 'делать лог включения NAS'
BEGIN
  INSERT INTO radnaslog VALUES (NULL, current_timestamp, nasipaddress, acctstatustype, nasIdentifier);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `do_switch_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `do_switch_log`(IN uid INT, IN swid INT, IN port INT, IN mac VARCHAR(17), IN vlan INT(5))
    MODIFIES SQL DATA
    DETERMINISTIC
    COMMENT 'Выполнить логирование события на свиче'
BEGIN
  INSERT INTO `switch_logs` VALUES (NULL, current_timestamp, uid, swid, port, mac, vlan);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `do_switch_opt82_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `do_switch_opt82_log`(IN `uid` INT, IN `user_mac` VARCHAR(17), IN `vlan` INT(5), IN `user_port` int(4), IN `swid` int, IN `logtypeid` smallint(10), IN `swid_mac` VARCHAR(17), IN `switch_circuit_id` varchar(64), IN `switch_remote_id` varchar(64))
    DETERMINISTIC
    COMMENT 'Выполнить логирование события в ядре по DHCP Option 82'
BEGIN
  INSERT INTO `switch_opt82_logs` VALUES (NULL, CURRENT_TIMESTAMP, `uid`, `user_mac`, `vlan`, `user_port`, `swid`, `logtypeid`, `swid_mac`, `switch_circuit_id`, `switch_remote_id`);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_proper_by_login_from_users` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `get_user_proper_by_login_from_users`(IN input_login VARCHAR(32))
    DETERMINISTIC
    COMMENT 'Получить данные пользователя для ядра mikbill по login из users'
BEGIN
  SELECT *
  FROM
    users
  WHERE
    user = input_login;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ip_pool_insert_del_ip_1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `ip_pool_insert_del_ip_1`(IN input_ip VARCHAR(15), IN input_poolid INT, IN input_time INT, IN input_acctsessionid VARCHAR(64), IN input_acctuniqueid VARCHAR(32), IN input_uid INT)
    DETERMINISTIC
    COMMENT 'Вставить в use и удалить из pool'
BEGIN
  INSERT INTO ip_pools_pool_use VALUES (input_ip, input_poolid, input_time, input_acctsessionid, input_acctuniqueid, input_uid);
  DELETE
  FROM
    ip_pools_pool
  WHERE
    poolip LIKE input_ip;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `kurva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `kurva`()
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

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `last_connection` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `last_connection`(IN input_uid bigint(16), IN input_time bigint)
    MODIFIES SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
  UPDATE `users`
  SET `last_connection` = FROM_UNIXTIME(input_time)
  WHERE uid = input_uid;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mikbill_analyze_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `mikbill_analyze_all`()
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mikbill_optimize_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `mikbill_optimize_all`()
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mikbill_repair_all` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `mikbill_repair_all`()
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_ip_pool_use_by_acct_packet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `update_ip_pool_use_by_acct_packet`(IN input_uid           INT,
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_ip_pool_use_only_time` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `update_ip_pool_use_only_time`(IN input_uid INT, IN input_last_change INT)
    DETERMINISTIC
    COMMENT 'Обновить ip_pool_use только время по UID'
BEGIN
  UPDATE ip_pools_pool_use
  SET
    last_change = input_last_change
  WHERE
    uid = input_uid;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;