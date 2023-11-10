--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `bugh_plategi_info` (
  `plategid` int(20) UNSIGNED NOT NULL,
  `comment` varchar(128) DEFAULT NULL,
  `what` varchar(128) DEFAULT NULL,
  `what_id` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;


ALTER TABLE `bugh_plategi_info`
  ADD PRIMARY KEY (`plategid`) USING BTREE;


ALTER TABLE `bugh_plategi_info`
  MODIFY `plategid` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `bugh_plategi_info` ADD INDEX `item_id` (`what_id`);
ALTER TABLE `bugh_plategi_info` ADD INDEX `ietm` (`what`);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
