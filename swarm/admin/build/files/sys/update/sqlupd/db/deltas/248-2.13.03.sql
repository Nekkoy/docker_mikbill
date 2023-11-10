--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('omegatv_on', '0');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('omegatv_public_key', '');

INSERT INTO `system_options` (`key`, `value`) 
VALUES ('omegatv_private_key', '');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
