--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

INSERT INTO `onu_registration_keys` (`id`, `name`) VALUES
(0, 'no key'),
(1, 'fio'),
(2, 'sattlementid'),
(3, 'laneid'),
(4, 'houseid'),
(5, 'apartment'),
(6, 'tele_number'),
(7, 'tele_sms'),
(8, 'email'),
(9, 'pass_seria'),
(10, 'pass_date'),
(11, 'pass_address'),
(12, 'pass_who_give'),
(13, 'inn'),
(14, 'devid'),
(15, 'serial'),
(16, 'tarif_cost'),
(17, 'speed'),
(18, 'work_cost'),
(19, 'add_dop_opor_count'),
(20, 'add_dop_opor_price'),
(21, 'real_ip'),
(22, 'link_length_optical'),
(23, 'link_length_utp'),
(24, 'pon_box'),
(25, 'report_date'),
(26, 'packet'),
(27, 'address'),
(28, 'stuff'),
(29, 'groupname'),
(30, 'partner'),
(31, 'partnerid');

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
