SET NAMES 'utf8';

INSERT INTO system_options (`key`, value) VALUES ('use_accl_coa' , '0');
INSERT INTO system_options (`key`, value) VALUES ('nonstop_max_amount' , '1000');
INSERT INTO system_options (`key`, value) VALUES ('nonstop_min_amount' , '1');

INSERT INTO system_options (`key`, value) VALUES ('iptvportal_login' , 'login');
INSERT INTO system_options (`key`, value) VALUES ('iptvportal_pass' , 'pass');
INSERT INTO system_options (`key`, value) VALUES ('iptvportal_subdomain' , 'url');

INSERT INTO system_options (`key`, value) VALUES ('strict_dhcp_mode' , '0');

INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES (94, 'Пополнение Xplat', '+', 0, '+', '+'); 
INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES (95, 'Пополнение РНКБ', '+', 0, '+', '+'); 

UPDATE  `bugh_plategi_type` SET  `typename` =  'Пополнение City-Pay' WHERE  `bugh_plategi_type`.`bughtypeid` =55;

INSERT INTO system_options (`key`, value) VALUES ('xplat_uid_prio', '1'); 
INSERT INTO system_options (`key`, value) VALUES ('xplat_login_prio', '2'); 
INSERT INTO system_options (`key`, value) VALUES ('xplat_numdogovor_prio', '3'); 

INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES (96, 'Пополнение PayBerry', '+', 0, '+', '+');

INSERT INTO system_options (`key`, value) VALUES ('payberry_uid_prio', '1');
INSERT INTO system_options (`key`, value) VALUES ('payberry_login_prio', '2');
INSERT INTO system_options (`key`, value) VALUES ('payberry_numdogovor_prio', '3');

