SET NAMES 'utf8';

--
-- Создать таблицу bugh_stat_balance
--
CREATE TABLE bugh_stat_balance (
  uid BIGINT(16) UNSIGNED NOT NULL,
  `date` DATETIME NOT NULL,
  deposit DOUBLE(20, 6) NOT NULL,
  credit DOUBLE(20, 6) NOT NULL
)
ENGINE = MYISAM
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'История балансов';

--
-- Создать таблицу services
--
CREATE TABLE services (
  serviceid SMALLINT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  servicename VARCHAR(64) NOT NULL,
  amount DOUBLE(20, 2) NOT NULL,
  users_states SET('n','f','d','r') NOT NULL DEFAULT 'n',
  period ENUM('m','w','d') NOT NULL DEFAULT 'm' COMMENT 'm - ежемесячно, w - еженедельно, d - ежедневно',
  suspended TINYINT(1) NOT NULL DEFAULT 0,
  creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  description VARCHAR(255) NOT NULL DEFAULT '',
  PRIMARY KEY (serviceid)
)
ENGINE = MYISAM
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Создать таблицу services_packets_pairs
--
CREATE TABLE services_packets_pairs (
  serviceid SMALLINT(5) UNSIGNED NOT NULL,
  gid SMALLINT(5) UNSIGNED NOT NULL
)
ENGINE = MYISAM
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

CREATE TABLE services_logs (
  record_id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  uid BIGINT(20) UNSIGNED NOT NULL,
  gid SMALLINT(5) UNSIGNED NOT NULL,
  serviceid SMALLINT(5) UNSIGNED NOT NULL,
  `date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  before_billing DOUBLE(20, 6) NOT NULL,
  amount DOUBLE(20, 6) NOT NULL,
  PRIMARY KEY (record_id)
)
ENGINE = MYISAM
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

INSERT INTO `services` (`serviceid`,`servicename`,`amount`,`description`,`suspended`) VALUES ('1','','0','reserved','1'),('2','','0','reserved','1'),('3','','0','reserved','1'),('4','','0','reserved','1'),('5','','0','reserved','1'),('6','','0','reserved','1'),('7','','0','reserved','1'),('8','','0','reserved','1'),('9','','0','reserved','1'),('10','','0','reserved','1'),('11','','0','reserved','1'),('12','','0','reserved','1'),('13','','0','reserved','1'),('14','','0','reserved','1'),('15','','0','reserved','1'),('16','','0','reserved','1'),('17','','0','reserved','1'),('18','','0','reserved','1'),('19','','0','reserved','1'),('20','','0','reserved','1'),('21','','0','reserved','1'),('22','','0','reserved','1'),('23','','0','reserved','1'),('24','','0','reserved','1'),('25','','0','reserved','1'),('26','','0','reserved','1'),('27','','0','reserved','1'),('28','','0','reserved','1'),('29','','0','reserved','1'),('30','','0','reserved','1'),('31','','0','reserved','1'),('32','','0','reserved','1'),('33','','0','reserved','1'),('34','','0','reserved','1'),('35','','0','reserved','1'),('36','','0','reserved','1'),('37','','0','reserved','1'),('38','','0','reserved','1'),('39','','0','reserved','1'),('40','','0','reserved','1'),('41','','0','reserved','1'),('42','','0','reserved','1'),('43','','0','reserved','1'),('44','','0','reserved','1'),('45','','0','reserved','1'),('46','','0','reserved','1'),('47','','0','reserved','1'),('48','','0','reserved','1'),('49','','0','reserved','1'),('50','','0','reserved','1'),('51','','0','reserved','1'),('52','','0','reserved','1'),('53','','0','reserved','1'),('54','','0','reserved','1'),('55','','0','reserved','1'),('56','','0','reserved','1'),('57','','0','reserved','1'),('58','','0','reserved','1'),('59','','0','reserved','1'),('60','','0','reserved','1'),('61','','0','reserved','1'),('62','','0','reserved','1'),('63','','0','reserved','1'),('64','','0','reserved','1'),('65','','0','reserved','1'),('66','','0','reserved','1'),('67','','0','reserved','1'),('68','','0','reserved','1'),('69','','0','reserved','1'),('70','','0','reserved','1'),('71','','0','reserved','1'),('72','','0','reserved','1'),('73','','0','reserved','1'),('74','','0','reserved','1'),('75','','0','reserved','1'),('76','','0','reserved','1'),('77','','0','reserved','1'),('78','','0','reserved','1'),('79','','0','reserved','1'),('80','','0','reserved','1'),('81','','0','reserved','1'),('82','','0','reserved','1'),('83','','0','reserved','1'),('84','','0','reserved','1'),('85','','0','reserved','1'),('86','','0','reserved','1'),('87','','0','reserved','1'),('88','','0','reserved','1'),('89','','0','reserved','1'),('90','','0','reserved','1'),('91','','0','reserved','1'),('92','','0','reserved','1'),('93','','0','reserved','1'),('94','','0','reserved','1'),('95','','0','reserved','1'),('96','','0','reserved','1'),('97','','0','reserved','1'),('98','','0','reserved','1'),('99','','0','reserved','1'),('100','','0','reserved','1');


