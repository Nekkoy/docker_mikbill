--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `sender_conditions` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL COMMENT 'Название',
  `period` varchar(32) NOT NULL COMMENT 'Период:(all,day,month,year)',
  `period_count` int(11) NOT NULL COMMENT 'Кол-во выполнений за указанный период',
  `active` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Признак активности условия',
  `event_id` int(11) NOT NULL COMMENT 'ID события',
  `sender_tempate_id` int(11) NOT NULL COMMENT 'ID шаблона',
  `conditions` text DEFAULT NULL COMMENT 'Коллекция условий'
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;

ALTER TABLE `sender_conditions` ADD PRIMARY KEY (`id`);
ALTER TABLE `sender_conditions` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;