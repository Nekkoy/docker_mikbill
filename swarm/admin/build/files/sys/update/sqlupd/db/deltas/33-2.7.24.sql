SET NAMES 'utf8';


INSERT INTO system_options (`key`, value) VALUES ('en_ticet_house_auto' , '0');
INSERT INTO system_options (`key`, value) VALUES ('en_uchetka_rezim_ulica_dyn' , '0');

INSERT INTO system_options (`key`, value) VALUES ('mac_autoreg_accel' , '1');
--
-- Создать таблицу users_pending_changes
--
CREATE TABLE users_pending_changes (
uid BIGINT(20) UNSIGNED NOT NULL,
pending_activation_datetime TIMESTAMP DEFAULT '0000-00-00 00:00:00' COMMENT 'время изменения атрибута абонента',
pending_attribute_name CHAR(24) NOT NULL DEFAULT '' COMMENT 'название атрибута, если "тип измениния" = 0',
pending_attribute_value VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'значение для изменения',
stuffid TINYINT(3) UNSIGNED NOT NULL,
pending_creation_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
pending_activated TINYINT(4) NOT NULL DEFAULT 0 COMMENT 'была ли включена или нет'
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci
COMMENT = 'таблица отложенных изменений пользователя';


INSERT INTO bugh_plategi_type (bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user)
  VALUES (80, 'Пополнение PayMaster', '+', 0 , '+', '+');

INSERT INTO system_options (`key`, value) VALUES ('citypay_uid' , '1');
INSERT INTO system_options (`key`, value) VALUES ('citypay_uid_prio' , '1');
INSERT INTO system_options (`key`, value) VALUES ('citypay_login' , '1');
INSERT INTO system_options (`key`, value) VALUES ('citypay_login_prio' , '2');

DELETE FROM `programs` WHERE `programname` = 'MikBill Admin';
INSERT INTO `programs` (`programname`, `version`, `build`) VALUES ('MiKBiLL Admin' , '2.7.24' , 141124);
  
ALTER TABLE stuff_personal
  ADD COLUMN do_skidka TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 AFTER usersgroupid;

--
-- Создать таблицу users_pending_changes
--
CREATE TABLE users_pending_changes (
  uid BIGINT(20) UNSIGNED NOT NULL,
  pending_activation_datetime TIMESTAMP DEFAULT '0000-00-00 00:00:00' COMMENT 'время изменения атрибута абонента',
  pending_attribute_name CHAR(24) NOT NULL DEFAULT '' COMMENT 'название атрибута, если "тип измениния" = 0',
  pending_attribute_value VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'значение для изменения',
  stuffid TINYINT(3) UNSIGNED NOT NULL,
  pending_creation_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  pending_activated TINYINT(4) NOT NULL DEFAULT 0 COMMENT 'была ли включена или нет'
  )
  ENGINE = INNODB
  CHARACTER SET koi8r
  COLLATE koi8r_general_ci
  COMMENT = 'таблица отложенных изменений пользователя';

ALTER TABLE users_pending_changes
  ADD COLUMN pending_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT FIRST,
  ADD PRIMARY KEY (pending_id);

