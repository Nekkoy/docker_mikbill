SET NAMES 'utf8';

--
-- Изменить таблицу "addons_privat_payment_account"
--
ALTER TABLE addons_privat_payment_account
  ADD COLUMN purpose VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Описание платежа' AFTER uid;

--
-- Изменить таблицу "addons_yapk"
--
ALTER TABLE addons_yapk
  ADD COLUMN account VARCHAR(64) NOT NULL DEFAULT '' AFTER uid;

--
-- Изменить таблицу "ip_pools"
--
ALTER TABLE ip_pools
  ADD COLUMN usegw TINYINT(2) UNSIGNED NOT NULL DEFAULT 0 AFTER poolname,
  ADD COLUMN poolmask TINYINT(2) UNSIGNED NOT NULL DEFAULT 24 AFTER usegw,
  ADD COLUMN poolgw CHAR(15) NOT NULL DEFAULT '' AFTER poolmask;

--
-- Изменить таблицу "radnas"
--
ALTER TABLE radnas
  ADD COLUMN mikver TINYINT(3) UNSIGNED NOT NULL DEFAULT 0 AFTER ipauth;

--
-- Изменить таблицу "services"
--
ALTER TABLE services
  ADD COLUMN service_like_packet TINYINT(4) NOT NULL DEFAULT 0 COMMENT 'указываем, чтоб исполнять логику, как в тарифе. При 1 игнорирует "период" услуги' AFTER priority;

