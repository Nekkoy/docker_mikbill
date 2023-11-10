SET NAMES 'utf8';


INSERT INTO system_options (`key`, value) VALUES ('autogen_login_type', 'uid');
INSERT INTO system_options (`key`, value) VALUES ('autogen_login_length', '8');


ALTER TABLE mod_cards_errors
  DROP INDEX `PRIMARY`;

ALTER TABLE mod_cards_errors
  CHANGE COLUMN `when` `when` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE mod_cards_errors
  ADD INDEX `when` (`when`);


