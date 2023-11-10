--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

--
-- Table structure for table `addons_fondy`
--

DROP TABLE IF EXISTS `addons_oplata`;
CREATE TABLE IF NOT EXISTS `addons_fondy` (
  `order_id` int(11) unsigned NOT NULL,
  `uid` bigint(16) unsigned DEFAULT NULL,
  `amount` decimal(18,2) unsigned DEFAULT NULL,
  `server_time` datetime DEFAULT NULL,
  `order_time` varchar(30) NOT NULL,
  `txn_id` int(19) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addons_fondy`
--
ALTER TABLE `addons_fondy`
  ADD PRIMARY KEY (`order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addons_fondy`
--
ALTER TABLE `addons_fondy`
  MODIFY `order_id` int(11) unsigned NOT NULL AUTO_INCREMENT;


DELETE FROM `bugh_plategi_type` WHERE `bughtypeid` = 97;

INSERT INTO `bugh_plategi_type` (`bughtypeid`, `typename`, `sign`, `fictitious`, `deposit_action`, `deposit_action_by_user`) VALUES ('97', 'Пополнение Fondy', '+', '0', '+', '+');
--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
