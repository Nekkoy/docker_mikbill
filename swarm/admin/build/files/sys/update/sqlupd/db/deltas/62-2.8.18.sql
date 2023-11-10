SET NAMES 'utf8';

DELIMITER $$

DROP FUNCTION IF EXISTS check_blocked_mem_func$$
CREATE FUNCTION check_blocked_mem_func (input_uid int)
RETURNS int(11)
DETERMINISTIC
SQL SECURITY INVOKER
READS SQL DATA
COMMENT 'Проверка на блокировку абонента в radacctmem'
BEGIN
  DECLARE return_value int DEFAULT 0;

  SELECT
    blocked INTO return_value
  FROM radacctmem
  WHERE uid = input_uid
  ORDER BY last_change LIMIT 1;

  RETURN return_value;

END
$$

DELIMITER ;

DELIMITER $$

DROP FUNCTION IF EXISTS check_money_mem_func$$
CREATE FUNCTION check_money_mem_func (input_uid int)
RETURNS int(11)
DETERMINISTIC
SQL SECURITY INVOKER
READS SQL DATA
COMMENT 'Получить сумму по абоненту из radacctmem'
BEGIN
  DECLARE return_value int DEFAULT 0;

  SELECT
    SUM(deposit + credit) INTO return_value
  FROM radacctmem
  WHERE uid = input_uid
  ORDER BY last_change LIMIT 1;

  RETURN return_value;

END
$$

DELIMITER ;

