SET NAMES 'utf8';

--
-- Структура таблицы `radacctbras`
--

DROP TABLE IF EXISTS `radacctbras`;
CREATE TABLE IF NOT EXISTS `radacctbras` (
  `radacctid` bigint(21) NOT NULL,
  `acctsessionid` varchar(64) NOT NULL,
  `acctuniqueid` varchar(32) NOT NULL,
  `username` varchar(32) CHARACTER SET koi8r COLLATE koi8r_bin NOT NULL,
  `uid` bigint(16) unsigned DEFAULT NULL,
  `gid` smallint(5) unsigned DEFAULT NULL,
  `nasipaddress` varchar(15) NOT NULL,
  `nasportid` varchar(15) DEFAULT NULL,
  `acctstarttime` datetime DEFAULT NULL,
  `acctstoptime` datetime DEFAULT NULL,
  `acctsessiontime` int(12) DEFAULT NULL,
  `acctinputoctets` bigint(20) DEFAULT NULL,
  `acctoutputoctets` bigint(20) DEFAULT NULL,
  `calledstationid` varchar(50) NOT NULL,
  `callingstationid` varchar(50) NOT NULL,
  `acctterminatecause` varchar(32) NOT NULL,
  `framedipaddress` varchar(15) NOT NULL,
  `last_change` int(10) unsigned NOT NULL DEFAULT '0',
  `before_billing` double(20,6) NOT NULL,
  `billing_minus` double(20,6) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=koi8r AVG_ROW_LENGTH=1820;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `radacctbras`
--
ALTER TABLE `radacctbras`
  ADD PRIMARY KEY (`radacctid`),
  ADD KEY `acctsessionid` (`acctsessionid`),
  ADD KEY `acctsessiontime` (`acctsessiontime`),
  ADD KEY `acctstarttime` (`acctstarttime`),
  ADD KEY `acctstoptime` (`acctstoptime`),
  ADD KEY `acctuniqueid` (`acctuniqueid`),
  ADD KEY `framedipaddress` (`framedipaddress`),
  ADD KEY `framed-terminate` (`framedipaddress`,`acctterminatecause`),
  ADD KEY `mrtggid` (`gid`,`acctterminatecause`),
  ADD KEY `mrtguid` (`uid`,`acctterminatecause`),
  ADD KEY `nasipaddress` (`nasipaddress`),
  ADD KEY `Online_index` (`acctterminatecause`),
  ADD KEY `ses-user-nas` (`acctsessionid`,`username`,`nasipaddress`),
  ADD KEY `time_user` (`username`,`acctsessionid`,`acctsessiontime`,`acctstarttime`,`acctstoptime`),
  ADD KEY `uid` (`uid`,`gid`),
  ADD KEY `uniq-user-nas` (`acctuniqueid`,`username`,`nasipaddress`),
  ADD KEY `user_uid` (`uid`),
  ADD KEY `username` (`username`),
  ADD KEY `user-start-time` (`username`,`acctstarttime`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `radacctbras`
--
ALTER TABLE `radacctbras`
  MODIFY `radacctid` bigint(21) NOT NULL AUTO_INCREMENT;

