--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES ('gui', 'user_registration_phone_as_login', 0x31);
INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES ('gui', 'user_registration_otp_pattern', 0x31);
	
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;