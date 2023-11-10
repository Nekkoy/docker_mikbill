--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';


--
-- Table structure for table `session_stat`
--

DROP TABLE IF EXISTS `session_stat`;
CREATE TABLE IF NOT EXISTS `session_stat` (
  `id` char(32) NOT NULL DEFAULT '',
  `modified` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `session_stat`
--
ALTER TABLE `session_stat`
  ADD PRIMARY KEY (`id`);

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
