[![en](https://img.shields.io/badge/lang-en-red.svg)](README.md)
[![ua](https://img.shields.io/badge/lang-ua-yellow.svg)](README.ua.md)
[![ru](https://img.shields.io/badge/lang-ru-blue.svg)](README.ru.md)

Пользовательский интерфейс

docker-compose.yaml состоит из
  + Cabinet_nginx — прием веб-запросов и перенаправление их на бэкенд
  + Cabinet_php — обрабатывает запрос от admin_nginx

### Конфигурация
  + files/nginx/site.conf — конфигурация хоста nginx
  + files/nginx/ssl/fullchain.pem — сертификат SSL
  + files/nginx/ssl/privkey.pem — ключ SSL

### Сети

Требуемые сети

```
docker network create -d bridge --attachable --opt com.docker.network.bridge.enable_ip_masquerade=false cabinet_network
docker network create -d bridge --attachable --opt com.docker.network.bridge.enable_ip_masquerade=false database_network
```