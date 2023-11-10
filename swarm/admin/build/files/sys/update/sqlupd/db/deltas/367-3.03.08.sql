--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO users_custom_fields SELECT `uid`, 'ext_discount_extended', '1' FROM usersfreeze WHERE `fixed_cost` > 0 ON DUPLICATE KEY UPDATE `value`=1;

INSERT INTO users_custom_fields SELECT `uid`, 'ext_discount_packet', `fixed_cost` FROM usersfreeze WHERE `fixed_cost` > 0 ON DUPLICATE KEY UPDATE `value`=`fixed_cost`;


--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
