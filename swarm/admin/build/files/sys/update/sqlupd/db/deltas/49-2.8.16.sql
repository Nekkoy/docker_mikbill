SET NAMES 'utf8';

--
-- Изменить таблицу "addons_paykeeper"
--
ALTER TABLE addons_paykeeper
  CHANGE COLUMN id_sys id_sys INT(10) UNSIGNED NOT NULL DEFAULT 1111;

--
-- Изменить таблицу "dev_types"
--
ALTER TABLE dev_types
  ADD COLUMN portal TINYINT(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'признак портала: 0 - нет, 1 - IPTVPORTAL, 2 - Stalker, 3 - olltv' AFTER card_id,
  ADD COLUMN portal_login TINYINT(4) NOT NULL DEFAULT 0 COMMENT 'Логин на портале' AFTER portal,
  ADD COLUMN portal_password TINYINT(4) NOT NULL DEFAULT 0 COMMENT 'Пароль на портале' AFTER portal_login;

--
-- Изменить таблицу "queue_messages"
--
ALTER TABLE queue_messages
  ADD COLUMN m_action VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'дополнительный параметр сообщения' AFTER m_msg;

--
-- Изменить таблицу "services"
--
ALTER TABLE services
  ADD COLUMN service_portal TINYINT(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'признак портала: 0 - нет, 1 - IPTVPORTAL, 2 - Stalker, 3 - olltv' AFTER service_loyal_recalculation;

--
-- Изменить таблицу "switche_type"
--
ALTER TABLE switche_type
  ADD COLUMN strict_dhcp_mode TINYINT(3) UNSIGNED NOT NULL DEFAULT 0 AFTER use_module_find;


