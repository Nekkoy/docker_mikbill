[![en](https://img.shields.io/badge/lang-en-red.svg)](README.md)
[![ua](https://img.shields.io/badge/lang-ua-yellow.svg)](README.ua.md)
[![ru](https://img.shields.io/badge/lang-ru-blue.svg)](README.ru.md)

Модуль для прийому платежів

docker-compose.yaml складається з
  + payment_nginx - приймає веб-запити та перенаправляє їх на бекенд
  + payment_php - обробляє запит від payment_nginx

### Конфігурація
  + files/nginx/site.conf - конфігурація хосту nginx
  + files/nginx/ssl/fullchain.pem - SSL сертифікат
  + files/nginx/ssl/privkey.pem - ключ SSL

### Мережі

Необхідні мережі

```
docker network create -d bridge --attachable -o com.docker.network.bridge.enable_ip_masquerade=false payments_network
docker network create -d bridge --attachable -o com.docker.network.bridge.enable_ip_masquerade=false database_network
```