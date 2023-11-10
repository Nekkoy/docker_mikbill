SET NAMES 'utf8';

ALTER TABLE radacct
  DROP INDEX acctsessiontime;

ALTER TABLE radacctbras
  DROP INDEX acctsessiontime;

ALTER TABLE radacctbras
  DROP INDEX Online_index;
