--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `mod_forpost_profiles` (
	`id` INT NOT NULL AUTO_INCREMENT COMMENT 'id профиля' ,
	`block_user` TINYINT NOT NULL DEFAULT '1' COMMENT 'блокировать юзера' ,
	`change_pass` TINYINT NOT NULL DEFAULT '0' COMMENT 'смена пароля при входе' ,
	`camera_online` TINYINT NOT NULL DEFAULT '1' COMMENT 'просмотр онлайн' ,
	`camera_archive_view` TINYINT NOT NULL DEFAULT '1' COMMENT 'просмотр архива' ,
	`camera_archive_save` TINYINT NOT NULL DEFAULT '1' COMMENT 'загрузка архива' ,
	`camera_settings` TINYINT NOT NULL DEFAULT '0' COMMENT 'доступ к настройкам' ,
	`profile_name` VARCHAR(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;