SET NAMES 'utf8';


DELIMITER $$

--
-- Изменить процедуру "connect_switch_to_KOI8"
--
DROP PROCEDURE connect_switch_to_KOI8$$
CREATE PROCEDURE connect_switch_to_KOI8()
  DETERMINISTIC
  COMMENT 'Переключаем соединение в koi8r'
BEGIN
SET `character_set_results` = 'koi8r';
END
$$

--
-- Изменить процедуру "connect_switch_to_UTF8"
--
DROP PROCEDURE connect_switch_to_UTF8$$
CREATE PROCEDURE connect_switch_to_UTF8()
  DETERMINISTIC
  COMMENT 'Переключаем соединение в utf8'
BEGIN
  SET `character_set_results` = 'utf8';
END
$$

--
-- Изменить процедуру "last_connection"
--
DROP PROCEDURE last_connection$$
CREATE PROCEDURE last_connection(IN uid BIGINT(16))
BEGIN
 UPDATE `users` SET `last_connection` = NOW() WHERE uid = uid; 
END
$$

--
-- Изменить функцию "check_blocked_mem_func"
--
DROP FUNCTION check_blocked_mem_func$$
CREATE FUNCTION check_blocked_mem_func(input_uid INT)
  RETURNS int(11)
  DETERMINISTIC
  READS SQL DATA
  COMMENT 'Проверка на блокировку абонента в radacctmem'
BEGIN
  DECLARE return_value INT DEFAULT 0;

  SELECT blocked
  INTO
    return_value
  FROM
    radacctmem
  WHERE
    uid = input_uid;

  RETURN return_value;

END
$$

--
-- Изменить функцию "check_money_mem_func"
--
DROP FUNCTION check_money_mem_func$$
CREATE FUNCTION check_money_mem_func(input_uid INT)
  RETURNS int(11)
  DETERMINISTIC
  READS SQL DATA
  COMMENT 'Получить сумму по абоненту из radacctmem'
BEGIN
  DECLARE return_value INT DEFAULT 0;

  SELECT sum(deposit + credit)
INTO
  return_value
FROM
  radacctmem
WHERE
  uid = input_uid;

  RETURN return_value;

END
$$

--
-- Создать функцию "get_version"
--
CREATE FUNCTION get_version()
  RETURNS varchar(10) CHARSET koi8r
  COMMENT 'get version of mikbill'
BEGIN
 DECLARE return_value varchar(10) DEFAULT '2.8.16';
SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(`description`,'-',-1),'.',3) INTO
    return_value FROM `changelog` order by `change_number` DESC LIMIT 1;
RETURN return_value;
END
$$


DELIMITER ;

