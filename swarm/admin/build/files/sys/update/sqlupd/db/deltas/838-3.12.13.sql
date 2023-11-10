--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `sender_templates` (
  `id` int(11) NOT NULL,
  `template` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `sender_templates` ADD PRIMARY KEY (`id`);
ALTER TABLE `sender_templates` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

INSERT INTO `sender_templates` (`id`, `template`) VALUES
(1, 'Ув. абонент, Ваш счет пополнен на %pay_amount% %currency% На вашем счете %deposit% %currency%'),
(2, 'Уважаемый абонент, услуга Интернет будет отключена через %left_day%-дня. Пополните свой счет.'),
(3, 'Уважаемый абонент, услуга Интернет будет отключена через 1 день. Пополните свой счет.');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;