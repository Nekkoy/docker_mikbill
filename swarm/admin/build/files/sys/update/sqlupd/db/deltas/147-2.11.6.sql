--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

DELIMITER $$

--
-- Изменить функцию "get_version"
--
DROP FUNCTION get_version$$
CREATE FUNCTION get_version()
  RETURNS varchar(10) CHARSET koi8r
  DETERMINISTIC
  COMMENT 'get version of mikbill'
BEGIN
 DECLARE return_value varchar(10) DEFAULT '2.8.16';
SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(`description`,'-',-1),'.',3) INTO
    return_value FROM `changelog` order by `change_number` DESC LIMIT 1;
RETURN return_value;
END
$$

DELIMITER ;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
