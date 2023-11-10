--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `addons_novakom_street` (
  `code_s` int(11) UNSIGNED DEFAULT NULL,
  `name_street` varchar(128) DEFAULT NULL,
  `name_sr` varchar(128) DEFAULT NULL,
  `name_su` varchar(128) DEFAULT NULL,
  `name_town` varchar(128) DEFAULT NULL,
  `code_t` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;

ALTER TABLE `addons_novakom_street`
  ADD UNIQUE KEY `code_s` (`code_s`);

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
