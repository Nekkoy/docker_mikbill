--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

DELETE FROM `system_options` WHERE `system_options`.`key` = 'platezhka_ip';
DELETE FROM `system_options` WHERE `system_options`.`key` = 'platezhka_IP';

INSERT INTO `system_options` (`key`, `value`) VALUES ('platezhka_network', '62.149.15.210/32');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
