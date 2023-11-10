[![en](https://img.shields.io/badge/lang-en-red.svg)](README.md)
[![ua](https://img.shields.io/badge/lang-ua-yellow.svg)](README.ua.md)
[![ru](https://img.shields.io/badge/lang-ru-blue.svg)](README.ru.md)

Інтерфейс білінгу та керування абонентами

docker-compose.yaml складається з
   + admin_nginx - приймає веб-запити та перенаправляє їх на бекенд
   + admin_php - обробляє запит від admin_nginx

### Конфігурація
   + files/nginx/site.conf - конфігурація хосту nginx
   + files/nginx/ssl/fullchain.pem - SSL сертифікат
   + files/nginx/ssl/privkey.pem - ключ SSL

### Мережі

Необхідні мережі

```
docker network create -d bridge --attachable --opt com.docker.network.bridge.enable_ip_masquerade=false admin_network
docker network create -d bridge --attachable --opt com.docker.network.bridge.enable_ip_masquerade=false database_network
```