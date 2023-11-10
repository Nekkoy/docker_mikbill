--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

ALTER TABLE `logs_auth_admin` CHANGE `auth_type` `auth_type` ENUM('check2fa','allow2fa','deny2fa','denied','allowed','session','') CHARACTER SET koi8r COLLATE koi8r_general_ci NOT NULL COMMENT 'Результат авторизации: вход запрещён/разрешён/сессионный';

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
