--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

UPDATE `userscontacts_labels` SET `name`='Lifecell' WHERE  `id`=6;
INSERT INTO `userscontacts_types` (`id`, `type`, `name`) VALUES ('8', 'subscription', 'Подписки');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;