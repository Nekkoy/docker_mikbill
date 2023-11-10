--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

TRUNCATE TABLE `queue_types`;

INSERT INTO `queue_types` (`mq_id`, `mq_name`, `mq_type`, `mq_created`, `mq_timeout`, `mq_maxerrors`, `mq_desc`, `mq_respond`, `mq_intval`, `mq_data`) VALUES
(1, 'userproperchange', 'message', '2018-11-08 10:51:24', 3000, 1, NULL, NULL, 2, NULL),
(2, 'kk', 'message', '2018-11-16 21:58:05', 3000, 1, NULL, NULL, 3, NULL),
(3, 'coapay', 'message', '2018-11-30 13:08:11', 3000, 1, NULL, NULL, 0, NULL),
(4, 'iptvadd', 'message', '2018-12-19 11:59:18', 3000, 1, NULL, NULL, 1, NULL),
(5, 'coablock', 'message', '2019-02-07 21:57:02', 3000, 1, NULL, NULL, 0, NULL),
(6, 'iptvdel', 'message', '2019-02-07 21:58:07', 3000, 1, NULL, NULL, 1, NULL),
(7, 'iptvglobalsuspended', 'message', '2019-03-25 13:44:44', 3000, 1, NULL, NULL, 1, NULL),
(8, 'call_mikbill_event', 'message', '2019-04-02 18:02:19', 3000, 1, NULL, NULL, 3, NULL),
(9, 'userchangepassword', 'message', '2019-04-10 08:06:08', 3000, 1, NULL, NULL, 2, NULL),
(10, 'userchangefio', 'message', '2019-04-25 11:52:02', 3000, 1, NULL, NULL, 2, NULL),
(11, 'coadevbill', 'message', '2019-04-26 20:58:07', 3000, 1, NULL, NULL, 0, NULL),
(12, 'iptvserviceportalchange', 'message', '2019-05-02 11:23:17', 3000, 1, NULL, NULL, 1, NULL),
(13, 'usdevportalchange', 'message', '2019-05-21 11:49:05', 3000, 1, NULL, NULL, 2, NULL),
(14, 'coaenable', 'message', '2019-05-29 09:35:22', 3000, 1, NULL, NULL, 0, NULL),
(15, 'iptvservicecategorychange', 'message', '2019-07-16 10:26:57', 3000, 1, NULL, NULL, 1, NULL),
(16, 'coafreeze', 'message', '2019-07-16 13:08:07', 3000, 1, NULL, NULL, 0, NULL),
(17, 'pod', 'message', '2019-08-05 16:32:50', 3000, 1, NULL, NULL, 3, NULL),
(18, 'iptvservicealiaschange', 'message', '2019-08-08 15:38:06', 3000, 1, NULL, NULL, 1, NULL),
(19, 'coachtarif', 'message', '2019-08-22 07:31:38', 3000, 1, NULL, NULL, 0, NULL),
(20, 'coabill', 'message', '2019-08-26 14:32:01', 3000, 1, NULL, NULL, 0, NULL),
(21, 'iptvservicetarifchange', 'message', '2019-11-27 12:08:41', 3000, 1, NULL, NULL, 1, NULL),
(22, 'komtet', 'message', '2019-11-28 11:36:10', 3000, 1, NULL, NULL, 3, NULL),
(23, 'nagrasyncsubs', 'message', '2019-12-30 10:46:20', 3000, 1, NULL, NULL, 1, NULL),
(24, 'userchangeemail', 'message', '2020-01-15 13:45:37', 3000, 1, NULL, NULL, 2, NULL),
(25, 'nagraaddmodule', 'message', '2020-01-17 11:32:49', 3000, 1, NULL, NULL, 1, NULL),
(26, 'nagrasyncpairing', 'message', '2020-01-17 12:40:40', 3000, 1, NULL, NULL, 1, NULL),
(27, 'iptvglobalenable', 'message', '2020-01-20 13:22:51', 3000, 1, NULL, NULL, 1, NULL),
(28, 'userchangedatebirth', 'message', '2020-01-27 08:12:03', 3000, 1, NULL, NULL, 2, NULL),
(29, 'userchangelogin', 'message', '2020-06-09 11:53:28', 3000, 1, NULL, NULL, 2, NULL),
(30, 'coapayment', 'message', '2020-07-22 09:54:34', 3000, 1, NULL, NULL, 0, NULL),
(31, 'iptvenable', 'message', '2020-10-26 14:16:09', 3000, 1, NULL, NULL, 1, NULL),
(32, 'iptvmultiadd', 'message', '2020-11-19 15:58:19', 3000, 1, NULL, NULL, 1, NULL),
(33, 'iptvmultidel', 'message', '2020-11-19 16:04:37', 3000, 1, NULL, NULL, 1, NULL),
(34, 'iptvdisable', 'message', '2021-02-23 11:00:47', 3000, 1, NULL, NULL, 1, NULL),
(35, 'drecryptaddcard', 'message', '2021-04-13 14:27:56', 3000, 1, NULL, NULL, 1, NULL),
(36, 'drecryptdelcard', 'message', '2021-04-14 10:15:00', 3000, 1, NULL, NULL, 1, NULL),
(37, 'drecryptchangecard', 'message', '2021-04-14 10:15:00', 3000, 1, NULL, NULL, 1, NULL),
(38, 'infocasmessage', 'message', '2021-08-27 13:24:43', 30, 5, NULL, NULL, 1, NULL),
(39, 'infocasmessageall', 'message', '2021-09-10 09:50:12', 3000, 1, NULL, NULL, 1, NULL),
(40, 'tarifchangespeed', 'message', '2022-04-12 10:33:00', 30, 5, NULL, NULL, 3, NULL),
(41, 'coarealip', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 0, NULL),
(42, 'coaturboblock', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 0, NULL),
(43, 'coaturbostart', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 0, NULL),
(44, 'coafreezed', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 0, NULL),
(45, 'coaunfreeze', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 0, NULL),
(46, 'coaunfreezed', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 0, NULL),
(47, 'coadisabled', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 0, NULL),
(48, 'coadeleted', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 0, NULL),
(49, 'coaunfreezedolg', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 0, NULL),
(50, 'coauserup', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 0, NULL),
(51, 'coacronblock', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 0, NULL),
(52, 'caocreditnull', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 0, NULL),
(53, 'caocreditpay', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 0, NULL),
(54, 'kernelkick', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 3, NULL),
(55, 'coamacreg', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 0, NULL),
(56, 'coaspeed', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 0, NULL),
(57, 'usdevdel', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 2, NULL),
(58, 'usdevadd', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 2, NULL),
(59, 'usdevchange', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 2, NULL),
(60, 'iptvmultienable', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 1, NULL),
(61, 'iptvmultidisable', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 1, NULL),
(62, 'iptvgidadd', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 1, NULL),
(63, 'iptvgiddel', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 1, NULL),
(64, 'atol', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 3, NULL),
(65, 'nagraaddcard', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 1, NULL),
(66, 'nagrachangecard', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 1, NULL),
(67, 'nagradelcard', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 1, NULL),
(68, 'nagrachangemodule', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 1, NULL),
(69, 'nagradelmodule', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 1, NULL),
(70, 'mail', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 3, NULL),
(71, 'mailingsms', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 3, NULL),
(72, 'mailingemail', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 3, NULL),
(73, 'mailingpost', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 3, NULL),
(74, 'multisms', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 3, NULL),
(75, 'trueipadddevice', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 1, NULL),
(76, 'trueipchangedevice', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 1, NULL),
(77, 'trueipdeldevice', 'message', '2022-04-13 13:05:50', 30, 5, NULL, NULL, 1, NULL);

UPDATE `queue_types` SET `mq_intval`=0 WHERE `mq_name` IN ('coapay','coablock','coadevbill','coaenable','coafreeze','coachtarif','coabill','coapayment','coarealip','coaturboblock','coaturbostart','coafreezed','coaunfreeze','coaunfreezed','coadisabled','coadeleted','coaunfreezedolg','coauserup','coacronblock','caocreditnull','caocreditpay','coamacreg','coaspeed');
UPDATE `queue_types` SET `mq_intval`=1 WHERE `mq_name` IN ('drecryptaddcard','drecryptchangecard','drecryptdelcard','infocasmessage','infocasmessageall','iptvadd','iptvdel','iptvdisable','iptvenable','iptvgidadd','iptvgiddel','iptvglobalenable','iptvglobalsuspended','iptvmultiadd','iptvmultidel','iptvmultidisable','iptvmultienable','iptvservicealiaschange','iptvservicecategorychange','iptvserviceportalchange','iptvservicetarifchange','nagraaddcard','nagraaddmodule','nagrachangecard','nagrachangemodule','nagradelcard','nagradelmodule','nagrasyncpairing','nagrasyncsubs','trueipadddevice','trueipchangedevice','trueipdeldevice');
UPDATE `queue_types` SET `mq_intval`=2 WHERE `mq_name` IN ('userproperchange','userchangepassword','userchangefio','usdevportalchange','userchangeemail','userchangedatebirth','userchangelogin','usdevdel','usdevadd','usdevchange');
UPDATE `queue_types` SET `mq_intval`=3 WHERE `mq_name` IN ('kk','call_mikbill_event','pod','komtet','tarifchangespeed','kernelkick','atol','mail','mailingsms','mailingemail','mailingpost','multisms');


/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;