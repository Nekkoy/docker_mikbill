SET NAMES 'utf8';

UPDATE radacct SET acctterminatecause = 'BILL-Request', acctstoptime = date_add(acctstarttime, interval ifnull(acctsessiontime, 0) second) WHERE 1456236550 > last_change ;

