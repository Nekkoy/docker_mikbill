[![en](https://img.shields.io/badge/lang-en-red.svg)](README.md)
[![ua](https://img.shields.io/badge/lang-ua-yellow.svg)](README.ua.md)
[![ru](https://img.shields.io/badge/lang-ru-blue.svg)](README.ru.md)

Модуль обработки авторизационных и учетных запросов

docker-compose.yaml состоит из
  + freeradius_nginx — прием BRAS-запросов и перенаправление их на radius_server
  + radius_server — обработать запрос freeradius_nginx и создать новый запрос к mikbill_kernel
  + mikbill_kernel — обрабатывает запрос от radius_server

### Конфигурация
  + files/nginx.conf — конфигурация nginx для приема запросов auth/acct для радиуса
  + files/sql.conf — файл конфигурации radius для подключения к базе

### Сети

Требуемые сети

```
docker network create --driver=overlay --scope=swarm --attachable -o "com.docker.network.bridge.enable_ip_masquerade"="false" freeradius_network
docker network create --driver=overlay --scope=swarm --attachable -o "com.docker.network.bridge.enable_ip_masquerade"="false" kernel_network
docker network create --driver=overlay --scope=swarm --attachable -o "com.docker.network.bridge.enable_ip_masquerade"="false" database_network
```
