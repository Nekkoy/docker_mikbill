--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `system_options` (`key`, `value`) VALUES ('sberbankrumrch_bundle_on', '0');

INSERT INTO `system_options` (`key`, `value`) VALUES ('sberbankrumrch_bundle_country', '');

INSERT INTO `system_options` (`key`, `value`) VALUES ('sberbankrumrch_bundle_city', '');

INSERT INTO `system_options` (`key`, `value`) VALUES ('sberbankrumrch_bundle_post_address', '');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;