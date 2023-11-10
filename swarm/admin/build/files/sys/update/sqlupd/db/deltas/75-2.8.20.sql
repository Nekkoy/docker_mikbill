SET NAMES 'utf8';


--
-- Изменить таблицу "usersblok"
--
ALTER TABLE usersblok
  ADD INDEX local_ip (local_ip);

ALTER TABLE usersblok
  ADD INDEX local_mac (local_mac);

--
-- Изменить таблицу "usersdel"
--
ALTER TABLE usersdel
  ADD INDEX local_ip (local_ip);

ALTER TABLE usersdel
  ADD INDEX local_mac (local_mac);


