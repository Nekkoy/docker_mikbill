
DROP TABLE stuff_usersgroups_permissions;

--
-- ������� ������� stuff_usersgroups
--
DROP TABLE stuff_usersgroups;

--
-- ������� ������� addons_kassira_net
--
CREATE TABLE addons_kassira_net (
  order_id INT(16) UNSIGNED NOT NULL AUTO_INCREMENT,
  order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  uid INT(16) UNSIGNED NOT NULL,
  terminal_id INT(8) NOT NULL,
  transaction_id INT(8) NOT NULL,
  sum DOUBLE(14, 2) NOT NULL,
  service_code VARCHAR(64) NOT NULL,
  PRIMARY KEY (order_id)
)
ENGINE = MYISAM
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- ������� ������� addons_pay_api
--
CREATE TABLE addons_pay_api (
  record_id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  transaction_id BIGINT(20) UNSIGNED NOT NULL,
  terminal_id BIGINT(20) UNSIGNED NOT NULL,
  category INT(11) NOT NULL,
  user_ref BIGINT(20) UNSIGNED NOT NULL,
  amount DECIMAL(19, 4) NOT NULL,
  creation_time TIMESTAMP DEFAULT '0000-00-00 00:00:00',
  update_time TIMESTAMP DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  status SMALLINT(6) NOT NULL DEFAULT 0,
  result_code SMALLINT(6) NOT NULL DEFAULT 0,
  `comment` VARCHAR(1024) NOT NULL,
  UNIQUE INDEX id (record_id),
  INDEX status (status)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- ������� ������� addons_pay_api_errortype
--
CREATE TABLE addons_pay_api_errortype (
  result_code SMALLINT(6) NOT NULL,
  error_meaning VARCHAR(128) NOT NULL,
  PRIMARY KEY (result_code)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- ������� ������� addons_privat
--
CREATE TABLE addons_privat (
  order_id INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
  order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  uid INT(16) UNSIGNED NOT NULL,
  terminal_date DATETIME NOT NULL,
  transaction_id VARCHAR(20) NOT NULL,
  sum DOUBLE(14, 2) NOT NULL,
  service_code VARCHAR(16) NOT NULL,
  PRIMARY KEY (order_id),
  INDEX uid (uid)
)
ENGINE = MYISAM
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- �������� ������� addons_robokassa
--
--
-- ������� ������� archived_packets
--
CREATE TABLE archived_packets (
  gid SMALLINT(5) UNSIGNED NOT NULL,
  UNIQUE INDEX gid (gid)
)
ENGINE = MYISAM
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- ������� ������� archived_staff
--
CREATE TABLE archived_staff (
  stuffid TINYINT(6) UNSIGNED NOT NULL,
  UNIQUE INDEX stuffid (stuffid)
)
ENGINE = MYISAM
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- �������� ������� errorcodes
--
ALTER TABLE errorcodes
  DROP INDEX kode;

--
-- �������� ������� ip_pools_pool
--
ALTER TABLE ip_pools_pool
  ADD INDEX idpoolid (id, poolid);

--
-- �������� ������� lanes
--

ALTER TABLE lanes
  DROP INDEX lane;

ALTER TABLE lanes
        ENGINE = INNODB;

ALTER TABLE lanes
  ADD INDEX lane (lane);

ALTER TABLE lanes
  ADD INDEX stateid (settlementid);

--
-- �������� ������� lanes_houses
--
ALTER TABLE lanes_houses
  DROP INDEX house;

ALTER TABLE lanes_houses
        ENGINE = INNODB;

ALTER TABLE lanes_houses
  ADD INDEX house (house);

--
-- �������� ������� lanes_houses_blocks
--
ALTER TABLE lanes_houses_blocks
ENGINE = INNODB;

ALTER TABLE lanes_houses_blocks
  ADD INDEX hgid (housingid);

--
-- �������� ������� lanes_housings
--
ALTER TABLE lanes_housings
ENGINE = INNODB;

ALTER TABLE lanes_housings
  ADD INDEX hid (houseid);

--
-- �������� ������� lanes_neighborhoods
--
ALTER TABLE lanes_neighborhoods
ENGINE = INNODB;

ALTER TABLE lanes_neighborhoods
  ADD INDEX sat (settlementid);

--
-- �������� ������� lanes_settlements
--
ALTER TABLE lanes_settlements
ENGINE = INNODB;

ALTER TABLE lanes_settlements
  ADD INDEX name (settlementname);

--
-- �������� ������� logs
--
ALTER TABLE logs
  ADD INDEX `date` (`date`);

ALTER TABLE logs
  ADD INDEX gid (gid);

ALTER TABLE logs
  ADD INDEX uid (uid);

--
-- �������� ������� map_criterions
--
ALTER TABLE map_criterions
  ADD INDEX id (mapid);

--
-- �������� ������� map_maps
--
ALTER TABLE map_maps
  ADD INDEX stuff (stuffid);

--
-- �������� ������� map_maps_criterions
--
ALTER TABLE map_maps_criterions
  ADD INDEX cr (criterionid);

ALTER TABLE map_maps_criterions
  ADD INDEX id (mapid);

--
-- �������� ������� map_maps_permissions
--
ALTER TABLE map_maps_permissions
  ADD INDEX id (mapid);

ALTER TABLE map_maps_permissions
  ADD INDEX stuff (stuffid);

--
-- �������� ������� map_objects
--
ALTER TABLE map_objects
  ADD INDEX map (mapid);

--
-- �������� ������� map_objects_criterions
--
ALTER TABLE map_objects_criterions
  ADD INDEX obj (objectid);

--
-- �������� ������� map_objects_devices
--
ALTER TABLE map_objects_devices
  ADD INDEX obj (objectid);

--
-- �������� ������� map_objects_houses
--
ALTER TABLE map_objects_houses
  ADD INDEX obj (objectid);

--
-- �������� ������� map_objects_lines
--
ALTER TABLE map_objects_lines
  ADD INDEX obj (objectid);

--
-- �������� ������� map_objects_wifis
--
ALTER TABLE map_objects_wifis
  ADD INDEX obj (objectid);

--
-- �������� ������� map_points
--
ALTER TABLE map_points
  ADD INDEX obj (objectid);

ALTER TABLE map_points
  ADD INDEX parent (parentid);

--
-- �������� ������� mod_cards_act_cards
--
ALTER TABLE mod_cards_act_cards
  ADD INDEX res (resellerid);

--
-- �������� ������� mod_cards_act_logs
--
ALTER TABLE mod_cards_act_logs
  ADD INDEX uid (uid);

--
-- �������� ������� mod_cards_errors
--
ALTER TABLE mod_cards_errors
  ADD INDEX res (resellerid);

--
-- �������� ������� notifications
--
ALTER TABLE notifications
  ADD INDEX act (active);

--
-- �������� ������� preferences
--
ALTER TABLE preferences
  ADD INDEX idname (stuffid, preferencename);

ALTER TABLE preferences
  ADD INDEX stuff (stuffid);

--
-- �������� ������� radnas
--
ALTER TABLE radnas
  ADD INDEX type (nastype);

--
-- �������� ������� radpostauthnew
--
ALTER TABLE radpostauthnew
  ADD INDEX name (username);

ALTER TABLE radpostauthnew
  ADD INDEX namedate (username, authdate);

ALTER TABLE radpostauthnew
  ADD INDEX uid (uid);

--
-- �������� ������� sectors
--
ALTER TABLE sectors
  ADD INDEX sector (sector);

--
-- �������� ������� stuff_aclid
--
ALTER TABLE stuff_aclid
ENGINE = INNODB;

--
-- �������� ������� stuff_aclresource
--
ALTER TABLE stuff_aclresource
ENGINE = INNODB;

--
-- �������� ������� stuff_aclrole
--
ALTER TABLE stuff_aclrole
ENGINE = INNODB;

--
-- ������� ������� stuff_groups
--
CREATE TABLE stuff_groups (
  stuffid INT(10) UNSIGNED NOT NULL,
  groupid SMALLINT(5) UNSIGNED NOT NULL,
  INDEX stuffid (stuffid)
)
ENGINE = MYISAM
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- �������� ������� switch_ip_unnumbered
--
ALTER TABLE switch_ip_unnumbered
  ADD INDEX vlanswid (vlan, swid);

--
-- �������� ������� switche_type
--

ALTER TABLE switche_type
 DROP INDEX swtypename;

ALTER TABLE switche_type
        ENGINE = INNODB;

ALTER TABLE switche_type
  ADD INDEX swtypename (swtypename);

--
-- �������� ������� switches
--
ALTER TABLE switches
ENGINE = INNODB;

ALTER TABLE switches
  ADD INDEX mac (mac);

ALTER TABLE switches
  ADD INDEX parent (parent_swid);

ALTER TABLE switches
  ADD INDEX type (swtypeid);

--
-- �������� ������� tickets_categories_list
--
ALTER TABLE tickets_categories_list
  ADD INDEX name (categoryname);

--
-- �������� ������� tickets_logs
--
ALTER TABLE tickets_logs
  DROP INDEX ticketlogid;

--
-- �������� ������� users
--
ALTER TABLE users
  ADD INDEX blockedinstalled (blocked, user_installed);

ALTER TABLE users
  ADD INDEX credit (credit);

ALTER TABLE users
  ADD INDEX deposit (deposit);

ALTER TABLE users
  ADD INDEX installed (user_installed);

ALTER TABLE users
  ADD INDEX localipmac (local_ip, local_mac);

ALTER TABLE users
  ADD INDEX mac (local_mac);

--
-- ������� ������� users_groups
--
CREATE TABLE users_groups (
  uid INT(10) UNSIGNED NOT NULL,
  groupid SMALLINT(5) UNSIGNED NOT NULL,
  PRIMARY KEY (groupid)
)
ENGINE = MYISAM
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- ������� ������� usersgroups
--
CREATE TABLE usersgroups (
  usersgroupid INT(16) UNSIGNED NOT NULL AUTO_INCREMENT,
  usersgroupname VARCHAR(64) NOT NULL,
  PRIMARY KEY (usersgroupid)
)
ENGINE = MYISAM
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- ������� ������� usersgroups_staff
--
CREATE TABLE usersgroups_staff (
  stuffid INT(16) UNSIGNED NOT NULL,
  usersgroupid INT(16) UNSIGNED NOT NULL,
  INDEX stuffid (stuffid)
)
ENGINE = MYISAM
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- ������� ������� usersgroups_users
--
CREATE TABLE usersgroups_users (
  uid INT(16) UNSIGNED NOT NULL,
  usersgroupid INT(16) UNSIGNED NOT NULL,
  UNIQUE INDEX uid (uid),
  INDEX usergroupid (usersgroupid)
)
ENGINE = MYISAM
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

TRUNCATE `bugh_plategi_type` ;
TRUNCATE  `radpostauthreplymessage` ;
TRUNCATE `tickets_priorities_types` ;
TRUNCATE `tickets_status_types` ;
TRUNCATE `addons_pay_api_errortype`  ;
TRUNCATE  `logtype` ;

INSERT INTO `tickets_priorities_types` (`prioritytypeid`, `prioritytypename`) VALUES
(1, 'high'),
(2, 'normal'),
(3, 'low');

INSERT INTO `tickets_status_types` (`statustypeid`, `statustypename`) VALUES
(1, 'opened'),
(2, 'closed'),
(3, 'in_work'),
(4, 'performed');

INSERT INTO `addons_pay_api_errortype` (`result_code`, `error_meaning`) VALUES
(0, '����� ������� ��������'),
(1, '������������ �� ������'),
(2, '����� ��������');


INSERT INTO `bugh_plategi_type` (`bughtypeid`, `typename`, `fiktivniy`) VALUES
(1, '����������� ����� �� ������� �����', 0),
(2, '����������� ����� �� ������� ����', 0),
(5, '���������� �����', 0),
(6, '������ �����', 0),
(7, '������ �� �����', 0),
(9, '������ ������ �������� IP ������', 0),
(10, '����������', 1),
(15, '������ �� ������������������� ������', 1),
(16, '�������!', 1),
(17, '�����', 1),
(18, '������', 1),
(20, '���������� ��������� � ����� � ���������� �������', 1),
(21, '���������� ��������� �� �����', 0),
(22, '���������� ����������� ����� �� ������� �����', 0),
(23, '��������� ������ � ������ ������', 1),
(24, '������� �� �� �������� ����', 1),
(25, '���������� ������������� �� ���� �������', 0),
(26, '��������� ��������� ������', 0),
(27, '����������� � ������������ ����', 0),
(28, '���������� ���������', 0),
(29, '% �� ����������� ��������', 0),
(30, '�������� ������ ������� ������', 0),
(31, '���������� MobyAZS(24NonStop)', 0),
(32, '������ Real IP', 1),
(33, '��������� ���������� ������', 0),
(34, '������ "�����"', 0),
(35, '��������� ������ ������', 0),
(36, '��������� ������ ������ � %', 0),
(37, '���������� OSMP', 0),
(38, '���������� Liqpay', 0),
(39, '������ ���������', 0),
(40, '���������� Yandex ������', 0),
(41, '���������� WebMoney', 0),
(42, '���������� �� ������������', 0),
(43, '�������� �� ������������', 0),
(44, '���������� CoPayCo', 0),
(45, '����������� ������', 0),
(46, '��������� ������ ��������', 0),
(47, '���������� ���-��������', 0),
(48, '������ ����������', 0),
(49, '������� ��������� �� ���������', 0),
(50, '������ Dr.Web', 0),
(51, '����������� ����� ���������', 0),
(52, '���������� EasySoft', 0),
(53, '���������� OnePay', 0),
(54, '���������� Privat24', 0),
(55, '���������� CitiPay', 0),
(56, '���������� Elecsnet', 0),
(57, '���������� w.QiWi.ru', 0),
(58, '���������� ComPay', 0),
(59, '���������� RoboKassa', 0),
(60, '���������� �������� ������', 0),
(61, '���������� �������� �������.���', 0),
(62, 'Terminal API', 0);


INSERT INTO `radpostauthreplymessage` (`replymessageid`, `replymessage`) VALUES
(1, '�����'),
(2, '������������'),
(3, 'PAP �������� ����'),
(4, 'PAP ������������ ������'),
(5, 'CHAP �������� ����'),
(6, 'CHAP ������������ ������'),
(7, '�������� � ���� ��������'),
(8, '� ��� ��� �����'),
(9, '� �������� ��������� ��������� ����'),
(10, '�� ������ � ���� ������ ���������� IP/MAC'),
(11, '������������ � ������ �����������'),
(12, '������������ � ������ ���������'),
(13, 'IP/MAC �� ��������� � ���������'),
(14, '��� ������� � ����������� ��� ��� �����'),
(15, '� �������� ������������ �������'),
(16, 'IP ��� ����� ������� ������������'),
(17, 'IP �� �����'),
(18, '��������� �����������'),
(19, '������ ��� � Online'),
(20, '�������� IP � Pool'),
(21, 'IP �� ������ � ����'),
(22, '������� ������ �������������'),
(23, '����������� ������'),
(24, '2� ��� �� ������'),
(25, 'MSCHAP-v1 �������� ����'),
(26, 'MSCHAP-v1 ������������ ������'),
(27, 'MSCHAP-v2 �������� ����'),
(28, 'MSCHAP-v2 ������������ ������');

INSERT INTO `logtype` (`logtypeid`, `logtype`) VALUES
(1, '�������'),
(2, '�����'),
(3, '��������'),
(4, '������'),
(5, '�����'),
(6, 'WhiteList'),
(7, 'NAS'),
(8, '��������'),
(9, '�����������'),
(10, 'Email ��������'),
(11, '��������'),
(12, '������'),
(13, '���������� �������'),
(14, '����� ������ - �����'),
(15, '������������� ��������');

DELETE FROM `preferences` WHERE `preferencename` LIKE '%invert_edit_view_trigger_button%';