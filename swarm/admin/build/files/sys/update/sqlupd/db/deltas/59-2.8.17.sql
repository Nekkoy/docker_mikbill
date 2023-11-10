SET NAMES 'utf8';

CREATE OR REPLACE VIEW `users_view_fsb`
(state, uid, user, fio, phone, mob_tel, sms_tel, real_ip, framed_ip, local_ip, local_mac, passportserie, passportpropiska, passportvoenkomat, passportgdevidan, inn, date_birth, numdogovor, use_router, blocked, last_connection, app, houseid, housingid, houseblockid, porch, floor) AS 
SELECT "0" as state, uid, user, fio, phone, mob_tel, sms_tel, real_ip, framed_ip, local_ip, local_mac, passportserie, passportpropiska, passportvoenkomat, passportgdevidan, inn, date_birth, numdogovor, use_router, blocked, last_connection, app, houseid, housingid, houseblockid, porch, floor FROM users 
UNION 
SELECT "1" as state, uid, user, fio, phone, mob_tel, sms_tel, real_ip, framed_ip, local_ip, local_mac, passportserie, passportpropiska, passportvoenkomat, passportgdevidan, inn, date_birth, numdogovor, use_router, blocked, last_connection, app, houseid, housingid, houseblockid, porch, floor FROM usersfreeze 
UNION 
SELECT "2" as state, uid, user, fio, phone, mob_tel, sms_tel, real_ip, framed_ip, local_ip, local_mac, passportserie, passportpropiska, passportvoenkomat, passportgdevidan, inn, date_birth, numdogovor, use_router, blocked, last_connection, app, houseid, housingid, houseblockid, porch, floor FROM usersblok 
UNION 
SELECT "3" as state, uid, user, fio, phone, mob_tel, sms_tel, real_ip, framed_ip, local_ip, local_mac, passportserie, passportpropiska, passportvoenkomat, passportgdevidan, inn, date_birth, numdogovor, use_router, blocked, last_connection, app, houseid, housingid, houseblockid, porch, floor FROM usersdel;





CREATE OR REPLACE VIEW `users_view_fsb_address` AS select concat(`lanes`.`lane`,' ',`lanes_houses`.`house`,'-',`users_view_fsb`.`app`) AS `address`,`lanes`.`lane` AS `lane`,`lanes_houses`.`house` AS `house`,`users_view_fsb`.`app` AS `app`,`lanes_houses`.`porches` AS `porches`,`lanes_houses`.`floors` AS `floors`,`users_view_fsb`.`uid` AS `uid`,`users_view_fsb`.`user` AS `user`,`users_view_fsb`.`fio` AS `fio` from ((`lanes_houses` join `lanes` on((`lanes`.`laneid` = `lanes_houses`.`laneid`))) join `users_view_fsb` on((`lanes_houses`.`houseid` = `users_view_fsb`.`houseid`)));

