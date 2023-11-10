--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

UPDATE dev_user dest, (SELECT dev_fields.`value` as devtypeid, dev_fields.devid as devid FROM dev_fields where `key` = "devtypeid") src 
  SET dest.devtypeid = src.devtypeid where dest.devid=src.devid ;
--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
