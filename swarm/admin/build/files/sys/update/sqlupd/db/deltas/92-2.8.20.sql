SET NAMES 'utf8';

--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;


DELIMITER $$

--
-- Изменить функцию "check_simul_usage_func"
--
DROP FUNCTION check_simul_usage_func$$
CREATE FUNCTION check_simul_usage_func(input_uid INT)
  RETURNS int(11)
  DETERMINISTIC
  READS SQL DATA
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
END
$$

--
-- Изменить функцию "check_simul_usage_ip_func"
--
DROP FUNCTION check_simul_usage_ip_func$$
CREATE FUNCTION check_simul_usage_ip_func(input_ip VARBINARY(15))
  RETURNS int(11)
  DETERMINISTIC
  READS SQL DATA
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
END
$$

DELIMITER ;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
