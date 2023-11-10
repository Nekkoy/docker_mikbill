--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `queue_types` (`mq_id`, `mq_name`, `mq_type`, `mq_created`, `mq_timeout`, `mq_maxerrors`, `mq_desc`, `mq_respond`, `mq_intval`, `mq_data`) VALUES (NULL, 'drecryptaddcard', 'message', CURRENT_TIMESTAMP, '3000', '1', NULL, NULL, NULL, NULL);
INSERT INTO `queue_types` (`mq_id`, `mq_name`, `mq_type`, `mq_created`, `mq_timeout`, `mq_maxerrors`, `mq_desc`, `mq_respond`, `mq_intval`, `mq_data`) VALUES (NULL, 'drecryptdelcard', 'message', CURRENT_TIMESTAMP, '3000', '1', NULL, NULL, NULL, NULL);
INSERT INTO `queue_types` (`mq_id`, `mq_name`, `mq_type`, `mq_created`, `mq_timeout`, `mq_maxerrors`, `mq_desc`, `mq_respond`, `mq_intval`, `mq_data`) VALUES (NULL, 'drecryptchangecard', 'message', CURRENT_TIMESTAMP, '3000', '1', NULL, NULL, NULL, NULL);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
