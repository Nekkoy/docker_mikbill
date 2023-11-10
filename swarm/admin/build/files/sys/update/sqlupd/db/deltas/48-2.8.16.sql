SET NAMES 'utf8';

--
-- Создать таблицу "addons_payberry"
--
CREATE TABLE addons_payberry (
  TransactionExt BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  uid BIGINT(16) UNSIGNED NOT NULL,
  TransactionId BIGINT(20) UNSIGNED NOT NULL,
  order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  Amount DOUBLE(14, 2) NOT NULL,
  TerminalId INT(10) UNSIGNED NOT NULL,
  status VARCHAR(6) CHARACTER SET koi8r COLLATE koi8r_general_ci NOT NULL,
  PRIMARY KEY (TransactionExt),
  INDEX time (order_date),
  INDEX `uid-time` (uid, order_date)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_bin;

--
-- Создать таблицу "addons_rnkb"
--
CREATE TABLE addons_rnkb (
  order_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  uid BIGINT(16) UNSIGNED DEFAULT NULL,
  amount DECIMAL(18, 2) UNSIGNED DEFAULT NULL,
  txn_id CHAR(36) NOT NULL,
  txn_date VARCHAR(15) DEFAULT NULL,
  check_time DATETIME DEFAULT NULL,
  status TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (order_id)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci;


--
-- Создать таблицу "addons_xplat"
--
CREATE TABLE addons_xplat (
  order_id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  uid BIGINT(16) UNSIGNED DEFAULT NULL,
  amount DECIMAL(18, 2) UNSIGNED DEFAULT NULL,
  txn_id CHAR(36) NOT NULL,
  txn_date VARCHAR(15) DEFAULT NULL,
  check_time DATETIME DEFAULT NULL,
  status TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (order_id)
)
ENGINE = INNODB
CHARACTER SET koi8r
COLLATE koi8r_general_ci;

--
-- Создать таблицу "usersgroups_extended_fields"
--
CREATE TABLE usersgroups_extended_fields (
  id TINYINT(3) UNSIGNED NOT NULL,
  `key` VARCHAR(32) NOT NULL,
  value VARCHAR(128) NOT NULL,
  PRIMARY KEY (id, `key`),
  UNIQUE INDEX full (id, `key`, value),
  INDEX search (`key`, value)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Custom dealer fields';

--
-- Создать представление "usersall"
--
CREATE
VIEW usersall
AS
SELECT
  `users`.`user` AS `user`,
  `users`.`password` AS `password`,
  `users`.`uid` AS `uid`,
  `users`.`gid` AS `gid`,
  `users`.`deposit` AS `deposit`,
  `users`.`credit` AS `credit`,
  `users`.`fio` AS `fio`,
  `users`.`phone` AS `phone`,
  `users`.`prim` AS `prim`,
  `users`.`add_date` AS `add_date`,
  `users`.`blocked` AS `blocked`,
  `users`.`activated` AS `activated`,
  `users`.`framed_ip` AS `framed_ip`,
  `users`.`passportserie` AS `passportserie`,
  `users`.`passportpropiska` AS `passportpropiska`,
  `users`.`passportvoenkomat` AS `passportvoenkomat`,
  `users`.`passportgdevidan` AS `passportgdevidan`,
  `users`.`dogovor` AS `dogovor`,
  'None' AS `block_date`,
  'None' AS `del_date`,
  'None' AS `freeze_date`,
  `users`.`mob_tel` AS `mob_tel`,
  `users`.`numdogovor` AS `numdogovor`,
  `users`.`app` AS `app`,
  `users`.`houseid` AS `houseid`,
  'рабочий' AS `status`
FROM `users`
UNION ALL
SELECT
  `usersblok`.`user` AS `user`,
  `usersblok`.`password` AS `password`,
  `usersblok`.`uid` AS `uid`,
  `usersblok`.`gid` AS `gid`,
  `usersblok`.`deposit` AS `deposit`,
  `usersblok`.`credit` AS `credit`,
  `usersblok`.`fio` AS `fio`,
  `usersblok`.`phone` AS `phone`,
  `usersblok`.`prim` AS `prim`,
  `usersblok`.`add_date` AS `add_date`,
  `usersblok`.`blocked` AS `blocked`,
  `usersblok`.`activated` AS `activated`,
  `usersblok`.`framed_ip` AS `framed_ip`,
  `usersblok`.`passportserie` AS `passportserie`,
  `usersblok`.`passportpropiska` AS `passportpropiska`,
  `usersblok`.`passportvoenkomat` AS `passportvoenkomat`,
  `usersblok`.`passportgdevidan` AS `passportgdevidan`,
  `usersblok`.`dogovor` AS `dogovor`,
  `usersblok`.`block_date` AS `block_date`,
  'None' AS `del_date`,
  'None' AS `freeze_date`,
  `usersblok`.`mob_tel` AS `mob_tel`,
  `usersblok`.`numdogovor` AS `numdogovor`,
  `usersblok`.`app` AS `app`,
  `usersblok`.`houseid` AS `houseid`,
  'отключенный' AS `status`
FROM `usersblok`
UNION ALL
SELECT
  `usersdel`.`user` AS `user`,
  `usersdel`.`password` AS `password`,
  `usersdel`.`uid` AS `uid`,
  `usersdel`.`gid` AS `gid`,
  `usersdel`.`deposit` AS `deposit`,
  `usersdel`.`credit` AS `credit`,
  `usersdel`.`fio` AS `fio`,
  `usersdel`.`phone` AS `phone`,
  `usersdel`.`prim` AS `prim`,
  `usersdel`.`add_date` AS `add_date`,
  `usersdel`.`blocked` AS `blocked`,
  `usersdel`.`activated` AS `activated`,
  `usersdel`.`framed_ip` AS `framed_ip`,
  `usersdel`.`passportserie` AS `passportserie`,
  `usersdel`.`passportpropiska` AS `passportpropiska`,
  `usersdel`.`passportvoenkomat` AS `passportvoenkomat`,
  `usersdel`.`passportgdevidan` AS `passportgdevidan`,
  `usersdel`.`dogovor` AS `dogovor`,
  `usersdel`.`block_date` AS `block_date`,
  `usersdel`.`del_date` AS `del_date`,
  'None' AS `freeze_date`,
  `usersdel`.`mob_tel` AS `mob_tel`,
  `usersdel`.`numdogovor` AS `numdogovor`,
  `usersdel`.`app` AS `app`,
  `usersdel`.`houseid` AS `houseid`,
  'удаленный' AS `status`
FROM `usersdel`
UNION ALL
SELECT
  `usersfreeze`.`user` AS `user`,
  `usersfreeze`.`password` AS `password`,
  `usersfreeze`.`uid` AS `uid`,
  `usersfreeze`.`gid` AS `gid`,
  `usersfreeze`.`deposit` AS `deposit`,
  `usersfreeze`.`credit` AS `credit`,
  `usersfreeze`.`fio` AS `fio`,
  `usersfreeze`.`phone` AS `phone`,
  `usersfreeze`.`prim` AS `prim`,
  `usersfreeze`.`add_date` AS `add_date`,
  `usersfreeze`.`blocked` AS `blocked`,
  `usersfreeze`.`activated` AS `activated`,
  `usersfreeze`.`framed_ip` AS `framed_ip`,
  `usersfreeze`.`passportserie` AS `passportserie`,
  `usersfreeze`.`passportpropiska` AS `passportpropiska`,
  `usersfreeze`.`passportvoenkomat` AS `passportvoenkomat`,
  `usersfreeze`.`passportgdevidan` AS `passportgdevidan`,
  `usersfreeze`.`dogovor` AS `dogovor`,
  'None' AS `block_date`,
  'None' AS `del_date`,
  `usersfreeze`.`freeze_date` AS `freeze_date`,
  `usersfreeze`.`mob_tel` AS `mob_tel`,
  `usersfreeze`.`numdogovor` AS `numdogovor`,
  `usersfreeze`.`app` AS `app`,
  `usersfreeze`.`houseid` AS `houseid`,
  'замороженный' AS `status`
FROM `usersfreeze`;


