SET NAMES 'utf8';

DELETE FROM `system_options` WHERE `key` = 'compay_login' ;

INSERT INTO system_options (`key`, value) VALUES ('compay_login', '1');
