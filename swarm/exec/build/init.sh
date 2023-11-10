#!/bin/bash

PHP=$(which php)
cd /var/www/mikbill/admin

$PHP index.php start_queue_threads noexit