--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

UPDATE `connect_template_type` SET `segment`=1, `local_ip`=1, `local_mac`=1, `switch`=1, `dev_mac`=0, `dev_sn`=0 WHERE `id`=1;
UPDATE `connect_template_type` SET `segment`=1, `local_ip`=1, `local_mac`=1, `switch`=0, `dev_mac`=0, `dev_sn`=0 WHERE `id`=2;
UPDATE `connect_template_type` SET `segment`=1, `local_ip`=1, `local_mac`=1, `switch`=0, `dev_mac`=0, `dev_sn`=0 WHERE `id`=3;
UPDATE `connect_template_type` SET `segment`=1, `local_ip`=1, `local_mac`=1, `switch`=0, `dev_mac`=0, `dev_sn`=0 WHERE `id`=4;
UPDATE `connect_template_type` SET `segment`=1, `local_ip`=1, `local_mac`=0, `switch`=1, `dev_mac`=1, `dev_sn`=1 WHERE `id`=5;
UPDATE `connect_template_type` SET `segment`=1, `local_ip`=1, `local_mac`=0, `switch`=1, `dev_mac`=1, `dev_sn`=1 WHERE `id`=6;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
