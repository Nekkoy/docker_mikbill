--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

CREATE TEMPORARY TABLE dev_fields_tmp AS SELECT DISTINCT * FROM dev_fields;
DELETE FROM `dev_fields`;
ALTER TABLE `dev_fields` ADD UNIQUE `id_key` (`devid`, `key`);
INSERT INTO dev_fields SELECT * FROM dev_fields_tmp ON DUPLICATE KEY UPDATE dev_fields.value=dev_fields_tmp.value;
DROP TABLE dev_fields_tmp;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;