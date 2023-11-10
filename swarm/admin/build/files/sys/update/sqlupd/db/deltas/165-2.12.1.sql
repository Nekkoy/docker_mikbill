--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

CREATE TABLE addons_yandex_money (
order_id int(11) UNSIGNED NOT NULL,
uid bigint(16) UNSIGNED DEFAULT NULL,
amount decimal(18,2) UNSIGNED DEFAULT NULL,
server_time datetime DEFAULT NULL,
order_time datetime DEFAULT NULL,
status tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AVG_ROW_LENGTH=151 DEFAULT CHARSET=koi8r;

ALTER TABLE addons_yandex_money
ADD PRIMARY KEY (order_id);

ALTER TABLE addons_yandex_money
MODIFY order_id int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
