--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `bugh_plategi_type` (`bughtypeid`, `typename`, `sign`, `fictitious`, `deposit_action`, `deposit_action_by_user`) VALUES ('145', 'Пополнение Sberbank.ru V1', '+', '0', '+', '+');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;