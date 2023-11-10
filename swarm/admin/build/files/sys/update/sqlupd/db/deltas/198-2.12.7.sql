--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) VALUES ('tinkoff_on', '0');

INSERT INTO `system_options` (`key`, `value`) VALUES ('tinkoff_terminal_key', '');

INSERT INTO `system_options` (`key`, `value`) VALUES ('tinkoff_secret_key', '');

INSERT INTO `system_options` (`key`, `value`) VALUES ('tinkoff_kommiss_percent', '0');

INSERT INTO `system_options` (`key`, `value`) VALUES ('tinkoff_percent', '0');


--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
