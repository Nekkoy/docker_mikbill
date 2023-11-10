--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO `queue_types` (`mq_id`, `mq_name`) VALUES
(41, 'coarealip'),
(42, 'coaturboblock'),
(43, 'coaturbostart'),
(44, 'coafreezed'),
(45, 'coaunfreeze'),
(46, 'coaunfreezed'),
(47, 'coadisabled'),
(48, 'coadeleted'),
(49, 'coaunfreezedolg'),
(50, 'coauserup'),
(51, 'coacronblock'),
(52, 'caocreditnull'),
(53, 'caocreditpay'),
(54, 'kernelkick'),
(55, 'coamacreg'),
(56, 'coaspeed'),
(57, 'usdevdel'),
(58, 'usdevadd'),
(59, 'usdevchange'),
(60, 'iptvmultienable'),
(61, 'iptvmultidisable'),
(62, 'iptvgidadd'),
(63, 'iptvgiddel'),
(64, 'atol'),
(65, 'nagraaddcard'),
(66, 'nagrachangecard'),
(67, 'nagradelcard'),
(68, 'nagrachangemodule'),
(69, 'nagradelmodule'),
(70, 'mail'),
(71, 'mailingsms'),
(72, 'mailingemail'),
(73, 'mailingpost'),
(74, 'multisms'),
(75, 'trueipadddevice'),
(76, 'trueipchangedevice'),
(77, 'trueipdeldevice');

UPDATE `queue_types` SET `mq_intval`=0 WHERE `mq_id` IN (52, 53, 20, 5, 19, 51, 48, 11, 47, 14, 16, 44, 55, 3, 30, 41, 56, 42, 43, 45, 46, 49, 50);
UPDATE `queue_types` SET `mq_intval`=1 WHERE `mq_id` IN (35, 37, 36, 38, 39, 4, 6, 34, 31, 62, 63, 27, 7, 32, 33, 61, 60, 18, 15, 12, 21, 65, 25, 66, 68, 67, 69, 26, 23, 75, 76, 77);
UPDATE `queue_types` SET `mq_intval`=2 WHERE `mq_id` IN (58, 59, 57, 13, 28, 24, 10, 29, 9, 1);
UPDATE `queue_types` SET `mq_intval`=3 WHERE `mq_id` IN (64, 8, 54, 2, 22, 70, 72, 73, 71, 74, 17, 40);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;