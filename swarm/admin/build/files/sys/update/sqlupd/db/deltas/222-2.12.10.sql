--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

--
-- Table structure for table `stuff_apikeys`
--

DROP TABLE IF EXISTS `stuff_apikeys`;
CREATE TABLE IF NOT EXISTS `stuff_apikeys` (
  `apikeyid` int(10) unsigned NOT NULL,
  `apikeyname` varchar(32) CHARACTER SET koi8u NOT NULL DEFAULT '',
  `stuffid` tinyint(6) unsigned NOT NULL,
  `secret` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `stuff_apikeys`
--
ALTER TABLE `stuff_apikeys`
  ADD PRIMARY KEY (`apikeyid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `stuff_apikeys`
--
ALTER TABLE `stuff_apikeys` MODIFY `apikeyid` int(10) unsigned NOT NULL AUTO_INCREMENT;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
