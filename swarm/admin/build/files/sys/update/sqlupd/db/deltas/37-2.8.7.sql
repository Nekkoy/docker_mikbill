SET NAMES 'utf8';


--
-- Удалить таблицу "tickets_acl_resources_list"
--
DROP TABLE tickets_acl_resources_list;

--
-- Изменить таблицу "services_packets_pairs"
--
ALTER TABLE services_packets_pairs
  ADD COLUMN service_price DOUBLE(20, 2) DEFAULT NULL AFTER gid,
  ADD COLUMN service_activation TINYINT(4) NOT NULL DEFAULT 0 COMMENT '0 - базовая, 1 - индивидуальная' AFTER service_price;

--
-- Изменить таблицу "stuff_personal"
--
ALTER TABLE stuff_personal
  ADD COLUMN staff_search_escaping TINYINT(4) NOT NULL DEFAULT 0 AFTER do_planner,
  ADD COLUMN staff_search_limit SMALLINT(5) UNSIGNED NOT NULL DEFAULT 0 AFTER staff_search_escaping,
  ADD COLUMN staff_payments_only_current_day TINYINT(4) NOT NULL DEFAULT 0 AFTER staff_search_limit,
  ADD COLUMN staff_payments_only_own TINYINT(4) NOT NULL DEFAULT 0 AFTER staff_payments_only_current_day;



 