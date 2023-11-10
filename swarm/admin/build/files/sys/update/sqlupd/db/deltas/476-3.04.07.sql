--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `bonus` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL COMMENT 'Название',
  `points` int(11) NOT NULL DEFAULT 0 COMMENT 'Бонусные баллы',
  `number_runs` int(11) DEFAULT 1 COMMENT 'Кол-во выполнений всего за жизнь',
  `event_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Событие в биллинге',
  `entity_id` int(11) DEFAULT NULL COMMENT 'Условие. Сущность',
  `operator` varchar(5) NOT NULL DEFAULT '=' COMMENT 'Условие. Оператор (>, >=, =, !=, <=, <)',
  `entity_value` varchar(128) DEFAULT NULL COMMENT 'Условие. Значение',
  `additional_condition` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Использовать дополнительное условие.  1-да, 0 -нет',
  `condition_equal` tinyint(1) DEFAULT 1 COMMENT 'Дополнительное условие \r\n\r\n1=and \r\n0=or',
  `entity_id_2` int(11) DEFAULT NULL,
  `operator_2` varchar(5) DEFAULT NULL,
  `entity_value_2` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `bonus` ADD PRIMARY KEY (`id`);
ALTER TABLE `bonus` MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;