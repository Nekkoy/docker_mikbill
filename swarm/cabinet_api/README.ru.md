[![en](https://img.shields.io/badge/lang-en-red.svg)](README.md)
[![ua](https://img.shields.io/badge/lang-ua-yellow.svg)](README.ua.md)
[![ru](https://img.shields.io/badge/lang-ru-blue.svg)](README.ru.md)

API кабинета для создания собственного абонентского интерфейса/бота Telegram

docker-compose.yaml состоит из
  + Cabinetapi_nginx — прием веб-запросов и перенаправление их на бэкенд
  + Cabinetapi_php — обрабатывает запрос от Cabinetapi_nginx

### Конфигурация
  + files/nginx/site.conf — конфигурация хоста nginx
  + files/nginx/ssl/fullchain.pem — сертификат SSL
  + files/nginx/ssl/privkey.pem — ключ SSL

### Сети

Требуемые сети

```
docker network create --driver=overlay --scope=swarm --attachable -o "com.docker.network.bridge.enable_ip_masquerade"="false" cabinetapi_network
docker network create --driver=overlay --scope=swarm --attachable -o "com.docker.network.bridge.enable_ip_masquerade"="false" database_network
```