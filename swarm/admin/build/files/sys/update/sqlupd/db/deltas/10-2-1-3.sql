SET NAMES 'utf8';

UPDATE `users` SET `swid` = 0 WHERE ISNULL(`swid`);
UPDATE `usersfreeze` SET `swid` = 0 WHERE ISNULL(`swid`);
UPDATE `usersblok` SET `swid` = 0 WHERE ISNULL(`swid`);
UPDATE `usersdel` SET `swid` = 0 WHERE ISNULL(`swid`);