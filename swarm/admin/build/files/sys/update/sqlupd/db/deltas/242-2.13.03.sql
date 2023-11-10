--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `addons_ckassa` (
  `reg_id` int(10) UNSIGNED NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `account` varchar(128) NOT NULL,
  `amount` double(16,2) NOT NULL DEFAULT '0.00',
  `pay_id` varchar(50) NOT NULL DEFAULT '',
  `agent_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pay_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=koi8r;


ALTER TABLE `addons_ckassa`
  ADD PRIMARY KEY (`reg_id`);

ALTER TABLE `addons_ckassa`
  MODIFY `reg_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;


--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
