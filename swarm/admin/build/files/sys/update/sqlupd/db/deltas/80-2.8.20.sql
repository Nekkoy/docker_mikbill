SET NAMES 'utf8';

DELIMITER $$

DROP FUNCTION check_simul_usage_ip_func$$
CREATE FUNCTION check_simul_usage_ip_func (input_ip varbinary(15))
RETURNS int(11)
DETERMINISTIC
SQL SECURITY INVOKER
READS SQL DATA
COMMENT 'Check Online by IP'
BEGIN
  DECLARE return_value int DEFAULT 0;

  SELECT
    COUNT(uid) INTO return_value
  FROM radacctbras
  WHERE framedipaddress = input_ip
  AND acctterminatecause = 'Online';

  RETURN return_value;
END
$$

DELIMITER ;


