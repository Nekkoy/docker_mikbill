SET NAMES 'utf8';

INSERT INTO bugh_plategi_type (bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES (77, 'Пополнение ПСКБ OOS', '+', 0 , '+' , '+');
INSERT INTO bugh_plategi_type (bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES (78, 'Дополнительные услуги - пополнение абонента', '+', 0 , '+' , '-');
INSERT INTO bugh_plategi_type (bughtypeid, typename, sign, fictitious, deposit_action, deposit_action_by_user) VALUES (79, 'Дополнительные услуги - списание с абонента', '-', 0 , '-' , '-');


INSERT INTO `system_options` (`key`, `value`) VALUES('pscb_on', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES('pscb_test', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES('pscb_MrchKey', '');
INSERT INTO `system_options` (`key`, `value`) VALUES('pscb_marketPlace', '');

INSERT INTO `system_options` (`key`, `value`) VALUES('required_pasport_serie', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES('required_pasport_registration', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES('mask_sms_phone_use', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES('mask_phone_sms', '');
INSERT INTO `system_options` (`key`, `value`) VALUES('mask_series_and_number_use', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES('mask_series_and_number', '');
INSERT INTO `system_options` (`key`, `value`) VALUES('mask_cellphone_use', '0');
INSERT INTO `system_options` (`key`, `value`) VALUES('mask_cellphone', '');
INSERT INTO `system_options` (`key`, `value`) VALUES('final_report_show_connect_amount', '0');

ALTER TABLE packets
  ADD COLUMN razresh_minus DOUBLE UNSIGNED NOT NULL DEFAULT 0 AFTER real_ip_nolk;


--
-- Изменить таблицу addons_pay_api_category
--
ALTER TABLE addons_pay_api_category
  ADD COLUMN show_in_final_report TINYINT(4) NOT NULL DEFAULT 0 COMMENT 'отображать в "итоговом отчёте"' AFTER description;
ALTER TABLE addons_pay_api_category
  ADD COLUMN order_in_final_report INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Порядок показа в итоговом отчете' AFTER show_in_final_report;

--
-- Создать таблицу addons_pscb
--
CREATE TABLE addons_pscb (
  order_id INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
  order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  uid BIGINT(16) UNSIGNED NOT NULL,
  amount DOUBLE(14, 2) DEFAULT NULL,
  state CHAR(20) NOT NULL DEFAULT 'new',
  status TINYINT(1) NOT NULL,
  PRIMARY KEY (order_id)
)
ENGINE = MYISAM
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Создать таблицу bugh_final_report
--
CREATE TABLE bugh_final_report (
  bughtypeid SMALLINT(5) UNSIGNED NOT NULL,
  bughtypename CHAR(255) NOT NULL
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

