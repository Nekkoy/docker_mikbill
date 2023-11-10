--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO system_options (`key`, `value`)
VALUES ('komtet_bughtypeid_40_on', '0');

INSERT INTO system_options (`key`, `value`)
VALUES ('komtet_bughtypeid_40_queue_id', '');

INSERT INTO system_options (`key`, `value`)
VALUES ('komtet_bughtypeid_40_print_check', '0');

INSERT INTO system_options (`key`, `value`)
VALUES ('komtet_bughtypeid_77_on', '0');

INSERT INTO system_options (`key`, `value`)
VALUES ('komtet_bughtypeid_77_queue_id', '');

INSERT INTO system_options (`key`, `value`)
VALUES ('komtet_bughtypeid_77_print_check', '0');


--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
