--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE IF NOT EXISTS `addons_2click` (
  `pay_id` char(64) NOT NULL DEFAULT '',
  `service_id` char(20) NOT NULL,
  `uid` int(16) DEFAULT NULL,
  `trade_point` char(20) NOT NULL,
  `pay_account` char(20) NOT NULL,
  `pay_amount` double(14,2) DEFAULT NULL,
  `receipt_num` char(32) DEFAULT NULL,
  `time_stamp` char(32) NOT NULL,
  `status_code` char(5) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;
--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
