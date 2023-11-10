SET NAMES 'utf8';

INSERT INTO bugh_plategi_type (bughtypeid, typename, fiktivniy) VALUES (63, 'Пополнение терминал Платёжка', 0);

UPDATE `bugh_plategi_type` SET `typename`='API' WHERE `bughtypeid` = 62;
ALTER TABLE `addons_pay_api` CHANGE `terminal_id` ` misc_id` VARCHAR( 128 ) CHARACTER SET koi8r COLLATE koi8r_general_ci NOT NULL DEFAULT '';
ALTER TABLE `addons_pay_api` CHANGE `transaction_id` `transaction_id` BIGINT( 20 ) UNSIGNED NOT NULL DEFAULT '0';
ALTER TABLE `addons_pay_api` CHANGE `category` `category` SMALLINT NOT NULL DEFAULT '0';
ALTER TABLE `addons_pay_api` CHANGE `comment` `comment` VARCHAR( 128 ) CHARACTER SET koi8r COLLATE koi8r_general_ci NOT NULL;
ALTER TABLE `addons_pay_api` DROP `result_code`;
ALTER TABLE `addons_pay_api` CHANGE ` misc_id` `misc_id` VARCHAR( 128 ) CHARACTER SET koi8r COLLATE koi8r_general_ci NOT NULL DEFAULT '';

RENAME TABLE `addons_pay_api_errortype` TO `addons_pay_api_status` ;
TRUNCATE TABLE `addons_pay_api_status`;
INSERT INTO `addons_pay_api_status`(`result_code`, `error_meaning`) VALUES (0,'Ожидает обработки'), (1,'Зачислен активному пользователю'), (2,'Зачислен замороженному пользователю'), (3,'Зачислен отключенному пользователю'), (4,'Зачислен удаленному пользователю'), (5,'Не обработан (пользователь не найден)');
ALTER TABLE `addons_pay_api_status` CHANGE `result_code` `status` SMALLINT( 6 ) NOT NULL;
ALTER TABLE `addons_pay_api_status` CHANGE `error_meaning` `statusname` VARCHAR( 128 ) CHARACTER SET koi8r COLLATE koi8r_general_ci NOT NULL;

CREATE TABLE IF NOT EXISTS `addons_pay_api_category` (
  `category` smallint(6) NOT NULL,
  `categoryname` varchar(64) NOT NULL,
  `description` varchar(256) NOT NULL DEFAULT '',
  UNIQUE KEY `category` (`category`)
) ENGINE=MyISAM DEFAULT CHARSET=koi8r;

INSERT INTO `switch_opt82_logtype` (`logtypeid` ,`logtype` ,`access` ) VALUES ( '14', 'Регистрация по Vlan+Port', '1' );






