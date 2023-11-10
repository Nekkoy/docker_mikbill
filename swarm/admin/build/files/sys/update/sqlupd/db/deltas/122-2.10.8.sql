--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE services
  ADD COLUMN tarifservice TINYINT(3) UNSIGNED NOT NULL DEFAULT 0 AFTER last_update,
  ADD COLUMN serviceacl VARCHAR(32) CHARACTER SET koi8u COLLATE koi8u_general_ci NOT NULL DEFAULT '' AFTER tarifservice;
--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
