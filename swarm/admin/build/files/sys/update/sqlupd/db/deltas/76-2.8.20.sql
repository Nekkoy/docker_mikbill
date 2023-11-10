SET NAMES 'utf8';

DELIMITER $$

DROP PROCEDURE last_connection$$
CREATE PROCEDURE last_connection (IN input_uid bigint(16), IN input_time bigint)
DETERMINISTIC
SQL SECURITY INVOKER
MODIFIES SQL DATA
BEGIN
  UPDATE `users`
  SET `last_connection` = FROM_UNIXTIME(input_time)
  WHERE uid = input_uid;
END
$$

DELIMITER ;

