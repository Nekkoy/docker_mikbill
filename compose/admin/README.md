[![en](https://img.shields.io/badge/lang-en-red.svg)](README.md)
[![ua](https://img.shields.io/badge/lang-ua-yellow.svg)](README.ua.md)
[![ru](https://img.shields.io/badge/lang-ru-blue.svg)](README.ru.md)

Billing and subscriber management interface

docker-compose.yaml consists of
 + admin_nginx - accepting web requests and redirecting them to the backend
 + admin_php - processes a request from admin_nginx

### Configuration
 + files/nginx/site.conf - nginx host config
 + files/nginx/ssl/fullchain.pem - SSL certificat
 + files/nginx/ssl/privkey.pem - SSL key

### Networks

Required networks

```
docker network create -d bridge --attachable --opt com.docker.network.bridge.enable_ip_masquerade=false admin_network
docker network create -d bridge --attachable --opt com.docker.network.bridge.enable_ip_masquerade=false database_network
```