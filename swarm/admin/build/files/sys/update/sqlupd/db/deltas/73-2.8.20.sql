SET NAMES 'utf8';


INSERT INTO system_options (`key`, value) VALUES ('speed_mbit_on', '0');

UPDATE system_options SET `value` = '400' WHERE `key` = 'online_timeout' and `value` = '330' ;