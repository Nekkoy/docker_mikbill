SET NAMES 'utf8';

INSERT INTO system_options (`key`, value) VALUES ('tickets_show_address_filter' , '0');
INSERT INTO system_options (`key`, value) VALUES ('deny_full_delete' , '0');
INSERT INTO system_options (`key`, value) VALUES ('create_payment_on_user_blocked' , '0');

--
-- Удалить таблицу users_groups
--
DROP TABLE users_groups;

--
-- Изменить таблицу stuff_personal
--
ALTER TABLE stuff_personal
  ADD COLUMN do_planner TINYINT(2) UNSIGNED NOT NULL DEFAULT 0 AFTER do_skidka;

--
-- Изменить таблицу users_pending_changes
--
ALTER TABLE users_pending_changes
  ADD COLUMN pending_inner_type TINYINT(4) NOT NULL DEFAULT 0 COMMENT 'Внутренний тип действия для конкретного атрибута. 0: "по умолчанию"' AFTER pending_attribute_value,
  CHANGE COLUMN pending_activated pending_activated TINYINT(4) NOT NULL DEFAULT 0 COMMENT 'статус активации:: 0: не активирована, 1: была активирована, -1: отменена, -2: ошибка' AFTER pending_creation_datetime;
 