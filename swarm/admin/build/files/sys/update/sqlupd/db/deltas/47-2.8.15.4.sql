SET NAMES 'utf8';

UPDATE bugh_plategi_type SET typename = 'Пополнение ЯПК' WHERE bughtypeid = 86;
UPDATE bugh_plategi_type SET typename = 'Пополнение СберБанк России (ООО Биллинговые Технологии)' WHERE bughtypeid = 76;

INSERT INTO radpostauthreplymessage (`replymessageid`, `replymessage`) VALUES (30,'Пользователь в группе замороженных');
INSERT INTO radpostauthreplymessage (`replymessageid`, `replymessage`) VALUES (31,'Пользователь в группе неизвестные');

