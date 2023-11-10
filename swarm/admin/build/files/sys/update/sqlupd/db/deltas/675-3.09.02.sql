--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `mod_sms_template` (
  `id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `template` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `mod_sms_template` ADD PRIMARY KEY (`id`);
ALTER TABLE `mod_sms_template` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

INSERT INTO `mod_sms_template` (`id`, `name`, `template`) VALUES
(1, 'Пополнение счета (deposit)', 'Счет пополнен успешно. Ваш баланс %deposit% %currency%'),
(2, 'Пополнение счета (login, deposit)', 'Уважаемый абонент (login %login%) счет пополнен. Ваш баланс %deposit% %currency%'),
(3, 'Пополнение счета (pay_amount, deposit)', 'Ваш счет пополнен на сумму %pay_amount% %currency% Теперь ваш баланс составляет %deposit% %currency%'),
(4, 'Пополнение счета (dogovor, pay_amount, deposit)', 'Ув. абонент ( лиц счет №: %dogovor%). Ваш счет пополнен на %pay_amount% %currency% На вашем счете %deposit% %currency%'),
(5, 'Осталось дней. (left_day)', 'Уважаемый абонент, услуга Интернет будет отключена через %left_day%-дня. Пополните свой счет.'),
(6, 'Остался 1 день', 'Уважаемый абонент, услуга Интернет будет отключена через 1 день. Пополните свой счет.'),
(7, 'Услуга будет отключена через n-дней (dogovor, left_day)', 'Ув.абонент (лиц счет №: %dogovor%). Услуга интернет будет отключена через %left_day%-дня. Пополните свой счет'),
(8, 'Смена тарифа (old_packet, new_packet)', 'Тариф: \"%old_packet%\" успешно изменен на новый тариф: \"%new_packet%\".');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
