SET NAMES 'utf8';

INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES (98, 'Пополнение СберБанк2826', '+', 0, '+', '+'); 

INSERT INTO system_options (`key`, value) VALUES ('sberbankru2826_uid_prio', '1'); 
INSERT INTO system_options (`key`, value) VALUES ('sberbankru2826_login_prio', '2'); 
INSERT INTO system_options (`key`, value) VALUES ('sberbankru2826_numdogovor_prio', '3');


INSERT INTO system_options (`key`, value) VALUES ('RNKB_uid_prio', '1'); 
INSERT INTO system_options (`key`, value) VALUES ('RNKB_login_prio', '2'); 
INSERT INTO system_options (`key`, value) VALUES ('RNKB_numdogovor_prio', '3');