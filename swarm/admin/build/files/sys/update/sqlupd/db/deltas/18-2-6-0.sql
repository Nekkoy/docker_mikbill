SET NAMES 'utf8';

INSERT INTO `users_custom_fields` SELECT `uid`, 'ext_date_fiz_contract_conclusion', `add_date` FROM `users` WHERE `uid` NOT IN (SELECT `uid` FROM `users_custom_fields` WHERE `key` = 'ext_date_fiz_contract_conclusion');
INSERT INTO `users_custom_fields` SELECT `uid`, 'ext_date_fiz_contract_conclusion', `add_date` FROM `usersfreeze` WHERE `uid` NOT IN (SELECT `uid` FROM `users_custom_fields` WHERE `key` = 'ext_date_fiz_contract_conclusion');
INSERT INTO `users_custom_fields` SELECT `uid`, 'ext_date_fiz_contract_conclusion', `add_date` FROM `usersblok` WHERE `uid` NOT IN (SELECT `uid` FROM `users_custom_fields` WHERE `key` = 'ext_date_fiz_contract_conclusion');
INSERT INTO `users_custom_fields` SELECT `uid`, 'ext_date_fiz_contract_conclusion', `add_date` FROM `usersdel` WHERE `uid` NOT IN (SELECT `uid` FROM `users_custom_fields` WHERE `key` = 'ext_date_fiz_contract_conclusion');


UPDATE `users_custom_fields` SET `value` = CONCAT(RIGHT(`value`, 4),'-',LEFT(`value`, 2),'-',LEFT(RIGHT(`value`, 7), 2)) WHERE `key` = 'ext_date_of_contract_conclusion';

--
-- Создать таблицу addons_baltica_bank
--
CREATE TABLE addons_baltica_bank (
  prv_txn INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
  txn_id CHAR(64) NOT NULL DEFAULT '',
  check_time DATETIME NOT NULL,
  time_from_osmp CHAR(20) DEFAULT NULL,
  uid BIGINT(20) UNSIGNED NOT NULL,
  account CHAR(20) NOT NULL,
  sum DOUBLE(14, 2) DEFAULT NULL,
  time_stamp DATETIME NOT NULL,
  PRIMARY KEY (prv_txn),
  INDEX `time` (check_time),
  INDEX timstamp (time_stamp),
  INDEX uid (account)
)
ENGINE = MYISAM
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Изменить таблицу packets
--
ALTER TABLE packets
  CHANGE COLUMN `fixed` `fixed` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0 - не снимать; 1 - КД, если было подключение; 7 - ОКД (фикс.); 10 - ОКД (фиксир.); 8 - обязательно каждый месяц; 9 - обязательно каждый месяц, потратить сумму; 11 - обязательно каждый месяц, плавающая дата';

--
-- Изменить таблицу users
--
ALTER TABLE users
  CHANGE COLUMN dogovor dogovor TINYINT(2) NOT NULL DEFAULT 0 COMMENT '0 - нет данных; 1 - активен; 2 - приостановлен; 3 - закрыт';

DELIMITER $$

--
-- Создать процедуру mikbill_analyze_all
--
CREATE PROCEDURE mikbill_analyze_all()
  COMMENT 'Анализ таблиц БД mikbill'
BEGIN
  DECLARE endloop   INT DEFAULT 0;
  DECLARE tableName CHAR(100);
  DECLARE rCursor CURSOR FOR SELECT `TABLE_NAME`
                             FROM
                               `information_schema`.`TABLES`
                             WHERE
                               ENGINE = 'MyISAM'
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
END
$$

--
-- Создать процедуру mikbill_optimize_all
--
CREATE PROCEDURE mikbill_optimize_all()
  COMMENT 'Оптимизация таблиц БД mikbill'
BEGIN
  DECLARE endloop   INT DEFAULT 0;
  DECLARE tableName CHAR(100);
  DECLARE rCursor CURSOR FOR SELECT `TABLE_NAME`
                             FROM
                               `information_schema`.`TABLES`
                             WHERE
                               ENGINE = 'MyISAM'
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
END
$$

--
-- Создать процедуру mikbill_repair_all
--
CREATE PROCEDURE mikbill_repair_all()
  COMMENT 'Проверка таблиц БД mikbill'
BEGIN
  DECLARE endloop   INT DEFAULT 0;
  DECLARE tableName CHAR(100);
  DECLARE rCursor CURSOR FOR SELECT `TABLE_NAME`
                             FROM
                               `information_schema`.`TABLES`
                             WHERE 
                                ENGINE = 'MyISAM' AND
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
END
$$

DELIMITER ;
