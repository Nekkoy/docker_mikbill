FROM php:7.4.30-cli-bullseye

ENV MIKBILL_ENV_CONFIG=1
WORKDIR /var/www/mikbill/admin

RUN apt-get update -y
RUN apt-get install -y libxslt1-dev libsnmp-dev libcurl4-openssl-dev libpspell-dev libonig-dev libgmp-dev libpng-dev zlib1g-dev libzip-dev
RUN apt-get install -y libc-client-dev libkrb5-dev freeradius-utils cron

RUN docker-php-ext-install pdo pdo_mysql xsl snmp curl pspell xmlrpc mbstring gmp bcmath gd zip sockets calendar
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl && docker-php-ext-install imap
RUN docker-php-ext-configure pcntl --enable-pcntl && docker-php-ext-install pcntl
RUN pecl install redis && docker-php-ext-enable redis

RUN echo "ATTRIBUTE DHCP-Router-IP-Address 241 ipaddr" >> /usr/share/freeradius/dictionary
RUN echo "ATTRIBUTE DHCP-Mask 242 integer" >> /usr/share/freeradius/dictionary
RUN echo "ATTRIBUTE L4-Redirect 243 integer" >> /usr/share/freeradius/dictionary
RUN echo "ATTRIBUTE L4-Redirect-ipset 244 string" >> /usr/share/freeradius/dictionary
RUN echo "ATTRIBUTE DHCP-Option82 245 octets" >> /usr/share/freeradius/dictionary
RUN echo "#ATTRIBUTE DHCP-Agent-Circuit-Id	1 octets" >> /usr/share/freeradius/dictionary
RUN echo "#ATTRIBUTE DHCP-Agent-Remote-Id	2 octets" >> /usr/share/freeradius/dictionary
RUN echo "ATTRIBUTE AccelRemoteId 246 octets" >> /usr/share/freeradius/dictionary
RUN echo "ATTRIBUTE AccelCircuitId 247 octets" >> /usr/share/freeradius/dictionary
RUN echo "#ATTRIBUTE DHCP-Attr-272 272 ipaddr" >> /usr/share/freeradius/dictionary

VOLUME /var/www/mikbill/admin
VOLUME /var/mikbill/prod/scripts
VOLUME /var/mikbill/prod/cron

ADD exec /var/www/mikbill/admin
ADD cron /var/mikbill/prod/cron
ADD scripts /var/mikbill/prod/scripts

RUN chmod +x /var/mikbill/prod/cron/*.sh
RUN chmod +x /var/mikbill/prod/scripts/*.sh

COPY ioncube/ioncube.ini /usr/local/etc/php/conf.d/ioncube.ini
COPY ioncube/ioncube_loader_lin_7.4.so /usr/local/ioncube/ioncube_loader_lin_7.4.so
COPY ioncube/ioncube_loader_lin_7.4_ts.so /usr/local/ioncube/ioncube_loader_lin_7.4_ts.so

COPY crontab /etc/cron.d/mikbill

RUN service cron restart

ADD init.sh /init.sh
ENTRYPOINT [ "/init.sh" ]