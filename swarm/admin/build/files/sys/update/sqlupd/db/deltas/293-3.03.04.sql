--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `nms_docsis_commands` (`id`, `command`) VALUES
('1', 'CREATE_MODEM'),
('2', 'DELETE_MODEM'),
('3', 'BLOCK_MODEM'),
('4', 'UNBLOCK_MODEM'),
('5', 'CHANGE_PROFILE'),
('6', 'AUXILIARI'),
('7', 'BAN_MODEM');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
