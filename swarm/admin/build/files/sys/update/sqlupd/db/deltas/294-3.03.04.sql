--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE IF NOT EXISTS `nms_docsis_queue` (
  `id` bigint(20) NOT NULL COMMENT 'id очереди',
  `uid` int(11) NOT NULL COMMENT 'uid абонента',
  `devid` int(11) NOT NULL COMMENT 'id устройства',
  `dev_mac` varchar(17) NOT NULL COMMENT 'MAC адрес оборудования',
  `gid` int(11) NOT NULL COMMENT 'id тарифа',
  `command_id` smallint(6) NOT NULL COMMENT 'id команды',
  `date` datetime NOT NULL COMMENT 'дата добавления/выполнения',
  `status` tinyint(4) NOT NULL COMMENT 'статус очереди (-1 ошибка, 0 ждет выполнения, 1 в очереди, 2 выполнено)'
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;

ALTER TABLE `nms_docsis_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gid` (`gid`),
  ADD KEY `uid` (`uid`) USING BTREE,
  ADD KEY `status_by_date` (`date`,`status`) USING BTREE,
  ADD KEY `commands` (`command_id`);

ALTER TABLE `nms_docsis_queue`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id очереди', AUTO_INCREMENT=1;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
