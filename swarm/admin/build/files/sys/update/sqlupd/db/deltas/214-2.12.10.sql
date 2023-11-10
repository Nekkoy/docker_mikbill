--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';


--
-- Table structure for table `logs_auth_cabinet`
--

CREATE TABLE IF NOT EXISTS `logs_auth_cabinet` (
  `auth_id` mediumint(8) unsigned NOT NULL COMMENT 'AI',
  `login` varchar(32) NOT NULL COMMENT 'логин',
  `auth_ip` int(10) unsigned NOT NULL COMMENT 'IP авторизации',
  `auth_type` enum('denied','allowed','session','') NOT NULL COMMENT 'Результат авторизации: вход запрещён/разрешён/сессионный',
  `auth_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=koi8r AVG_ROW_LENGTH=106;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `logs_auth_cabinet`
--
ALTER TABLE `logs_auth_cabinet`
  ADD PRIMARY KEY (`auth_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `logs_auth_cabinet`
--
ALTER TABLE `logs_auth_cabinet`
  MODIFY `auth_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'AI';

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
