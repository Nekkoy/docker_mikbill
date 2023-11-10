SET NAMES 'utf8';

ALTER TABLE radacctbras
  DROP INDEX acctstoptime;

ALTER TABLE radacctbras
  DROP INDEX mrtggid;

ALTER TABLE radacctbras
  DROP INDEX mrtguid;

ALTER TABLE radacctbras
  DROP INDEX `framed-terminate`;

ALTER TABLE radacctbras
  ADD INDEX gid (gid);
