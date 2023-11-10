--
-- Отключение внешних ключей 
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

SET sql_mode='';

ALTER TABLE `cabinet_config` CHANGE COLUMN `key` `key` CHAR(64) NOT NULL COLLATE 'utf8mb3_bin' AFTER `parent`;

INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES ('gui', 'user_registration_type3_on', 0x31);
INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES ('gui', 'user_registration_def_country3', 0x22756122);
INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES ('gui', 'user_registration_pref_country3', 0x22756122);
INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES ('gui', 'user_registration_only_country3', 0x227561222c20227275222c20226279222c20226d64222c20227472222c20226c74222c20226c7622);

INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES ('system', 'user_registration_gid3', 0x30);
INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES ('system', 'user_registration_sectorid3', 0x30);
INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES ('system', 'user_registration_houseid3', 0x30);

INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES ('system', 'user_registration_lot_acc_phone3', 0x30);
INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES ('gui', 'user_registration_phone_as_login3', 0x31);
INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES ('gui', 'user_registration_block3', 0x30);

INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES ('gui', 'user_registration_type3_external', 0x30);
INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES ('gui', 'user_registration_type3_notify', 0x30);
INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES ('gui', 'user_registration_type3_url', 0x687474703a2f2f6c6f63616c686f73742f617374657269736b2e7068703f70686f6e653d7b7b70686f6e657d7d);
INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES ('gui', 'user_registration_type3_timeout', 0x333030);
INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES ('gui', 'user_registration_type3_secret', 0x736563726574);

INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES ('gui', 'user_registration_type3_usesms1', 0x30);
INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES ('system', 'user_registration_text3', 0x596f7572204f54503a202573);
INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES ('system', 'user_registration_expire_time3', 0x35);
INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES ('gui', 'user_registration_otp_pattern3', 0x31);

INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES ('gui', 'user_registration_after_on3', 0x30);
INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES ('system', 'user_registration_after_text3', 0xd092d0b0d18820d0bbd0bed0b3d0b8d0bd3a2025730d0ad092d0b0d18820d0bfd0b0d180d0bed0bbd18c3a2025730d0ad090d0b4d180d0b5d1813a20687474703a2f2f6973702e636162696e65742e6e6574);
INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES ('system', 'user_registration_after_pass3', 0x32);
INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES ('system', 'user_registration_after_user3', 0x31);
INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES ('system', 'user_registration_after_uid3', 0x30);
INSERT INTO `cabinet_config` (`parent`, `key`, `value`) VALUES ('system', 'user_registration_link_auth3', 0x33);

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;