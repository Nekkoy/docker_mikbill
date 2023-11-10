SET NAMES 'utf8';

INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES (99, 'Корректировка', '+', 0, '+', '+');

INSERT INTO bugh_plategi_type(bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES (100, 'Перевод личных средств', '+', 0, '+', '+');
UPDATE `bugh_plategi_type` SET `sign` = '/', `deposit_action` = '/' WHERE `bughtypeid` = 100;