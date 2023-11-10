--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO radacctmem SELECT acctsessionid, acctuniqueid, uid, '0' as 'devid',  gid, blocked, deposit, credit, last_change FROM radacctmem_before31213 ON DUPLICATE KEY UPDATE radacctmem.deposit=radacctmem_before31213.deposit;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;