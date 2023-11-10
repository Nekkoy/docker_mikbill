SET NAMES 'utf8';

INSERT INTO system_options (`key`, value) VALUES ('use_ciscoasr_coa', '1');

INSERT INTO bugh_plategi_type (bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES (101, 'Пополнение TYME', '+', 0, '+', '+'); 

INSERT INTO system_options (`key`, value) VALUES ('TYME_uid_prio', '1'); 
INSERT INTO system_options (`key`, value) VALUES ('TYME_login_prio', '2'); 
INSERT INTO system_options (`key`, value) VALUES ('TYME_numdogovor_prio', '3');


