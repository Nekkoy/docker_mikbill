#!/bin/bash

cd /var/www/mikbill/admin

php ./index.php rad_online
php ./index.php pool_online
php ./index.php do_turbo_block
php -q ./index.php user_mrtg_gen
#/usr/bin/indexmaker /etc/mrtg/mrtg_mikbill_users.conf > /var/www/mikbill/admin/sys/mrtg_users/index.html >/dev/null 2>&1
env LANG=C /usr/bin/mrtg /etc/mrtg/mrtg_mikbill_tarif.conf >/dev/null 2>&1
env LANG=C /usr/bin/mrtg /etc/mrtg/mrtg_mikbill_users.conf >/dev/null 2>&1