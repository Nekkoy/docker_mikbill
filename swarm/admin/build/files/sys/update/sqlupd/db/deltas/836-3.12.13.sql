--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TABLE `bugh_cards_log_deleted` (
  `cardslogid` mediumint UNSIGNED NOT NULL,
  `uid` bigint UNSIGNED NOT NULL,
  `card` char(64) NOT NULL,
  `cards_id` int UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `before_billing` double(20,6) NOT NULL,
  `summa` double(20,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;

ALTER TABLE `bugh_cards_log_deleted`
  ADD PRIMARY KEY (`cardslogid`),
  ADD KEY `card-index` (`card`),
  ADD KEY `date` (`date`),
  ADD KEY `uid` (`uid`),
  ADD KEY `uid-date` (`uid`,`date`);

ALTER TABLE `bugh_cards_log_deleted` MODIFY `cardslogid` mediumint UNSIGNED NOT NULL AUTO_INCREMENT;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;