#!/bin/bash

cd /var/www/mikbill/admin

php ./index.php do_freeze
php ./index.php do_unfreeze
php ./index.php do_freeze_abonplata

php ./index.php pay_day
php ./index.php pay_day_monthly
php ./index.php pay_day2
php ./index.php pay_real
php ./index.php pay_credit
php ./index.php clear_dhcp_log
php ./index.php do_usluga_block
php ./index.php credit_null

php ./index.php otkl_neplat
php ./index.php del_otkl
php ./index.php clear_real_ip

