--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `bugh_plategi_type` (`bughtypeid`, `typename`, `sign`, `fictitious`, `deposit_action`, `deposit_action_by_user`) VALUES
(130, 'Пополнение AB SEB Bankas', '+', 0, '+', '+'),
(131, 'Пополнение Luminor Bank', '+', 0, '+', '+'),
(132, 'Пополнение Swedbank', '+', 0, '+', '+'),
(133, 'Пополнение Viena Saskaita', '+', 0, '+', '+'),
(134, 'Пополнение Perlas', '+', 0, '+', '+'),
(135, 'Пополнение Maxima', '+', 0, '+', '+');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
