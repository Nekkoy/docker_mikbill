--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO `queue_types` (`mq_id`, `mq_name`, `mq_type`, `mq_created`, `mq_timeout`, `mq_maxerrors`, `mq_desc`, `mq_respond`, `mq_intval`, `mq_data`) VALUES (38, 'infocasmessage', 'message', CURRENT_TIMESTAMP, '30', '5', NULL, NULL, NULL, NULL);
INSERT INTO `queue_types` (`mq_id`, `mq_name`, `mq_type`, `mq_created`, `mq_timeout`, `mq_maxerrors`, `mq_desc`, `mq_respond`, `mq_intval`, `mq_data`) VALUES (39, 'infocasmessageall', 'message', CURRENT_TIMESTAMP, '30', '5', NULL, NULL, NULL, NULL);
INSERT INTO `queue_types` (`mq_id`, `mq_name`, `mq_type`, `mq_created`, `mq_timeout`, `mq_maxerrors`, `mq_desc`, `mq_respond`, `mq_intval`, `mq_data`) VALUES (40, 'infocasmessagedel', 'message', CURRENT_TIMESTAMP, '30', '5', NULL, NULL, NULL, NULL);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
