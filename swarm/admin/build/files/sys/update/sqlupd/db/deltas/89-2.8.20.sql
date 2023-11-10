SET NAMES 'utf8';

--
-- Отключение внешних ключей
--
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;


--
-- Изменить представление "actions"
--
CREATE OR REPLACE 
VIEW actions
AS
	select `r`.`username` AS `user`,`r`.`gid` AS `gid`,`r`.`acctsessionid` AS `id`,`r`.`acctuniqueid` AS `unique_id`,`r`.`acctsessiontime` AS `time_on`,`r`.`acctstarttime` AS `start_time`,`r`.`acctstoptime` AS `stop_time`,`r`.`acctinputoctets` AS `in_bytes`,`r`.`acctoutputoctets` AS `out_bytes`,`r`.`framedipaddress` AS `ip`,`r`.`nasipaddress` AS `server`,`r`.`nasipaddress` AS `client_ip`,`r`.`calledstationid` AS `call_to`,`r`.`callingstationid` AS `call_from`,_utf8'' AS `connect_info`,`r`.`acctterminatecause` AS `terminate_cause`,`r`.`last_change` AS `last_change`,`r`.`before_billing` AS `before_billing`,`r`.`billing_minus` AS `billing_minus` from `radacct` `r`;

--
-- Изменить представление "inetonline"
--
CREATE OR REPLACE 
VIEW inetonline
AS
	select `r`.`gid` AS `gid`,`r`.`uid` AS `uid`,`r`.`username` AS `user`,`r`.`nasportid` AS `port`,`r`.`nasipaddress` AS `server`,`r`.`framedipaddress` AS `ip`,`r`.`callingstationid` AS `call_from`,date_format(`r`.`acctstarttime`,_utf8'%d %b, %H:%i:%s') AS `fstart_time`,`r`.`acctsessiontime` AS `time_on`,`r`.`acctinputoctets` AS `in_bytes`,`r`.`acctoutputoctets` AS `out_bytes`,`r`.`billing_minus` AS `billing_minus` from `radacctbras` `r`;

--
-- Изменить представление "inetonlinenew"
--
CREATE OR REPLACE 
VIEW inetonlinenew
AS
	select `r`.`radacctid` AS `radacctid`,`r`.`acctsessionid` AS `acctsessionid`,`r`.`acctuniqueid` AS `acctuniqueid`,`r`.`username` AS `username`,`r`.`uid` AS `uid`,`r`.`gid` AS `gid`,`r`.`nasipaddress` AS `nasipaddress`,`r`.`nasportid` AS `nasportid`,`r`.`acctstarttime` AS `acctstarttime`,`r`.`acctstoptime` AS `acctstoptime`,`r`.`acctsessiontime` AS `acctsessiontime`,`r`.`acctinputoctets` AS `acctinputoctets`,`r`.`acctoutputoctets` AS `acctoutputoctets`,`r`.`calledstationid` AS `calledstationid`,`r`.`callingstationid` AS `callingstationid`,`r`.`acctterminatecause` AS `acctterminatecause`,`r`.`framedipaddress` AS `framedipaddress`,`r`.`last_change` AS `last_change`,`r`.`before_billing` AS `before_billing`,`r`.`billing_minus` AS `billing_minus` from `radacctbras` `r`;

--
-- Изменить представление "inetonlinewithspeed"
--
CREATE OR REPLACE 
VIEW inetonlinewithspeed
AS
	select `r`.`radacctid` AS `radacctid`,`r`.`acctsessionid` AS `acctsessionid`,`r`.`acctuniqueid` AS `acctuniqueid`,`r`.`username` AS `username`,`r`.`uid` AS `uid`,`r`.`gid` AS `gid`,`r`.`nasipaddress` AS `nasipaddress`,`r`.`nasportid` AS `nasportid`,`r`.`acctstarttime` AS `acctstarttime`,`r`.`acctstoptime` AS `acctstoptime`,`r`.`acctsessiontime` AS `acctsessiontime`,`r`.`acctinputoctets` AS `acctinputoctets`,`r`.`acctoutputoctets` AS `acctoutputoctets`,`r`.`calledstationid` AS `calledstationid`,`r`.`callingstationid` AS `callingstationid`,`r`.`acctterminatecause` AS `acctterminatecause`,`r`.`framedipaddress` AS `framedipaddress`,`r`.`last_change` AS `last_change`,`r`.`before_billing` AS `before_billing`,`r`.`billing_minus` AS `billing_minus`,`u`.`speed_rate` AS `user_speed_in`,`u`.`speed_burst` AS `user_speed_out`,`p`.`do_mik_rad_shapers` AS `use_radius_shaper`,`p`.`speed_rate` AS `tarif_speed_in`,`p`.`speed_burst` AS `tarif_speed_out`,`p`.`shaper_prio` AS `tarif_shaper_prio` from ((`radacctbras` `r` join `users` `u`) join `packets` `p`) where ((`r`.`gid` = `u`.`gid`) and (`r`.`gid` = `p`.`gid`) and (`r`.`uid` = `u`.`uid`) and (`u`.`gid` = `p`.`gid`)) group by `r`.`uid`;

--
-- Изменить представление "inetspeedlist"
--
CREATE OR REPLACE 
VIEW inetspeedlist
AS
	select `u`.`user` AS `username`,`u`.`framed_ip` AS `framedipaddress`,`u`.`local_ip` AS `local_ip`,`u`.`speed_rate` AS `user_speed_in`,`u`.`speed_burst` AS `user_speed_out`,`p`.`speed_rate` AS `tarif_speed_in`,`p`.`speed_rate` AS `tarif_speed_out` from (`users` `u` join `packets` `p`) where (`u`.`gid` = `p`.`gid`);

--
-- Изменить представление "ip_pools_counts"
--
CREATE OR REPLACE 
VIEW ip_pools_counts
AS
	select `p`.`poolname` AS `poolname`,`ip`.`poolid` AS `poolid`,count(distinct `ip`.`poolip`) AS `ipfree`,count(distinct `use`.`poolip`) AS `ipuse` from ((`ip_pools_pool` `ip` join `ip_pools` `p`) join `ip_pools_pool_use` `use`) where ((`ip`.`poolid` = `p`.`poolid`) and (`p`.`poolid` = `use`.`poolid`)) group by `ip`.`poolid`;

--
-- Изменить представление "map_online"
--
CREATE OR REPLACE 
VIEW map_online
AS
	select `r`.`radacctid` AS `radacctid`,`r`.`acctsessionid` AS `acctsessionid`,`r`.`acctuniqueid` AS `acctuniqueid`,`r`.`username` AS `username`,`r`.`uid` AS `uid`,`r`.`gid` AS `gid`,`r`.`nasipaddress` AS `nasipaddress`,`r`.`nasportid` AS `nasportid`,`r`.`acctstarttime` AS `acctstarttime`,`r`.`acctstoptime` AS `acctstoptime`,`r`.`acctsessiontime` AS `acctsessiontime`,`r`.`acctinputoctets` AS `acctinputoctets`,`r`.`acctoutputoctets` AS `acctoutputoctets`,`r`.`calledstationid` AS `calledstationid`,`r`.`callingstationid` AS `callingstationid`,`r`.`acctterminatecause` AS `acctterminatecause`,`r`.`framedipaddress` AS `framedipaddress`,`r`.`last_change` AS `last_change`,`r`.`before_billing` AS `before_billing`,`r`.`billing_minus` AS `billing_minus`,`u`.`app` AS `app`,`u`.`swid` AS `swid`,`u`.`switchport` AS `switchport`,`u`.`houseid` AS `houseid`,`u`.`speed_rate` AS `user_speed_in`,`u`.`speed_burst` AS `user_speed_out`,`p`.`do_mik_rad_shapers` AS `use_radius_shaper`,`p`.`speed_rate` AS `tarif_speed_in`,`p`.`speed_burst` AS `tarif_speed_out`,`p`.`shaper_prio` AS `tarif_shaper_prio` from ((`radacctbras` `r` join `users` `u`) join `packets` `p`) where ((`r`.`gid` = `u`.`gid`) and (`r`.`gid` = `p`.`gid`) and (`r`.`uid` = `u`.`uid`) and (`u`.`gid` = `p`.`gid`)) group by `r`.`uid`;

--
-- Создать представление "mb_view_tickets_messages"
--
CREATE
VIEW mb_view_tickets_messages
AS
SELECT
  `m`.`messageid` AS `messageid`,
  `m`.`date` AS `date`,
  `m`.`ticketid` AS `ticketid`,
  `m`.`stuffid` AS `stuffid`,
  `p`.`fio` AS `stuff_fio`,
  `m`.`useruid` AS `useruid`,
  `u`.`fio` AS `user_fio`,
  `m`.`message` AS `message`,
  `m`.`unread` AS `unread`,
  `s`.`statustypename` AS `statustypename`
FROM ((((`tickets_messages` `m`
  LEFT JOIN `users` `u`
    ON ((`m`.`useruid` = `u`.`uid`)))
  LEFT JOIN `stuff_personal` `p`
    ON ((`m`.`stuffid` = `p`.`stuffid`)))
  JOIN `tickets_tickets` `t`)
  JOIN `tickets_status_types` `s`)
WHERE ((`m`.`ticketid` = `t`.`ticketid`)
AND (`t`.`statustypeid` = `s`.`statustypeid`));

--
-- Изменить представление "radpostauth"
--
CREATE OR REPLACE 
VIEW radpostauth
AS
	select `a`.`id` AS `id`,`a`.`username` AS `username`,`a`.`pass` AS `pass`,`t`.`packettype` AS `packettype`,`m`.`replymessage` AS `replymessage`,`n`.`nasname` AS `nasipaddress`,`a`.`nasportid` AS `nasportid`,`n`.`shortname` AS `nasident`,`a`.`callingstationid` AS `callingstationid`,`a`.`authdate` AS `authdate` from (((`radpostauthnew` `a` join `radpostauthpackettype` `t`) join `radpostauthreplymessage` `m`) join `radnas` `n`) where ((`a`.`packettypeid` = `a`.`packettypeid`) and (`a`.`replymessageid` = `m`.`replymessageid`) and (`n`.`id` = `a`.`nasid`));

--
-- Изменить представление "users_view_fsb"
--
CREATE OR REPLACE 
VIEW users_view_fsb
AS
	select '0' AS `state`,`u`.`uid` AS `uid`,`u`.`user` AS `user`,`u`.`fio` AS `fio`,`u`.`phone` AS `phone`,`u`.`mob_tel` AS `mob_tel`,`u`.`sms_tel` AS `sms_tel`,`u`.`real_ip` AS `real_ip`,`u`.`framed_ip` AS `framed_ip`,`u`.`local_ip` AS `local_ip`,`u`.`local_mac` AS `local_mac`,`u`.`passportserie` AS `passportserie`,`u`.`passportpropiska` AS `passportpropiska`,`u`.`passportvoenkomat` AS `passportvoenkomat`,`u`.`passportgdevidan` AS `passportgdevidan`,`u`.`inn` AS `inn`,`u`.`date_birth` AS `date_birth`,`u`.`numdogovor` AS `numdogovor`,`u`.`use_router` AS `use_router`,`u`.`blocked` AS `blocked`,`u`.`last_connection` AS `last_connection`,`u`.`app` AS `app`,`u`.`houseid` AS `houseid`,`u`.`housingid` AS `housingid`,`u`.`houseblockid` AS `houseblockid`,`u`.`porch` AS `porch`,`u`.`floor` AS `floor` from `users` `u` union select '1' AS `state`,`uf`.`uid` AS `uid`,`uf`.`user` AS `user`,`uf`.`fio` AS `fio`,`uf`.`phone` AS `phone`,`uf`.`mob_tel` AS `mob_tel`,`uf`.`sms_tel` AS `sms_tel`,`uf`.`real_ip` AS `real_ip`,`uf`.`framed_ip` AS `framed_ip`,`uf`.`local_ip` AS `local_ip`,`uf`.`local_mac` AS `local_mac`,`uf`.`passportserie` AS `passportserie`,`uf`.`passportpropiska` AS `passportpropiska`,`uf`.`passportvoenkomat` AS `passportvoenkomat`,`uf`.`passportgdevidan` AS `passportgdevidan`,`uf`.`inn` AS `inn`,`uf`.`date_birth` AS `date_birth`,`uf`.`numdogovor` AS `numdogovor`,`uf`.`use_router` AS `use_router`,`uf`.`blocked` AS `blocked`,`uf`.`last_connection` AS `last_connection`,`uf`.`app` AS `app`,`uf`.`houseid` AS `houseid`,`uf`.`housingid` AS `housingid`,`uf`.`houseblockid` AS `houseblockid`,`uf`.`porch` AS `porch`,`uf`.`floor` AS `floor` from `usersfreeze` `uf` union select '2' AS `state`,`ub`.`uid` AS `uid`,`ub`.`user` AS `user`,`ub`.`fio` AS `fio`,`ub`.`phone` AS `phone`,`ub`.`mob_tel` AS `mob_tel`,`ub`.`sms_tel` AS `sms_tel`,`ub`.`real_ip` AS `real_ip`,`ub`.`framed_ip` AS `framed_ip`,`ub`.`local_ip` AS `local_ip`,`ub`.`local_mac` AS `local_mac`,`ub`.`passportserie` AS `passportserie`,`ub`.`passportpropiska` AS `passportpropiska`,`ub`.`passportvoenkomat` AS `passportvoenkomat`,`ub`.`passportgdevidan` AS `passportgdevidan`,`ub`.`inn` AS `inn`,`ub`.`date_birth` AS `date_birth`,`ub`.`numdogovor` AS `numdogovor`,`ub`.`use_router` AS `use_router`,`ub`.`blocked` AS `blocked`,`ub`.`last_connection` AS `last_connection`,`ub`.`app` AS `app`,`ub`.`houseid` AS `houseid`,`ub`.`housingid` AS `housingid`,`ub`.`houseblockid` AS `houseblockid`,`ub`.`porch` AS `porch`,`ub`.`floor` AS `floor` from `usersblok` `ub` union select '3' AS `state`,`ud`.`uid` AS `uid`,`ud`.`user` AS `user`,`ud`.`fio` AS `fio`,`ud`.`phone` AS `phone`,`ud`.`mob_tel` AS `mob_tel`,`ud`.`sms_tel` AS `sms_tel`,`ud`.`real_ip` AS `real_ip`,`ud`.`framed_ip` AS `framed_ip`,`ud`.`local_ip` AS `local_ip`,`ud`.`local_mac` AS `local_mac`,`ud`.`passportserie` AS `passportserie`,`ud`.`passportpropiska` AS `passportpropiska`,`ud`.`passportvoenkomat` AS `passportvoenkomat`,`ud`.`passportgdevidan` AS `passportgdevidan`,`ud`.`inn` AS `inn`,`ud`.`date_birth` AS `date_birth`,`ud`.`numdogovor` AS `numdogovor`,`ud`.`use_router` AS `use_router`,`ud`.`blocked` AS `blocked`,`ud`.`last_connection` AS `last_connection`,`ud`.`app` AS `app`,`ud`.`houseid` AS `houseid`,`ud`.`housingid` AS `housingid`,`ud`.`houseblockid` AS `houseblockid`,`ud`.`porch` AS `porch`,`ud`.`floor` AS `floor` from `usersdel` `ud`;

--
-- Изменить представление "usersadress"
--
CREATE OR REPLACE 
VIEW usersadress
AS
	select concat(`l`.`lane`,' ',`h`.`house`,'-',`u`.`app`) AS `address`,`l`.`lane` AS `lane`,`h`.`house` AS `house`,`u`.`app` AS `app`,`h`.`porches` AS `porches`,`h`.`floors` AS `floors`,`u`.`uid` AS `uid`,`u`.`user` AS `user`,`u`.`fio` AS `fio` from ((`lanes_houses` `h` join `lanes` `l` on((`l`.`laneid` = `h`.`laneid`))) join `users` `u` on((`h`.`houseid` = `u`.`houseid`)));

--
-- Изменить представление "usersall"
--
CREATE OR REPLACE 
VIEW usersall
AS
	select `u`.`user` AS `user`,`u`.`password` AS `password`,`u`.`uid` AS `uid`,`u`.`gid` AS `gid`,`u`.`deposit` AS `deposit`,`u`.`credit` AS `credit`,`u`.`fio` AS `fio`,`u`.`phone` AS `phone`,`u`.`prim` AS `prim`,`u`.`add_date` AS `add_date`,`u`.`blocked` AS `blocked`,`u`.`activated` AS `activated`,`u`.`framed_ip` AS `framed_ip`,`u`.`passportserie` AS `passportserie`,`u`.`passportpropiska` AS `passportpropiska`,`u`.`passportvoenkomat` AS `passportvoenkomat`,`u`.`passportgdevidan` AS `passportgdevidan`,`u`.`dogovor` AS `dogovor`,'None' AS `block_date`,'None' AS `del_date`,'None' AS `freeze_date`,`u`.`mob_tel` AS `mob_tel`,`u`.`numdogovor` AS `numdogovor`,`u`.`app` AS `app`,`u`.`houseid` AS `houseid`,'рабочий' AS `status` from `users` `u` union all select `ub`.`user` AS `user`,`ub`.`password` AS `password`,`ub`.`uid` AS `uid`,`ub`.`gid` AS `gid`,`ub`.`deposit` AS `deposit`,`ub`.`credit` AS `credit`,`ub`.`fio` AS `fio`,`ub`.`phone` AS `phone`,`ub`.`prim` AS `prim`,`ub`.`add_date` AS `add_date`,`ub`.`blocked` AS `blocked`,`ub`.`activated` AS `activated`,`ub`.`framed_ip` AS `framed_ip`,`ub`.`passportserie` AS `passportserie`,`ub`.`passportpropiska` AS `passportpropiska`,`ub`.`passportvoenkomat` AS `passportvoenkomat`,`ub`.`passportgdevidan` AS `passportgdevidan`,`ub`.`dogovor` AS `dogovor`,`ub`.`block_date` AS `block_date`,'None' AS `del_date`,'None' AS `freeze_date`,`ub`.`mob_tel` AS `mob_tel`,`ub`.`numdogovor` AS `numdogovor`,`ub`.`app` AS `app`,`ub`.`houseid` AS `houseid`,'отключенный' AS `status` from `usersblok` `ub` union all select `ud`.`user` AS `user`,`ud`.`password` AS `password`,`ud`.`uid` AS `uid`,`ud`.`gid` AS `gid`,`ud`.`deposit` AS `deposit`,`ud`.`credit` AS `credit`,`ud`.`fio` AS `fio`,`ud`.`phone` AS `phone`,`ud`.`prim` AS `prim`,`ud`.`add_date` AS `add_date`,`ud`.`blocked` AS `blocked`,`ud`.`activated` AS `activated`,`ud`.`framed_ip` AS `framed_ip`,`ud`.`passportserie` AS `passportserie`,`ud`.`passportpropiska` AS `passportpropiska`,`ud`.`passportvoenkomat` AS `passportvoenkomat`,`ud`.`passportgdevidan` AS `passportgdevidan`,`ud`.`dogovor` AS `dogovor`,`ud`.`block_date` AS `block_date`,`ud`.`del_date` AS `del_date`,'None' AS `freeze_date`,`ud`.`mob_tel` AS `mob_tel`,`ud`.`numdogovor` AS `numdogovor`,`ud`.`app` AS `app`,`ud`.`houseid` AS `houseid`,'удаленный' AS `status` from `usersdel` `ud` union all select `uf`.`user` AS `user`,`uf`.`password` AS `password`,`uf`.`uid` AS `uid`,`uf`.`gid` AS `gid`,`uf`.`deposit` AS `deposit`,`uf`.`credit` AS `credit`,`uf`.`fio` AS `fio`,`uf`.`phone` AS `phone`,`uf`.`prim` AS `prim`,`uf`.`add_date` AS `add_date`,`uf`.`blocked` AS `blocked`,`uf`.`activated` AS `activated`,`uf`.`framed_ip` AS `framed_ip`,`uf`.`passportserie` AS `passportserie`,`uf`.`passportpropiska` AS `passportpropiska`,`uf`.`passportvoenkomat` AS `passportvoenkomat`,`uf`.`passportgdevidan` AS `passportgdevidan`,`uf`.`dogovor` AS `dogovor`,'None' AS `block_date`,'None' AS `del_date`,`uf`.`freeze_date` AS `freeze_date`,`uf`.`mob_tel` AS `mob_tel`,`uf`.`numdogovor` AS `numdogovor`,`uf`.`app` AS `app`,`uf`.`houseid` AS `houseid`,'замороженный' AS `status` from `usersfreeze` `uf`;

--
-- Изменить представление "users_view_fsb_address"
--
CREATE OR REPLACE 
VIEW users_view_fsb_address
AS
	select concat(`l`.`lane`,' ',`h`.`house`,'-',`f`.`app`) AS `address`,`l`.`lane` AS `lane`,`h`.`house` AS `house`,`f`.`app` AS `app`,`h`.`porches` AS `porches`,`h`.`floors` AS `floors`,`f`.`uid` AS `uid`,`f`.`user` AS `user`,`f`.`fio` AS `fio` from ((`lanes_houses` `h` join `lanes` `l` on((`l`.`laneid` = `h`.`laneid`))) join `users_view_fsb` `f` on((`h`.`houseid` = `f`.`houseid`)));

--
-- Включение внешних ключей
--
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

