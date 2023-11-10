--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE IF NOT EXISTS `bugh_report_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bugh_report_id` int(11) NOT NULL,
  `sequence_number` int(11) NOT NULL,
  `useruid` int(11) NOT NULL,
  `user` text CHARACTER SET utf8,
  `fio` text CHARACTER SET utf8,
  `debit_at_the_beginning` double(20,6) NOT NULL,
  `credit_at_the_beginning` double(20,6) NOT NULL,
  `connections` double(20,6) NOT NULL,
  `fee` double(20,6) NOT NULL,
  `allowances` double(20,6) NOT NULL,
  `paid` double(20,6) NOT NULL,
  `discounts` double(20,6) NOT NULL,
  `debit_at_the_end` double(20,6) NOT NULL,
  `credit_at_the_end` double(20,6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_id` (`bugh_report_id`),
  KEY `full_index` (`bugh_report_id`,`sequence_number`,`useruid`,`user`(128),`fio`(128),`debit_at_the_beginning`,`credit_at_the_beginning`,`connections`,`fee`,`allowances`,`paid`,`discounts`,`debit_at_the_end`,`credit_at_the_end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
