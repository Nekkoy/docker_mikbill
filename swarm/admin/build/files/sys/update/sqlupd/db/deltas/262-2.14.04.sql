--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

DELETE FROM `system_options` WHERE `system_options`.`key` = 'nkorrr_uid_prio' ;
INSERT INTO `system_options` (`key`, `value`)
VALUES ('nkorr_uid_prio', '1'); 

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
