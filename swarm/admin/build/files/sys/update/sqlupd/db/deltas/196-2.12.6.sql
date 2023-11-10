--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

DROP TABLE IF EXISTS `sms_type`;

CREATE TABLE `sms_type` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `sms_type`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `sms_type`
 MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

INSERT INTO `sms_type` (`id`, `name`) VALUES
(1, 'OTP'),
(2, 'SMS Register'),
(3, 'Restore pass'),
(4, 'Multi-SMS'),
(5, 'SMS-Info'),
(6, 'Balance Info');
 

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
