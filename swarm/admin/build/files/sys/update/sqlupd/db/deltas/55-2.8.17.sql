SET NAMES 'utf8';

--
-- Изменить таблицу "addons_privat_payment_account"
--
ALTER TABLE addons_privat_payment_account
  ADD COLUMN id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT FIRST,
    ADD PRIMARY KEY (id);