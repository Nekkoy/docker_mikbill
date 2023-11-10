--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE `doc_templates` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `doc_type` smallint(6) NOT NULL DEFAULT '1' COMMENT '1 - invoice',
  `usersgroupid` int(11) NOT NULL DEFAULT '0',
  `date_create` int(11) NOT NULL,
  `file` blob
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;

ALTER TABLE `doc_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doc_type` (`doc_type`),
  ADD KEY `usersgroupid` (`usersgroupid`);

ALTER TABLE `doc_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;