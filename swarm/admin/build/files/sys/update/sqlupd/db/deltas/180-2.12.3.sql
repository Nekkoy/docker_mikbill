--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';



DELIMITER $$

--
-- Создать функцию "convert_int_to_mac"
--
CREATE FUNCTION convert_int_to_mac(bint_num bigint)
  RETURNS char(17) CHARSET koi8r
  DETERMINISTIC
  COMMENT 'get mac from bint'
BEGIN
  DECLARE temp char(17);
  SET temp = LPAD(HEX(bint_num), 12, '0');
  RETURN CONCAT(LEFT(temp, 2), ':', MID(temp, 3, 2), ':', MID(temp, 5, 2), ':', MID(temp, 7, 2), ':', MID(temp, 9, 2), ':', MID(temp, 11, 2));

END
$$

--
-- Создать функцию "get_macid_by_bint"
--
CREATE FUNCTION get_macid_by_bint(bint_num bigint)
  RETURNS int(11)
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
END
$$

--
-- Создать функцию "get_macid_by_mac"
--
CREATE FUNCTION get_macid_by_mac(mac_str char(17))
  RETURNS bigint(20)
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

END
$$

DELIMITER ;


--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
