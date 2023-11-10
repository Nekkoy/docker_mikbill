FROM php:7.4.30-fpm-bullseye

ENV MIKBILL_ENV_CONFIG=1
WORKDIR /var/log/mikbill/stat

RUN apt-get update -y
RUN apt-get install -y libxslt1-dev libsnmp-dev libcurl4-openssl-dev libpspell-dev libonig-dev libgmp-dev libpng-dev zlib1g-dev libzip-dev
RUN apt-get install -y libc-client-dev libkrb5-dev

RUN docker-php-ext-install pdo pdo_mysql xsl snmp curl pspell xmlrpc mbstring gmp bcmath gd zip calendar
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl && docker-php-ext-install imap
RUN pecl install redis && docker-php-ext-enable redis

VOLUME /var/www/mikbill/stat
ADD files /var/www/mikbill/stat

COPY ioncube/ioncube.ini /usr/local/etc/php/conf.d/ioncube.ini
COPY ioncube/ioncube_loader_lin_7.4.so /usr/local/ioncube/ioncube_loader_lin_7.4.so
COPY ioncube/ioncube_loader_lin_7.4_ts.so /usr/local/ioncube/ioncube_loader_lin_7.4_ts.so