--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE IF NOT EXISTS addons_simplepay (
order_id int(32) unsigned NOT NULL,
txn_id int(32) DEFAULT NULL,
uid int(14) NOT NULL,
amount double(14,2) NOT NULL,
server_time datetime DEFAULT NULL,
order_time datetime DEFAULT NULL,
status int(1) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=koi8r;

ALTER TABLE addons_simplepay
ADD PRIMARY KEY (order_id);

ALTER TABLE addons_simplepay
MODIFY order_id int(32) unsigned NOT NULL AUTO_INCREMENT;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
