SET NAMES 'utf8';


DELIMITER $$

DROP FUNCTION check_simul_usage_func$$
CREATE FUNCTION check_simul_usage_func (input_uid int)
RETURNS int(11)
DETERMINISTIC
SQL SECURITY INVOKER
READS SQL DATA
COMMENT 'check online'
BEGIN
  DECLARE return_value int DEFAULT 0;

  SELECT
    COUNT(uid) INTO return_value
  FROM radacctbras
  WHERE uid = input_uid
  AND acctterminatecause = 'Online';

  RETURN return_value;
END
$$

DELIMITER ;


