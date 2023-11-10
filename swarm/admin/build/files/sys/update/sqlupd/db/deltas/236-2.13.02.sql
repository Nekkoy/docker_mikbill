--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `addons_paysoft` (
  `order_id` int(32) UNSIGNED NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` bigint(16) UNSIGNED NOT NULL,
  `payment_system` tinyint(1) NOT NULL,
  `amount` double(14,2) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=819 DEFAULT CHARSET=koi8r;

ALTER TABLE `addons_paysoft`
  ADD PRIMARY KEY (`order_id`);
  
ALTER TABLE `addons_paysoft`
    MODIFY `order_id` int(1) UNSIGNED NOT NULL AUTO_INCREMENT;
    

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
