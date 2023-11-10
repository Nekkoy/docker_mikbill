FROM debian:bullseye-slim

WORKDIR /var/log/freeradius

RUN apt-get update
RUN apt-get install -y freeradius freeradius-mysql freeradius-utils

RUN rm -rf /etc/freeradius/3.0
RUN mkdir -p /etc/freeradius/3.0

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

ADD freeradius/raddb /etc/freeradius/3.0
COPY freeradius/raddb/serialize.pm /etc/perl/