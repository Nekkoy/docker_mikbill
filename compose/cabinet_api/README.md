[![en](https://img.shields.io/badge/lang-en-red.svg)](README.md)
[![ua](https://img.shields.io/badge/lang-ua-yellow.svg)](README.ua.md)
[![ru](https://img.shields.io/badge/lang-ru-blue.svg)](README.ru.md)

Cabinet API for creating your own subscriber interface/telegram bot

docker-compose.yaml consists of
 + cabinetapi_nginx - accepting web requests and redirecting them to the backend
 + cabinetapi_php - processes a request from cabinetapi_nginx

### Configuration
 + files/nginx/site.conf - nginx host config
 + files/nginx/ssl/fullchain.pem - SSL certificat
 + files/nginx/ssl/privkey.pem - SSL key

### Networks

Required networks

```
docker network create -d bridge --attachable --opt com.docker.network.bridge.enable_ip_masquerade=false cabinetapi_network
docker network create -d bridge --attachable --opt com.docker.network.bridge.enable_ip_masquerade=false database_network
```