--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

INSERT INTO radacctbras SELECT radacctid, acctsessionid, acctuniqueid, username, uid, '0' as 'devid',  gid, nasipaddress, nasportid, acctstarttime, acctstoptime, acctsessiontime, acctinputoctets, acctoutputoctets, calledstationid, callingstationid, acctterminatecause, framedipaddress, last_change, before_billing, billing_minus FROM radacctbras_before31213 ON DUPLICATE KEY UPDATE radacctbras.deposit=radacctbras_before31213.deposit, radacctbras.billing_minus=radacctbras_before31213.billing_minus;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;