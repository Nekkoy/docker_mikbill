--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

DELIMITER $$

--
-- Изменить процедуру "do_switch_log"
--
DROP PROCEDURE do_switch_log$$
CREATE PROCEDURE do_switch_log(IN uid INT, IN swid INT, IN port INT, IN mac VARCHAR(17), IN vlan INT(5))
  DETERMINISTIC
  MODIFIES SQL DATA
  COMMENT 'Выполнить логирование события на свиче'
BEGIN
  INSERT INTO `switch_logs` VALUES (NULL, current_timestamp, uid, swid, port, mac, vlan);
END
$$

DELIMITER ;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
