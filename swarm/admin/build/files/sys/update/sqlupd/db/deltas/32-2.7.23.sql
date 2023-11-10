SET NAMES 'utf8';


--
-- Создать таблицу addons_paymaster
--

CREATE TABLE IF NOT EXISTS `addons_paymaster` (
  `order_id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uid` bigint(16) unsigned NOT NULL,
  `payment_system` tinyint(1) NOT NULL,
  `amount` double(14,2) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=koi8r AUTO_INCREMENT=1 ;


--
-- Изменить таблицу programs
--
ALTER TABLE programs
  CHANGE COLUMN version version CHAR(8) NOT NULL;

--
-- Изменить таблицу services
--
ALTER TABLE services
  ADD COLUMN priority TINYINT(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Приоритет применения услуги. Чем меньше - тем раньше она будет запущена (списана оплата)' AFTER suspended,
  ADD COLUMN activation_by_admin TINYINT(4) NOT NULL DEFAULT 0 COMMENT 'подключается администратором' AFTER priority,
  ADD COLUMN activation_by_user TINYINT(4) NOT NULL DEFAULT 0 COMMENT 'подключается абонентом' AFTER activation_by_admin;



INSERT INTO `system_options` (`key`, `value`) VALUES 
('paymaster_on', '0'),
('paymaster_MrchID', ''),
('paymaster_secretkey', ''),
('paymaster_test', '0'),
('paymaster_procent', '0'),
('paymaster_network', '');

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


INSERT INTO bugh_plategi_type (bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user)
  VALUES (80, 'Пополнение PayMaster', '+', 0 , '+', '+');

INSERT INTO system_options (`key`, value) VALUES ('citypay_uid' , '1');
INSERT INTO system_options (`key`, value) VALUES ('citypay_uid_prio' , '1');
INSERT INTO system_options (`key`, value) VALUES ('citypay_login' , '1');
INSERT INTO system_options (`key`, value) VALUES ('citypay_login_prio' , '2');
  
DELETE FROM `programs` WHERE `programname` = 'MikBill Admin';
INSERT INTO `programs` (`programname`, `version`, `build`) VALUES ('MiKBiLL Admin' , '2.7.23' , 141124);

INSERT INTO system_options (`key`, value) VALUES ('mac_autoreg_accel' , '1');